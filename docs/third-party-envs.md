# <a name="ThirdPartyEnv"></a>Deploying Malcolm in Other Third-Party Environments

* [Deploying Malcolm in Other Third-Party Environments](#ThirdPartyEnv)
    - [Generating a Malcolm Amazon Machine Image (AMI) for Use on Amazon Web Services (AWS)](#AWSAMI)
        + [Prerequisites](#AWSAMIPrerequisites)
        + [Procedure](#AWSAMIProcedure)
            * [Using MFA](#AWSAMIMFA)
        + [Attribution](#AWSAttribution)

## <a name="AWSAMI"></a>Generating a Malcolm Amazon Machine Image (AMI) for Use on Amazon Web Services (AWS)

This section outlines the process of using [packer](https://www.packer.io/)'s [Amazon AMI Builder](https://developer.hashicorp.com/packer/plugins/builders/amazon) to create an [EBS-backed](https://developer.hashicorp.com/packer/plugins/builders/amazon/ebs) Malcolm AMI for either the x86-64 or arm64 CPU architecture. This section assumes you have good working knowledge of [Amazon Web Services (AWS)](https://docs.aws.amazon.com/index.html).

### <a name="AWSAMIPrerequisites"></a> Prerequisites

* [packer](https://www.packer.io/)
    - the packer command-line tool ([download](https://developer.hashicorp.com/packer/downloads))
* [aws cli](https://aws.amazon.com/cli/)
    - the AWS Command Line Interface with functioning access to your AWS infrastructure
* AWS access key ID and secret access key
    - [AWS security credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html)
* ensure the AWS account you are using for packer has minimal required permissions
    - [Amazon AMI builder](https://developer.hashicorp.com/packer/plugins/builders/amazon)

### <a name="AWSAMIProcedure"></a> Procedure

The files referenced in this section can be found in [scripts/third-party-environments/aws/ami]({{ site.github.repository_url }}/blob/{{ site.github.build_revision }}/scripts/third-party-environments/aws/ami).

1. Copy `packer_vars.json.example` to `packer_vars.json`
    ```bash
    $ cp ./packer_vars.json.example ./packer_vars.json
    ```
1. Edit `packer_vars.json` 
    * set `vpc_region`, `instance_arch`, and other variables as needed
1. Validate the packer configuration
    ```bash
    $ packer validate packer_build.json
    The configuration is valid.
    ```
1. Launch packer to build the AMI, providing `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` as environment variables:
    ```bash
    $ AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY \
        AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_KEY \
        packer build -var-file=packer_vars.json packer_build.json

    amazon-ebs: output will be in this color.

    ==> amazon-ebs: Prevalidating any provided VPC information
    ==> amazon-ebs: Prevalidating AMI Name: malcolm-v{{ site.malcolm.version }}-x86_64-2024-10-10T15-41-32Z
        amazon-ebs: Found Image ID: ami-xxxxxxxxxxxxxxxxx

    ...

    ==> amazon-ebs: Waiting for AMI to become ready...
    ==> amazon-ebs: Skipping Enable AMI deprecation...
    ==> amazon-ebs: Adding tags to AMI (ami-xxxxxxxxxxxxxxxxx)...
    ==> amazon-ebs: Tagging snapshot: snap-xxxxxxxxxxxxxxxxx
    ==> amazon-ebs: Creating AMI tags
        amazon-ebs: Adding tag: "Malcolm": "idaholab/Malcolm/v{{ site.malcolm.version }}"
        amazon-ebs: Adding tag: "source_ami_name": "al2023-ami-ecs-hvm-2023.0.20241003-kernel-6.1-x86_64"
    ==> amazon-ebs: Creating snapshot tags
    ==> amazon-ebs: Terminating the source AWS instance...
    ==> amazon-ebs: Cleaning up any extra volumes...
    ==> amazon-ebs: No volumes to clean up, skipping
    ==> amazon-ebs: Deleting temporary keypair...
    Build 'amazon-ebs' finished after 19 minutes 57 seconds.

    ==> Wait completed after 19 minutes 57 seconds

    ==> Builds finished. The artifacts of successful builds are:
    --> amazon-ebs: AMIs were created:
    us-east-1: ami-xxxxxxxxxxxxxxxxx
    ```
1. Use `aws` (or the [Amazon EC2 console](https://us-east-1.console.aws.amazon.com/ec2/home)) to verify that the new AMI exists
    ```bash
    $ aws ec2 describe-images --owners self --filters "Name=root-device-type,Values=ebs" --filters "Name=name,Values=malcolm-*"
    ```
    ```json
    {
        "Images": [
            {
                "Architecture": "x86_64",
                "CreationDate": "2024-05-30T14:02:21.000Z",
                "ImageId": "ami-xxxxxxxxxxxxxxxxx",
                "ImageLocation": "xxxxxxxxxxxx/malcolm-v{{ site.malcolm.version }}-arm64-2024-05-30T13-57-31Z",
                "ImageType": "machine",
                "Public": false,
                "OwnerId": "xxxxxxxxxxxx",
                "PlatformDetails": "Linux/UNIX",
                "UsageOperation": "RunInstances",
                "State": "available",
                "BlockDeviceMappings": [
                    {
                        "DeviceName": "/dev/xvda",
                        "Ebs": {
                            "DeleteOnTermination": true,
                            "SnapshotId": "snap-xxxxxxxxxxxxxxxxx",
                            "VolumeSize": 30,
                            "VolumeType": "gp2",
                            "Encrypted": false
                        }
                    }
                ],
                "EnaSupport": true,
                "Hypervisor": "xen",
                "Name": "malcolm-v{{ site.malcolm.version }}-arm64-2024-05-30T13-57-31Z",
                "RootDeviceName": "/dev/xvda",
                "RootDeviceType": "ebs",
                "SriovNetSupport": "simple",
                "Tags": [
                    {
                        "Key": "Malcolm",
                        "Value": "idaholab/Malcolm/v{{ site.malcolm.version }}"
                    },
                    {
                        "Key": "source_ami_name",
                        "Value": "al2023-ami-ecs-hvm-2023.0.20241003-kernel-6.1-x86_64"
                    }
                ],
                "VirtualizationType": "hvm",
                "BootMode": "uefi",
                "SourceInstanceId": "i-xxxxxxxxxxxxxxxxx",
                "DeregistrationProtection": "disabled"
            }
        ]
    }
    ```
1. Launch an instance from the new AMI
    * for x86-64 instances `c4.4xlarge`, `t2.2xlarge`, and `t3a.2xlarge` seem to be good instance types for Malcolm
    * for arm64 instances, `m6gd.2xlarge`, `m6g.2xlarge`, `m7g.2xlarge`, and `t4g.2xlarge` seem to be good instance types for Malcolm
    * see [recommended system requirements](system-requirements.md#SystemRequirements) for Malcolm
1. SSH into the instance
1. Run `~/Malcolm/scripts/configure` to configure Malcolm
1. Run `~/Malcolm/scripts/auth_setup` to set up authentication for Malcolm
1. Run `~/Malcolm/scripts/start` to start Malcolm

### <a name="AWSAMIMFA"></a> Using MFA

Users with [AWS MFA requirements](https://docs.aws.amazon.com/console/iam/self-mfa) may receive an `UnauthorizedOperation` error when performing the steps outlined above. If this is the case, the following workaround may allow the build to execute (thanks to [this GitHub comment](https://github.com/hashicorp/packer-plugin-amazon/issues/441#issuecomment-1880073476)):

1. Remove the `access_key` and `secret_key` lines from the `builders` section of `packer_build.json` (right below `"type": "amazon-ebs"`)
1. Run `aws ec2 describe-instances --profile=xxxxxxxx` (replacing `xxxxxxxx` with the credential profile name) to cause `aws` to authenticate (prompting for the MFA code) and cache the credentials
1. At the bash command line, run: `eval "$(aws configure export-credentials --profile xxxxxxxx --format env)"` to load the current AWS credentials into environment variables in the current session
1. Run the `packer build` command as described in the previous section

### <a name="AWSAttribution"></a> Attribution

Amazon Web Services, AWS, the Powered by AWS logo, and Amazon Machine Image (AMI) are trademarks of Amazon.com, Inc. or its affiliates. The information about providers and services contained in this document is for instructional purposes and does not constitute endorsement or recommendation. 
