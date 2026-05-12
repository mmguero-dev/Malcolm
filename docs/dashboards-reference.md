# Malcolm Dashboard Reference

> This document provides user-focused descriptions of all available dashboards and their visualizations. Use it to understand what each dashboard monitors, what data it surfaces, and how to interpret individual panels.

---

## Table of Contents

* [Actions and Results](#actions-and-results)
* [ANSI C12.22](#ansi-c1222)
* [Asset Interaction Analysis](#asset-interaction-analysis)
* [BACnet](#bacnet)
* [BSAP](#bsap)
* [Connections](#connections)
* [Connections - Destination - Originator Bytes (region map)](#connections-destination-originator-bytes-region-map)
* [Connections - Destination - Responder Bytes](#connections-destination-responder-bytes)
* [Connections - Destination - Responder Bytes (region map)](#connections-destination-responder-bytes-region-map)
* [Connections - Destination - Sum of Total Bytes](#connections-destination-sum-of-total-bytes)
* [Connections - Destination - Sum of Total Bytes (region map)](#connections-destination-sum-of-total-bytes-region-map)
* [Connections - Destination - Top Connection Duration](#connections-destination-top-connection-duration)
* [Connections - Destination - Top Connection Duration (region map)](#connections-destination-top-connection-duration-region-map)
* [Connections - Source - Originator Bytes](#connections-source-originator-bytes)
* [Connections - Source - Originator Bytes (region map)](#connections-source-originator-bytes-region-map)
* [Connections - Source - Responder Bytes (region map)](#connections-source-responder-bytes-region-map)
* [Connections - Source - Sum of Total Bytes](#connections-source-sum-of-total-bytes)
* [Connections - Source - Sum of Total Bytes (region map)](#connections-source-sum-of-total-bytes-region-map)
* [Connections - Source - Top Connection Duration](#connections-source-top-connection-duration)
* [Connections - Source - Top Connection Duration (region map)](#connections-source-top-connection-duration-region-map)
* [DCE/RPC](#dcerpc)
* [DHCP](#dhcp)
* [DNP3](#dnp3)
* [DNS](#dns)
* [EtherCAT](#ethercat)
* [EtherNet/IP](#ethernetip)
* [File Scanning](#file-scanning)
* [File Tree](#file-tree)
* [Files](#files)
* [FTP](#ftp)
* [GE SRTP](#ge-srtp)
* [GENISYS](#genisys)
* [HART-IP](#hart-ip)
* [HTTP](#http)
* [ICS Best Guess](#ics-best-guess)
* [ICS/IoT Security Overview](#icsiot-security-overview)
* [IP Connections Tree](#ip-connections-tree)
* [IRC](#irc)
* [Kerberos](#kerberos)
* [LDAP](#ldap)
* [Modbus](#modbus)
* [MQTT](#mqtt)
* [MySQL](#mysql)
* [NTLM](#ntlm)
* [NTP](#ntp)
* [Omron FINS](#omron-fins)
* [OPCUA Binary](#opcua-binary)
* [OSPF](#ospf)
* [Overview](#overview)
* [PE](#pe)
* [PostgreSQL](#postgresql)
* [PROFINET](#profinet)
* [QUIC](#quic)
* [RADIUS](#radius)
* [RDP](#rdp)
* [Redis](#redis)
* [RFB](#rfb)
* [ROC Plus](#roc-plus)
* [S7comm / S7comm Plus](#s7comm-s7comm-plus)
* [Security Overview](#security-overview)
* [Severity](#severity)
* [Signatures](#signatures)
* [SIP](#sip)
* [SMB](#smb)
* [SMTP](#smtp)
* [SNMP](#snmp)
* [Software](#software)
* [SSH](#ssh)
* [SSL](#ssl)
* [STUN](#stun)
* [Suricata Alerts](#suricata-alerts)
* [Synchrophasor](#synchrophasor)
* [Syslog](#syslog)
* [Tabular Data Stream](#tabular-data-stream)
* [Tabular Data Stream - RPC](#tabular-data-stream-rpc)
* [Tabular Data Stream - SQL](#tabular-data-stream-sql)
* [Telnet, rlogin and rsh](#telnet-rlogin-and-rsh)
* [TFTP](#tftp)
* [Threat Intelligence](#threat-intelligence)
* [Tunnels](#tunnels)
* [WebSocket](#websocket)
* [X.509](#x509)
* [Zeek Known Summary](#zeek-known-summary)
* [Zeek Notices](#zeek-notices)
* [Zeek Weird](#zeek-weird)

---

## Actions and Results

* ID: [a33e0a50-afcd-11ea-993f-b7d8522a8bed](#/dashboard/a33e0a50-afcd-11ea-993f-b7d8522a8bed)

The Actions and Results dashboard provides a cross-protocol view of operation types and their outcomes across all monitored ICS and IT protocols. It aggregates event action and result fields to show what commands were issued, which succeeded or failed, and which hosts were involved. This is useful for detecting anomalous command patterns, failed authentication attempts, and unauthorized operations across protocols.

### Visualizations

#### Total Log Count Over Time by Application Protocol

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### Total Number of Logs

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `event.provider`


#### Top Actions by Service

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `event.action`
* `network.protocol`
* timestamp


#### Top Results by Service

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `event.result`
* `network.protocol`
* timestamp


#### Actions

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.action`
* `network.protocol`


#### Results

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.result`
* `network.protocol`


#### All Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


---

## ANSI C12.22

* ID: [db51fc00-673b-11f0-8230-37b935257dd0](#/dashboard/db51fc00-673b-11f0-8230-37b935257dd0)

*ANSI C12.22 visualizations*

The ANSI C12.22 dashboard covers the [ANSI C12.22](https://en.wikipedia.org/wiki/ANSI_C12.22) smart meter communication protocol traffic, used in advanced metering infrastructure (AMI) and utility environments. It surfaces service types, device identifiers, table data access, and communication pairs between meters and head-end systems. Analysts monitoring utility networks can use this dashboard to detect unauthorized meter access, data manipulation, and rogue devices communicating on the AMI network.

### Visualizations

#### C12.22 - Log Count

*Count of C1222 logs by log type*

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - Logs Over Time

*C12.22 logs sorted by time and type*

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22  - Transport Protocol

**Purpose:** A pie chart showing the proportional distribution of Transport Protocol for C12.22 . Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - Source IPs

*The source IP addresses of C12.22 traffic*

**Purpose:** A ranked frequency table of Source IPs values for C12.22. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - Destination IPs

*The destination addresses for C12.22 traffic*

**Purpose:** A ranked frequency table of Destination IPs values for C12.22. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - Users

**Purpose:** A horizontal bar chart ranking Users for C12.22 by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - EPSEM Services

*C12.22 EPSEM services by count*

**Purpose:** A ranked frequency table of EPSEM Services values for C12.22. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.epsem_service`
* `zeek.c1222.req_resp`


#### C12.22 - AP Titles

*AP Titles as shown in the C12.22 network traffic*

**Purpose:** A ranked frequency table of AP Titles values for C12.22. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - Actions

*The C12.22 actions seen in network traffic.*

**Purpose:** A ranked frequency table of Actions values for C12.22. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - Results

*ANSI C122.22 results seen in network traffic*

**Purpose:** A ranked frequency table of Results values for C12.22. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - Users and Passwords

*ANSI C12.22 passwords seen in network traffic*

**Purpose:** A ranked frequency table of Users and Passwords values for C12.22. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `related.password`
* `related.user`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


#### C12.22 - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.c1222.called_ap_invocation_id`
* `zeek.c1222.called_ap_title`
* `zeek.c1222.calling_ap_invocation_id`
* `zeek.c1222.calling_ap_title`
* `zeek.c1222.calling_auth_value`
* `zeek.c1222.elements`
* `zeek.c1222.is_encrypted_epsem`


#### C12.22 - Service Error Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp


#### C12.22 - User Information Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.c1222.epsem_service`
* `zeek.c1222_user_information.encrypted_epsem`
* `zeek.c1222_user_information.epsem_control`
* `zeek.c1222_user_information.mac`


#### C12.22 and Related - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.c1222.ap_title`
* `zeek.c1222.req_resp`


---

## Asset Interaction Analysis

* ID: [677ee170-809e-11ed-8d5b-07069f823b6f](#/dashboard/677ee170-809e-11ed-8d5b-07069f823b6f)

The Asset Interaction Analysis dashboard maps the communication relationships between hosts on the network enriched with the context provided by the [NetBox asset inventory](asset-interaction-analysis.md), providing a behavioral picture of which assets talk to which. It uses connection and protocol data to surface interaction patterns, cross-segment traffic, unusual peer relationships, and potentially unauthorized lateral movement. Security teams use this dashboard to understand normal communication baselines and flag deviations that may indicate compromise or misconfiguration.

### Visualizations

#### Traffic by Network Segment

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.segment.name`
* `network.bytes`
* `network.direction`
* `network.packets`
* `related.site`
* `source.segment.name`
* timestamp


#### Network Site

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `related.site`


#### Cross Segment Traffic

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `destination.segment.name`
* `source.segment.name`
* timestamp


#### Protocol by Network Segment

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.name`
* `network.protocol`
* `network.transport`
* `network.type`
* `related.site`


#### Event Severity by Network Segment

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.risk_score`
* `event.severity_tags`
* `network.name`
* `related.site`


#### Source Device Type

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `source.device.device_type`
* `source.device.manufacturer`
* `source.device.role`


#### Notice, Alert and Signature by Network Segment

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.dataset`
* `event.provider`
* `network.name`
* `related.site`
* `rule.category`


#### Destination Device Type

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.device.device_type`
* `destination.device.manufacturer`
* `destination.device.role`


#### Source Device Role

**Purpose:** A horizontal bar chart ranking values in this category by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `source.device.role`


#### Destination Device Role

**Purpose:** A horizontal bar chart ranking values in this category by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.device.role`


#### Source Device Log Counts

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `source.device.device_type`
* `source.device.manufacturer`
* `source.device.name`
* `source.device.role`


#### Destination Device Log Counts

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.device.device_type`
* `destination.device.manufacturer`
* `destination.device.name`
* `destination.device.role`


#### Uninventoried Internal Source IPs

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.oui`
* `destination.segment.name`
* `event.dataset`
* `event.id`
* `event.provider`
* `network.protocol`
* `network.transport`
* `related.site`
* `source.ip`
* `source.oui`
* `source.segment.name`
* `source.segment.site`


#### Uninventoried Internal Destination IPs

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.oui`
* `destination.segment.name`
* `destination.segment.site`
* `event.dataset`
* `event.id`
* `event.provider`
* `network.protocol`
* `network.transport`
* `related.site`
* `source.ip`
* `source.oui`
* `source.segment.name`


#### Uninventoried Internal Assets - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.oui`
* `destination.segment.name`
* `event.dataset`
* `event.id`
* `event.provider`
* `network.protocol`
* `network.transport`
* `related.site`
* `source.ip`
* `source.oui`
* `source.segment.name`


#### Uninventoried Observed Services - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `destination.segment.name`
* `event.dataset`
* `event.id`
* `event.provider`
* `network.protocol`
* `network.transport`
* `network.type`
* `related.site`
* `source.ip`


---

## BACnet

* ID: [2bec1490-eb94-11e9-a384-0fcf32210194](#/dashboard/2bec1490-eb94-11e9-a384-0fcf32210194)

*Dashboard for the BACnet (Building Automation and Control Networks) Protocol*

The BACnet dashboard covers [Building Automation and Control network (BACnet)](https://en.wikipedia.org/wiki/BACnet) protocol traffic, targeting building management systems. It tracks service types, instance numbers, vendor IDs, object identifiers, and device communication patterns. Analysts and building automation security teams can use this dashboard to detect unauthorized access to HVAC, lighting, and physical access control systems.

### Visualizations

#### BACnet - Log Count

*Count of BACnet logs including BACnet Discovery and Property logs*

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `event.dataset`


#### BACnet - Logs Over Time

*BACnet Logs over Time*

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `event.dataset`
* timestamp


#### BACnet - Device Vendors

*BACnet Device Vendors from i-am messages*

**Purpose:** A pie chart showing the proportional distribution of Device Vendors for BACnet. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.instance_number`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet_discovery.object_type`
* `zeek.bacnet_discovery.vendor`


#### BACnet - BVLC Functions

*BACnet Virtual Link Control Functions (Link-Layer Control)*

**Purpose:** A ranked frequency table of BVLC Functions values for BACnet. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.bvlc_function`
* `zeek.bacnet.invoke_id`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet.pdu_type`


#### ATT&CK for ICS Tactic - BACnet

**Purpose:** A horizontal bar chart ranking BACnet for ATT&CK for ICS Tactic by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.protocol`
* `source.ip`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp
* `zeek.notice.msg`


#### BACnet - Actions and Results

**Purpose:** A ranked frequency table of Actions and Results values for BACnet. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.action`
* `event.result`


#### BACnet - Protocol Data Units (PDUs)

*BACnet Application Layer Protocol Data Unit types and services*

**Purpose:** A ranked frequency table of Protocol Data Units (PDUs) values for BACnet. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.bvlc_function`
* `zeek.bacnet.invoke_id`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet.pdu_type`


#### ATT&CK for ICS Notices - BACnet

**Purpose:** A ranked frequency table of BACnet values for ATT&CK for ICS Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.protocol`
* `source.ip`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp
* `zeek.notice.msg`


#### BACnet - Source IP

*Source IP Addresses from bacnet.log*

**Purpose:** A ranked frequency table of Source IP values for BACnet. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `source.ip`


#### BACnet - Destination IP

*Destination IP Addresses from bacnet.log*

**Purpose:** A ranked frequency table of Destination IP values for BACnet. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`


#### BACnet - Device Discovery

*Results from BACnet i-am and i-have commands*

**Purpose:** A ranked frequency table of Device Discovery values for BACnet. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.instance_number`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet_discovery.object_type`
* `zeek.bacnet_discovery.vendor`


#### BACnet - Trends

**Purpose:** A custom visualization of log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `MALCOLM_OTHER_INDEX_TIME_FIELD_REPLACER`
* `event.dataset`
* `scheme`
* `zeek.bacnet_property.property`
* `zeek.bacnet_property.value`


#### BACnet  - Read and Write Property

*Results from BACnet Read-Property and Write-Property Commands*

**Purpose:** A ranked frequency table of Read and Write Property  values for BACnet . Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.instance_number`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet_property.object_type`
* `zeek.bacnet_property.property`
* `zeek.bacnet_property.value`


#### BACnet - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.bvlc_function`
* `zeek.bacnet.invoke_id`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet.pdu_type`


#### BACnet - Property Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.instance_number`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet_property.object_type`
* `zeek.bacnet_property.property`
* `zeek.bacnet_property.value`


#### BACnet - Discovery Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.instance_number`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet_discovery.object_type`
* `zeek.bacnet_discovery.vendor`


#### BACnet Device Control - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.result`
* `source.ip`
* `zeek.bacnet.invoke_id`
* `zeek.uid`


---

## BSAP

* ID: [ca5799a0-56b5-11eb-b749-576de068f8ad](#/dashboard/ca5799a0-56b5-11eb-b749-576de068f8ad)

The BSAP dashboard covers [Bristol Standard Asynchronous Protocol (BSAP)](https://en.wikipedia.org/wiki/Bristol_Standard_Asynchronous_Protocol) traffic used in ABB and Bristol Babcock control systems, common in oil and gas and chemical process environments. It logs function codes, device addresses, and communication pairs observed on the network. Security teams can use this dashboard to detect unauthorized commands to BSAP-enabled field devices and monitor for unexpected communication sources.

### Visualizations

#### BSAP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### BSAP - Logs Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### BSAP - Source IP

**Purpose:** A ranked frequency table of Source IP values for BSAP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* timestamp


#### BSAP IP - Function

**Purpose:** A ranked frequency table of Function values for BSAP IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.bsap_ip_rdb.app_func_code`
* `zeek.bsap_ip_rdb.func_code`
* `zeek.bsap_ip_rdb.node_status`
* `zeek.bsap_ip_rdb.variable_count`
* `zeek.bsap_ip_rdb.variables`


#### BSAP - Transport

**Purpose:** A pie chart showing the proportional distribution of Transport for BSAP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `network.transport`
* `source.ip`
* timestamp


#### BSAP Serial - RDB Function

**Purpose:** A ranked frequency table of RDB Function values for BSAP Serial. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.bsap_serial_header.dfun`
* `zeek.bsap_serial_header.nsb`
* `zeek.bsap_serial_header.sfun`
* `zeek.bsap_serial_header.type_name`
* `zeek.bsap_serial_rdb.func_code`
* `zeek.bsap_serial_rdb.variable_count`
* `zeek.bsap_serial_rdb.variables`


#### BSAP Serial - Function

**Purpose:** A ranked frequency table of Function values for BSAP Serial. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.bsap_serial_header.dfun`
* `zeek.bsap_serial_header.nsb`
* `zeek.bsap_serial_header.sfun`
* `zeek.bsap_serial_header.type_name`
* `zeek.bsap_serial_rdb.func_code`
* `zeek.bsap_serial_rdb.variable_count`
* `zeek.bsap_serial_rdb.variables`


#### BSAP IP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.bsap_ip_rdb.app_func_code`
* `zeek.bsap_ip_rdb.func_code`
* `zeek.bsap_ip_rdb.node_status`
* `zeek.bsap_ip_rdb.variable_count`
* `zeek.bsap_ip_rdb.variables`


#### BSAP Serial - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.bsap_serial_header.dfun`
* `zeek.bsap_serial_header.nsb`
* `zeek.bsap_serial_header.sfun`
* `zeek.bsap_serial_header.type_name`
* `zeek.bsap_serial_rdb.func_code`
* `zeek.bsap_serial_rdb.variable_count`
* `zeek.bsap_serial_rdb.variables`


#### BSAP - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for BSAP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


---

## Connections

* ID: [abdd7550-2c7c-40dc-947e-f6d186a158c4](#/dashboard/abdd7550-2c7c-40dc-947e-f6d186a158c4)

The Connections dashboard covers all network-layer connection records observed on the network, including TCP, UDP, and ICMP flows. It surfaces data on conversation volumes, data transfer sizes, connection durations, geographic origins and destinations, and top talkers by byte count. Users can identify chatty hosts, large data transfers, long-lived connections, and cross-border traffic that may warrant further investigation.

### Visualizations

#### Connections - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Service By Destination Country

**Purpose:** A pie chart showing the proportional distribution of Service By Destination Country for Connections. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Source Country

**Purpose:** A ranked frequency table of Source Country values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.geo.country_code2`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Responder Bytes

**Purpose:** A ranked frequency table of Responder Bytes values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `server.bytes`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Missed Bytes

**Purpose:** A ranked frequency table of Missed Bytes values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp
* `zeek.conn.missed_bytes`


#### Connections - Connection State

**Purpose:** A ranked frequency table of Connection State values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp
* `zeek.conn.conn_state_description`


#### Connections - Top 10 - Total Bytes By Connection

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Top 10 - Total Bytes By Destination IP

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Top 10 - Total Bytes By Destination Port

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Top 10 - Total Bytes By Source IP

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Total Bytes Per Source/Destination IP Pair

**Purpose:** A ranked frequency table of Total Bytes Per Source/Destination IP Pair values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Source MAC OUI

**Purpose:** A ranked frequency table of Source MAC OUI values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.oui`
* `source.port`
* timestamp


#### Connections - Destination MAC OUI

**Purpose:** A ranked frequency table of Destination MAC OUI values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.oui`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Source MAC Address

**Purpose:** A ranked frequency table of Source MAC Address values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.mac`
* `source.oui`
* `source.port`
* timestamp


#### Connections - Destination MAC Address

**Purpose:** A ranked frequency table of Destination MAC Address values for Connections. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.mac`
* `destination.oui`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Top 10 - Total Bytes By Source MAC OUI

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.oui`
* `source.port`
* timestamp


#### Connections - Top 10 - Total Bytes By Destination MAC OUI

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.oui`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Protocol

**Purpose:** A pie chart showing the proportional distribution of Protocol for Connections. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Long Connections - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp
* `zeek.conn.long`


#### Network Layer

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `network.type`
* `source.ip`
* `source.port`
* timestamp


#### Connections - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.community_id`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Destination - Originator Bytes (region map)

* ID: [55e332d0-3f99-11e9-a58e-8bdedb0915e8](#/dashboard/55e332d0-3f99-11e9-a58e-8bdedb0915e8)

This country-level map shades destination countries by the volume of bytes sent to them by originators, on a green-to-red scale where green indicates lower volumes and red indicates higher volumes. It gives a geographic overview of where data is being directed at a national level. Useful for quickly spotting countries receiving disproportionately large volumes of traffic.

### Visualizations

#### Connections - Destination - Originator Bytes (region map)

**Purpose:** A country-level map shading destination countries by bytes sent by originators, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `client.bytes`
* `destination.geo.country_iso_code`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Destination - Responder Bytes

* ID: [d4fd6afd-15cb-42bf-8a25-03dd8e59b327](#/dashboard/d4fd6afd-15cb-42bf-8a25-03dd8e59b327)

This coordinate map plots destination locations as dots sized by the volume of bytes sent back by responders, pinned to city-level precision. It highlights specific geographic locations where large volumes of response data are originating. Useful for detecting concentrated sources of response traffic at a granular level.

### Visualizations

#### Connections - Destination - Responder Bytes

**Purpose:** A city-level coordinate map plotting destination locations as dots sized by bytes sent by responders. Enables identification of specific geographic hotspots at a granular level.

**Fields / Aggregations:**

* `destination.geo.location`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `server.bytes`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Destination - Responder Bytes (region map)

* ID: [77fc9960-3f99-11e9-a58e-8bdedb0915e8](#/dashboard/77fc9960-3f99-11e9-a58e-8bdedb0915e8)

This country-level map shades destination countries by the volume of bytes sent back by responders, on a green-to-red scale where green indicates lower volumes and red indicates higher volumes. It gives a geographic overview of which countries are generating the most response traffic back to monitored hosts. Useful for identifying national-level sources of high-volume response data.

### Visualizations

#### Connections - Destination - Responder Bytes (region map)

**Purpose:** A country-level map shading destination countries by bytes sent by responders, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.geo.country_iso_code`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `server.bytes`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Destination - Sum of Total Bytes

* ID: [60d78fbd-471c-4f59-a9e3-189b33a13644](#/dashboard/60d78fbd-471c-4f59-a9e3-189b33a13644)

This coordinate map plots destination locations as dots sized by total bytes in both directions, pinned to city-level precision. It highlights specific geographic locations involved in the heaviest overall data exchange. Useful for detecting geographic hotspots of combined traffic volume at a granular level.

### Visualizations

#### Connections - Destination - Sum of Total Bytes

**Purpose:** A city-level coordinate map plotting destination locations as dots sized by total bytes in both directions. Enables identification of specific geographic hotspots at a granular level.

**Fields / Aggregations:**

* `destination.geo.location`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Destination - Sum of Total Bytes (region map)

* ID: [a16110b0-3f99-11e9-a58e-8bdedb0915e8](#/dashboard/a16110b0-3f99-11e9-a58e-8bdedb0915e8)

This country-level map shades destination countries by total bytes exchanged in both directions, on a green-to-red scale where green indicates lower volumes and red indicates higher volumes. It provides a high-level geographic summary of which countries are associated with the most overall network traffic. Useful for identifying countries with disproportionately high combined data volumes.

### Visualizations

#### Connections - Destination - Sum of Total Bytes (region map)

**Purpose:** A country-level map shading destination countries by total bytes in both directions, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.geo.country_iso_code`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Destination - Top Connection Duration

* ID: [0aed0e23-c8ac-4f2b-9f68-d04b6e7666b0](#/dashboard/0aed0e23-c8ac-4f2b-9f68-d04b6e7666b0)

This coordinate map plots destination locations as dots sized by connection duration, pinned to city-level precision. It highlights specific geographic locations associated with the longest-lived connections. Useful for detecting persistent communication channels to unexpected destinations at a granular level.

### Visualizations

#### Connections - Destination - Top Connection Duration

**Purpose:** A city-level coordinate map plotting destination locations as dots sized by connection duration. Enables identification of specific geographic hotspots at a granular level.

**Fields / Aggregations:**

* `destination.geo.location`
* `destination.ip`
* `destination.port`
* `event.duration`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Destination - Top Connection Duration (region map)

* ID: [b9f247c0-3f99-11e9-a58e-8bdedb0915e8](#/dashboard/b9f247c0-3f99-11e9-a58e-8bdedb0915e8)

This country-level map shades destination countries by longest connection duration, on a green-to-red scale where green indicates shorter durations and red indicates longer ones. It provides a geographic overview of which nations are associated with the most long-lived outbound connections. Useful for identifying countries linked to persistent communication that may indicate C2 or ongoing exfiltration.

### Visualizations

#### Connections - Destination - Top Connection Duration (region map)

**Purpose:** A country-level map shading destination countries by connection duration, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.geo.country_iso_code`
* `destination.ip`
* `destination.port`
* `event.duration`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Source - Originator Bytes

* ID: [b50c8d17-6ed3-4de6-aed4-5181032810b2](#/dashboard/b50c8d17-6ed3-4de6-aed4-5181032810b2)

This coordinate map plots source locations as dots sized by the volume of bytes sent as an originator, pinned to city-level precision. It highlights specific geographic locations generating the most outbound data. Useful for detecting high-volume originating sources at a granular geographic level.

### Visualizations

#### Connections - Source - Originator Bytes

**Purpose:** A city-level coordinate map plotting source locations as dots sized by bytes sent by originators. Enables identification of specific geographic hotspots at a granular level.

**Fields / Aggregations:**

* `client.bytes`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.geo.location`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Source - Originator Bytes (region map)

* ID: [d41fe630-3f98-11e9-a58e-8bdedb0915e8](#/dashboard/d41fe630-3f98-11e9-a58e-8bdedb0915e8)

This country-level map shades source countries by the volume of bytes sent as originators, on a green-to-red scale where green indicates lower volumes and red indicates higher volumes. It provides a geographic overview of which nations are generating the most outbound traffic. Useful for correlating high-volume originator activity with known threat actor regions or unexpected source countries.

### Visualizations

#### Connections - Source - Originator Bytes (region map)

**Purpose:** A country-level map shading source countries by bytes sent by originators, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `client.bytes`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.geo.country_iso_code`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Source - Responder Bytes (region map)

* ID: [ed8a6640-3f98-11e9-a58e-8bdedb0915e8](#/dashboard/ed8a6640-3f98-11e9-a58e-8bdedb0915e8)

This country-level map shades source countries by the volume of bytes received from responders, on a green-to-red scale where green indicates lower volumes and red indicates higher volumes. It provides a geographic overview of which source nations are receiving the most response data. Useful for identifying countries whose hosts are pulling large volumes of data from remote responders.

### Visualizations

#### Connections - Source - Responder Bytes (region map)

**Purpose:** A country-level map shading source countries by bytes sent by responders, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `server.bytes`
* `source.geo.country_iso_code`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Source - Sum of Total Bytes

* ID: [f394057d-1b16-4174-b994-7045f423a416](#/dashboard/f394057d-1b16-4174-b994-7045f423a416)

This coordinate map plots source locations as dots sized by total bytes in both directions, pinned to city-level precision. It highlights specific geographic locations with the highest combined traffic volumes. Useful for surfacing geographic hotspots of overall activity at a granular level.

### Visualizations

#### Connections - Source - Sum of Total Bytes

**Purpose:** A city-level coordinate map plotting source locations as dots sized by total bytes in both directions. Enables identification of specific geographic hotspots at a granular level.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.geo.location`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Source - Sum of Total Bytes (region map)

* ID: [1ce42250-3f99-11e9-a58e-8bdedb0915e8](#/dashboard/1ce42250-3f99-11e9-a58e-8bdedb0915e8)

This country-level map shades source countries by total bytes exchanged in both directions, on a green-to-red scale where green indicates lower volumes and red indicates higher volumes. It provides a high-level geographic summary of which nations are the most network-active overall. Useful for identifying countries with disproportionately high combined traffic volumes.

### Visualizations

#### Connections - Source - Sum of Total Bytes (region map)

**Purpose:** A country-level map shading source countries by total bytes in both directions, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.geo.country_iso_code`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Source - Top Connection Duration

* ID: [e09a4b86-29b5-4256-bb3b-802ac9f90404](#/dashboard/e09a4b86-29b5-4256-bb3b-802ac9f90404)

This coordinate map plots source locations as dots sized by connection duration, pinned to city-level precision. It highlights specific geographic locations where the most persistent outbound connections originate. Useful for detecting long-running sessions from unexpected locations that may indicate beaconing or C2 activity.

### Visualizations

#### Connections - Source - Top Connection Duration

**Purpose:** A city-level coordinate map plotting source locations as dots sized by connection duration. Enables identification of specific geographic hotspots at a granular level.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.duration`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.geo.location`
* `source.ip`
* `source.port`
* timestamp


---

## Connections - Source - Top Connection Duration (region map)

* ID: [39abfe30-3f99-11e9-a58e-8bdedb0915e8](#/dashboard/39abfe30-3f99-11e9-a58e-8bdedb0915e8)

This country-level map shades source countries by longest connection duration, on a green-to-red scale where green indicates shorter durations and red indicates longer ones. It provides a geographic overview of which nations are associated with the most persistent originating connections. Useful for identifying countries linked to long-lived communication patterns that may indicate ongoing adversary activity.

### Visualizations

#### Connections - Source - Top Connection Duration (region map)

**Purpose:** A country-level map shading source countries by connection duration, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.duration`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.geo.country_iso_code`
* `source.ip`
* `source.port`
* timestamp


---

## DCE/RPC

* ID: [432af556-c5c0-4cc3-8166-b274b4e3a406](#/dashboard/432af556-c5c0-4cc3-8166-b274b4e3a406)

The DCE/RPC dashboard provides visibility into [Distributed Computing Environment / Remote Procedure Call (DCE/RPC)](https://en.wikipedia.org/wiki/DCE/RPC) traffic, which underlies many Windows protocols including DCOM and WMI. It surfaces endpoint UUIDs, operations, named pipes, and the hosts involved in RPC exchanges. Security teams can use this dashboard to detect lateral movement via WMI or DCOM, identify unusual RPC service calls, and spot DCE/RPC-based reconnaissance.

### Visualizations

#### DCE/RPC - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for DCE/RPC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for DCE/RPC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Endpoint

**Purpose:** A ranked frequency table of Endpoint values for DCE/RPC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Named Pipe

**Purpose:** A ranked frequency table of Named Pipe values for DCE/RPC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.named_pipe`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Operation

**Purpose:** A ranked frequency table of Operation values for DCE/RPC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Round Trip Time

**Purpose:** A ranked frequency table of Round Trip Time values for DCE/RPC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`
* `zeek.dce_rpc.rtt`


#### DCE/RPC - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for DCE/RPC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Summary

**Purpose:** A ranked frequency table of Summary values for DCE/RPC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.named_pipe`
* `zeek.dce_rpc.operation`


#### DCE/RPC - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.dce_rpc.endpoint`
* `zeek.dce_rpc.operation`


---

## DHCP

* ID: [2d98bb8e-214c-4374-837b-20e1bcd63a5e](#/dashboard/2d98bb8e-214c-4374-837b-20e1bcd63a5e)

The DHCP dashboard tracks [Dynamic Host Configuration Protocol (DHCP)](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) activity observed on the network, including IP address assignments, hostname registrations, and lease activity. It provides a real-time picture of which devices are joining the network and what addresses they are receiving. Analysts can use it for asset discovery, detecting rogue DHCP servers, and correlating IP addresses with hostnames at specific points in time.

### Visualizations

#### DHCP - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


#### DHCP - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for DHCP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


#### DHCP - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for DHCP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


#### DHCP - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for DHCP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


#### DHCP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


#### DHCP - IP to MAC Assignment

**Purpose:** A ranked frequency table of IP to MAC Assignment values for DHCP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


#### DHCP - Client Software

**Purpose:** A ranked frequency table of Client Software values for DHCP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


#### DHCP - Server Software

**Purpose:** A ranked frequency table of Server Software values for DHCP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


#### DHCP - JA4D Fingerprint

**Purpose:** A ranked frequency table of JA4D Fingerprint values for DHCP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`
* `zeek.dhcp.vendor_class_id`


#### DHCP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `dhcp.ja4d`
* `event.dataset`
* `event.id`
* `source.ip`
* `source.mac`
* timestamp
* `zeek.dhcp.assigned_ip`
* `zeek.dhcp.client_software`
* `zeek.dhcp.domain`
* `zeek.dhcp.host_name`
* `zeek.dhcp.msg_types`
* `zeek.dhcp.server_software`


---

## DNP3

* ID: [870a5862-6c26-4a08-99fd-0c06cda85ba3](#/dashboard/870a5862-6c26-4a08-99fd-0c06cda85ba3)

*Dashboard for the DNP3 Protocol*

The DNP3 dashboard covers [Distributed Network Protocol 3 (DNP3)](https://en.wikipedia.org/wiki/DNP3) traffic, a common ICS protocol used in electric utility and water treatment environments. It surfaces function codes, object headers, master and outstation addresses, and request/response patterns observed on the network. This dashboard helps security and operations teams detect command injection, unauthorized polling, and anomalous DNP3 traffic that may indicate unauthorized access to field devices.

### Visualizations

#### DNP3 - Source IP

*Source IP Addresses from dnp3.log*

**Purpose:** A ranked frequency table of Source IP values for DNP3. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dnp3.fc_reply`
* `zeek.dnp3.iin_flags`


#### DNP3 - Destination IP

*Destination IP Addresses from dnp3.log*

**Purpose:** A ranked frequency table of Destination IP values for DNP3. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dnp3.fc_reply`
* `zeek.dnp3.iin_flags`


#### DNP3 - Function Request

*DNP3 function in request packet from dnp3.log*

**Purpose:** A ranked frequency table of Function Request values for DNP3. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dnp3.fc_reply`
* `zeek.dnp3.iin_flags`


#### DNP3 - Function Reply

*DNP3 function in reply packet from dnp3.log*

**Purpose:** A ranked frequency table of Function Reply values for DNP3. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dnp3.fc_reply`
* `zeek.dnp3.iin_flags`


#### DNP3 - Log Count

*Count of DNP3 logs including DNP3 Control and Objects logs*

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `event.dataset`


#### DNP3 - Logs Over Time

*DNP3 logs over time*

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `event.dataset`
* timestamp


#### DNP3 - Internal Indicators Overview

*DNP3 Internal Indicators from dnp3.iin in dnp3.log*

**Purpose:** A pie chart showing the proportional distribution of Internal Indicators Overview for DNP3. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dnp3.fc_reply`
* `zeek.dnp3.iin_flags`


#### DNP3 - Objects Overview

*Overview of DNP3 objects from READ-RESPONSE messages in dnp3_objects.log*

**Purpose:** A ranked frequency table of Objects Overview values for DNP3. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `source.ip`
* timestamp
* `zeek.dnp3_objects.object_count`
* `zeek.dnp3_objects.object_type`
* `zeek.dnp3_objects.range_high`
* `zeek.dnp3_objects.range_low`


#### DNP3 - Control Overview

*Overview of DNP3 control functions from dnp3_control.log*

**Purpose:** A ranked frequency table of Control Overview values for DNP3. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `source.ip`
* timestamp
* `zeek.dnp3_control.block_type`
* `zeek.dnp3_control.clear_bit`
* `zeek.dnp3_control.function_code`
* `zeek.dnp3_control.index_number`
* `zeek.dnp3_control.operation_type`
* `zeek.dnp3_control.status_code`
* `zeek.dnp3_control.trip_control_code`


#### DNP3 - Trends

**Purpose:** A custom visualization of log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `MALCOLM_OTHER_INDEX_TIME_FIELD_REPLACER`
* `event.action`
* `scheme`
* `zeek.dnp3_control.function_code`


#### DNP3 - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dnp3.fc_reply`
* `zeek.dnp3.iin_flags`


#### DNP3 - Control Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.dnp3_control.clear_bit`
* `zeek.dnp3_control.function_code`
* `zeek.dnp3_control.operation_type`
* `zeek.dnp3_control.status_code`
* `zeek.dnp3_control.trip_control_code`


#### DNP3 - Objects Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `source.ip`
* timestamp
* `zeek.dnp3_objects.object_count`
* `zeek.dnp3_objects.object_type`
* `zeek.dnp3_objects.range_high`
* `zeek.dnp3_objects.range_low`


---

## DNS

* ID: [2cf94cd0-ecab-40a5-95a7-8419f3a39cd9](#/dashboard/2cf94cd0-ecab-40a5-95a7-8419f3a39cd9)

The DNS dashboard provides a comprehensive view of [Domain Name System (DNS)](https://en.wikipedia.org/wiki/Domain_Name_System) activity observed on the network. It covers query volumes over time, top queried domains, response codes, query types, and the hosts generating DNS traffic. Analysts use it to detect DNS-based threats such as data exfiltration via DNS tunneling, domain generation algorithm (DGA) activity, and unusually high query rates.

### Visualizations

#### DNS - Server

**Purpose:** A ranked frequency table of Server values for DNS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Client

**Purpose:** A ranked frequency table of Client values for DNS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Query Class

**Purpose:** A pie chart showing the proportional distribution of Query Class for DNS. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.qclass_name`
* `zeek.dns.query`


#### DNS - Query/Answer

**Purpose:** A ranked frequency table of Query/Answer values for DNS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Destination Port

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Answers

**Purpose:** A ranked frequency table of Answers values for DNS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Response Code (Name)

**Purpose:** A ranked frequency table of Response Code (Name) values for DNS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`
* `zeek.dns.rcode_name`


#### DNS - Query Type

**Purpose:** A ranked frequency table of Query Type values for DNS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.qtype_name`
* `zeek.dns.query`


#### DNS - Protocol

**Purpose:** A pie chart showing the proportional distribution of Protocol for DNS. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS Queries by Randomness

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `dns.host`
* `event.freq_score_v1`
* `event.freq_score_v2`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


---

## EtherCAT

* ID: [4a073440-b286-11eb-a4d4-09fa12a6ebd4](#/dashboard/4a073440-b286-11eb-a4d4-09fa12a6ebd4)

The EtherCAT dashboard provides visibility into [EtherCAT](https://en.wikipedia.org/wiki/EtherCAT) industrial Ethernet traffic, used in high-speed motion control and automation systems. It captures command types, server addresses, working counters, and communication patterns between client and server devices. This dashboard is useful for detecting anomalous EtherCAT traffic that could indicate device tampering or unauthorized access to automation equipment.

### Visualizations

#### EtherCAT - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`


#### EtherCAT - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`
* timestamp


#### EtherCAT - Source

**Purpose:** A ranked frequency table of Source values for EtherCAT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`


#### EtherCAT - Destination

**Purpose:** A ranked frequency table of Destination values for EtherCAT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`


#### EtherCAT - Commands

**Purpose:** A ranked frequency table of Commands values for EtherCAT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`


#### EtherCAT - Register Types and Commands

**Purpose:** A ranked frequency table of Register Types and Commands values for EtherCAT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`
* `zeek.ecat_registers.register_type`


#### EtherCAT Registers - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `source.mac`
* `source.oui`
* `zeek.ecat_registers.register_addr`
* `zeek.ecat_registers.register_type`
* `zeek.ecat_registers.server_addr`


#### Logs - EtherCAT

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`


---

## EtherNet/IP

* ID: [29a1b290-eb98-11e9-a384-0fcf32210194](#/dashboard/29a1b290-eb98-11e9-a384-0fcf32210194)

*Dashboard for Ethernet/IP and CIP Protocols*

The EtherNet/IP dashboard covers [EtherNet/IP](https://en.wikipedia.org/wiki/EtherNet/IP) and [Common Industrial Protocol (CIP)](https://en.wikipedia.org/wiki/Common_Industrial_Protocol) traffic, which is widely used in manufacturing and process control environments. It surfaces CIP service codes, class and instance identifiers, device identity data, and communication pairs. Security teams can use this to monitor for unauthorized PLC access, unusual CIP commands, and unexpected EtherNet/IP device discovery activity.

### Visualizations

#### EtherNet/IP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `event.dataset`


#### EtherNet/IP - Logs Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `event.dataset`
* timestamp


#### Ethernet/IP - Commands

**Purpose:** A horizontal bar chart ranking Commands for Ethernet/IP by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.cip.packet_correlation_id`
* `zeek.enip.options`
* `zeek.enip.sender_context`
* `zeek.enip.session_handle`


#### EtherNet/IP - Source IP

**Purpose:** A ranked frequency table of Source IP values for EtherNet/IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `source.ip`


#### ATT&CK for ICS Tactic - EtherNet/IP and CIP

**Purpose:** A horizontal bar chart ranking EtherNet/IP and CIP for ATT&CK for ICS Tactic by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.protocol`
* `source.ip`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp
* `zeek.cip.packet_correlation_id`
* `zeek.notice.msg`


#### ATT&CK for ICS Notices - EtherNet/IP and CIP

**Purpose:** A ranked frequency table of EtherNet/IP and CIP values for ATT&CK for ICS Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.protocol`
* `source.ip`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp
* `zeek.cip.packet_correlation_id`
* `zeek.notice.msg`


#### EtherNet/IP - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for EtherNet/IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`


#### CIP - Device Identity

*CIP Identity Results*

**Purpose:** A ranked frequency table of Device Identity values for CIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.cip.packet_correlation_id`
* `zeek.cip_identity.device_type_name`
* `zeek.cip_identity.product_name`
* `zeek.cip_identity.revision`
* `zeek.cip_identity.serial_number`
* `zeek.cip_identity.vendor_name`


#### CIP - Services

*CIP Services and Status*

**Purpose:** A ranked frequency table of Services values for CIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.result`
* `source.ip`
* timestamp
* `zeek.cip.cip_sequence_count`
* `zeek.cip.class_id`
* `zeek.cip.class_name`
* `zeek.cip.direction`
* `zeek.cip.instance_id`
* `zeek.cip.packet_correlation_id`


#### EtherNet/IP -  Detailed Information

*Includes: Session Identifier, Sender Context, EtherNet/IP Command, Data Length, and Status*

**Purpose:** A ranked frequency table of  Detailed Information values for EtherNet/IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.cip.packet_correlation_id`
* `zeek.enip.length`
* `zeek.enip.options`
* `zeek.enip.sender_context`
* `zeek.enip.session_handle`


#### CIP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.result`
* `source.ip`
* timestamp
* `zeek.cip.cip_sequence_count`
* `zeek.cip.class_id`
* `zeek.cip.class_name`
* `zeek.cip.direction`
* `zeek.cip.instance_id`
* `zeek.cip.packet_correlation_id`


#### CIP - Identity Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.cip.packet_correlation_id`
* `zeek.cip_identity.device_type_name`
* `zeek.cip_identity.product_name`
* `zeek.cip_identity.revision`
* `zeek.cip_identity.serial_number`
* `zeek.cip_identity.vendor_name`


#### Ethernet/IP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.cip.packet_correlation_id`
* `zeek.enip.options`
* `zeek.enip.sender_context`
* `zeek.enip.session_handle`


#### CIP - IO Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.cip.packet_correlation_id`
* `zeek.cip_io.connection_id`
* `zeek.cip_io.data_length`
* `zeek.cip_io.sequence_number`


---

## File Scanning

* ID: [248cae60-eff9-11f0-b83f-8f35d6995138](#/dashboard/248cae60-eff9-11f0-b83f-8f35d6995138)

The File Scanning dashboard consolidates results from Malcolm's [automatic file extraction and scanning](file-scanning.md#ZeekFileExtraction) capability provided by [Strelka](https://target.github.io/strelka/#/), including those from [YARA](https://github.com/VirusTotal/yara), [ClamAV](https://www.clamav.net/), and [many others](https://target.github.io/strelka/#/?id=scanner-list). It tracks files observed in network traffic, their MIME types, the contents of archive files, and signatures and reports generated by the scanners. This dashboard is useful for hunting malware, tracking file transfers across the network, and validating whether transferred files are known-bad or suspicious. For a more general-purpose dashboard dealing with file transfers, see [Files](#files).

### Visualizations

#### File Scanning - Hit Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - Hits Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - File Source

**Purpose:** A horizontal bar chart ranking File Source for File Scanning by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - Scanners With Hits

**Purpose:** A pie chart showing the proportional distribution of Scanners With Hits for File Scanning. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - Triggered Rules

**Purpose:** A ranked frequency table of Triggered Rules values for File Scanning. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - Severity

**Purpose:** A ranked frequency table of Severity values for File Scanning. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.risk_score`
* `event.severity_tags`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - MIME Type

**Purpose:** A ranked frequency table providing a categorical breakdown of the MIME types of files scanned. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - Tactic and Technique

**Purpose:** A ranked frequency table of Tactic and Technique values for File Scanning. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - All Scanners

**Purpose:** A ranked frequency table of All Scanners values for File Scanning. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.module`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### Files Scanned by Nesting Depth

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - Source IP

**Purpose:** A ranked frequency table of Source IP values for File Scanning. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for File Scanning. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Scanning - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


---

## File Tree

* ID: [4ff567d0-48a6-11f1-9604-d962b9b51f3a](#/dashboard/4ff567d0-48a6-11f1-9604-d962b9b51f3a)

The File Tree dashboard presents a hierarchical breakdown of files observed in network traffic, particularly with regards to [archived files](file-scanning.md#ScanningArchivedFiles) such as ZIP files or tarballs, allowing parent/child relationships between nested files to be explored.

### Visualizations

#### File Scanning - MIME Type

**Purpose:** A ranked frequency table providing a categorical breakdown of the MIME types of files scanned. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Tree - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records associated with scanned files. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.name`
* `file.source`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


#### File Tree

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data, presenting a hierarchical breakdown of files observed in network traffic, particularly with regards to [archived files](file-scanning.md#ScanningArchivedFiles) such as ZIP files or tarballs, allowing parent/child relationships between nested files to be explored.

**Fields / Aggregations:**

* `MALCOLM_OTHER_INDEX_TIME_FIELD_REPLACER`
* `field`
* `file.name`
* `filescan.tree.node`
* `filescan.tree.parent`
* `filescan.tree.root`
* `scheme`
* `signal`
* `zeek.files.filename`
* `zeek.ts`


#### Files Scanned by Nesting Depth

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.entropy`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* `filescan.hits`
* `filescan.tree.depth`
* `rule.name`
* `rule.ruleset`
* `source.ip`
* timestamp
* `zeek.files.extracted_uri`


---

## Files

* ID: [9ee51f94-3316-4fc5-bd89-93a52af69714](#/dashboard/9ee51f94-3316-4fc5-bd89-93a52af69714)

The Files dashboard provides an overview of all files observed traversing the network as captured by Zeek's [file analysis framework](file-scanning.md#ZeekFileExtraction). It covers file types by the context of the transfer (e.g., protocol), MIME type, path and filename (where applicable), transfer volumes, source and destination hosts, and file hashes. When file preservation is enabled, users have download access to the files in question. Analysts can identify unusual file types, large file transfers, and track specific files of interest across the captured traffic.

### Visualizations

#### Files - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### Files - Files By Size (Bytes)

**Purpose:** A ranked frequency table of Files By Size (Bytes) values for Files. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp
* `zeek.files.seen_bytes`


#### Files - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for FIles. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### Files - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for FIles. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### Files - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### Files - Source

**Purpose:** A horizontal bar chart ranking Source for Files by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### Files - MIME Type

**Purpose:** A ranked frequency table of MIME Type values for Files. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `file.mime_type`


#### Files - Paths

**Purpose:** A ranked frequency table providing a categorical breakdown of filenames and paths. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.dataset`
* `file.path`
* `network.protocol`


#### Extracted File Downloads

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual file logs and which includes a hyperlink providing download access to the files themselves, depending on file preservation settings.

**Fields / Aggregations:**

* `event.id`
* `file.mime_type`
* `file.name`
* `file.size`
* `file.source`
* timestamp
* `zeek.files.extracted_uri`


#### Files - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


---

## FTP

* ID: [078b9aa5-9bd4-4f02-ae5e-cf80fa6f887b](#/dashboard/078b9aa5-9bd4-4f02-ae5e-cf80fa6f887b)

The FTP dashboard covers all [File Transfer Protocol (FTP)](https://en.wikipedia.org/wiki/File_Transfer_Protocol) activity observed on the network, including commands, arguments, reply codes, and transfer participants. It provides insight into file staging, unauthorized file transfers, and FTP authentication patterns. This is a useful dashboard for investigating data exfiltration over FTP and identifying misconfigured FTP servers accessible to unauthorized clients.

### Visualizations

#### FTP - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Argument

**Purpose:** A ranked frequency table of Argument values for FTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.arg`
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Commands and Replies

**Purpose:** A ranked frequency table of Commands and Replies values for FTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_code`
* `zeek.ftp.reply_msg`


#### FTP - Reply

**Purpose:** A pie chart showing the proportional distribution of Reply for FTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Source

**Purpose:** A ranked frequency table of Source values for FTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Destination

**Purpose:** A ranked frequency table of Destination values for FTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Username

**Purpose:** A ranked frequency table of Username values for FTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


---

## GE SRTP

* ID: [e233a570-45d9-11ef-96a6-432365601033](#/dashboard/e233a570-45d9-11ef-96a6-432365601033)

*Dashboard for the GE SRTP Protocol*

The GE SRTP dashboard covers the [GE Service Request Transport Protocol (SRTP)](https://en.wikipedia.org/wiki/Service_Request_Transport_Protocol), used to communicate with GE PLCs and automation devices. It captures service request types, memory area access, sequence numbers, and communication pairs. Security teams can use this to detect unauthorized reads or writes to GE PLC memory areas, which could indicate ICS-targeted attacks or insider threats.

### Visualizations

#### GE SRTP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Logs Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Source IP

**Purpose:** A ranked frequency table of Source IP values for GE SRTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for GE SRTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Actions and Results

**Purpose:** A ranked frequency table of Actions and Results values for GE SRTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Panel Run Switch

**Purpose:** A pie chart showing the proportional distribution of Panel Run Switch for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.front_panel_run_switch`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Panel Enable Switch

**Purpose:** A pie chart showing the proportional distribution of Panel Enable Switch for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.front_panel_enable_switch`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - PLC Fault Entry Present

**Purpose:** A pie chart showing the proportional distribution of PLC Fault Entry Present for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_fault_entry_present`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - I/O Fault Entry Present

**Purpose:** A pie chart showing the proportional distribution of I/O Fault Entry Present for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.io_fault_entry_present`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Programmer Attachment

**Purpose:** A pie chart showing the proportional distribution of Programmer Attachment for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.programmer_attachment`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - PLC State

**Purpose:** A ranked frequency table of PLC State values for GE SRTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Constant Sweep Mode

**Purpose:** A pie chart showing the proportional distribution of Constant Sweep Mode for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.constant_sweep_mode`
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Oversweep Flag

**Purpose:** A pie chart showing the proportional distribution of Oversweep Flag for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.oversweep_flag`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - PLC Fault Table Changed

**Purpose:** A pie chart showing the proportional distribution of PLC Fault Table Changed for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_fault_entry_last_read`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - I/O Fault Table Changed

**Purpose:** A pie chart showing the proportional distribution of I/O Fault Table Changed for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.io_fault_entry_last_read`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - OEM Protection

**Purpose:** A pie chart showing the proportional distribution of OEM Protection for GE SRTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.oem_protected`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


#### GE SRTP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ge_srtp.data_length`
* `zeek.ge_srtp.memory_offset`
* `zeek.ge_srtp.packet_number`
* `zeek.ge_srtp.plc_state`
* `zeek.ge_srtp.segment_selector`
* `zeek.ge_srtp.sequence_number_1`
* `zeek.ge_srtp.sequence_number_2`
* `zeek.ge_srtp.srtp_type`
* `zeek.ge_srtp.total_packet_number`


---

## GENISYS

* ID: [03207c00-d07e-11ec-b4a7-d1b4003706b7](#/dashboard/03207c00-d07e-11ec-b4a7-d1b4003706b7)

*Dashboard for the GENISYS Protocol*

The GENISYS dashboard covers network traffic for the [GENISYS](https://manualzz.com/doc/6363274/genisys-2000---ansaldo-sts---product-support#93) industrial protocol. It tracks source and destination communication pairs, station addresses, operation directions, and event results. This dashboard gives operators and security teams visibility into GENISYS device communication and helps detect anomalous commands or unexpected participants in protocol exchanges.

### Visualizations

#### GENISYS - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.genisys.payload`
* `zeek.genisys.server`


#### GENISYS - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.genisys.payload`
* `zeek.genisys.server`


#### GENISYS - Station Address

**Purpose:** A ranked frequency table of Station Address values for GENISYS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.genisys.payload`
* `zeek.genisys.server`


#### GENISYS - Source

**Purpose:** A ranked frequency table of Source values for GENISYS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.genisys.payload`
* `zeek.genisys.server`


#### GENISYS - Action

**Purpose:** A horizontal bar chart ranking Action for GENISYS by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.genisys.payload`
* `zeek.genisys.server`


#### GENISYS - Message Direction

**Purpose:** A pie chart showing the proportional distribution of Message Direction for GENISYS. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.genisys.direction`
* `zeek.genisys.payload`
* `zeek.genisys.server`


#### GENISYS - Destination

**Purpose:** A ranked frequency table of Destination values for GENISYS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.genisys.payload`
* `zeek.genisys.server`


#### GENISYS - Result

**Purpose:** A horizontal bar chart ranking Result for GENISYS by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.genisys.payload`
* `zeek.genisys.server`


#### GENISYS - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.genisys.payload`
* `zeek.genisys.server`


---

## HART-IP

* ID: [3a9e3440-75e2-11ef-8138-03748f839a49](#/dashboard/3a9e3440-75e2-11ef-8138-03748f839a49)

The HART-IP dashboard covers [Highway Addressable Remote Transducer (HART)](https://en.wikipedia.org/wiki/Highway_Addressable_Remote_Transducer_Protocol) over IP traffic, used to communicate with smart field instruments in process control environments. It logs command codes, device addresses, response codes, and communication participants. Security teams monitoring process control networks can use this to detect unauthorized read or write commands to smart sensors and field devices.

### Visualizations

#### HART-IP - Logs Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* timestamp


#### HART-IP - Logs Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* timestamp


#### HART-IP - Source IP

**Purpose:** A ranked frequency table of Source IP values for HART-IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* timestamp


#### HART-IP - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for HART-IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* timestamp


#### HART-IP - Actions and Results

**Purpose:** A ranked frequency table of Actions and Results values for HART-IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* timestamp


#### HART-IP - Universal Commands Device Profile and Type

**Purpose:** A ranked frequency table of Universal Commands Device Profile and Type values for HART-IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_universal_commands.read_unique_identifier_response_device_profile`
* `zeek.hart_ip_universal_commands.read_unique_identifier_response_expanded_device_type`


#### HART-IP - Universal Commands Message and Response

**Purpose:** A ranked frequency table of Universal Commands Message and Response values for HART-IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_universal_commands.read_message_response_message`
* `zeek.hart_ip_universal_commands.write_message_message_string`


#### HART-IP - PDU Command

**Purpose:** A ranked frequency table of PDU Command values for HART-IP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Header Version

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Protocol Major Revision

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_universal_commands.read_unique_identifier_response_hart_protocol_major_revision`


#### Insecure Session

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_session_record.session_log_record_session_status_summary_insecure_session`


#### Audit Log Insecure Syslog Connection

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.read_audit_log_server_status_insecure_syslog_connection`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Session Summary: Writes Occurred

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_session_record.session_log_record_session_status_summary_writes_occured`


#### Device Malfunction (Token Passing PDU)

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`
* `zeek.hart_ip.token_passing_pdu_contents_response_device_status_device_malfunction`


#### Device Malfunction (Direct PDU)

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.direct_pdu_device_status_device_malfunction`
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Configuration Changed (Token Passing PDU)

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`
* `zeek.hart_ip.token_passing_pdu_contents_response_device_status_configuration_changed`


#### Configuration Changed (Direct PDU)

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.direct_pdu_device_status_configuration_changed`
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Maintenance Required

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.direct_pdu_extended_status_maintenance_required`
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Function Check

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.direct_pdu_extended_status_function_check`
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Failure

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.direct_pdu_extended_status_failure`
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Device Variable Alert

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.direct_pdu_extended_status_device_variable_alert`
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Critical Power Failure

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.direct_pdu_extended_status_critical_power_failure`
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### Out of Specification

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.hart_ip.direct_pdu_extended_status_out_of_specification`
* `zeek.hart_ip.header_sequence_number`
* `zeek.hart_ip.header_version`
* `zeek.hart_ip.token_passing_pdu_command_number`


#### HART-IP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* timestamp


---

## HTTP

* ID: [37041ee1-79c0-4684-a436-3173b0e89876](#/dashboard/37041ee1-79c0-4684-a436-3173b0e89876)

The HTTP dashboard covers all [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) web traffic observed on the network, including request methods, URIs, response codes, user agents, and host headers. It provides insight into web browsing behavior, application traffic, file downloads, and server responses across the monitored network. This is a key dashboard for investigating web-based attacks, unauthorized downloads, and unusual HTTP patterns that may indicate compromise.

### Visualizations

#### HTTP - Status Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Sites

**Purpose:** A ranked frequency table of Sites values for HTTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Sites Hosting EXEs

**Purpose:** A ranked frequency table of Sites Hosting EXEs values for HTTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `zeek.http.host`


#### HTTP - URIs

**Purpose:** A ranked frequency table of URIs values for HTTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`
* `zeek.http.uri`


#### HTTP - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for HTTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for HTTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - User Agent

**Purpose:** A ranked frequency table of User Agent values for HTTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Referrer

**Purpose:** A ranked frequency table of Referrer values for HTTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.referrer`
* `zeek.http.status_msg`


#### HTTP - Destination Port

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Destination Country

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP  - Status and Method

**Purpose:** A ranked frequency table of Status and Method values for HTTP . Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Unique Usernames and Passwords

**Purpose:** Displays the total number of unique observed values, giving a quick inventory count for this category.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.password`
* `related.user`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Version

**Purpose:** A pie chart showing the proportional distribution of Version for HTTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - File Type

**Purpose:** A tag cloud showing the relative frequency of values by size. Dominant tags appear larger, making it easy to identify the most common values at a glance.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `file.mime_type`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.http.host`
* `zeek.http.method`
* `zeek.http.status_msg`


#### HTTP - Method and Status

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `event.action`
* `event.result`
* timestamp


---

## ICS Best Guess

* ID: [12e3a130-d83b-11eb-a0b0-f328ce09b0b7](#/dashboard/12e3a130-d83b-11eb-a0b0-f328ce09b0b7)

The ICS Best Guess dashboard surfaces connections that exhibit characteristics consistent with industrial control system (ICS) or operational technology (OT) protocols, even when not definitively identified. It flags traffic that heuristically resembles ICS protocols based on port, behavior, and tagging logic. This dashboard is a useful tool for discovering shadow ICS/OT devices or unrecognized protocols in environments where all OT traffic should be accounted for.

### Visualizations

#### Best Guess - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `protocol`
* `source.ip`
* `source.port`
* `zeek.bestguess.category`
* `zeek.bestguess.name`


#### Best Guess - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `protocol`
* `source.ip`
* `source.port`
* timestamp
* `zeek.bestguess.category`
* `zeek.bestguess.name`


#### Best Guess Protocol - Destination

**Purpose:** A ranked frequency table of Destination values for Best Guess Protocol. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `protocol`
* `source.ip`
* `source.port`
* `zeek.bestguess.category`
* `zeek.bestguess.name`


#### Best Guess - Summary

**Purpose:** A ranked frequency table of Summary values for Best Guess. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.transport`
* `protocol`
* `source.ip`
* `source.port`
* `zeek.bestguess.category`
* `zeek.bestguess.name`


#### Best Guess Protocol - Source

**Purpose:** A ranked frequency table of Source values for Best Guess Protocol. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `protocol`
* `source.ip`
* `source.port`
* `zeek.bestguess.category`
* `zeek.bestguess.name`


#### Best Guess - Category

**Purpose:** A horizontal bar chart ranking Category for Best Guess by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `protocol`
* `source.ip`
* `source.port`
* `zeek.bestguess.category`
* `zeek.bestguess.name`


#### Best Guess - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `protocol`
* `source.ip`
* `source.port`
* `zeek.bestguess.category`
* `zeek.bestguess.name`


---

## ICS/IoT Security Overview

* ID: [4a4bde20-4760-11ea-949c-bbb5a9feecbf](#/dashboard/4a4bde20-4760-11ea-949c-bbb5a9feecbf)

The ICS/IoT Security Overview dashboard aggregates security-relevant data specific to industrial control and IoT network traffic. It presents ICS log volumes, protocol distribution, external connectivity, ATT&CK for ICS tactic mapping, and unusual actions or results. Security teams use it to monitor the risk posture of OT/ICS environments and quickly surface tactics or techniques that map to known ICS attack patterns.

### Visualizations

#### ICS/IoT Log Counts

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* timestamp


#### ICS/IoT Traffic Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* timestamp


#### ICS/IoT External Traffic

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `source.geo.country_name`
* `source.ip`
* `source.port`
* timestamp


#### Network Layer

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `network.type`
* `source.ip`
* `source.port`
* timestamp


#### ICS/IoT Actions and Results

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* timestamp


#### ATT&CK for ICS Tactic

**Purpose:** A horizontal bar chart ranking values in this category by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* `threat.tactic.name`
* timestamp


#### ICS/IoT Source IP

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* timestamp


#### ICS Tactics and Techniques

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `rule.category`
* `source.ip`
* `source.port`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp


#### ICS/IoT Destination IP

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* timestamp


#### ICS/IoT Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* timestamp


#### ACID on ATT&CK for ICS

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.protocol`
* `source.ip`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp
* `zeek.notice.msg`


---

## IP Connections Tree

* ID: [89714140-a2d5-11f0-b5ae-e139a66d2205](#/dashboard/89714140-a2d5-11f0-b5ae-e139a66d2205)

*Trees are Malcolm analytics designed to be utilized by analysts to assist in tracking lateral movement across a network.*

The IP Connections Tree dashboard presents network connection data in a hierarchical tree structure, showing parent-child relationships between communicating hosts. It is designed to help analysts visualize communication chains and identify which hosts serve as hubs or pivots in the network topology. This view is particularly useful during incident investigations to trace lateral movement or identify command-and-control relationships.

### Visualizations

#### Connections Tree From Destination

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `MALCOLM_OTHER_INDEX_TIME_FIELD_REPLACER`
* `destination.ip`
* `event.id`
* `field`
* `scheme`
* `signal`
* `source.ip`
* timestamp
* `zeek.conn.conn_state`


#### Connections Tree From Source

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `MALCOLM_OTHER_INDEX_TIME_FIELD_REPLACER`
* `destination.ip`
* `event.id`
* `field`
* `scheme`
* `signal`
* `source.ip`
* timestamp
* `zeek.conn.conn_state`


#### Connections - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


---

## IRC

* ID: [76f2f912-80da-44cd-ab66-6a73c8344cc3](#/dashboard/76f2f912-80da-44cd-ab66-6a73c8344cc3)

The IRC dashboard covers [Internet Relay Chat (IRC)](https://en.wikipedia.org/wiki/Internet_Relay_Chat) protocol traffic, tracking channels, nicknames, commands, and communication hosts. IRC is frequently used as a command-and-control channel by botnets and malware, making this dashboard a useful tool for detecting C2 communication and bot activity. Analysts can identify unexpected IRC traffic in environments where it is not a legitimate business tool.

### Visualizations

#### IRC - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.irc.command`
* `zeek.irc.nick`
* `zeek.irc.value`


#### IRC - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for IRC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.irc.command`
* `zeek.irc.nick`
* `zeek.irc.value`


#### IRC - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for IRC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.irc.command`
* `zeek.irc.nick`
* `zeek.irc.value`


#### IRC - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for IRC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.irc.command`
* `zeek.irc.nick`
* `zeek.irc.value`


#### IRC - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.irc.command`
* `zeek.irc.nick`
* `zeek.irc.value`


#### IRC - Destination Country

**Purpose:** A ranked frequency table of Destination Country values for IRC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.geo.city_name`
* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.irc.command`
* `zeek.irc.nick`
* `zeek.irc.value`


#### IRC - Command

**Purpose:** A ranked frequency table of Command values for IRC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.irc.command`
* `zeek.irc.nick`
* `zeek.irc.value`


#### IRC - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.irc.command`
* `zeek.irc.nick`
* `zeek.irc.value`


---

## Kerberos

* ID: [82da3101-2a9c-4ae2-bb61-d447a3fbe673](#/dashboard/82da3101-2a9c-4ae2-bb61-d447a3fbe673)

The Kerberos dashboard surfaces [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol)) authentication traffic, covering ticket requests, error codes, service names, and participating hosts. It is useful for detecting Kerberoasting, AS-REP roasting, ticket forgery, and other Active Directory authentication abuse patterns. Analysts can use the error code breakdown to identify failed authentication spikes and unusual service ticket requests.

### Visualizations

#### Kerberos - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Client

**Purpose:** A ranked frequency table of Client values for Kerberos. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.cname`
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Success Status

**Purpose:** A pie chart showing the proportional distribution of Success Status for Kerberos. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Server

**Purpose:** A ranked frequency table of Server values for Kerberos. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.sname`
* `zeek.kerberos.success`


#### Kerberos - Cipher

**Purpose:** A pie chart showing the proportional distribution of Cipher for Kerberos. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.cipher`
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for Kerberos. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for Kerberos. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Service

**Purpose:** A ranked frequency table of Service values for Kerberos. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.sname`
* `zeek.kerberos.success`


#### Kerberos - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Request Types

**Purpose:** A pie chart showing the proportional distribution of Request Types for Kerberos. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Renewable Ticket Requested

**Purpose:** A pie chart showing the proportional distribution of Renewable Ticket Requested for Kerberos. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.renewable`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Destination Ports

**Purpose:** A horizontal bar chart ranking Destination Ports for Kerberos by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


#### Kerberos - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.kerberos.error_msg`
* `zeek.kerberos.request_type`
* `zeek.kerberos.success`


---

## LDAP

* ID: [05e3e000-f118-11e9-acda-83a8e29e1a24](#/dashboard/05e3e000-f118-11e9-acda-83a8e29e1a24)

The LDAP dashboard tracks [Lightweight Directory Access Protocol (LDAP)](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol) queries and responses, covering bind operations, search queries, object targets, and results. It is particularly useful for identifying Active Directory enumeration, unauthorized directory queries, and LDAP injection attempts. Analysts can review top querying hosts and common search targets to baseline legitimate directory usage against anomalous activity.

### Visualizations

#### LDAP - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ldap.argument`
* `zeek.ldap.message_id`
* `zeek.ldap.object`
* `zeek.ldap.version`


#### LDAP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ldap.argument`
* `zeek.ldap.message_id`
* `zeek.ldap.object`
* `zeek.ldap.version`


#### LDAP - Source IP

**Purpose:** A ranked frequency table of Source IP values for LDAP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ldap.argument`
* `zeek.ldap.message_id`
* `zeek.ldap.object`
* `zeek.ldap.version`


#### LDAP - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for LDAP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ldap.argument`
* `zeek.ldap.message_id`
* `zeek.ldap.object`
* `zeek.ldap.version`


#### LDAP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### LDAP - Bind

**Purpose:** A ranked frequency table of Bind values for LDAP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `network.protocol_version`
* `source.ip`
* timestamp
* `zeek.ldap.argument`
* `zeek.ldap.message_id`
* `zeek.ldap.object`
* `zeek.ldap.version`


#### LDAP - Search Scope

**Purpose:** A horizontal bar chart ranking Search Scope for LDAP by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `zeek.ldap_search.base_object`
* `zeek.ldap_search.filter`
* `zeek.ldap_search.message_id`
* `zeek.ldap_search.result_count`
* `zeek.ldap_search.scope`


#### LDAP - Result Code

**Purpose:** A ranked frequency table of Result Code values for LDAP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### LDAP - Operation

**Purpose:** A ranked frequency table of Operation values for LDAP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### LDAP Search - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `zeek.ldap_search.base_object`
* `zeek.ldap_search.filter`
* `zeek.ldap_search.message_id`
* `zeek.ldap_search.result_count`


---

## Modbus

* ID: [152f29dc-51a2-4f53-93e9-6e92765567b8](#/dashboard/152f29dc-51a2-4f53-93e9-6e92765567b8)

*Dashboard for the Modbus Protocol*

The Modbus dashboard provides visibility into [Modbus](https://en.wikipedia.org/wiki/Modbus) industrial protocol traffic, covering function codes, register addresses, unit identifiers, and host communication pairs. Modbus is widely used in SCADA and ICS environments for controlling field devices, making this dashboard critical for OT security monitoring. Analysts can detect unauthorized commands, unusual function codes, and communication with unexpected Modbus devices.

### Visualizations

#### Modbus - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.network_direction`
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`


#### Modbus - Source IP

*Source IP Addresses from modbus.log*

**Purpose:** A ranked frequency table of Source IP values for Modbus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.network_direction`
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`


#### Modbus - Destination IP

*Destination IP Addresses from modbus.log*

**Purpose:** A ranked frequency table of Destination IP values for Modbus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.network_direction`
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`


#### Modbus - Observed Clients and Servers

*Modbus observed client and server devices*

**Purpose:** A ranked frequency table of Observed Clients and Servers values for Modbus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.direction`
* `source.ip`
* timestamp
* `zeek.known_modbus.device_type`


#### Modbus - Observed Client/Server Ratio

*Modbus Observed Clients and Servers Chart*

**Purpose:** A pie chart showing the proportional distribution of Observed Client/Server Ratio for Modbus. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `network.direction`
* `source.ip`
* timestamp
* `zeek.known_modbus.device_type`


#### Modbus - Log Count

*Count of Modbus logs including Modbus Detailed and Modbus Register Change*

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `event.dataset`


#### Modbus - Logs Over Time

*Modbus Logs over Time*

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `event.dataset`
* timestamp


#### Modbus - Functions and Exceptions

**Purpose:** A ranked frequency table of Functions and Exceptions values for Modbus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* `zeek.modbus.network_direction`
* `zeek.modbus.unit_id`


#### Modbus - Request and Response

**Purpose:** A horizontal bar chart ranking Request and Response for Modbus by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.network_direction`
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`


#### Modbus - Reads

**Purpose:** A ranked frequency table of Reads values for Modbus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`
* `zeek.modbus_detailed.address`
* `zeek.modbus_detailed.link_id`
* `zeek.modbus_detailed.matched`
* `zeek.modbus_detailed.quantity`
* `zeek.modbus_detailed.request_values`
* `zeek.modbus_detailed.response_values`


#### Modbus - Writes

**Purpose:** A ranked frequency table of Writes values for Modbus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`
* `zeek.modbus_detailed.address`
* `zeek.modbus_detailed.link_id`
* `zeek.modbus_detailed.matched`
* `zeek.modbus_detailed.quantity`
* `zeek.modbus_detailed.request_values`
* `zeek.modbus_detailed.response_values`


#### Modbus - Transport

**Purpose:** A pie chart showing the proportional distribution of Transport for Modbus. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `network.type`
* `source.ip`
* `source.port`
* timestamp


#### Modbus - Device Identification Objects

**Purpose:** A ranked frequency table of Device Identification Objects values for Modbus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.network_direction`
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`
* `zeek.modbus_detailed.link_id`
* `zeek.modbus_read_device_identification.conformity_level`
* `zeek.modbus_read_device_identification.device_id_code`
* `zeek.modbus_read_device_identification.object_id`
* `zeek.modbus_read_device_identification.object_value`


#### Modbus - Trends

**Purpose:** A custom visualization of log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `MALCOLM_OTHER_INDEX_TIME_FIELD_REPLACER`
* `event.id`
* `scheme`
* timestamp
* `zeek.modbus_detailed.matched`
* `zeek.modbus_detailed.request_values`


#### Modbus - Detailed

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`
* `zeek.modbus_detailed.address`
* `zeek.modbus_detailed.link_id`
* `zeek.modbus_detailed.matched`
* `zeek.modbus_detailed.quantity`
* `zeek.modbus_detailed.request_values`
* `zeek.modbus_detailed.response_values`


#### Modbus - Mask Write

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.modbus.network_direction`
* `zeek.modbus.unit_id`
* `zeek.modbus_detailed.address`
* `zeek.modbus_detailed.link_id`
* `zeek.modbus_mask_write_register.and_mask`
* `zeek.modbus_mask_write_register.or_mask`


#### Modbus - Read Write Multiple

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.modbus.network_direction`
* `zeek.modbus.unit_id`
* `zeek.modbus_detailed.link_id`
* `zeek.modbus_read_write_multiple_registers.read_registers`
* `zeek.modbus_read_write_multiple_registers.read_start_address`
* `zeek.modbus_read_write_multiple_registers.write_registers`
* `zeek.modbus_read_write_multiple_registers.write_start_address`


#### Modbus - Read Device Identification

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.modbus.network_direction`
* `zeek.modbus.trans_id`
* `zeek.modbus.unit_id`
* `zeek.modbus_detailed.link_id`
* `zeek.modbus_read_device_identification.conformity_level`
* `zeek.modbus_read_device_identification.device_id_code`
* `zeek.modbus_read_device_identification.object_id`
* `zeek.modbus_read_device_identification.object_value`


---

## MQTT

* ID: [87a32f90-ef58-11e9-974e-9d600036d105](#/dashboard/87a32f90-ef58-11e9-974e-9d600036d105)

The MQTT dashboard covers [MQ Telemetry Transport (MQTT)](https://en.wikipedia.org/wiki/MQTT) protocol traffic, widely used in IoT devices and lightweight machine-to-machine communication. It tracks topic names, QoS levels, client IDs, and broker/client communication patterns observed on the network. This dashboard is useful for asset discovery in IoT environments, detecting unauthorized MQTT brokers, and identifying sensitive topics being published or subscribed to by unexpected clients.

### Visualizations

#### MQTT - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp


#### MQTT - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp


#### MQTT - Source IP

**Purpose:** A ranked frequency table of Source IP values for MQTT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp


#### MQTT - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for MQTT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp


#### MQTT - Protocol

**Purpose:** A pie chart showing the proportional distribution of Protocol for MQTT. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mqtt_connect.client_id`
* `zeek.mqtt_connect.connect_status`
* `zeek.mqtt_connect.proto_name`
* `zeek.mqtt_connect.proto_version`


#### MQTT - Client ID

**Purpose:** A ranked frequency table of Client ID values for MQTT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mqtt_connect.client_id`
* `zeek.mqtt_connect.connect_status`
* `zeek.mqtt_connect.proto_name`


#### MQTT - Subscription

**Purpose:** A ranked frequency table of Subscription values for MQTT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mqtt_subscribe.ack`
* `zeek.mqtt_subscribe.action`
* `zeek.mqtt_subscribe.topics`


#### MQTT - Publish

**Purpose:** A ranked frequency table of Publish values for MQTT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mqtt_publish.from_client`
* `zeek.mqtt_publish.status`
* `zeek.mqtt_publish.topic`


#### MQTT - Publish Payload

**Purpose:** A ranked frequency table of Publish Payload values for MQTT. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mqtt_publish.from_client`
* `zeek.mqtt_publish.payload`
* `zeek.mqtt_publish.payload_len`
* `zeek.mqtt_publish.status`
* `zeek.mqtt_publish.topic`


#### MQTT - All Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp


---

## MySQL

* ID: [50ced171-1b10-4c3f-8b67-2db9635661a6](#/dashboard/50ced171-1b10-4c3f-8b67-2db9635661a6)

The MySQL dashboard provides visibility into [MySQL](https://en.wikipedia.org/wiki/MySQL) database protocol traffic, including command types, user credentials (where visible), affected rows, and connection metadata. It helps detect unauthorized database access, SQL operations from unexpected hosts, and unusual query patterns. Security teams can use this to enforce database access policies and identify potential data exfiltration over MySQL connections.

### Visualizations

#### MySQL - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mysql.cmd`
* `zeek.mysql.success`


#### MySQL - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mysql.cmd`
* `zeek.mysql.success`


#### MySQL - Success

**Purpose:** A pie chart showing the proportional distribution of Success for MySQL. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mysql.cmd`
* `zeek.mysql.success`


#### MySQL - Commands

**Purpose:** A ranked frequency table of Commands values for MySQL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mysql.arg`
* `zeek.mysql.cmd`
* `zeek.mysql.response`
* `zeek.mysql.success`


#### MySQL - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mysql.cmd`
* `zeek.mysql.success`


---

## NTLM

* ID: [543118a9-02d7-43fe-b669-b8652177fc37](#/dashboard/543118a9-02d7-43fe-b669-b8652177fc37)

The NTLM dashboard covers [NT LAN Manager (NTLM)](https://en.wikipedia.org/wiki/NT_LAN_Manager) authentication traffic, including NTLM challenge-response exchanges, domain information, and authentication outcomes. It provides insight into legacy authentication usage and helps detect NTLM relay attacks, credential brute-forcing, and pass-the-hash activity. Security teams can use this dashboard to identify systems still relying on NTLM where Kerberos should be used.

### Visualizations

#### NTLM - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Hostname

**Purpose:** A ranked frequency table of Hostname values for NTLM. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Domain Name

**Purpose:** A ranked frequency table of Domain Name values for NTLM. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Username

**Purpose:** A ranked frequency table of Username values for NTLM. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for NTLM. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for NTLM. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for NTLM. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Hostname to Username

**Purpose:** A ranked frequency table of Hostname to Username values for NTLM. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


#### NTLM - Success

**Purpose:** A pie chart showing the proportional distribution of Success for NTLM. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`
* `zeek.ntlm.success`


#### NTLM - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntlm.domain`
* `zeek.ntlm.host`
* `zeek.ntlm.server_dns_computer`
* `zeek.ntlm.server_nb_computer`
* `zeek.ntlm.server_tree`


---

## NTP

* ID: [af5df620-eeb6-11e9-bdef-65a192b7f586](#/dashboard/af5df620-eeb6-11e9-bdef-65a192b7f586)

The NTP dashboard covers [Network Time Protocol (NTP)](https://en.wikipedia.org/wiki/Network_Time_Protocol) traffic, providing insight into time synchronization activity across the environment. It tracks NTP stratum levels, reference IDs, version numbers, and communication pairs. Analysts can detect NTP amplification abuse, rogue time sources, and unusual NTP query volumes that could indicate reconnaissance or DDoS preparation.

### Visualizations

#### NTP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


#### NTP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


#### NTP - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


#### NTP - Stratum

**Purpose:** A horizontal bar chart ranking Stratum for NTP by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


#### NTP - Version

**Purpose:** A pie chart showing the proportional distribution of Version for NTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


#### NTP - Mode

**Purpose:** A pie chart showing the proportional distribution of Mode for NTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


#### NTP - Polling Interval

**Purpose:** A horizontal bar chart ranking Polling Interval for NTP by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.poll`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


#### NTP - Source IP

**Purpose:** A ranked frequency table of Source IP values for NTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


#### NTP - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for NTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ntp.mode_str`
* `zeek.ntp.org_time`
* `zeek.ntp.stratum`
* `zeek.ntp.version`
* `zeek.ntp.xmt_time`


---

## Omron FINS

* ID: [c899f8b0-d36b-11ef-b619-17836b3bbf47](#/dashboard/c899f8b0-d36b-11ef-b619-17836b3bbf47)

The Omron FINS dashboard provides visibility into the [Factory Interface Network Service (FINS)](https://en.wikipedia.org/wiki/Factory_Interface_Network_Service) protocol used by Omron PLCs and automation equipment. It tracks command codes, memory area designations, unit addresses, and source/destination host pairs. This dashboard is useful for detecting unauthorized command execution against Omron controllers, including memory reads, writes, and PLC status queries.

### Visualizations

#### Omron FINS - Log Counts

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`


#### Omron FINS - Logs Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`


#### Omron FINS - Action and Result

**Purpose:** A ranked frequency table of Action and Result values for Omron FINS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`


#### Omron FINS - Source IP

**Purpose:** A ranked frequency table of Source IP values for Omron FINS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`


#### Omron FINS - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for Omron FINS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`


#### Omron FINS - Controller Model and Version

**Purpose:** A ranked frequency table of Controller Model and Version values for Omron FINS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`
* `zeek.omron_fins_detail.controller_model`
* `zeek.omron_fins_detail.controller_version`


#### Omron FINS - Files/Volumes

**Purpose:** A ranked frequency table of Files/Volumes values for Omron FINS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `file.path`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`


#### Omron FINS - Transport Protocol

**Purpose:** A pie chart showing the proportional distribution of Transport Protocol for Omron FINS. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`


#### Omron FINS - Data Type

**Purpose:** A pie chart showing the proportional distribution of Data Type for Omron FINS. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.icf_data_type`
* `zeek.omron_fins.link_id`


#### Omron FINS - Address, Node, and Unit

**Purpose:** A ranked frequency table of Address, Node, and Unit values for Omron FINS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.destination_network_address`
* `zeek.omron_fins.destination_node_number`
* `zeek.omron_fins.destination_unit_address`
* `zeek.omron_fins.link_id`
* `zeek.omron_fins.service_id`
* `zeek.omron_fins.source_network_address`
* `zeek.omron_fins.source_node_number`
* `zeek.omron_fins.source_unit_address`


#### Omron FINS - All Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.omron_fins.link_id`


---

## OPCUA Binary

* ID: [dd87edd0-796a-11ec-9ce6-b395c1ff58f4](#/dashboard/dd87edd0-796a-11ec-9ce6-b395c1ff58f4)

The OPC UA Binary dashboard covers [OPC Unified Architecture (OPC UA)](https://en.wikipedia.org/wiki/OPC_Unified_Architecture) binary protocol traffic, the modern standard for industrial data exchange between PLCs, SCADA systems, and enterprise applications. It captures service types, node IDs, security policy, and communication pairs observed on the network. Analysts can use this to detect unauthorized OPC UA connections, unusual browsing or write operations, and unexpected cross-zone OPC UA traffic.

### Visualizations

#### OPCUA Binary - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* `url.original`


#### OPCUA Binary - Traffic Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `event.dataset`
* timestamp


#### OPCUA Binary - Actions

**Purpose:** A ranked frequency table of Actions values for OPCUA Binary. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.action`


#### OPCUA Binary - Results

**Purpose:** A ranked frequency table of Results values for OPCUA Binary. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.result`


#### OPCUA Binary - URLs and URIs

**Purpose:** A ranked frequency table of URLs and URIs values for OPCUA Binary. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `url.original`


#### OPCUA Binary - User

**Purpose:** A horizontal bar chart ranking User for OPCUA Binary by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* `url.original`


#### OPCUA Binary - Source

**Purpose:** A ranked frequency table of Source values for OPCUA Binary. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* `zeek.opcua_binary.opcua_link_id`


#### OPCUA Binary - Destination

**Purpose:** A ranked frequency table of Destination values for OPCUA Binary. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* `zeek.opcua_binary.opcua_link_id`


#### OPCUA Binary - Password Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `related.password`
* `source.ip`
* `url.original`


#### OPCUA Binary - Software

**Purpose:** A horizontal bar chart ranking Software for OPCUA Binary by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* `url.original`
* `zeek.software.name`


#### OPCUA Binary - Protocol Version

**Purpose:** A pie chart showing the proportional distribution of Protocol Version for OPCUA Binary. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.protocol_version`
* `source.ip`
* `url.original`


#### OPCUA Binary - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* `zeek.opcua_binary.opcua_link_id`


#### OPCUA Binary and Related - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `source.ip`
* `url.original`


---

## OSPF

* ID: [1cc01ff0-5205-11ec-a62c-7bc80e88f3f0](#/dashboard/1cc01ff0-5205-11ec-a62c-7bc80e88f3f0)

The OSPF dashboard covers [Open Shortest Path First (OSPF)](https://en.wikipedia.org/wiki/Open_Shortest_Path_First) routing protocol traffic. It tracks message types (Hello, DBD, LSR, LSU, LSAck), router IDs, area IDs, and neighbor relationships. Security teams can use this to detect unauthorized OSPF neighbors attempting to inject false routing information, which could redirect traffic or enable man-in-the-middle attacks.

### Visualizations

#### OSPF - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* timestamp
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - Packet Type

**Purpose:** A pie chart showing the proportional distribution of Packet Type for OSPF. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - Link State Advertisement

**Purpose:** A ranked frequency table of Link State Advertisement values for OSPF. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - Link Type

**Purpose:** A ranked frequency table of Link Type values for OSPF. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - Area and Router

**Purpose:** A ranked frequency table of Area and Router values for OSPF. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - Source IP

**Purpose:** A ranked frequency table of Source IP values for OSPF. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for OSPF. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - All IP Addresses

**Purpose:** A ranked frequency table of All IP Addresses values for OSPF. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `related.ip`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


#### OSPF - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `network.protocol_version`
* `source.ip`
* `zeek.ospf.area_id`
* `zeek.ospf.backup_router`
* `zeek.ospf.desig_router`
* `zeek.ospf.interface_id`
* `zeek.ospf.link_type`
* `zeek.ospf.lsa_type`
* `zeek.ospf.neighbors`
* `zeek.ospf.router_id`


---

## Overview

* ID: [0ad3d7c2-3441-485e-9dfe-dbb22e84e576](#/dashboard/0ad3d7c2-3441-485e-9dfe-dbb22e84e576)

The Overview dashboard provides a high-level summary of all network traffic and log activity across the monitored environment. It aggregates events from every data source into a single view, showing total log volume, protocol distribution, and top communicating hosts. Analysts use it as a starting point to assess overall activity levels and quickly identify unusual spikes or new protocol traffic before drilling into protocol-specific dashboards.

### Visualizations

#### Total Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### Connections - Service By Destination Country

**Purpose:** A pie chart showing the proportional distribution of Service By Destination Country for Connections. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Log Type

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### Total Number of Logs

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `event.provider`


#### DNS - Queries

**Purpose:** A ranked frequency table of Queries values for DNS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### Log Source

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.ingested`
* `host.name`


#### Application Protocol

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.protocol`
* `network.protocol_version`


#### Actions and Results

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.action`
* `event.result`
* `network.protocol`


#### All Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


---

## PE

* ID: [0a490422-0ce9-44bf-9a2d-19329ddde8c3](#/dashboard/0a490422-0ce9-44bf-9a2d-19329ddde8c3)

The PE (Portable Executable) dashboard provides visibility into Windows PE file analysis data observed in network traffic, covering OS targets, machine types, subsystems, section names, and capability signatures. It helps analysts understand what executable files have been observed in network traffic and identify suspicious characteristics such as unusual sections or capability flags. This dashboard is particularly useful during malware investigations to quickly characterize executables transferring across the network.

### Visualizations

#### PE - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.subsystem`


#### PE - OS

**Purpose:** A pie chart showing the proportional distribution of OS for PE. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.subsystem`


#### PE - Subsystem

**Purpose:** A pie chart showing the proportional distribution of Subsystem for PE. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.subsystem`


#### PE - Section Name

**Purpose:** A ranked frequency table of Section Name values for PE. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.section_names`
* `zeek.pe.subsystem`


#### PE - Machine

**Purpose:** A ranked frequency table of Machine values for PE. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.subsystem`


#### PE - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.subsystem`


#### Capa Signatures

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.id`
* `rule.name`
* timestamp


#### Executable Capabilities

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `event.id`
* `rule.name`
* timestamp


#### PE - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.subsystem`


---

## PostgreSQL

* ID: [f2c0da10-d2c5-11ef-8864-d58a560dc292](#/dashboard/f2c0da10-d2c5-11ef-8864-d58a560dc292)

The PostgreSQL dashboard covers [PostgreSQL](https://en.wikipedia.org/wiki/PostgreSQL) database protocol traffic, including connection metadata, command types, and host pairs. It provides visibility into who is accessing PostgreSQL instances and what types of operations they are performing. Analysts can detect unauthorized database access, unexpected client connections, and unusual query volumes that may indicate automated data extraction.

### Visualizations

#### PostgreSQL - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


#### PostgreSQL - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


#### PostgreSQL - Database

**Purpose:** A horizontal bar chart ranking Database for PostgreSQL by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


#### PostgreSQL - Action and Results

**Purpose:** A ranked frequency table of Action and Results values for PostgreSQL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


#### PostgreSQL - Application

**Purpose:** A ranked frequency table of Application values for PostgreSQL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


#### PostgreSQL - Source IP

**Purpose:** A ranked frequency table of Source IP values for PostgreSQL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


#### PostgreSQL - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for PostgreSQL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


#### PostgreSQL - User

**Purpose:** A ranked frequency table of User values for PostgreSQL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


#### PostgreSQL - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.id`
* `event.result`
* `related.user`
* `source.ip`
* timestamp
* `zeek.postgresql.application_name`
* `zeek.postgresql.backend_arg`
* `zeek.postgresql.database`
* `zeek.postgresql.frontend_arg`
* `zeek.postgresql.rows`


---

## PROFINET

* ID: [a7514350-eba6-11e9-a384-0fcf32210194](#/dashboard/a7514350-eba6-11e9-a384-0fcf32210194)

The PROFINET dashboard covers [PROFINET](https://en.wikipedia.org/wiki/PROFINET) industrial communication protocol traffic, commonly used in manufacturing automation with Siemens and other ICS vendors. It tracks DCP (Discovery and Configuration Protocol), IO (real-time I/O), and DCE/RPC sub-protocol activity between PLCs, HMIs, and I/O devices. Security teams use it to detect unauthorized device discovery, configuration changes, and unusual PROFINET communication patterns.

### Visualizations

#### PROFINET - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `event.dataset`


#### PROFINET - Logs Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `event.dataset`
* timestamp


#### PROFINET - Source IP

**Purpose:** A ranked frequency table of Source IP values for PROFINET. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* `source.port`
* timestamp
* `zeek.profinet.index`


#### PROFINET - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for PROFINET. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* `source.port`
* timestamp
* `zeek.profinet.index`


#### PROFINET - Operation

**Purpose:** A ranked frequency table of Operation values for PROFINET. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.profinet.block_version`
* `zeek.profinet.index`
* `zeek.profinet.operation_type`


#### PROFINET - Operation Details

**Purpose:** A ranked frequency table of Operation Details values for PROFINET. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.profinet.block_version`
* `zeek.profinet.index`
* `zeek.profinet.operation_type`
* `zeek.profinet.slot_number`
* `zeek.profinet.subslot_number`


#### PROFINET I/O CM - Operation

**Purpose:** A horizontal bar chart ranking Operation for PROFINET I/O CM by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.protocol_version`
* `source.ip`
* `source.port`
* timestamp
* `zeek.profinet_io_cm.operation`
* `zeek.profinet_io_cm.packet_type`
* `zeek.profinet_io_cm.sequence_num`


#### PROFINET and Related - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* `source.port`
* timestamp
* `zeek.profinet.index`


#### PROFINET I/O CM - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.protocol_version`
* `source.ip`
* `source.port`
* timestamp
* `zeek.profinet_io_cm.sequence_num`


---

## QUIC

* ID: [11ddd980-e388-11e9-b568-cf17de8e860c](#/dashboard/11ddd980-e388-11e9-b568-cf17de8e860c)

The QUIC dashboard provides visibility into [QUIC](https://en.wikipedia.org/wiki/QUIC#Google_QUIC_(gQUIC)) protocol traffic, a UDP-based transport used by modern HTTPS and HTTP/3 connections. It covers connection metadata, server names, versions, and host communication pairs. This dashboard is useful for tracking QUIC-based web traffic, identifying applications using QUIC, and detecting attempts to bypass inspection by tunneling traffic over QUIC.

### Visualizations

#### QUIC - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for QUIC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for QUIC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - User Agent

**Purpose:** A ranked frequency table of User Agent values for QUIC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - Server Name

**Purpose:** A ranked frequency table of Server Name values for QUIC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - CYU Fingerprint

**Purpose:** A ranked frequency table of CYU Fingerprint values for QUIC. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.gquic.cyu`
* `zeek.gquic.cyutags`


#### QUIC - Version

**Purpose:** A pie chart showing the proportional distribution of Version for QUIC. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


---

## RADIUS

* ID: [ae79b7d1-4281-4095-b2f6-fa7eafda9970](#/dashboard/ae79b7d1-4281-4095-b2f6-fa7eafda9970)

The RADIUS dashboard covers [Remote Authentication Dial-In User Service (RADIUS)](https://en.wikipedia.org/wiki/RADIUS) protocol traffic, tracking authentication requests, results, username attributes, and NAS identifiers. RADIUS is used for centralized network access authentication, and this dashboard helps detect brute-force attempts, authentication bypass, and rogue RADIUS clients. Analysts can correlate failed authentication spikes with specific NAS devices and usernames.

### Visualizations

#### RADIUS - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


#### RADIUS - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for RADIUS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


#### RADIUS - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for RADIUS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


#### RADIUS - MAC

**Purpose:** A ranked frequency table of MAC values for RADIUS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


#### RADIUS - Connection Information

**Purpose:** A ranked frequency table of Connection Information values for RADIUS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.connect_info`
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


#### RADIUS - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


#### RADIUS - Username

**Purpose:** A ranked frequency table of Username values for RADIUS. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


#### RADIUS - Authentication Result

**Purpose:** A pie chart showing the proportional distribution of Authentication Result for RADIUS. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


#### RADIUS - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.user`
* `source.ip`
* timestamp
* `zeek.radius.framed_addr`
* `zeek.radius.mac`
* `zeek.radius.result`


---

## RDP

* ID: [7f41913f-cba8-43f5-82a8-241b7ead03e0](#/dashboard/7f41913f-cba8-43f5-82a8-241b7ead03e0)

The RDP dashboard covers [Remote Desktop Protocol (RDP)](https://en.wikipedia.org/wiki/Remote_Desktop_Protocol) sessions, including connection metadata, authentication outcomes, security protocols, and host certificates. It provides visibility into remote desktop usage and helps detect unauthorized remote access, brute-force attempts, and RDP-based lateral movement. This is a high-value dashboard during incident response when adversaries frequently leverage RDP for interactive access.

### Visualizations

#### RDP - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for RDP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for RDP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Cookie

**Purpose:** A ranked frequency table of Cookie values for RDP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.cookie`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Result

**Purpose:** A pie chart showing the proportional distribution of Result for RDP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Keyboard Layout

**Purpose:** A pie chart showing the proportional distribution of Keyboard Layout for RDP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Client Version

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Encryption

**Purpose:** A pie chart showing the proportional distribution of Encryption for RDP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_level`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


#### RDP - Connections Tree

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `MALCOLM_OTHER_INDEX_TIME_FIELD_REPLACER`
* `destination.ip`
* `event.id`
* `field`
* `scheme`
* `signal`
* `source.ip`
* timestamp


#### RDP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rdp.client_build`
* `zeek.rdp.encryption_method`
* `zeek.rdp.keyboard_layout`
* `zeek.rdp.result`
* `zeek.rdp.security_protocol`


---

## Redis

* ID: [ef0f9be0-7d3d-11f0-9ca7-8bfd0076f5c9](#/dashboard/ef0f9be0-7d3d-11f0-9ca7-8bfd0076f5c9)

The Redis dashboard covers [Redis](https://en.wikipedia.org/wiki/Redis) in-memory data store protocol traffic, including command types, return values, and communication pairs. Redis is commonly exposed unintentionally without authentication, making it a frequent target for unauthorized access and data manipulation. Analysts can use this dashboard to detect unexpected Redis clients, dangerous commands (FLUSHDB, CONFIG), and unauthorized access to cached data.

### Visualizations

#### Redis - Logs Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`


#### Redis - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`


#### Redis - Success

**Purpose:** A pie chart showing the proportional distribution of Success for Redis. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`
* `zeek.redis.success`


#### Redis - Source

**Purpose:** A ranked frequency table of Source values for Redis. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`


#### Redis - Destination

**Purpose:** A ranked frequency table of Destination values for Redis. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`


#### Redis - Action and Result

**Purpose:** A ranked frequency table of Action and Result values for Redis. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`


#### Redis - Key

**Purpose:** A ranked frequency table of Key values for Redis. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`


#### Redis - Key and Value

**Purpose:** A ranked frequency table of Key and Value values for Redis. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`
* `zeek.redis.cmd_value`


#### Redis - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `source.ip`
* `source.port`
* timestamp
* `zeek.redis.cmd_key`


---

## RFB

* ID: [f77bf097-18a8-465c-b634-eb2acc7a4f26](#/dashboard/f77bf097-18a8-465c-b634-eb2acc7a4f26)

The RFB dashboard covers [Remote Framebuffer (RFB)](https://en.wikipedia.org/wiki/RFB_protocol) protocol sessions (used by VNC), including desktop sharing connections, authentication types, and host pairs. It helps identify remote desktop activity outside of expected channels and detect unauthorized VNC access to internal systems. Analysts can use it to baseline legitimate VNC usage and flag unexpected desktop-sharing sessions.

### Visualizations

#### RFB - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Authentication Status

**Purpose:** A pie chart showing the proportional distribution of Authentication Status for RFB. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Exclusive Session

**Purpose:** A pie chart showing the proportional distribution of Exclusive Session for RFB. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Desktop Name

**Purpose:** A ranked frequency table of Desktop Name values for RFB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for RFB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for RFB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for RFB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Server Version

**Purpose:** A ranked frequency table of Server Version values for RFB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.server_major_version`
* `zeek.rfb.server_minor_version`
* `zeek.rfb.share_flag`


#### RFB - Client Version

**Purpose:** A ranked frequency table of Client Version values for RFB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.client_major_version`
* `zeek.rfb.client_minor_version`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Authentication Method

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


#### RFB - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.rfb.auth`
* `zeek.rfb.authentication_method`
* `zeek.rfb.desktop_name`
* `zeek.rfb.share_flag`


---

## ROC Plus

* ID: [cbf2e4d0-29e8-11f0-862c-2dfee4f08125](#/dashboard/cbf2e4d0-29e8-11f0-862c-2dfee4f08125)

The ROC Plus dashboard covers the Emerson [ROC Plus](https://www.emerson.com/documents/automation/roc-plus-protocol-specification-manual-en-6851618.pdf) protocol traffic used to communicate with remote operations controllers commonly found in oil and gas environments. It logs parameter group and logic numbers, operation types, and communication participants. Security teams can use this dashboard to detect unauthorized reads or writes to ROC devices and monitor for unexpected communication patterns in pipeline control systems.

### Visualizations

#### ROC Plus - Log Types

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - Traffic Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - Action

**Purpose:** A ranked frequency table of Action values for ROC Plus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - Result

**Purpose:** A ranked frequency table of Result values for ROC Plus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - Packet Size

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - Transport Protocol

**Purpose:** A pie chart showing the proportional distribution of Transport Protocol for ROC Plus. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - Source IP

**Purpose:** A ranked frequency table of Source IP values for ROC Plus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for ROC Plus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - File Transfer Directory

**Purpose:** A ranked frequency table of File Transfer Directory values for ROC Plus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `file.directory`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - File Transfer Filename

**Purpose:** A ranked frequency table of File Transfer Filename values for ROC Plus. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `file.name`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


#### ROC Plus - All Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `network.bytes`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.roc_plus.link_id`
* `zeek.roc_plus.packet_type`


---

## S7comm / S7comm Plus

* ID: [e76d05c0-eb9f-11e9-a384-0fcf32210194](#/dashboard/e76d05c0-eb9f-11e9-a384-0fcf32210194)

The S7comm dashboard provides visibility into [Siemens S7 protocol (S7comm)](https://wiki.wireshark.org/S7comm) communication used to program and control Siemens PLCs, a frequent target in ICS attacks. It surfaces function codes, block types, CPU data, and communication pairs between engineering stations and PLCs. This is a critical dashboard for detecting unauthorized PLC programming, reading of sensitive memory areas, and reconnaissance against Siemens control systems.

### Visualizations

#### S7comm - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* `zeek.s7comm.pdu_reference`
* `zeek.uid`


#### S7comm - Logs Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* timestamp
* `zeek.s7comm.pdu_reference`
* `zeek.uid`


#### S7comm Operations

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* `zeek.s7comm.pdu_reference`
* `zeek.uid`


#### S7comm Source IP

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* `zeek.s7comm.pdu_reference`
* `zeek.uid`


#### S7comm Destination IP

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* `zeek.s7comm.pdu_reference`
* `zeek.uid`


#### S7comm Plus Version

**Purpose:** A pie chart showing the proportional distribution of values in this category. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `network.protocol_version`
* `source.ip`
* `source.port`
* `zeek.uid`


#### S7comm Devices

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* `zeek.s7comm.pdu_reference`
* `zeek.s7comm_known_devices.automation_system_name`
* `zeek.s7comm_known_devices.module_name`
* `zeek.s7comm_known_devices.module_serial`
* `zeek.s7comm_known_devices.plant_name`
* `zeek.uid`


#### S7comm Read-SZL

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `source.ip`
* `source.port`
* `zeek.s7comm.pdu_reference`
* `zeek.s7comm_read_szl.method`
* `zeek.s7comm_read_szl.szl_index`
* `zeek.uid`


#### ATT&CK for ICS Tactic - S7comm

**Purpose:** A horizontal bar chart ranking S7comm for ATT&CK for ICS Tactic by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.protocol`
* `source.ip`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp
* `zeek.notice.msg`


#### ATT&CK for ICS Notices - S7comm

**Purpose:** A ranked frequency table of S7comm values for ATT&CK for ICS Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.protocol`
* `source.ip`
* `threat.tactic.name`
* `threat.technique.name`
* timestamp
* `zeek.notice.msg`


#### S7comm - Upload/Download File Names

**Purpose:** A ranked frequency table of Upload/Download File Names values for S7comm. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* `zeek.s7comm_upload_download.block_type`
* `zeek.s7comm_upload_download.destination_filesystem`
* `zeek.uid`


#### S7comm and Related - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.result`
* `network.protocol`
* `source.ip`
* `source.port`
* `zeek.s7comm.pdu_reference`
* `zeek.uid`


---

## Security Overview

* ID: [95479950-41f2-11ea-88fa-7151df485405](#/dashboard/95479950-41f2-11ea-88fa-7151df485405)

The Security Overview dashboard offers a consolidated view of security-relevant events across all monitored protocols. It combines alert data, notice events, and categorized rule hits to give analysts an at-a-glance picture of the threat landscape. This is a useful starting point for daily triage, providing trend lines, category breakdowns, and top event sources to focus attention where it matters most.

### Visualizations

#### Normalized Event Category

**Purpose:** A horizontal bar chart ranking values in this category by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `network.transport`
* `rule.category`


#### Notice, Alert and Signature - Summary

**Purpose:** A ranked frequency table of Summary values for Notice, Alert and Signature. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.id`
* `event.module`
* `event.provider`
* `event.severity_tags`
* `network.protocol`
* `rule.category`
* `rule.name`
* `source.ip`


#### Outdated/Insecure Application Protocols

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.protocol`
* `network.protocol_version`


#### Vulnerabilities

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.id`
* `event.module`
* `event.provider`
* `event.severity_tags`
* `network.protocol`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `vulnerability.id`


#### Clear-text Transmission of Passwords

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.protocol`
* `related.user`


#### Inbound Access By Protocol Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Outbound Internal Traffic by Country

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.geo.country_name`


#### Inbound External Traffic by Country

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `source.geo.country_name`


#### File Transfers

**Purpose:** A tag cloud showing the relative frequency of values by size. Dominant tags appear larger, making it easy to identify the most common values at a glance.

**Fields / Aggregations:**

* `file.mime_type`


#### DNS Queries by Randomness

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `dns.host`
* `event.freq_score_v1`
* `event.freq_score_v2`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### Connections by Destination Country (region map)

**Purpose:** A country-level map shading destination countries by traffic volume, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.geo.country_code2`
* `destination.ip`
* `destination.port`
* `event.id`
* `network.bytes`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.port`
* timestamp


#### Notice, Alert, and Signature - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.dataset`
* `event.id`
* `event.module`
* `event.provider`
* `event.severity_tags`
* `network.protocol`
* `rule.category`
* `rule.name`
* `source.ip`


---

## Severity

* ID: [d2dd0180-06b1-11ec-8c6b-353266ade330](#/dashboard/d2dd0180-06b1-11ec-8c6b-353266ade330)

The Severity dashboard organizes all detected events and alerts by their assigned severity level, from informational notices through critical findings. It draws from both Zeek notices and Suricata alert data to present a ranked view of the most impactful activity in the environment. Analysts use it to prioritize response actions and track whether high-severity event counts are increasing or decreasing over time.

### Visualizations

#### Severity Tags

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.risk_score`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `source.ip`


#### Severity Score Occurrences

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `event.severity`
* `network.protocol`
* `source.ip`
* timestamp


#### Severity - Notices

**Purpose:** A ranked frequency table of Notices values for Severity. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.risk_score`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`
* `zeek.notice.note`


#### Severity - Application Protocol

**Purpose:** A ranked frequency table of Application Protocol values for Severity. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.risk_score`
* `network.protocol`


#### Severity - Socket Family

**Purpose:** A pie chart showing the proportional distribution of Socket Family for Severity. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `network.type`
* `source.ip`


#### File Types by Transport

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### Severity - Source IP

**Purpose:** A ranked frequency table of Source IP values for Severity. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.risk_score`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `source.ip`


#### Severity - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for Severity. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.risk_score`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `source.ip`


#### Severity - Originating Country

**Purpose:** A country-level map shading host countries by traffic volume, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `source.geo.country_iso_code`
* `source.ip`


#### Severity - Responding Country

**Purpose:** A country-level map shading host countries by traffic volume, on a green-to-red scale where green indicates lower values and red indicates higher values. Provides a geographic overview of where activity is concentrated at a national level.

**Fields / Aggregations:**

* `destination.geo.country_iso_code`
* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `source.ip`


#### Severity - Destination OUI

**Purpose:** A ranked frequency table of Destination OUI values for Severity. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.oui`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.risk_score`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `source.ip`


#### Severity - Source OUI

**Purpose:** A ranked frequency table of Source OUI values for Severity. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.risk_score`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `source.ip`
* `source.oui`


#### Actions and Results

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.action`
* `event.result`
* `network.protocol`


#### Severity-Scored Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.result`
* `event.severity`
* `event.severity_tags`
* `network.protocol`
* `network.transport`
* `source.ip`


---

## Signatures

* ID: [665d1610-523d-11e9-a30e-e3576242f3ed](#/dashboard/665d1610-523d-11e9-a30e-e3576242f3ed)

The Signatures dashboard focuses on rule-based detections, showing which signatures have fired and how frequently. It covers both Suricata alert rules and Zeek notice signatures, providing a breakdown by rule name, category, and originating host. This dashboard helps tune detection coverage—identifying which signatures generate the most noise versus those that rarely fire but may be highly significant.

### Visualizations

#### Signatures - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* timestamp


#### Signatures - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.original`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp


#### Signatures - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.original`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp


#### Signatures - Name

**Purpose:** A ranked frequency table of Name values for Signatures. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.original`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp


#### Signatures - Source IP

**Purpose:** A ranked frequency table of Source IP values for Signatures. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.original`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp


#### Signatures - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for Signatures. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.original`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp


---

## SIP

* ID: [0b2354ae-0fe9-4fd9-b156-1c3870e5c7aa](#/dashboard/0b2354ae-0fe9-4fd9-b156-1c3870e5c7aa)

The SIP dashboard covers [Session Initiation Protocol (SIP)](https://en.wikipedia.org/wiki/Session_Initiation_Protocol) traffic, including call setup, methods, response codes, user agents, and communication pairs. SIP is used for VoIP and unified communications and can be targeted for toll fraud, call hijacking, and reconnaissance of telephony infrastructure. Analysts can detect unusual SIP activity, rogue clients, high volumes of failed authentication, and unauthorized INVITE or REGISTER messages.

### Visualizations

#### SIP - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for SIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for SIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Destination Country

**Purpose:** A pie chart showing the proportional distribution of Destination Country for SIP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Request Path

**Purpose:** A ranked frequency table of Request Path values for SIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.request_path`
* `zeek.sip.status_msg`


#### SIP - URI

**Purpose:** A ranked frequency table of URI values for SIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`
* `zeek.sip.uri`


#### SIP - User Agent

**Purpose:** A ranked frequency table of User Agent values for SIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Content Type

**Purpose:** A pie chart showing the proportional distribution of Content Type for SIP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Method

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for SIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


#### SIP - Status

**Purpose:** A ranked frequency table of Status values for SIP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_code`
* `zeek.sip.status_msg`


#### SIP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.sip.content_type`
* `zeek.sip.status_msg`


---

## SMB

* ID: [42e831b9-41a9-4f35-8b7d-e1566d368773](#/dashboard/42e831b9-41a9-4f35-8b7d-e1566d368773)

The SMB dashboard provides visibility into [Server Message Block (SMB)](https://en.wikipedia.org/wiki/Server_Message_Block) protocol traffic, covering file sharing, named pipe operations, and authentication activity. It surfaces the commands used, files accessed, share names, and hosts involved in SMB communication. This is a critical dashboard for detecting lateral movement, credential relay attacks, and ransomware staging behavior that frequently leverages SMB.

### Visualizations

#### SMB - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp


#### SMB - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for SMB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp


#### SMB - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for SMB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp


#### SMB - Version

**Purpose:** A pie chart showing the proportional distribution of Version for SMB. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp


#### SMB - FIle Path

**Purpose:** A ranked frequency table of FIle Path values for SMB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp
* `zeek.smb_files.path`


#### SMB - File Name

**Purpose:** A ranked frequency table of File Name values for SMB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp
* `zeek.smb_files.name`


#### SMB - File/Path Summary

**Purpose:** A ranked frequency table of File/Path Summary values for SMB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp
* `zeek.smb_files.name`
* `zeek.smb_files.path`


#### SMB - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp


#### SMB - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for SMB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp


#### SMB - Relevant Notices

**Purpose:** A ranked frequency table of Relevant Notices values for SMB. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### SMB Action

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp


#### SMB - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp


---

## SMTP

* ID: [bb827f8e-639e-468c-93c8-9f5bc132eb8f](#/dashboard/bb827f8e-639e-468c-93c8-9f5bc132eb8f)

The SMTP dashboard covers [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol) email traffic observed on the network. It tracks message senders, recipients, mail servers, attachment details, and transmission metadata. Analysts use it to investigate phishing activity, unauthorized mail relay, and unusual email flow patterns that could indicate account compromise or malware communication.

### Visualizations

#### SMTP - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - Subject

**Purpose:** A ranked frequency table of Subject values for SMTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.subject`
* `zeek.smtp.x_originating_ip`


#### SMTP  - Destination Country

**Purpose:** A pie chart showing the proportional distribution of Destination Country for SMTP . Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - "From" Address

**Purpose:** A ranked frequency table of "From" Address values for SMTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - "To" Address

**Purpose:** A ranked frequency table of "To" Address values for SMTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.rcptto`
* `zeek.smtp.x_originating_ip`


#### SMTP - TLS

**Purpose:** A pie chart showing the proportional distribution of TLS for SMTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.tls`
* `zeek.smtp.x_originating_ip`


#### SMTP - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for SMTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for SMTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - User Agent

**Purpose:** A ranked frequency table of User Agent values for SMTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for SMTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - Webmail

**Purpose:** A pie chart showing the proportional distribution of Webmail for SMTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.is_webmail`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


#### SMTP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `user_agent.original`
* `zeek.smtp.mailfrom`
* `zeek.smtp.x_originating_ip`


---

## SNMP

* ID: [4e5f106e-c60a-4226-8f64-d534abb912ab](#/dashboard/4e5f106e-c60a-4226-8f64-d534abb912ab)

The SNMP dashboard covers [Simple Network Management Protocol (SNMP)](https://en.wikipedia.org/wiki/Simple_Network_Management_Protocol) traffic, including get/set operations, community strings (if visible), and managed device identifiers. It provides insight into network device monitoring activity and helps detect unauthorized SNMP polling, community string brute-forcing, and SNMP-based information gathering. Analysts can identify which hosts are querying network infrastructure devices and flag unexpected management traffic.

### Visualizations

#### SNMP - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.snmp.community`
* `zeek.snmp.version`


#### SNMP - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for SNMP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.snmp.community`
* `zeek.snmp.version`


#### SNMP - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for SNMP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.snmp.community`
* `zeek.snmp.version`


#### SNMP - Session Duration

**Purpose:** A ranked frequency table of Session Duration values for SNMP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.snmp.community`
* `zeek.snmp.duration`
* `zeek.snmp.version`


#### SNMP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp
* `zeek.snmp.community`
* `zeek.snmp.version`


#### SNMP - Community String

**Purpose:** A ranked frequency table of Community String values for SNMP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.snmp.community`
* `zeek.snmp.version`


#### SNMP - PDU Type

**Purpose:** A horizontal bar chart ranking PDU Type for SNMP by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.protocol_version`
* `source.ip`
* timestamp
* `zeek.snmp.community`
* `zeek.snmp.version`


#### SNMP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `source.ip`
* timestamp
* `zeek.snmp.community`
* `zeek.snmp.version`


#### SNMP - Version and PDU Type

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `event.action`
* `network.protocol_version`
* timestamp


---

## Software

* ID: [87d990cc-9e0b-41e5-b8fe-b10ae1da0c85](#/dashboard/87d990cc-9e0b-41e5-b8fe-b10ae1da0c85)

The Software dashboard tracks software versions and products observed in network traffic, as identified by Zeek's Software framework. It surfaces client and server software names, versions, and the hosts running them, enabling asset management and vulnerability correlation. This is particularly useful for identifying outdated or vulnerable software versions in use across the environment.

### Visualizations

#### Software - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `source.ip`
* timestamp
* `url.full`
* `zeek.software.name`
* `zeek.software.software_type`
* `zeek.software.unparsed_version`


#### Software - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `source.ip`
* timestamp
* `url.full`
* `zeek.software.name`
* `zeek.software.software_type`
* `zeek.software.unparsed_version`


#### Software - Summary

**Purpose:** A pie chart showing the proportional distribution of Summary for Software. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `source.ip`
* timestamp
* `url.full`
* `zeek.software.name`
* `zeek.software.software_type`
* `zeek.software.unparsed_version`
* `zeek.software.version_major`
* `zeek.software.version_minor`


#### Software - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `source.ip`
* timestamp
* `url.full`
* `zeek.software.name`
* `zeek.software.software_type`
* `zeek.software.unparsed_version`


---

## SSH

* ID: [caef3ade-d289-4d05-a511-149f3e97f238](#/dashboard/caef3ade-d289-4d05-a511-149f3e97f238)

The SSH dashboard tracks [Secure Shell (SSH)](https://en.wikipedia.org/wiki/Secure_Shell) sessions, covering connection counts, authentication outcomes, client and server versions, and geographic origins. It provides visibility into remote access activity and helps detect brute-force attempts, unauthorized access, and unusual geographic sources of SSH connections. Analysts can correlate version data to identify outdated SSH implementations that may be vulnerable.

### Visualizations

#### SSH - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


#### SSH - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for SSH. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


#### SSH - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for SSH. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


#### SSH - Client/Server

**Purpose:** A ranked frequency table of Client/Server values for SSH. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.client`
* `zeek.ssh.mac_alg`
* `zeek.ssh.server`
* `zeek.ssh.sshka`


#### SSH - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


#### SSH -Server

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.mac_alg`
* `zeek.ssh.server`
* `zeek.ssh.sshka`


#### SSH - Version

**Purpose:** A pie chart showing the proportional distribution of Version for SSH. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`
* `zeek.ssh.version`


#### SSH - Client Algorithms

**Purpose:** A ranked frequency table of Client Algorithms values for SSH. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.hasshAlgorithms`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


#### SSH - Server Algorithms

**Purpose:** A ranked frequency table of Server Algorithms values for SSH. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.hasshServerAlgorithms`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


#### SSH - HASSH Client Hash

**Purpose:** A ranked frequency table of HASSH Client Hash values for SSH. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.hassh`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


#### SSH - HASSH Server Hash

**Purpose:** A ranked frequency table of HASSH Server Hash values for SSH. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.hasshServer`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


#### SSH - Connections Tree

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `MALCOLM_OTHER_INDEX_TIME_FIELD_REPLACER`
* `destination.ip`
* `event.id`
* `field`
* `scheme`
* `signal`
* `source.ip`
* timestamp


#### SSH - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssh.auth_success`
* `zeek.ssh.cipher_alg`
* `zeek.ssh.mac_alg`
* `zeek.ssh.sshka`


---

## SSL

* ID: [7f77b58a-df3e-4cc2-b782-fd7f8bad8ffb](#/dashboard/7f77b58a-df3e-4cc2-b782-fd7f8bad8ffb)

The [SSL/TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security) dashboard presents certificate and connection data from encrypted traffic observed on the network. It surfaces certificate subjects, issuers, validation errors, cipher suites, and TLS versions in use across the environment. Analysts can use it to identify self-signed or expired certificates, weak cipher usage, and potentially malicious use of encryption to hide command-and-control traffic.

### Visualizations

#### SSL - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Version

**Purpose:** A pie chart showing the proportional distribution of Version for SSL. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.ssl_version`
* `zeek.ssl.validation_status`


#### SSL - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Destination Address

**Purpose:** A ranked frequency table of Destination Address values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Server

**Purpose:** A ranked frequency table of Server values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.freq_score_v1`
* `event.freq_score_v2`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Destination Country

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Validation Status

**Purpose:** A ranked frequency table of Validation Status values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Relevant Notices

**Purpose:** A ranked frequency table of Relevant Notices values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### SSL - Connection Established

**Purpose:** A pie chart showing the proportional distribution of Connection Established for SSL. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Certificate Fingerprint

**Purpose:** A ranked frequency table of Certificate Fingerprint values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`
* `zeek.x509.fingerprint`


#### SSL - Elliptic Curve

**Purpose:** A horizontal bar chart ranking Elliptic Curve for SSL by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.curve`
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Next Protocol

**Purpose:** A ranked frequency table of Next Protocol values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.next_protocol`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


#### SSL - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ssl.established`
* `zeek.ssl.server_name`
* `zeek.ssl.sni_matches_cert`
* `zeek.ssl.ssl_history`
* `zeek.ssl.validation_status`


---

## STUN

* ID: [fa477130-2b8a-11ec-a9f2-3911c8571bfd](#/dashboard/fa477130-2b8a-11ec-a9f2-3911c8571bfd)

The STUN dashboard covers [Session Traversal Utilities for NAT (STUN)](https://en.wikipedia.org/wiki/STUN) traffic, which is used by applications like WebRTC to establish peer-to-peer connections through firewalls. It tracks binding requests, responses, software identifiers, and communication pairs. Analysts can use this dashboard to identify applications using STUN-based NAT traversal and flag unexpected STUN traffic that may be used for covert communication channels.

### Visualizations

#### STUN - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `event.id`
* `event.provider`
* `event.result`
* `network.protocol`
* `source.ip`
* timestamp


#### STUN - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* timestamp
* `zeek.stun.attr_type`
* `zeek.stun.class`


#### STUN - Attribute Type

**Purpose:** A horizontal bar chart ranking Attribute Type for STUN by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun.attr_type`
* `zeek.stun.class`


#### STUN - Method and Class

**Purpose:** A ranked frequency table of Method and Class values for STUN. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun.attr_type`
* `zeek.stun.class`


#### STUN - Class

**Purpose:** A pie chart showing the proportional distribution of Class for STUN. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun.attr_type`
* `zeek.stun.class`


#### STUN - Action and Result

**Purpose:** A ranked frequency table of Action and Result values for STUN. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun.attr_type`
* `zeek.stun.class`


#### STUN - Source IP

**Purpose:** A ranked frequency table of Source IP values for STUN. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun.attr_type`
* `zeek.stun.class`


#### STUN - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for STUN. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun.attr_type`
* `zeek.stun.class`


#### STUN - LAN

**Purpose:** A ranked frequency table of LAN values for STUN. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun_nat.lan_addr`
* `zeek.stun_nat.wan_addr`
* `zeek.stun_nat.wan_port`


#### STUN - WAN

**Purpose:** A ranked frequency table of WAN values for STUN. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun_nat.lan_addr`
* `zeek.stun_nat.wan_addr`
* `zeek.stun_nat.wan_port`


#### STUN - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun.attr_type`
* `zeek.stun.class`


#### STUN NAT - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.is_orig`
* `source.ip`
* `source.port`
* `zeek.stun_nat.lan_addr`
* `zeek.stun_nat.wan_addr`
* `zeek.stun_nat.wan_port`


---

## Suricata Alerts

* ID: [5694ca60-cbdf-11ec-a50a-5fedd672f5c5](#/dashboard/5694ca60-cbdf-11ec-a50a-5fedd672f5c5)

The Suricata Alerts dashboard surfaces all alerts generated by the Suricata network intrusion detection engine. It presents alert volume over time, rule categories, top alert names, and the source and destination hosts triggering detections. Analysts can use it to identify active threats, track alert trends, and investigate which hosts are most involved in flagged activity.

### Visualizations

#### Alerts - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* timestamp
* `vulnerability.category`


#### Alerts - Tags

**Purpose:** A tag cloud showing the relative frequency of values by size. Dominant tags appear larger, making it easy to identify the most common values at a glance.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `tags`
* `vulnerability.category`


#### Alert Category

**Purpose:** A horizontal bar chart ranking values in this category by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Target

**Purpose:** A ranked frequency table of Target values for Alerts. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Name

**Purpose:** A ranked frequency table of Name values for Alerts. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Source

**Purpose:** A ranked frequency table of Source values for Alerts. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Destination

**Purpose:** A ranked frequency table of Destination values for Alerts. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Destination Country

**Purpose:** A ranked frequency table of Destination Country values for Alerts. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Source Country

**Purpose:** A ranked frequency table of Source Country values for Alerts. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.geo.country_name`
* `source.ip`
* `vulnerability.category`


#### Suricata Alerts - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


---

## Synchrophasor

* ID: [2cc56240-e460-11ed-a9d5-9f591c284cb4](#/dashboard/2cc56240-e460-11ed-a9d5-9f591c284cb4)

*Dashboard for the DNP3 Protocol*

The Synchrophasor dashboard covers [IEEE C37.118](https://en.wikipedia.org/wiki/C37.118) synchrophasor protocol traffic used in electric grid monitoring and wide-area measurement systems (WAMS). It tracks frame types (data, header, configuration, command), PMU identifiers, data rates, and communication participants. Grid operators and security teams can use this to detect unauthorized access to phasor measurement units and anomalous configuration or command frames.

### Visualizations

#### Synchrophasor - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.uid`


#### Synchrophasor - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `network.protocol_version`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.synchrophasor.data_frame_count`
* `zeek.synchrophasor.data_rate`
* `zeek.synchrophasor.data_stream_id`
* `zeek.synchrophasor.frame_size_tot`
* `zeek.synchrophasor.history`
* `zeek.uid`


#### Synchrophasor - Source

**Purpose:** A ranked frequency table of Source values for Synchrophasor. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `network.protocol_version`
* `network.transport`
* `source.ip`
* `zeek.synchrophasor.data_frame_count`
* `zeek.synchrophasor.data_rate`
* `zeek.synchrophasor.data_stream_id`
* `zeek.synchrophasor.frame_size_tot`
* `zeek.synchrophasor.history`
* `zeek.uid`


#### Synchrophasor - Destination

**Purpose:** A ranked frequency table of Destination values for Synchrophasor. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `network.protocol_version`
* `network.transport`
* `source.ip`
* `zeek.synchrophasor.data_frame_count`
* `zeek.synchrophasor.data_rate`
* `zeek.synchrophasor.data_stream_id`
* `zeek.synchrophasor.frame_size_tot`
* `zeek.synchrophasor.history`
* `zeek.uid`


#### Synchrophasor - Action

**Purpose:** A horizontal bar chart ranking Action for Synchrophasor by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.uid`


#### Synchrophasor - Frame Types

**Purpose:** A horizontal bar chart ranking Frame Types for Synchrophasor by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.uid`


#### Synchrophasor - Transport

**Purpose:** A pie chart showing the proportional distribution of Transport for Synchrophasor. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `network.protocol_version`
* `network.transport`
* `source.ip`
* `zeek.synchrophasor.data_frame_count`
* `zeek.synchrophasor.data_rate`
* `zeek.synchrophasor.data_stream_id`
* `zeek.synchrophasor.frame_size_tot`
* `zeek.synchrophasor.history`
* `zeek.uid`


#### Synchrophasor - Stations

**Purpose:** A ranked frequency table of Stations values for Synchrophasor. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.synchrophasor_cfg_detail.station_name`
* `zeek.uid`


#### Synchrophasor - Phasors

**Purpose:** A ranked frequency table of Phasors values for Synchrophasor. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.synchrophasor_cfg_detail.phnam`
* `zeek.uid`


#### Synchrophasor - Analog Channels

**Purpose:** A ranked frequency table of Analog Channels values for Synchrophasor. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.synchrophasor_cfg_detail.annam`
* `zeek.uid`


#### Synchrophasor - Digital Channels

**Purpose:** A ranked frequency table of Digital Channels values for Synchrophasor. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.synchrophasor_cfg_detail.dgnam`
* `zeek.uid`


#### Synchrophasor - Data Modified

**Purpose:** A pie chart showing the proportional distribution of Data Modified for Synchrophasor. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.synchrophasor_data_detail.data_modified`
* `zeek.uid`


#### Synchrophasor - Rate of Change of Frequency Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* timestamp
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.synchrophasor_data_detail.rocof`
* `zeek.uid`


#### Synchrophasor - Frequency Deviation From Nominal Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* timestamp
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.synchrophasor_data_detail.freq_dev_mhz`
* `zeek.uid`


#### Synchrophasor and Related - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.dataset`
* `network.transport`
* `source.ip`
* `totDataBytes`
* `zeek.synchrophasor.frame_type`
* `zeek.uid`


#### Synchrophasor - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `network.protocol_version`
* `network.transport`
* `source.ip`
* `zeek.synchrophasor.data_frame_count`
* `zeek.synchrophasor.data_rate`
* `zeek.synchrophasor.data_stream_id`
* `zeek.synchrophasor.frame_size_tot`
* `zeek.synchrophasor.history`
* `zeek.uid`


---

## Syslog

* ID: [92985909-dc29-4533-9e80-d3182a0ecf1d](#/dashboard/92985909-dc29-4533-9e80-d3182a0ecf1d)

*Syslog messages observed in network traffic*

The Syslog dashboard presents [syslog](https://en.wikipedia.org/wiki/Syslog) messages observed in network traffic, covering severity levels, facility codes, originating hosts, and message content summaries. It helps analysts understand what systems are forwarding log data, whether logging pipelines are functioning correctly, and whether any unusual error or critical syslog events are being generated. This dashboard is also useful for detecting log flooding, rogue syslog sources, and syslog-based data exfiltration.

### Visualizations

#### Syslog - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


#### Syslog - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for Syslog. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


#### Syslog - Destination IP Address

**Purpose:** A ranked frequency table of Destination IP Address values for Syslog. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


#### Syslog - Destination Port

**Purpose:** A ranked frequency table of Destination Port values for Syslog. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


#### Syslog - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


#### Syslog - Severity

**Purpose:** A pie chart showing the proportional distribution of Severity for Syslog. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


#### Syslog - Facility

**Purpose:** A horizontal bar chart ranking Facility for Syslog by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


#### Syslog - Protocol

**Purpose:** A pie chart showing the proportional distribution of Protocol for Syslog. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


#### Syslog (Zeek) - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.syslog.facility`
* `zeek.syslog.message`
* `zeek.syslog.severity`


---

## Tabular Data Stream

* ID: [bed185a0-ef82-11e9-b38a-2db3ee640e88](#/dashboard/bed185a0-ef82-11e9-b38a-2db3ee640e88)

The Tabular Data Stream (TDS) dashboard covers [Microsoft SQL Server's Tabular Data Stream (TDS)](https://en.wikipedia.org/wiki/Tabular_Data_Stream) protocol traffic, including login metadata, query activity, and response codes. It provides visibility into database connections and helps detect unauthorized SQL Server access and unusual database activity. Analysts can identify which clients are connecting to SQL Server instances and detect patterns consistent with SQL injection or data exfiltration.

### Visualizations

#### Tabular Data Stream - All Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds.command`


#### Tabular Data Stream - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds.command`


#### Tabular Data Stream - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds.command`


#### Tabular Data Stream - Command

**Purpose:** A pie chart showing the proportional distribution of Command for Tabular Data Stream. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds.command`


#### Tabular Data Stream - Source IP

**Purpose:** A ranked frequency table of Source IP values for Tabular Data Stream. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds.command`


#### Tabular Data Stream - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for Tabular Data Stream. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds.command`


---

## Tabular Data Stream - RPC

* ID: [32587740-ef88-11e9-b38a-2db3ee640e88](#/dashboard/32587740-ef88-11e9-b38a-2db3ee640e88)

The Tabular Data Stream - RPC dashboard focuses on remote procedure call operations within [Microsoft SQL Server's TDS](https://en.wikipedia.org/wiki/Tabular_Data_Stream) protocol traffic, including stored procedure execution and batch operations. It surfaces the RPC procedure names, parameters, and originating hosts, providing detailed insight into programmatic database interactions. Security teams can use this to detect unauthorized stored procedure execution and unusual RPC-based SQL Server communication.

### Visualizations

#### Tabular Data Stream - RPC Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_rpc.parameter`
* `zeek.tds_rpc.procedure_name`


#### Tabular Data Stream - RPC Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_rpc.parameter`
* `zeek.tds_rpc.procedure_name`


#### Tabular Data Stream - RPC Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_rpc.parameter`
* `zeek.tds_rpc.procedure_name`


#### Tabular Data Stream - RPC Procedure

**Purpose:** A ranked frequency table of RPC Procedure values for Tabular Data Stream. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_rpc.parameter`
* `zeek.tds_rpc.procedure_name`


#### Tabular Data Stream - RPC Source IP

**Purpose:** A ranked frequency table of RPC Source IP values for Tabular Data Stream. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_rpc.parameter`
* `zeek.tds_rpc.procedure_name`


#### Tabular Data Stream - RPC Destination IP

**Purpose:** A ranked frequency table of RPC Destination IP values for Tabular Data Stream. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_rpc.parameter`
* `zeek.tds_rpc.procedure_name`


---

## Tabular Data Stream - SQL

* ID: [fa141950-ef89-11e9-b38a-2db3ee640e88](#/dashboard/fa141950-ef89-11e9-b38a-2db3ee640e88)

The Tabular Data Stream - SQL dashboard focuses on the SQL statement activity within [Microsoft SQL Server's TDS](https://en.wikipedia.org/wiki/Tabular_Data_Stream) protocol traffic, capturing query text snippets, affected rows, and communication metadata. It provides a window into the types of SQL queries being executed against SQL Server instances. Analysts can use this to detect data harvesting queries, schema enumeration, and unauthorized or unusual SQL activity from unexpected clients.

### Visualizations

#### Tabular Data Stream - SQL Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Header Type

**Purpose:** A pie chart showing the proportional distribution of SQL Header Type for Tabular Data Stream. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Source IP

**Purpose:** A ranked frequency table of SQL Source IP values for Tabular Data Stream. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Destination IP

**Purpose:** A ranked frequency table of SQL Destination IP values for Tabular Data Stream. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Query

**Purpose:** A ranked frequency table of SQL Query values for Tabular Data Stream. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


---

## Telnet, rlogin and rsh

* ID: [c2549e10-7f2e-11ea-9f8a-1fe1327e2cd2](#/dashboard/c2549e10-7f2e-11ea-9f8a-1fe1327e2cd2)

The Telnet, rlogin, and rsh dashboard covers legacy plaintext remote access protocols — [Telnet](https://en.wikipedia.org/wiki/Telnet), [rlogin, and rsh](https://en.wikipedia.org/wiki/Berkeley_r-commands) — providing visibility into unencrypted interactive sessions. These protocols transmit credentials and session data in cleartext, making them high-risk when observed on modern networks. Analysts can use this dashboard to identify legacy systems still using insecure remote access protocols and investigate any such sessions as potential security incidents.

### Visualizations

#### Telnet, rlogin and rsh - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.protocol`
* `source.ip`
* timestamp
* `user`
* `zeek.login.client_user`
* `zeek.login.success`


#### Telnet, rlogin and rsh - Login Success

**Purpose:** A pie chart showing the proportional distribution of Login Success for Telnet, rlogin and rsh. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.protocol`
* `source.ip`
* timestamp
* `user`
* `zeek.login.client_user`
* `zeek.login.success`


#### Telnet, rlogin and rsh - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.protocol`
* `source.ip`
* timestamp
* `user`
* `zeek.login.client_user`
* `zeek.login.success`


#### Telnet, rlogin and rsh - Login Attempts with Cleartext Passwords

**Purpose:** A ranked frequency table of Login Attempts with Cleartext Passwords values for Telnet, rlogin and rsh. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.protocol`
* `related.user`
* `source.ip`
* timestamp
* `user`
* `zeek.login.client_user`
* `zeek.login.success`


#### Telnet, rsh and rlogin - Source

**Purpose:** A ranked frequency table of Source values for Telnet, rsh and rlogin. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.protocol`
* `source.ip`
* timestamp
* `user`
* `zeek.login.client_user`
* `zeek.login.success`


#### Telnet, rlogin and rsh - Destination

**Purpose:** A ranked frequency table of Destination values for Telnet, rlogin and rsh. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.protocol`
* `source.ip`
* timestamp
* `user`
* `zeek.login.client_user`
* `zeek.login.success`


#### Telnet, rlogin and rsh - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `network.protocol`
* `source.ip`
* timestamp
* `user`
* `zeek.login.client_user`
* `zeek.login.success`


---

## TFTP

* ID: [bf5efbb0-60f1-11eb-9d60-dbf0411cfc48](#/dashboard/bf5efbb0-60f1-11eb-9d60-dbf0411cfc48)

The TFTP dashboard covers [Trivial File Transfer Protocol (TFTP)](https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol) traffic, including file names, transfer directions, block counts, and host pairs. TFTP is commonly used for network device firmware updates and PXE boot, but also frequently abused for unauthorized file transfers due to its lack of authentication. Analysts can detect unexpected TFTP activity, unauthorized firmware or configuration file transfers, and TFTP servers that should not be accessible.

### Visualizations

#### TFTP - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tftp.mode`


#### TFTP - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tftp.mode`


#### TFTP - Filename

**Purpose:** A ranked frequency table of Filename values for TFTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tftp.mode`


#### TFTP - Source IP

**Purpose:** A ranked frequency table of Source IP values for TFTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tftp.mode`


#### TFTP - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for TFTP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tftp.mode`


#### TFTP - Transfer Mode

**Purpose:** A pie chart showing the proportional distribution of Transfer Mode for TFTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tftp.mode`


#### TFTP - Operation Results

**Purpose:** A pie chart showing the proportional distribution of Operation Results for TFTP. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tftp.mode`


#### TFTP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.action`
* `event.id`
* `event.result`
* `file.path`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tftp.mode`


---

## Threat Intelligence

* ID: [36ed695f-edcc-47c1-b0ec-50d20c93ce0f](#/dashboard/36ed695f-edcc-47c1-b0ec-50d20c93ce0f)

The Threat Intelligence dashboard presents matches between observed network traffic and threat intelligence indicators, as detected by Zeek's Intel framework. It shows which indicators have been seen, their types (IP, domain, URL, etc.), the sources providing the intelligence, and which network hosts were involved. Analysts can use this dashboard to identify confirmed IOC matches and prioritize incident response based on indicator severity and frequency.

### Visualizations

#### Intel - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Observed In

**Purpose:** A pie chart showing the proportional distribution of Observed In for Intel. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Indicator Source

**Purpose:** A ranked frequency table of Indicator Source values for Intel. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Source IP

**Purpose:** A ranked frequency table of Source IP values for Intel. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for Intel. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Indicator

**Purpose:** A ranked frequency table of Indicator values for Intel. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - MIME Type

**Purpose:** A ranked frequency table of MIME Type values for Intel. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `file.mime_type`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Indicator Type

**Purpose:** A ranked frequency table of Indicator Type values for Intel. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Indicator Description

**Purpose:** A ranked frequency table of Indicator Description values for Intel. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Indicator Category

**Purpose:** A horizontal bar chart ranking Indicator Category for Intel by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Tags

**Purpose:** A tag cloud showing the relative frequency of values by size. Dominant tags appear larger, making it easy to identify the most common values at a glance.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `tags`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


#### Intel - Unique Indicators

**Purpose:** Displays the total number of unique observed values, giving a quick inventory count for this category.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `threat.indicator.description`
* `threat.indicator.name`
* `threat.indicator.provider`
* `threat.indicator.reference`
* `threat.indicator.type`
* timestamp
* `zeek.intel.category`
* `zeek.intel.seen_where`


---

## Tunnels

* ID: [11be6381-beef-40a7-bdce-88c5398392fc](#/dashboard/11be6381-beef-40a7-bdce-88c5398392fc)

The Tunnels dashboard provides visibility into network [tunneling](https://en.wikipedia.org/wiki/Tunneling_protocol) activity, covering protocols like GRE, IP-in-IP, and application-layer tunnels. It surfaces tunnel types, encapsulated protocols, and the hosts involved in tunneling activity. Analysts can use this to detect covert communication channels, VPN bypass attempts, and unauthorized encapsulation that may be used to hide malicious traffic.

### Visualizations

#### Tunnels - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tunnel.action`
* `zeek.tunnel.tunnel_type`


#### Tunnels - Type

**Purpose:** A pie chart showing the proportional distribution of Type for Tunnels. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tunnel.action`
* `zeek.tunnel.tunnel_type`


#### Tunnels - Destination Address

**Purpose:** A ranked frequency table of Destination Address values for Tunnels. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tunnel.action`
* `zeek.tunnel.tunnel_type`


#### Tunnels - Source IP Address

**Purpose:** A ranked frequency table of Source IP Address values for Tunnels. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tunnel.action`
* `zeek.tunnel.tunnel_type`


#### Tunnels - Country

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tunnel.action`
* `zeek.tunnel.tunnel_type`


#### Tunnels - Action

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tunnel.action`
* `zeek.tunnel.tunnel_type`


#### Tunnels - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tunnel.action`
* `zeek.tunnel.tunnel_type`


#### Tunnels - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* `source.port`
* timestamp
* `zeek.tunnel.action`
* `zeek.tunnel.tunnel_type`


---

## WebSocket

* ID: [b8cf5890-87ed-11ef-ae18-dbcd34795edb](#/dashboard/b8cf5890-87ed-11ef-ae18-dbcd34795edb)

The WebSocket dashboard covers [WebSocket](https://en.wikipedia.org/wiki/WebSocket) upgrade sessions and message traffic, tracking the web hosts, URIs, and connection patterns involved in persistent WebSocket connections. WebSocket connections are used by modern web applications for real-time communication and can also be abused for covert C2 channels. Analysts can use this dashboard to identify unexpected WebSocket usage and flag connections to suspicious or unauthorized endpoints.

### Visualizations

#### WebSocket - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - Logs Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - Source IP

**Purpose:** A ranked frequency table of Source IP values for WebSocket. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - Destination IP

**Purpose:** A ranked frequency table of Destination IP values for WebSocket. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - Client Extensions

**Purpose:** A ranked frequency table of Client Extensions values for WebSocket. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - Server Extensions

**Purpose:** A ranked frequency table of Server Extensions values for WebSocket. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - Protocols

**Purpose:** A ranked frequency table of Protocols values for WebSocket. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - User Agent Name

**Purpose:** A horizontal bar chart ranking User Agent Name for WebSocket by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.name`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - URI

**Purpose:** A ranked frequency table of URI values for WebSocket. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


#### WebSocket - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `related.hosts`
* `source.ip`
* timestamp
* `url.original`
* `user_agent.original`
* `zeek.websocket.client_extensions`
* `zeek.websocket.client_protocols`
* `zeek.websocket.server_extensions`
* `zeek.websocket.subprotocol`


---

## X.509

* ID: [024062a6-48d6-498f-a91a-3bf2da3a3cd3](#/dashboard/024062a6-48d6-498f-a91a-3bf2da3a3cd3)

The X.509 dashboard focuses on certificate metadata extracted from TLS/SSL sessions, providing a detailed inventory of certificates seen on the network. It covers certificate subjects, issuers, signing algorithms, key lengths, and whether certificates are used for host or client authentication. This dashboard helps identify weak cryptographic configurations, expired or untrusted certificates, and certificate anomalies that may indicate impersonation or MitM attacks.

### Visualizations

#### X.509 - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Certificate Signing Algorithm

**Purpose:** A pie chart showing the proportional distribution of Certificate Signing Algorithm for X.509. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Certificate Subject

**Purpose:** A ranked frequency table of Certificate Subject values for X.509. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_subject_full`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Certificate Issuer

**Purpose:** A ranked frequency table of Certificate Issuer values for X.509. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_issuer_full`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Certificate Key Length

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_key_length`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Certificate Key Algorithm

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_key_alg`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### SSL - Relevant Notices

**Purpose:** A ranked frequency table of Relevant Notices values for SSL. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### OCSP - Certificate Revocation

**Purpose:** A ranked frequency table of Certificate Revocation values for OCSP. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.id`
* `zeek.ocsp.certStatus`
* `zeek.ocsp.nextUpdate`
* `zeek.ocsp.revokereason`
* `zeek.ocsp.revoketime`
* `zeek.ocsp.serialNumber`
* `zeek.ocsp.thisUpdate`


#### X.509 - Is Host Certificate

**Purpose:** A pie chart showing the proportional distribution of Is Host Certificate for X.509. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Is Client Certificate

**Purpose:** A pie chart showing the proportional distribution of Is Client Certificate for X.509. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Certificate Fingerprint

**Purpose:** A ranked frequency table of Certificate Fingerprint values for X.509. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.fingerprint`
* `zeek.x509.host_cert`


#### X.509 - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### OCSP - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `event.id`
* `zeek.ocsp.certStatus`
* `zeek.ocsp.nextUpdate`
* `zeek.ocsp.revokereason`
* `zeek.ocsp.revoketime`
* `zeek.ocsp.serialNumber`
* `zeek.ocsp.thisUpdate`


---

## Zeek Known Summary

* ID: [89d1cc50-974c-11ed-bb6b-3fb06c879b11](#/dashboard/89d1cc50-974c-11ed-bb6b-3fb06c879b11)

The Zeek Known Summary dashboard aggregates data from Zeek's 'known' logs, which track hosts, services, and certificates that have been observed on the network. It provides an inventory-style view of known devices, services, and software in the environment. This is useful for asset discovery, baselining normal behavior, and identifying new or unexpected hosts and services appearing on the network.

### Visualizations

#### Unique Known IP Addresses

**Purpose:** Displays the total number of unique observed values, giving a quick inventory count for this category.

**Fields / Aggregations:**

* `event.dataset`
* `network.direction`
* `network.name`
* `network.protocol`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`


#### Log Source

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.ingested`
* `host.name`


#### Observed Protocols Cloud

**Purpose:** A tag cloud showing the relative frequency of values by size. Dominant tags appear larger, making it easy to identify the most common values at a glance.

**Fields / Aggregations:**

* `event.dataset`
* `network.name`
* `network.protocol`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`


#### Observed Device Types

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.dataset`
* `network.name`
* `network.protocol`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`


#### Observed Devices

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.dataset`
* `network.name`
* `network.protocol`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`


#### IANA Service Name and Transport Protocol Port Number Registry

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.port`
* `network.name`
* `network.protocol`
* `network.transport`
* `network.type`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`
* `zeek.known_services.iana_description`
* `zeek.known_services.iana_name`


#### Observed Software Categories

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `source.ip`
* timestamp
* `url.full`
* `zeek.software.name`
* `zeek.software.software_type`
* `zeek.software.unparsed_version`


#### Observed Software

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.name`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`
* `zeek.software.name`
* `zeek.software.software_type`
* `zeek.software.unparsed_version`


#### Uninventoried Observed Hosts

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.device.uninventoried`
* `destination.ip`
* `destination.segment.name`
* `related.site`
* `source.device.uninventoried`
* `source.ip`
* `source.segment.name`


#### Uninventoried Observed Services

**Purpose:** A ranked frequency table of values in this category. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.port`
* `network.name`
* `network.protocol`
* `network.transport`
* `network.type`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`
* `zeek.known_services.iana_description`
* `zeek.known_services.iana_name`


#### Zeek Known Services - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.port`
* `network.name`
* `network.protocol`
* `network.transport`
* `network.type`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`
* `zeek.known_services.iana_description`
* `zeek.known_services.iana_name`


#### Zeek Known Software - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `network.name`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`
* `zeek.software.name`
* `zeek.software.software_type`
* `zeek.software.unparsed_version`


#### Zeek Known Hosts - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `network.name`
* `related.device_name`
* `related.device_type`
* `related.ip`
* `related.manufacturer`
* `related.role`
* `related.site`


---

## Zeek Notices

* ID: [f1f09567-fc7f-450b-a341-19d2f2bb468b](#/dashboard/f1f09567-fc7f-450b-a341-19d2f2bb468b)

The Zeek Notices dashboard displays all notice-level events raised by Zeek's detection framework, which flags potentially significant network behaviors. Notices can represent a wide range of conditions—from scanning activity and SSL anomalies to policy violations and protocol errors. This dashboard helps analysts review what Zeek has flagged, understand the distribution of notice types, and correlate notices with specific hosts.

### Visualizations

#### Notices - Log Count Over Time

**Purpose:** A time-series trend line showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Source IP Addresses

**Purpose:** A ranked frequency table of Source IP Addresses values for Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Destination IP Addresses

**Purpose:** A ranked frequency table of Destination IP Addresses values for Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Notice Type

**Purpose:** A ranked frequency table of Notice Type values for Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - File MIME Type

**Purpose:** A ranked frequency table of File MIME Type values for Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.file_mime_type`
* `zeek.notice.msg`


#### Notices - File Description

**Purpose:** A ranked frequency table of File Description values for Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.file_desc`
* `zeek.notice.msg`


#### Notice - Destination Port

**Purpose:** A histogram charting event distribution over time, useful for identifying activity bursts or quiet periods.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notice - Message Details

**Purpose:** A ranked frequency table of Message Details values for Notice. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Notice Types by Source and Destination

**Purpose:** A ranked frequency table of Notice Types by Source and Destination values for Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Destination Country

**Purpose:** A ranked frequency table of Destination Country values for Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.geo.country_name`
* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Source Country

**Purpose:** A ranked frequency table of Source Country values for Notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.geo.country_name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


---

## Zeek Weird

* ID: [1fff49f6-0199-4a0f-820b-721aff9ff1f1](#/dashboard/1fff49f6-0199-4a0f-820b-721aff9ff1f1)

The Zeek Weird dashboard captures unusual or unexpected protocol behaviors that Zeek's 'weird' log records—events that don't fit normal protocol expectations. These entries often indicate malformed packets, protocol misuse, or active reconnaissance, making them valuable early-warning indicators. Analysts can review this dashboard to surface low-level anomalies that may not trigger a full alert but still merit investigation.

### Visualizations

#### Weird - Log Count Over Time

**Purpose:** A time-based histogram showing log volume over time, making it easy to spot traffic spikes, drops, or unusual patterns for this data type.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.name`
* `source.ip`
* `source.port`
* timestamp


#### Weird - Source

**Purpose:** A ranked frequency table of Source values for Weird. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.name`
* `source.ip`
* `source.port`
* timestamp


#### Weird - Destination

**Purpose:** A ranked frequency table of Destination values for Weird. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.name`
* `source.ip`
* `source.port`
* timestamp


#### Weird - Log Count

**Purpose:** Displays the total number of log events in scope, giving an instant count of activity volume.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.name`
* `source.ip`
* `source.port`
* timestamp


#### Weird - Name

**Purpose:** A ranked frequency table of Name values for Weird. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.name`
* `source.ip`
* `source.port`
* timestamp


#### Weird - Logs

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.name`
* `source.ip`
* `source.port`
* timestamp


---
