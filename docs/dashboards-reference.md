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

**Purpose:** A ranked frequency table providing a categorical breakdown of actions. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.action`
* `network.protocol`


#### Results

**Purpose:** A ranked frequency table providing a categorical breakdown of results. Useful for identifying top values and spotting outliers.

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

The ANSI C12.22 dashboard covers the ANSI C12.22 smart meter communication protocol traffic, used in advanced metering infrastructure (AMI) and utility environments. It surfaces service types, device identifiers, table data access, and communication pairs between meters and head-end systems. Analysts monitoring utility networks can use this dashboard to detect unauthorized meter access, data manipulation, and rogue devices communicating on the AMI network.

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

**Purpose:** A pie chart showing the proportional distribution of c12.22  transport protocol. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of c12.22 source ips. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of c12.22 destination ips. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking c12.22 users by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of c12.22 epsem services. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of c12.22 ap titles. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of c12.22 actions. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of c12.22 results. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of c12.22 users and passwords. Useful for identifying top values and spotting outliers.

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

The Asset Interaction Analysis dashboard maps the communication relationships between hosts on the network, providing a behavioral picture of which assets talk to which. It uses connection and protocol data to surface interaction patterns, unusual peer relationships, and potentially unauthorized lateral movement. Security teams use this dashboard to understand normal communication baselines and flag deviations that may indicate compromise or misconfiguration.

### Visualizations

#### Traffic by Network Segment

**Purpose:** A ranked frequency table providing a categorical breakdown of traffic by network segment. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.segment.name`
* `network.bytes`
* `network.direction`
* `network.packets`
* `related.site`
* `source.segment.name`
* timestamp


#### Network Site

**Purpose:** A pie chart showing the proportional distribution of network site. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `related.site`


#### Cross Segment Traffic

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

**Fields / Aggregations:**

* `destination.segment.name`
* `source.segment.name`
* timestamp


#### Protocol by Network Segment

**Purpose:** A ranked frequency table providing a categorical breakdown of protocol by network segment. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.name`
* `network.protocol`
* `network.transport`
* `network.type`
* `related.site`


#### Event Severity by Network Segment

**Purpose:** A ranked frequency table providing a categorical breakdown of event severity by network segment. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.risk_score`
* `event.severity_tags`
* `network.name`
* `related.site`


#### Source Device Type

**Purpose:** A ranked frequency table providing a categorical breakdown of source device type. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `source.device.device_type`
* `source.device.manufacturer`
* `source.device.role`


#### Notice, Alert and Signature by Network Segment

**Purpose:** A ranked frequency table providing a categorical breakdown of notice, alert and signature by network segment. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.dataset`
* `event.provider`
* `network.name`
* `related.site`
* `rule.category`


#### Destination Device Type

**Purpose:** A ranked frequency table providing a categorical breakdown of destination device type. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.device.device_type`
* `destination.device.manufacturer`
* `destination.device.role`


#### Source Device Role

**Purpose:** A horizontal bar chart ranking source device role by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `source.device.role`


#### Destination Device Role

**Purpose:** A horizontal bar chart ranking destination device role by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of uninventoried internal source ips. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of uninventoried internal destination ips. Useful for identifying top values and spotting outliers.

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

The BACnet dashboard covers Building Automation and Control network protocol traffic as logged by Zeek, targeting building management systems. It tracks service types, instance numbers, vendor IDs, object identifiers, and device communication patterns. Analysts and building automation security teams can use this dashboard to detect unauthorized access to HVAC, lighting, and physical access control systems.

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

**Purpose:** A pie chart showing the proportional distribution of bacnet device vendors. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bacnet bvlc functions. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.bvlc_function`
* `zeek.bacnet.invoke_id`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet.pdu_type`


#### ATT&CK for ICS Tactic - BACnet

**Purpose:** A horizontal bar chart ranking att&ck for ics tactic bacnet by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bacnet actions and results. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.action`
* `event.result`


#### BACnet - Protocol Data Units (PDUs)

*BACnet Application Layer Protocol Data Unit types and services*

**Purpose:** A ranked frequency table providing a categorical breakdown of bacnet protocol data units (pdus). Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `source.ip`
* timestamp
* `zeek.bacnet.bvlc_function`
* `zeek.bacnet.invoke_id`
* `zeek.bacnet.pdu_service`
* `zeek.bacnet.pdu_type`


#### ATT&CK for ICS Notices - BACnet

**Purpose:** A ranked frequency table providing a categorical breakdown of att&ck for ics notices bacnet. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bacnet source ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `source.ip`


#### BACnet - Destination IP

*Destination IP Addresses from bacnet.log*

**Purpose:** A ranked frequency table providing a categorical breakdown of bacnet destination ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`


#### BACnet - Device Discovery

*Results from BACnet i-am and i-have commands*

**Purpose:** A ranked frequency table providing a categorical breakdown of bacnet device discovery. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bacnet  read and write property . Useful for identifying top values and spotting outliers.

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

The BSAP dashboard covers Bristol Standard Asynchronous Protocol (BSAP) traffic used in ABB and Bristol Babcock control systems, common in oil and gas and chemical process environments. It logs function codes, device addresses, and communication pairs observed by Zeek. Security teams can use this dashboard to detect unauthorized commands to BSAP-enabled field devices and monitor for unexpected communication sources.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bsap source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bsap ip function. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of bsap transport. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bsap serial rdb function. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bsap serial function. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of bsap destination ip. Useful for identifying top values and spotting outliers.

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

The Connections dashboard covers all network-layer connection records captured by Zeek and Suricata, including TCP, UDP, and ICMP flows. It surfaces data on conversation volumes, data transfer sizes, connection durations, geographic origins and destinations, and top talkers by byte count. Users can identify chatty hosts, large data transfers, long-lived connections, and cross-border traffic that may warrant further investigation.

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

**Purpose:** A pie chart showing the proportional distribution of connections service by destination country. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections source country. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections responder bytes. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections missed bytes. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections connection state. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections total bytes per source/destination ip pair. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections source mac oui. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections destination mac oui. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections source mac address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of connections destination mac address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of connections protocol. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of network layer. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

This geographic dashboard maps total bytes sent by originators to each destination region, using a world map view based on GeoIP data. It allows analysts to quickly visualize the geographic distribution of outbound data flows and identify unusual volumes of traffic directed to specific countries or regions. This view is useful for detecting data exfiltration to unexpected geographic locations.

### Visualizations

#### Connections - Destination - Originator Bytes (region map)

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This dashboard shows inbound byte volumes received by destinations, providing a ranked view of which hosts or subnets are receiving the most data from network responders. It helps identify hosts receiving unusually large data volumes, which may indicate data staging, bulk downloads, or C2 communication. Analysts can use this to prioritize investigation of high-volume data recipients.

### Visualizations

#### Connections - Destination - Responder Bytes

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This geographic map dashboard visualizes responder byte volumes by destination region, providing a geographic breakdown of inbound data flows. It highlights which countries or regions are the source of the most data being delivered to monitored destinations. Useful for identifying geographic sources of large inbound data transfers that may be associated with threat actor infrastructure.

### Visualizations

#### Connections - Destination - Responder Bytes (region map)

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This dashboard ranks destination hosts by total bytes in both directions, providing a clear view of the highest-traffic destinations. It is useful for identifying internal hosts involved in large data transfers and detecting data exfiltration or bulk communication to unexpected destinations. Analysts can correlate high-traffic destinations with known services to flag anomalous activity.

### Visualizations

#### Connections - Destination - Sum of Total Bytes

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This geographic map dashboard shows total byte volumes by destination region, combining both inbound and outbound bytes into a single view. It provides a quick geographic summary of where the most network traffic is directed. Analysts use it to identify geographic concentrations of network activity and flag traffic to high-risk regions.

### Visualizations

#### Connections - Destination - Sum of Total Bytes (region map)

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This dashboard surfaces the longest-lived connections to each destination, helping identify persistent beaconing, slow data exfiltration, and long-running C2 sessions. Long connection durations to unusual destinations are a common indicator of command-and-control communication. Analysts can use this view to triage connections that have been active for unusually extended periods.

### Visualizations

#### Connections - Destination - Top Connection Duration

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This geographic map dashboard maps the longest connection durations by destination region, providing a geographic view of persistent connections. It helps identify sustained communication with hosts in specific countries or regions, which can indicate beaconing or long-lived C2 channels. Analysts can quickly see which geographic areas are associated with the most persistent connections.

### Visualizations

#### Connections - Destination - Top Connection Duration (region map)

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This dashboard ranks source hosts by the total bytes they have sent as connection originators, highlighting the most active data senders on the network. Unusually high originator byte counts from a single source may indicate bulk data exfiltration or a compromised host involved in large-scale data transfer. Analysts can use this view to identify outlier sources and investigate their communication patterns.

### Visualizations

#### Connections - Source - Originator Bytes

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This geographic map dashboard visualizes originator byte volumes by source region, showing which geographic areas are generating the most outbound traffic. It is useful for identifying regions associated with high-volume data originators and detecting unexpected geographic sources of large data transfers. Security teams can cross-reference with threat intelligence to flag originator activity from high-risk regions.

### Visualizations

#### Connections - Source - Originator Bytes (region map)

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This geographic map visualizes responder byte volumes by source region, showing which countries or areas are associated with the highest inbound data receipt. It provides a geographic view of which regions' hosts are receiving the most response data. Useful for identifying geographic clusters of high data-receipt activity that may warrant deeper investigation.

### Visualizations

#### Connections - Source - Responder Bytes (region map)

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This dashboard ranks source hosts by their total network byte volume across all connections, giving a combined view of both sent and received data. Top sources by total bytes represent the most network-active hosts and may warrant investigation if they are not known high-volume systems. Analysts use this as a quick indicator of which hosts have the highest overall network presence.

### Visualizations

#### Connections - Source - Sum of Total Bytes

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This geographic map dashboard shows total byte volumes by source region, combining sent and received bytes for a comprehensive geographic activity view. It provides an at-a-glance summary of which regions are the most network-active. Useful for detecting geographic concentrations of high-volume traffic that may indicate targeted activity.

### Visualizations

#### Connections - Source - Sum of Total Bytes (region map)

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This dashboard surfaces the longest-lived connections originating from each source host, helping identify persistent communication channels and potential beaconing. Long-lived connections from a single source to an external host are a common indicator of command-and-control or data exfiltration over persistent sessions. Analysts can use this to prioritize investigation of sources maintaining unusually long connections.

### Visualizations

#### Connections - Source - Top Connection Duration

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

This geographic map dashboard maps the longest connection durations by source region, showing which geographic areas are associated with the most persistent originating connections. It complements the source duration table view with a geographic context, helping analysts identify regions involved in long-lived communication. Useful for detecting persistent cross-border connections that may indicate ongoing C2 or data exfiltration activity.

### Visualizations

#### Connections - Source - Top Connection Duration (region map)

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

The DCE/RPC dashboard provides visibility into Distributed Computing Environment / Remote Procedure Call traffic as logged by Zeek, which underlies many Windows protocols including DCOM and WMI. It surfaces endpoint UUIDs, operations, named pipes, and the hosts involved in RPC exchanges. Security teams can use this dashboard to detect lateral movement via WMI or DCOM, identify unusual RPC service calls, and spot DCE/RPC-based reconnaissance.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dce/rpc source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dce/rpc destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dce/rpc endpoint. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dce/rpc named pipe. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dce/rpc operation. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dce/rpc round trip time. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dce/rpc destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dce/rpc summary. Useful for identifying top values and spotting outliers.

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

The DHCP dashboard tracks Dynamic Host Configuration Protocol activity captured by Zeek, including IP address assignments, hostname registrations, and lease activity. It provides a real-time picture of which devices are joining the network and what addresses they are receiving. Analysts can use it for asset discovery, detecting rogue DHCP servers, and correlating IP addresses with hostnames at specific points in time.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dhcp destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dhcp source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dhcp destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dhcp ip to mac assignment. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dhcp client software. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dhcp server software. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dhcp ja4d fingerprint. Useful for identifying top values and spotting outliers.

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

The DNP3 dashboard covers Distributed Network Protocol 3 traffic, a common ICS protocol used in electric utility and water treatment environments. It surfaces function codes, object headers, master and outstation addresses, and request/response patterns observed by Zeek. This dashboard helps security and operations teams detect command injection, unauthorized polling, and anomalous DNP3 traffic that may indicate unauthorized access to field devices.

### Visualizations

#### DNP3 - Source IP

*Source IP Addresses from dnp3.log*

**Purpose:** A ranked frequency table providing a categorical breakdown of dnp3 source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dnp3 destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dnp3 function request. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dnp3 function reply. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of dnp3 internal indicators overview. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dnp3 objects overview. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dnp3 control overview. Useful for identifying top values and spotting outliers.

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

The DNS dashboard provides a comprehensive view of DNS activity observed on the network as captured by Zeek. It covers query volumes over time, top queried domains, response codes, query types, and the hosts generating DNS traffic. Analysts use it to detect DNS-based threats such as data exfiltration via DNS tunneling, domain generation algorithm (DGA) activity, and unusually high query rates.

### Visualizations

#### DNS - Server

**Purpose:** A ranked frequency table providing a categorical breakdown of dns server. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Client

**Purpose:** A ranked frequency table providing a categorical breakdown of dns client. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Query Class

**Purpose:** A pie chart showing the proportional distribution of dns query class. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.qclass_name`
* `zeek.dns.query`


#### DNS - Query/Answer

**Purpose:** A ranked frequency table providing a categorical breakdown of dns query/answer. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dns answers. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS - Response Code (Name)

**Purpose:** A ranked frequency table providing a categorical breakdown of dns response code (name). Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`
* `zeek.dns.rcode_name`


#### DNS - Query Type

**Purpose:** A ranked frequency table providing a categorical breakdown of dns query type. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.qtype_name`
* `zeek.dns.query`


#### DNS - Protocol

**Purpose:** A pie chart showing the proportional distribution of dns protocol. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `network.transport`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### DNS Queries by Randomness

**Purpose:** A ranked frequency table providing a categorical breakdown of dns queries by randomness. Useful for identifying top values and spotting outliers.

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

The EtherCAT dashboard provides visibility into EtherCAT industrial Ethernet traffic, used in high-speed motion control and automation systems. It captures command types, slave addresses, working counters, and communication patterns between master and slave devices. This dashboard is useful for detecting anomalous EtherCAT traffic that could indicate device tampering or unauthorized access to automation equipment.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ethercat source. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`


#### EtherCAT - Destination

**Purpose:** A ranked frequency table providing a categorical breakdown of ethercat destination. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`


#### EtherCAT - Commands

**Purpose:** A ranked frequency table providing a categorical breakdown of ethercat commands. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.mac`
* `destination.oui`
* `event.action`
* `event.dataset`
* `source.mac`
* `source.oui`


#### EtherCAT - Register Types and Commands

**Purpose:** A ranked frequency table providing a categorical breakdown of ethercat register types and commands. Useful for identifying top values and spotting outliers.

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

The EtherNet/IP dashboard covers Ethernet/IP and Common Industrial Protocol (CIP) traffic as logged by Zeek, which is widely used in manufacturing and process control environments. It surfaces CIP service codes, class and instance identifiers, device identity data, and communication pairs. Security teams can use this to monitor for unauthorized PLC access, unusual CIP commands, and unexpected EtherNet/IP device discovery activity.

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

**Purpose:** A horizontal bar chart ranking ethernet/ip commands by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ethernet/ip source ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `source.ip`


#### ATT&CK for ICS Tactic - EtherNet/IP and CIP

**Purpose:** A horizontal bar chart ranking att&ck for ics tactic ethernet/ip and cip by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of att&ck for ics notices ethernet/ip and cip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ethernet/ip destination ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`


#### CIP - Device Identity

*CIP Identity Results*

**Purpose:** A ranked frequency table providing a categorical breakdown of cip device identity. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of cip services. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ethernet/ip  detailed information. Useful for identifying top values and spotting outliers.

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

The File Scanning dashboard consolidates results from file analysis tools integrated with Zeek, including YARA rule matches and file hash lookups. It tracks files observed in network traffic, their MIME types, associated hashes, and any signatures they triggered. This dashboard is useful for hunting malware, tracking file transfers across the network, and validating whether transferred files are known-bad or suspicious.

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

**Purpose:** A horizontal bar chart ranking file scanning file source by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A pie chart showing the proportional distribution of file scanning scanners with hits. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of file scanning triggered rules. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of file scanning severity. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of file scanning mime type. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of file scanning tactic and technique. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of file scanning all scanners. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of file scanning source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of file scanning destination ip. Useful for identifying top values and spotting outliers.

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

The File Tree dashboard presents a hierarchical breakdown of files observed in network traffic, organized by directory path or protocol context. It is useful for understanding the structure of file transfers—particularly over protocols like SMB or FTP—and identifying patterns in what data is being accessed or exfiltrated. Analysts can drill into specific directories or file categories to investigate suspicious file activity.

### Visualizations

#### File Scanning - MIME Type

**Purpose:** A ranked frequency table providing a categorical breakdown of file scanning mime type. Useful for identifying top values and spotting outliers.

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

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

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

**Purpose:** A custom Vega visualization providing a specialized view of the underlying data. Refer to the panel title for the specific metric or relationship being displayed.

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

The Files dashboard provides an overview of all files observed traversing the network as captured by Zeek's file analysis framework. It covers file types by MIME category, transfer volumes, source and destination hosts, and file hashes. Analysts can identify unusual file types, large file movements, and track specific files of interest across the captured traffic.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of files files by size (bytes). Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp
* `zeek.files.seen_bytes`


#### FIles - Destination IP Address

**Purpose:** A ranked frequency table providing a categorical breakdown of files destination ip address. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### FIles - Source IP Address

**Purpose:** A ranked frequency table providing a categorical breakdown of files source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking files source by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### Files - MIME Type

**Purpose:** A ranked frequency table providing a categorical breakdown of files mime type. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `file.mime_type`


#### Files - Paths

**Purpose:** A ranked frequency table providing a categorical breakdown of files paths. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.dataset`
* `file.path`
* `network.protocol`


#### Extracted File Downloads

**Purpose:** A detailed, scrollable event log table allowing analysts to inspect individual records. Supports drilling into specific events, filtering, and exporting for further investigation.

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

The FTP dashboard covers all File Transfer Protocol activity captured by Zeek, including commands, arguments, reply codes, and transfer participants. It provides insight into file staging, unauthorized file transfers, and FTP authentication patterns. This is a useful dashboard for investigating data exfiltration over FTP and identifying misconfigured FTP servers accessible to unauthorized clients.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ftp argument. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.arg`
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Commands and Replies

**Purpose:** A ranked frequency table providing a categorical breakdown of ftp commands and replies. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of ftp reply. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.result`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Source

**Purpose:** A ranked frequency table providing a categorical breakdown of ftp source. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Destination

**Purpose:** A ranked frequency table providing a categorical breakdown of ftp destination. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.ftp.command`
* `zeek.ftp.reply_msg`


#### FTP - Username

**Purpose:** A ranked frequency table providing a categorical breakdown of ftp username. Useful for identifying top values and spotting outliers.

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

The GE SRTP dashboard covers the GE Service Request Transport Protocol (SRTP), used to communicate with GE PLCs and automation devices. It captures service request types, memory area access, sequence numbers, and communication pairs. Security teams can use this to detect unauthorized reads or writes to GE PLC memory areas, which could indicate ICS-targeted attacks or insider threats.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ge srtp source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ge srtp destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ge srtp actions and results. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp panel run switch. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp panel enable switch. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp plc fault entry present. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp i/o fault entry present. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp programmer attachment. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ge srtp plc state. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp constant sweep mode. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp oversweep flag. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp plc fault table changed. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp i/o fault table changed. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ge srtp oem protection. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The GENISYS dashboard covers network traffic for the GENISYS industrial protocol as logged by Zeek. It tracks source and destination communication pairs, station addresses, operation directions, and event results. This dashboard gives operators and security teams visibility into GENISYS device communication and helps detect anomalous commands or unexpected participants in protocol exchanges.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of genisys station address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of genisys source. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking genisys action by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A pie chart showing the proportional distribution of genisys message direction. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of genisys destination. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking genisys result by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

The HART-IP dashboard covers Highway Addressable Remote Transducer (HART) over IP traffic, used to communicate with smart field instruments in process control environments. It logs command codes, device addresses, response codes, and communication participants. Security teams monitoring process control networks can use this to detect unauthorized read or write commands to smart sensors and field devices.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of hart-ip source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of hart-ip destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of hart-ip actions and results. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of hart-ip universal commands device profile and type. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_universal_commands.read_unique_identifier_response_device_profile`
* `zeek.hart_ip_universal_commands.read_unique_identifier_response_expanded_device_type`


#### HART-IP - Universal Commands Message and Response

**Purpose:** A ranked frequency table providing a categorical breakdown of hart-ip universal commands message and response. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_universal_commands.read_message_response_message`
* `zeek.hart_ip_universal_commands.write_message_message_string`


#### HART-IP - PDU Command

**Purpose:** A ranked frequency table providing a categorical breakdown of hart-ip pdu command. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of header version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of protocol major revision. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_universal_commands.read_unique_identifier_response_hart_protocol_major_revision`


#### Insecure Session

**Purpose:** A pie chart showing the proportional distribution of insecure session. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_session_record.session_log_record_session_status_summary_insecure_session`


#### Audit Log Insecure Syslog Connection

**Purpose:** A pie chart showing the proportional distribution of audit log insecure syslog connection. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of session summary: writes occurred. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.hart_ip_session_record.session_log_record_session_status_summary_writes_occured`


#### Device Malfunction (Token Passing PDU)

**Purpose:** A pie chart showing the proportional distribution of device malfunction (token passing pdu). Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of device malfunction (direct pdu). Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of configuration changed (token passing pdu). Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of configuration changed (direct pdu). Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of maintenance required. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of function check. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of failure. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of device variable alert. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of critical power failure. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of out of specification. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The HTTP dashboard covers all web traffic observed by Zeek, including request methods, URIs, response codes, user agents, and host headers. It provides insight into web browsing behavior, application traffic, file downloads, and server responses across the monitored network. This is a key dashboard for investigating web-based attacks, unauthorized downloads, and unusual HTTP patterns that may indicate compromise.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of http sites. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of http sites hosting exes. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `zeek.http.host`


#### HTTP - URIs

**Purpose:** A ranked frequency table providing a categorical breakdown of http uris. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of http source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of http destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of http user agent. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of http referrer. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of http  status and method. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of http version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of best guess protocol destination. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of best guess summary. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of best guess protocol source. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking best guess category by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ics/iot external traffic. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of network layer. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ics/iot actions and results. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking att&ck for ics tactic by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ics/iot source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ics tactics and techniques. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ics/iot destination ip. Useful for identifying top values and spotting outliers.

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

The IRC dashboard covers Internet Relay Chat protocol traffic as logged by Zeek, tracking channels, nicknames, commands, and communication hosts. IRC is frequently used as a command-and-control channel by botnets and malware, making this dashboard a useful tool for detecting C2 communication and bot activity. Analysts can identify unexpected IRC traffic in environments where it is not a legitimate business tool.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of irc destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of irc source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of irc destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of irc destination country. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of irc command. Useful for identifying top values and spotting outliers.

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

The Kerberos dashboard surfaces authentication traffic from Kerberos as logged by Zeek, covering ticket requests, error codes, service names, and participating hosts. It is useful for detecting Kerberoasting, AS-REP roasting, ticket forgery, and other Active Directory authentication abuse patterns. Analysts can use the error code breakdown to identify failed authentication spikes and unusual service ticket requests.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of kerberos client. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of kerberos success status. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of kerberos server. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of kerberos cipher. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of kerberos source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of kerberos destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of kerberos service. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of kerberos request types. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of kerberos renewable ticket requested. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A horizontal bar chart ranking kerberos destination ports by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

The LDAP dashboard tracks Lightweight Directory Access Protocol queries and responses as observed by Zeek, covering bind operations, search queries, object targets, and results. It is particularly useful for identifying Active Directory enumeration, unauthorized directory queries, and LDAP injection attempts. Analysts can review top querying hosts and common search targets to baseline legitimate directory usage against anomalous activity.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ldap source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ldap destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ldap bind. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking ldap search scope by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ldap result code. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ldap operation. Useful for identifying top values and spotting outliers.

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

The Modbus dashboard provides visibility into Modbus industrial protocol traffic as logged by Zeek, covering function codes, register addresses, unit identifiers, and host communication pairs. Modbus is widely used in SCADA and ICS environments for controlling field devices, making this dashboard critical for OT security monitoring. Analysts can detect unauthorized commands, unusual function codes, and communication with unexpected Modbus devices.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of modbus source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of modbus destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of modbus observed clients and servers. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.direction`
* `source.ip`
* timestamp
* `zeek.known_modbus.device_type`


#### Modbus - Observed Client/Server Ratio

*Modbus Observed Clients and Servers Chart*

**Purpose:** A pie chart showing the proportional distribution of modbus observed client/server ratio. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of modbus functions and exceptions. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking modbus request and response by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of modbus reads. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of modbus writes. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of modbus transport. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of modbus device identification objects. Useful for identifying top values and spotting outliers.

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

The MQTT dashboard covers Message Queuing Telemetry Transport protocol traffic, widely used in IoT devices and lightweight machine-to-machine communication. It tracks topic names, QoS levels, client IDs, and broker/client communication patterns observed by Zeek. This dashboard is useful for asset discovery in IoT environments, detecting unauthorized MQTT brokers, and identifying sensitive topics being published or subscribed to by unexpected clients.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of mqtt source ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp


#### MQTT - Destination IP

**Purpose:** A ranked frequency table providing a categorical breakdown of mqtt destination ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp


#### MQTT - Protocol

**Purpose:** A pie chart showing the proportional distribution of mqtt protocol. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of mqtt client id. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of mqtt subscription. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of mqtt publish. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of mqtt publish payload. Useful for identifying top values and spotting outliers.

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

The MySQL dashboard provides visibility into MySQL database protocol traffic as captured by Zeek, including command types, user credentials (where visible), affected rows, and connection metadata. It helps detect unauthorized database access, SQL operations from unexpected hosts, and unusual query patterns. Security teams can use this to enforce database access policies and identify potential data exfiltration over MySQL connections.

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

**Purpose:** A pie chart showing the proportional distribution of mysql success. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.mysql.cmd`
* `zeek.mysql.success`


#### MySQL - Commands

**Purpose:** A ranked frequency table providing a categorical breakdown of mysql commands. Useful for identifying top values and spotting outliers.

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

The NTLM dashboard covers NT LAN Manager authentication traffic as captured by Zeek, including NTLM challenge-response exchanges, domain information, and authentication outcomes. It provides insight into legacy authentication usage and helps detect NTLM relay attacks, credential brute-forcing, and pass-the-hash activity. Security teams can use this dashboard to identify systems still relying on NTLM where Kerberos should be used.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntlm hostname. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntlm domain name. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntlm username. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntlm destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntlm source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntlm destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntlm hostname to username. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of ntlm success. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The NTP dashboard covers Network Time Protocol traffic as logged by Zeek, providing insight into time synchronization activity across the environment. It tracks NTP stratum levels, reference IDs, version numbers, and communication pairs. Analysts can detect NTP amplification abuse, rogue time sources, and unusual NTP query volumes that could indicate reconnaissance or DDoS preparation.

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

**Purpose:** A horizontal bar chart ranking ntp stratum by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A pie chart showing the proportional distribution of ntp version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of ntp mode. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A horizontal bar chart ranking ntp polling interval by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntp source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ntp destination ip. Useful for identifying top values and spotting outliers.

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

The Omron FINS dashboard provides visibility into the Factory Interface Network Service (FINS) protocol used by Omron PLCs and automation equipment. It tracks command codes, memory area designations, unit addresses, and source/destination host pairs. This dashboard is useful for detecting unauthorized command execution against Omron controllers, including memory reads, writes, and PLC status queries.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of omron fins action and result. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of omron fins source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of omron fins destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of omron fins controller model and version. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of omron fins files/volumes. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of omron fins transport protocol. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of omron fins data type. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of omron fins address, node, and unit. Useful for identifying top values and spotting outliers.

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

The OPC UA Binary dashboard covers OPC Unified Architecture binary protocol traffic, the modern standard for industrial data exchange between PLCs, SCADA systems, and enterprise applications. It captures service types, node IDs, security policy, and communication pairs observed by Zeek. Analysts can use this to detect unauthorized OPC UA connections, unusual browsing or write operations, and unexpected cross-zone OPC UA traffic.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of opcua binary actions. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.action`


#### OPCUA Binary - Results

**Purpose:** A ranked frequency table providing a categorical breakdown of opcua binary results. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.result`


#### OPCUA Binary - URLs and URIs

**Purpose:** A ranked frequency table providing a categorical breakdown of opcua binary urls and uris. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `url.original`


#### OPCUA Binary - User

**Purpose:** A horizontal bar chart ranking opcua binary user by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of opcua binary source. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of opcua binary destination. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking opcua binary software by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A pie chart showing the proportional distribution of opcua binary protocol version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The OSPF dashboard covers Open Shortest Path First routing protocol traffic as observed by Zeek. It tracks message types (Hello, DBD, LSR, LSU, LSAck), router IDs, area IDs, and neighbor relationships. Security teams can use this to detect unauthorized OSPF neighbors attempting to inject false routing information, which could redirect traffic or enable man-in-the-middle attacks.

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

**Purpose:** A pie chart showing the proportional distribution of ospf packet type. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ospf link state advertisement. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ospf link type. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ospf area and router. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ospf source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ospf destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ospf all ip addresses. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of connections service by destination country. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of log type. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of dns queries. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `source.ip`
* timestamp
* `zeek.dns.answers`
* `zeek.dns.query`


#### Log Source

**Purpose:** A ranked frequency table providing a categorical breakdown of log source. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.ingested`
* `host.name`


#### Application Protocol

**Purpose:** A ranked frequency table providing a categorical breakdown of application protocol. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.protocol`
* `network.protocol_version`


#### Actions and Results

**Purpose:** A ranked frequency table providing a categorical breakdown of actions and results. Useful for identifying top values and spotting outliers.

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

The PE (Portable Executable) dashboard provides visibility into Windows PE file analysis data from Zeek, covering OS targets, machine types, subsystems, section names, and capability signatures. It helps analysts understand what executable files have been observed in network traffic and identify suspicious characteristics such as unusual sections or capability flags. This dashboard is particularly useful during malware investigations to quickly characterize executables transferring across the network.

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

**Purpose:** A pie chart showing the proportional distribution of pe os. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.subsystem`


#### PE - Subsystem

**Purpose:** A pie chart showing the proportional distribution of pe subsystem. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.subsystem`


#### PE - Section Name

**Purpose:** A ranked frequency table providing a categorical breakdown of pe section name. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.id`
* timestamp
* `zeek.pe.machine`
* `zeek.pe.os`
* `zeek.pe.section_names`
* `zeek.pe.subsystem`


#### PE - Machine

**Purpose:** A ranked frequency table providing a categorical breakdown of pe machine. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of capa signatures. Useful for identifying top values and spotting outliers.

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

The PostgreSQL dashboard covers PostgreSQL database protocol traffic as captured by Zeek, including connection metadata, command types, and host pairs. It provides visibility into who is accessing PostgreSQL instances and what types of operations they are performing. Analysts can detect unauthorized database access, unexpected client connections, and unusual query volumes that may indicate automated data extraction.

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

**Purpose:** A horizontal bar chart ranking postgresql database by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of postgresql action and results. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of postgresql application. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of postgresql source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of postgresql destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of postgresql user. Useful for identifying top values and spotting outliers.

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

The PROFINET dashboard covers PROFINET industrial communication protocol traffic, commonly used in manufacturing automation with Siemens and other ICS vendors. It tracks DCP (Discovery and Configuration Protocol), IO (real-time I/O), and DCE/RPC sub-protocol activity between PLCs, HMIs, and I/O devices. Security teams use it to detect unauthorized device discovery, configuration changes, and unusual PROFINET communication patterns.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of profinet source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of profinet destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of profinet operation. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of profinet operation details. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking profinet i/o cm operation by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

The QUIC dashboard provides visibility into QUIC protocol traffic, a UDP-based transport used by modern HTTPS and HTTP/3 connections. It covers connection metadata, server names, versions, and host communication pairs as observed by Zeek. This dashboard is useful for tracking QUIC-based web traffic, identifying applications using QUIC, and detecting attempts to bypass inspection by tunneling traffic over QUIC.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of quic source ip address. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - Destination IP Address

**Purpose:** A ranked frequency table providing a categorical breakdown of quic destination ip address. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - User Agent

**Purpose:** A ranked frequency table providing a categorical breakdown of quic user agent. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - Server Name

**Purpose:** A ranked frequency table providing a categorical breakdown of quic server name. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `quic.host`
* `quic.version`
* `source.ip`
* timestamp
* `user_agent.original`


#### QUIC - CYU Fingerprint

**Purpose:** A ranked frequency table providing a categorical breakdown of quic cyu fingerprint. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of quic version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The RADIUS dashboard covers Remote Authentication Dial-In User Service protocol traffic as logged by Zeek, tracking authentication requests, results, username attributes, and NAS identifiers. RADIUS is used for centralized network access authentication, and this dashboard helps detect brute-force attempts, authentication bypass, and rogue RADIUS clients. Analysts can correlate failed authentication spikes with specific NAS devices and usernames.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of radius source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of radius destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of radius mac. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of radius connection information. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of radius username. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of radius authentication result. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The RDP dashboard covers Remote Desktop Protocol sessions as logged by Zeek, including connection metadata, authentication outcomes, security protocols, and host certificates. It provides visibility into remote desktop usage and helps detect unauthorized remote access, brute-force attempts, and RDP-based lateral movement. This is a high-value dashboard during incident response when adversaries frequently leverage RDP for interactive access.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rdp source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rdp destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rdp cookie. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of rdp result. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of rdp keyboard layout. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of rdp encryption. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The Redis dashboard covers Redis in-memory data store protocol traffic as logged by Zeek, including command types, return values, and communication pairs. Redis is commonly exposed unintentionally without authentication, making it a frequent target for unauthorized access and data manipulation. Analysts can use this dashboard to detect unexpected Redis clients, dangerous commands (FLUSHDB, CONFIG), and unauthorized access to cached data.

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

**Purpose:** A pie chart showing the proportional distribution of redis success. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of redis source. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of redis destination. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of redis action and result. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of redis key. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of redis key and value. Useful for identifying top values and spotting outliers.

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

The RFB dashboard covers Remote Framebuffer protocol sessions (used by VNC) as captured by Zeek, including desktop sharing connections, authentication types, and host pairs. It helps identify remote desktop activity outside of expected channels and detect unauthorized VNC access to internal systems. Analysts can use it to baseline legitimate VNC usage and flag unexpected desktop-sharing sessions.

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

**Purpose:** A pie chart showing the proportional distribution of rfb authentication status. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of rfb exclusive session. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rfb desktop name. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rfb source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rfb destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rfb destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rfb server version. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of rfb client version. Useful for identifying top values and spotting outliers.

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

The ROC Plus dashboard covers the Emerson ROC Plus protocol traffic used to communicate with remote operations controllers commonly found in oil and gas environments. It logs parameter group and logic numbers, operation types, and communication participants. Security teams can use this dashboard to detect unauthorized reads or writes to ROC devices and monitor for unexpected communication patterns in pipeline control systems.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of roc plus action. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of roc plus result. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of roc plus transport protocol. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of roc plus source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of roc plus destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of roc plus file transfer directory. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of roc plus file transfer filename. Useful for identifying top values and spotting outliers.

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

The S7comm dashboard provides visibility into Siemens S7 protocol communication used to program and control Siemens PLCs, a frequent target in ICS attacks. It surfaces function codes, block types, CPU data, and communication pairs between engineering stations and PLCs. This is a critical dashboard for detecting unauthorized PLC programming, reading of sensitive memory areas, and reconnaissance against Siemens control systems.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of s7comm operations. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of s7comm source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of s7comm destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of s7comm plus version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of s7comm devices. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of s7comm read-szl. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking att&ck for ics tactic s7comm by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of att&ck for ics notices s7comm. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of s7comm upload/download file names. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking normalized event category by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `network.transport`
* `rule.category`


#### Notice, Alert and Signature - Summary

**Purpose:** A ranked frequency table providing a categorical breakdown of notice, alert and signature summary. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of outdated/insecure application protocols. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `network.protocol`
* `network.protocol_version`


#### Vulnerabilities

**Purpose:** A ranked frequency table providing a categorical breakdown of vulnerabilities. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of clear-text transmission of passwords . Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of outbound internal traffic by country. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.geo.country_name`


#### Inbound External Traffic by Country

**Purpose:** A ranked frequency table providing a categorical breakdown of inbound external traffic by country. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `source.geo.country_name`


#### File Transfers

**Purpose:** A tag cloud showing the relative frequency of values by size. Dominant tags appear larger, making it easy to identify the most common values at a glance.

**Fields / Aggregations:**

* `file.mime_type`


#### DNS Queries by Randomness

**Purpose:** A ranked frequency table providing a categorical breakdown of dns queries by randomness. Useful for identifying top values and spotting outliers.

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

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of severity tags. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of severity notices. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of severity application protocol. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.risk_score`
* `network.protocol`


#### Severity - Socket Family

**Purpose:** A pie chart showing the proportional distribution of severity socket family. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of file types by transport. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `file.mime_type`
* `file.path`
* `file.source`
* `source.ip`
* timestamp


#### Severity - Source IP

**Purpose:** A ranked frequency table providing a categorical breakdown of severity source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of severity destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

**Purpose:** A geographic map overlaying connection data onto a world view. Enables quick visual identification of traffic to or from unexpected geographic regions.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of severity destination oui. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of severity source oui. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of actions and results. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of signatures name. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.original`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp


#### Signatures - Source IP

**Purpose:** A ranked frequency table providing a categorical breakdown of signatures source ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `event.original`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp


#### Signatures - Destination IP

**Purpose:** A ranked frequency table providing a categorical breakdown of signatures destination ip. Useful for identifying top values and spotting outliers.

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

The SIP dashboard covers Session Initiation Protocol traffic as logged by Zeek, including call setup, methods, response codes, user agents, and communication pairs. SIP is used for VoIP and unified communications and can be targeted for toll fraud, call hijacking, and reconnaissance of telephony infrastructure. Analysts can detect unusual SIP activity, rogue clients, high volumes of failed authentication, and unauthorized INVITE or REGISTER messages.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of sip source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of sip destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of sip destination country. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of sip request path. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of sip uri. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of sip user agent. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of sip content type. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of sip destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of sip status. Useful for identifying top values and spotting outliers.

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

The SMB dashboard provides visibility into Server Message Block protocol traffic as logged by Zeek, covering file sharing, named pipe operations, and authentication activity. It surfaces the commands used, files accessed, share names, and hosts involved in SMB communication. This is a critical dashboard for detecting lateral movement, credential relay attacks, and ransomware staging behavior that frequently leverages SMB.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smb source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smb destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of smb version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smb file path. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smb file name. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smb file/path summary. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smb destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smb relevant notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### SMB Action

**Purpose:** A ranked frequency table providing a categorical breakdown of smb action. Useful for identifying top values and spotting outliers.

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

The SMTP dashboard covers email traffic observed on the network as captured by Zeek's SMTP log. It tracks message senders, recipients, mail servers, attachment details, and transmission metadata. Analysts use it to investigate phishing activity, unauthorized mail relay, and unusual email flow patterns that could indicate account compromise or malware communication.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smtp subject. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of smtp  destination country. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smtp "from" address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smtp "to" address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of smtp tls. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smtp source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smtp destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smtp user agent. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of smtp destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of smtp webmail. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The SNMP dashboard covers Simple Network Management Protocol traffic as captured by Zeek, including get/set operations, community strings (if visible), and managed device identifiers. It provides insight into network device monitoring activity and helps detect unauthorized SNMP polling, community string brute-forcing, and SNMP-based information gathering. Analysts can identify which hosts are querying network infrastructure devices and flag unexpected management traffic.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of snmp source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of snmp destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of snmp session duration. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of snmp community string. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking snmp pdu type by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A pie chart showing the proportional distribution of software summary. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The SSH dashboard tracks Secure Shell (SSH) sessions as logged by Zeek, covering connection counts, authentication outcomes, client and server versions, and geographic origins. It provides visibility into remote access activity and helps detect brute-force attempts, unauthorized access, and unusual geographic sources of SSH connections. Analysts can correlate version data to identify outdated SSH implementations that may be vulnerable.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssh source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssh destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssh client/server. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssh -server. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of ssh version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssh client algorithms. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssh server algorithms. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssh hassh client hash. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssh hassh server hash. Useful for identifying top values and spotting outliers.

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

The SSL/TLS dashboard presents certificate and connection data from encrypted traffic as captured by Zeek's SSL log. It surfaces certificate subjects, issuers, validation errors, cipher suites, and TLS versions in use across the environment. Analysts can use it to identify self-signed or expired certificates, weak cipher usage, and potentially malicious use of encryption to hide command-and-control traffic.

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

**Purpose:** A pie chart showing the proportional distribution of ssl version. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl destination address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl server. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl validation status. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl relevant notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### SSL - Connection Established

**Purpose:** A pie chart showing the proportional distribution of ssl connection established. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl certificate fingerprint. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking ssl elliptic curve by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl next protocol. Useful for identifying top values and spotting outliers.

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

The STUN dashboard covers Session Traversal Utilities for NAT (STUN) traffic as observed by Zeek, which is used by applications like WebRTC to establish peer-to-peer connections through firewalls. It tracks binding requests, responses, software identifiers, and communication pairs. Analysts can use this dashboard to identify applications using STUN-based NAT traversal and flag unexpected STUN traffic that may be used for covert communication channels.

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

**Purpose:** A horizontal bar chart ranking stun attribute type by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of stun method and class. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of stun class. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of stun action and result. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of stun source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of stun destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of stun lan. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of stun wan. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking alert category by frequency. Provides a clear visual comparison of relative occurrence across categories.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Target

**Purpose:** A ranked frequency table providing a categorical breakdown of alerts target. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Name

**Purpose:** A ranked frequency table providing a categorical breakdown of alerts name. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Source

**Purpose:** A ranked frequency table providing a categorical breakdown of alerts source. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.id`
* `rule.name`
* `source.ip`
* `vulnerability.category`


#### Alerts - Destination

**Purpose:** A ranked frequency table providing a categorical breakdown of alerts destination. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of alerts destination country. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of alerts source country. Useful for identifying top values and spotting outliers.

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

The Synchrophasor dashboard covers IEEE C37.118 synchrophasor protocol traffic used in electric grid monitoring and wide-area measurement systems (WAMS). It tracks frame types (data, header, configuration, command), PMU identifiers, data rates, and communication participants. Grid operators and security teams can use this to detect unauthorized access to phasor measurement units and anomalous configuration or command frames.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of synchrophasor source. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of synchrophasor destination. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking synchrophasor action by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A horizontal bar chart ranking synchrophasor frame types by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A pie chart showing the proportional distribution of synchrophasor transport. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of synchrophasor stations. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of synchrophasor phasors. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of synchrophasor analog channels. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of synchrophasor digital channels. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of synchrophasor data modified. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The Syslog dashboard presents syslog messages observed in network traffic as captured by Zeek, covering severity levels, facility codes, originating hosts, and message content summaries. It helps analysts understand what systems are forwarding log data, whether logging pipelines are functioning correctly, and whether any unusual error or critical syslog events are being generated. This dashboard is also useful for detecting log flooding, rogue syslog sources, and syslog-based data exfiltration.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of syslog source ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of syslog destination ip address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of syslog destination port. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of syslog severity. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A horizontal bar chart ranking syslog facility by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A pie chart showing the proportional distribution of syslog protocol. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

The Tabular Data Stream (TDS) dashboard covers Microsoft SQL Server protocol traffic as logged by Zeek, including login metadata, query activity, and response codes. It provides visibility into database connections and helps detect unauthorized SQL Server access and unusual database activity. Analysts can identify which clients are connecting to SQL Server instances and detect patterns consistent with SQL injection or data exfiltration.

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

**Purpose:** A pie chart showing the proportional distribution of tabular data stream command. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds.command`


#### Tabular Data Stream - Source IP

**Purpose:** A ranked frequency table providing a categorical breakdown of tabular data stream source ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.dataset`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds.command`


#### Tabular Data Stream - Destination IP

**Purpose:** A ranked frequency table providing a categorical breakdown of tabular data stream destination ip. Useful for identifying top values and spotting outliers.

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

The Tabular Data Stream - RPC dashboard focuses on remote procedure call operations within Microsoft SQL Server TDS traffic, including stored procedure execution and batch operations. It surfaces the RPC procedure names, parameters, and originating hosts, providing detailed insight into programmatic database interactions. Security teams can use this to detect unauthorized stored procedure execution and unusual RPC-based SQL Server communication.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of tabular data stream rpc procedure. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_rpc.parameter`
* `zeek.tds_rpc.procedure_name`


#### Tabular Data Stream - RPC Source IP

**Purpose:** A ranked frequency table providing a categorical breakdown of tabular data stream rpc source ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_rpc.parameter`
* `zeek.tds_rpc.procedure_name`


#### Tabular Data Stream - RPC Destination IP

**Purpose:** A ranked frequency table providing a categorical breakdown of tabular data stream rpc destination ip. Useful for identifying top values and spotting outliers.

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

The Tabular Data Stream - SQL dashboard focuses on the SQL statement activity within Microsoft SQL Server TDS traffic, capturing query text snippets, affected rows, and communication metadata. It provides a window into the types of SQL queries being executed against SQL Server instances. Analysts can use this to detect data harvesting queries, schema enumeration, and unauthorized or unusual SQL activity from unexpected clients.

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

**Purpose:** A pie chart showing the proportional distribution of tabular data stream sql header type. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Source IP

**Purpose:** A ranked frequency table providing a categorical breakdown of tabular data stream sql source ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Destination IP

**Purpose:** A ranked frequency table providing a categorical breakdown of tabular data stream sql destination ip. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `source.ip`
* timestamp
* `zeek.tds_sql_batch.header_type`
* `zeek.tds_sql_batch.query`


#### Tabular Data Stream - SQL Query

**Purpose:** A ranked frequency table providing a categorical breakdown of tabular data stream sql query. Useful for identifying top values and spotting outliers.

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

The Telnet, rlogin, and rsh dashboard covers legacy plaintext remote access protocols as captured by Zeek, providing visibility into unencrypted interactive sessions. These protocols transmit credentials and session data in cleartext, making them high-risk when observed on modern networks. Analysts can use this dashboard to identify legacy systems still using insecure remote access protocols and investigate any such sessions as potential security incidents.

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

**Purpose:** A pie chart showing the proportional distribution of telnet, rlogin and rsh login success. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of values in this category. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of telnet, rsh and rlogin source. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of telnet, rlogin and rsh destination. Useful for identifying top values and spotting outliers.

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

The TFTP dashboard covers Trivial File Transfer Protocol traffic as captured by Zeek, including file names, transfer directions, block counts, and host pairs. TFTP is commonly used for network device firmware updates and PXE boot, but also frequently abused for unauthorized file transfers due to its lack of authentication. Analysts can detect unexpected TFTP activity, unauthorized firmware or configuration file transfers, and TFTP servers that should not be accessible.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of tftp filename. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of tftp source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of tftp destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of tftp transfer mode. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of tftp operation results. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A pie chart showing the proportional distribution of intel observed in. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of intel indicator source. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of intel source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of intel destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of intel indicator. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of intel mime type. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of intel indicator type. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of intel indicator description. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking intel indicator category by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

The Tunnels dashboard provides visibility into network tunneling activity as detected by Zeek, covering protocols like GRE, IP-in-IP, and application-layer tunnels. It surfaces tunnel types, encapsulated protocols, and the hosts involved in tunneling activity. Analysts can use this to detect covert communication channels, VPN bypass attempts, and unauthorized encapsulation that may be used to hide malicious traffic.

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

**Purpose:** A pie chart showing the proportional distribution of tunnels type. Highlights which categories dominate and surfaces minority categories that may be unusual.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of tunnels destination address. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of tunnels source ip address. Useful for identifying top values and spotting outliers.

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

The WebSocket dashboard covers WebSocket upgrade sessions and message traffic as logged by Zeek, tracking the web hosts, URIs, and connection patterns involved in persistent WebSocket connections. WebSocket connections are used by modern web applications for real-time communication and can also be abused for covert C2 channels. Analysts can use this dashboard to identify unexpected WebSocket usage and flag connections to suspicious or unauthorized endpoints.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of websocket source ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of websocket destination ip. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of websocket client extensions. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of websocket server extensions. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of websocket protocols. Useful for identifying top values and spotting outliers.

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

**Purpose:** A horizontal bar chart ranking websocket user agent name by frequency. Provides a clear visual comparison of relative occurrence across categories.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of websocket uri. Useful for identifying top values and spotting outliers.

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

**Purpose:** A pie chart showing the proportional distribution of x.509 certificate signing algorithm. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Certificate Subject

**Purpose:** A ranked frequency table providing a categorical breakdown of x.509 certificate subject. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of x.509 certificate issuer. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of ssl relevant notices. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### OCSP - Certificate Revocation

**Purpose:** A ranked frequency table providing a categorical breakdown of ocsp certificate revocation. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `event.id`
* `zeek.ocsp.certStatus`
* `zeek.ocsp.nextUpdate`
* `zeek.ocsp.revokereason`
* `zeek.ocsp.revoketime`
* `zeek.ocsp.serialNumber`
* `zeek.ocsp.thisUpdate`


#### X.509 - Is Host Certificate

**Purpose:** A pie chart showing the proportional distribution of x.509 is host certificate. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Is Client Certificate

**Purpose:** A pie chart showing the proportional distribution of x.509 is client certificate. Highlights which categories dominate and surfaces minority categories that may be unusual.

**Fields / Aggregations:**

* timestamp
* `zeek.x509.certificate_issuer.CN`
* `zeek.x509.certificate_sig_alg`
* `zeek.x509.certificate_subject.CN`
* `zeek.x509.certificate_version`
* `zeek.x509.client_cert`
* `zeek.x509.host_cert`


#### X.509 - Certificate Fingerprint

**Purpose:** A ranked frequency table providing a categorical breakdown of x.509 certificate fingerprint. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of log source. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of observed device types. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of observed devices. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of values in this category. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of observed software. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of uninventoried observed hosts. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.device.uninventoried`
* `destination.ip`
* `destination.segment.name`
* `related.site`
* `source.device.uninventoried`
* `source.ip`
* `source.segment.name`


#### Uninventoried Observed Services

**Purpose:** A ranked frequency table providing a categorical breakdown of uninventoried observed services. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of notices source ip addresses. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Destination IP Addresses

**Purpose:** A ranked frequency table providing a categorical breakdown of notices destination ip addresses. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Notice Type

**Purpose:** A ranked frequency table providing a categorical breakdown of notices notice type. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - File MIME Type

**Purpose:** A ranked frequency table providing a categorical breakdown of notices file mime type. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of notices file description. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of notice message details. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of notices notice types by source and destination. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `event.id`
* `rule.category`
* `rule.name`
* `source.ip`
* timestamp
* `zeek.notice.msg`


#### Notices - Destination Country

**Purpose:** A ranked frequency table providing a categorical breakdown of notices destination country. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of notices source country. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of weird source. Useful for identifying top values and spotting outliers.

**Fields / Aggregations:**

* `destination.ip`
* `destination.port`
* `event.id`
* `rule.name`
* `source.ip`
* `source.port`
* timestamp


#### Weird - Destination

**Purpose:** A ranked frequency table providing a categorical breakdown of weird destination. Useful for identifying top values and spotting outliers.

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

**Purpose:** A ranked frequency table providing a categorical breakdown of weird name. Useful for identifying top values and spotting outliers.

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
