# The Internet

- [] Have a broad understanding of what the internet is and how it works
- [] Understand the characteristics of the physical network, such as latency and bandwidth
- [] Have a basic understanding of how lower level protocols operate
- [] Know what an IP address is and what a port number is
- [] Have an understanding of how DNS works
- [] Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model

# TCP & UDP

- [] Have a clear understanding of the TCP and UDP protocols, their similarities and differences
- [] Have a broad understanding of the three-way handshake and its purpose
- [] Have a broad understanding of flow control and congestion avoidance

# URLs

- [] Be able to identify the components of a URL, including query strings
- [] Be able to construct a valid URL
- [] Have an understanding of what URL encoding is and when it might be used

# HTTP and the Request/Response Cycle

- [] Be able to explain what HTTP requests and responses are, and identify the components of each
- [] Be able to describe the HTTP request/response cycle
- [] Be able to explain what status codes are, and provide examples of different status code types
- [] Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state
- [] Explain the difference between GET and POST, and know when to choose each

# Security

- [] Have an understanding of various security risks that can affect HTTP, and be able to outline measures that can be used to mitigate against these risks
- [] Be aware of the different services that TLS can provide, and have a broad understanding of each of those services

## What is the Internet

- A **network** is two or more devices connected in order to communicate and exchange data
- A _LAN_ (local area network) is two or more devices connected by a hub or a switch and the scope of communications is geographically limited to devices that are connected physicially (wireless in case of WLAN)
- Inter-network Communication is accomplished by adding routers between networks
  - _Routers_ act as gateways in and out of networks and direct data to other networks
- the Internet is the network of networks and all the sub-networks are connected to routers which direct traffic to their correct location

**The Internet is a vast network of networks that includes network infrastructure(devices, routers, switches, cables) and protocols(which enables the infrastucture to function)**

## Protocols

- **Protocols are a set of rule that govern the exchange or transmission of data**
  1. there are different protocols that handle different aspects of network communication
  2. there are different protocols that address the same aspects of communciation but for different use cases

## TCP/IP & OSI model

| Open Systems Interconnection |   Internet Protocol Suite    |
| :--------------------------- | :--------------------------: |
| Application                  |         Application          |
| Presentation                 |         Application          |
| Session                      |         Application          |
| Transport (segment/datagram) | Transport (segment/datagram) |
| Network (packet)             |      Internet (packet)       |
| Data Link (frame)            |         Link (frame)         |
| Physical                     |         Link (frame)         |

- The internet Protocol suite model divides the layers in terms of the scope of communiciation within each layer

  - it divides the layers by whether it is communication within a local area network, between networks,etc.

- OSI divides the layers in terms of function that each layer provides

**Data Encapsulation** is a concept presented by both models in which data from one layer is encapsulated within the data unit of the layer below and it is a means by which protocols from different layers can work together
**Protocol Data Units** is an amount or block of data transferred over a the network

- each layer of has a different name for their PDU and the full PDU of one layer is only the data payload of the layer below (data encapsulation)
- each layer's PDU contains a header with metadata and the data payload and a footer at certain layers
- this encapsulation allows for seperation between layers, a specific protocol at one layer transporting the payload does not care about the protocol of the upper layer

## Physical Layer

- At the most basic level, the physical network (also the first layer in the OSI model) is the hardware which includes wires, routers, devices, and cables that make up all the networked devices
- at this layer, the bits are converted to different signals depending on the medium that the data is being transferred by i.e. electrical, light or radio

The two main characteristics that define the performance of this physical network are :

1. Latency => is the measure of time it takes for some data to get from point A to point B
   car analogy - the time for a car to get from one place to another

2. Bandwith => the amount of data that is able to be sent in a particular unit of time (usually a second)
   car analogy - the amount of lanes on the road that allow for cars to travel along

### Latency

- is a measure of delay, the difference in time from getting from point A to B is the delay, there are actually different types of delay that determine the overall latency of a network connection
  - **propagation delay** => this is the amount of time for a message to be able to physical get from point A to point B and increases with distance between the points and speed at which the data can travel
  - **transmission delay** => this is the delay causes when data needs to be pushed between different links in the network i.e switches, routers and other networked devices (the number of hops)
  - **processing delay** is the delay caused by the routers/switches/hubs processing the data and forwarding it to the next hop to it's destination
  - **queuing delay** is caused by data buffering or waiting at a router to be processed and routed to the next hop. It is worst when traffic is heavily congested and packets need to queue for processing.
- the total latency between two points is the sum of all the delays usually expressed in milliseconds(ms)

- **Last-mile Latency** => many delays that occur happen at the edge of the network because that is where data is changing between different routers most frequently. i.e from your ISP router to your home modem and then your wireless router. This network edge experiences higher latency as well because the infrastructure is usually less efficient than other parts of the network connection

  - as an analogy, you can travel faster on the highway where there are more lanes and the roads are repaired to reduce bumps vs your home street which could have potholes and a single lane

- **Round-trip Time(RTT)** is the way latency calcuation is usually expressed in networking. It is the length of time for sigianl to be sent and for an acknowledgement or response to be received.

### Bandwidth

- bandwidth capacity can range depending on the different parts of the netwwork
- the lowest bandwidth for data travelling from point A to point B will represent the bandwidth bottleneck and the overall bandwidth for the data's journey
- increasing bandwidth will not always lead to lower latency as different types of delays set the lowest point latency can reach

## Link/Data Link Layer

- This layer is the connection between the physical network and protocol/logical layers above
- the important thing when devices are connected is identifying the device in which we want to send data, the protocols at this layer are concerned with identifying devices on the physical network and moving the data between these devices
- ethernet protocol is most commonly used at this layer which uses ethernet cables to connect computers, switches and routers and deals with **framing** and **addressing**

### Ethernet Frames

- Ethernet Frames are a Protocol Data Unit and it encapsulates data from the Internet/Network layer above
- the link layer is the lowest layer at which encapsulation takes places
- each frame is structured with metadata for transporting the frame as well the as teh data payload for the frame

  - Preamble and Start Frame Delimiter => preamble 7 bytes and SFD 1 byte to synchronize and notify receiving device the start of data
  - Source and Destination MAC address => 6 bytes each representing which device the data came from and the device the data is going to
  - Length => 2 bytes represent the lenght of the data payload
  - DSAP, SSAP, Control => 1 byte each, DSAP and SSAP representing network protocol use for data payload and control provides information on communication mode for the frame
  - Data Payload => between 42 to 1497 bytes (contains entire PDU of layer above i.e. IP packet)
  - Frame Check Sequence -> 4 byte checksum to check for integrity of the data at arrival. generated by sending device with algo, receiving device will perform the same algo and compare the checksum. if not matching than the frame is dropped

- Interframe Gap => brief pause between transmission of each frame and varies depending on the capability of the ethernet connection

### MAC address

- every network enabled device has an network interface card (NIC) which is assigned a unique **MAC (media access control) address** sometimes called the physical address or burned-in address
- this address is included in the ethernet frame to direct traffic from sending device to the correct receiving device
- it is the job of a hub or switch to keep a record of every MAC address on its network and to send it data to the correct host/computer

- this alone is unable to create a large scale network due to the limitation of MAC addressing system
  1. they are physical addresses tied to a device
  - this is a problem because people can move around and the switch would need to keep an up to date table on the location of each MAC address
  2. flat structure rather than hierarchical meaning that there is no structure to the MAC address that can allow it to be broken down into sub-divisions
  - without subdivision, there would be way too many MAC addresses to keep track of

## Internet/Network Layer

- Internet Protocol is the predominant protocol used for inter-network communcations with two versions IPv4 an IPv6
  - routing capability via IP Address
  - encapsulation of data into packets

### Data Packets

- the PDU of the Internet Protocol is referred to as a **packet** which is comprised of a header and data payload
  - the data payload of this layer contains the full PDU of the layer above(transport layer) which could be a TCP segment or UDP datagram as an example

Headers

- Version => IPv4 / IPv6
- ID, Flags, Fragment Offset => fragment transport layer PDU if too big for single packet
- TTL => Time to Live (maximum hops before a packet is dropped), decrements by 1 each hop
- Protocol => Protocol of the tranport layer e.g. TCP, UDP
- checksum => error checking value (is not included in IPv6)
- Source Address : originating IP address
- Destination address : fiinal IP address

### IP Address

- ip addresses are logical in nature, they are not tied to a specific device and get assigned when the device joins a network
- ip address will fall within a range of address available to the local network
- the range is defined by a network hierachy where the network is split into subnetworks
- IPv4 divided into 4 section of 8 bits each
- when a router routes traffic, it only needs to find the router that controls the network address and that segment of the network
  - the splitting of the network into sections is called subnetworking

IPv6 is upgrade from IPv4 to allow for more IP addresses

- it has 8 sections, with each section having 4 hexidecimal numbers - each digit can be represented by 4 bits (16 bits each section)
- IPv6 header structure is different from IPv4 and it does not include a checksum (leaves it to the link layer checksum)

## Transport Layer

### Multiplexing and Demultiplexing

- at the network/internet layer, we were able to get data from one computer to another computer, however this does not provide any differentiation betweeen multiple applications and processes running on your computer
- **multiplexing** refers to that ability to transmit multiple signals from different processes through a single channel. for example, all the data from each of your different applications is sent out to the same host/computer
- **demultiplexing** is the reverse in which you take all the data that comes off the single channel and seperate them to the application or program that requires that data
- multiplexing and demultiplexing is a general concept that can be applied to different layers for example in the physical layer, we have a single channel which is a fibre optics cable which different signals (light refracted at different angles) being passed through the single channel -> that would be multiplexing at the physical layer
- At the transport layer, the concept of multiplexing and demultiplexing is applied to ports

_multiplexing and demultiplexing allow transmission of multiple siganls through a single channel_

### Ports

- it is an identifier for a specific process running on the host and they range from 0-65535

* 0-1023, well known ports that are assigned to commonly used network services i.e HTTP 80, FTP 20 & 21, SMTP 25, etc
* 1024-49151 registered port assigned to private entities, can be used as ephemeral port on client side
* 49152-65535 dynamic ports, not assigned (ephemeral ports used for customized services)

- source and destination ports are included in the transport layer PDU
- therefore with the Ip address and port, it is considered end to end communication and referred to as a socket

### Sockets

- Conceptually level, an abstraction for an endpoint used for inter-process communication

- different types of sockets in practice

  - UNIX socket for communication between local processes on the same machine
  - Internet socket (such as TCP/IP socket is a mechanism for inter-process communication between networked processes)

- so for this course, conceptual level where it is communication end-point defined by address-port pair

### Sockets and Connections

- sockets allows you to create a connection between two machines that allow you to provide them with you undivided attention
- you create an instance of the socket that is dedicated for the incoming data for a specific process
- this is in contrast with a connectionless network where, there is one channel that handles the different incoming requests and responds through this one channel
- in a connection-oriented approach, the instantiation of each socket object is uniquely defined by the ip address and port of both the sender adn the receiver, so that the channel is dedicated for a specific client

### Network Reliability

- the lower layer protocols and physical hardware is unreliable and we need to create a reliable communication channel in which we can ensure that data reaches its destination

  - _In order delivery_: data is received in the order that it was sent
  - Error detection: corrupt data is identified using a checksum _data-integrity_
  - Handling data loss: missing data is retransmitted based on acknowledgements and timeouts _retransmission of lost data_
  - Handling duplication: duplicate data is eliminated through the use of sequence numbers _de-duplication_

  **pipelining** is the process of sending multiple messages at the same time to utilize maximum bandwidth and reduce the wait time between message and acknowledgement to complete all transmissions

### TCP

TCP allows for the abstraction of reliable network communication on top of an unreliable channel

- it hides the complexity of creating a reliable network from the application layer
- it's reliability makes it the protocol of choice for many applications
- however the downside is the performance challenges created by this complexity
- On top of providing reliability, TCP alos provide data encapsulation and multiplexing using TCP segments

### TCP Segments

- segments are the PDUs of TCP
  - it also contains the header and data payload

Headers

- Checksum
- Sequence Number
- Acknowledgement Number
- Window Size
- Flags, URG, PSH, SYN, ACK, FIN, RST

### TCP CONNECTIONS - 3 WAY HANDSHAKE

- TCP is a connection-oriented protocol that establishes a connection with the use of the 3 way handshake

1. the client send a SYN message (SYN flag set to 1)
2. server sends a SYN ACK message (SYN and ACK flag set to 1)
3. client sends an ACK message (ACK set to 1)

as soon as client sends the ACK message, it can begin to send data to the server, the server will need to receive the final ACK before it can begin to send data

TCP requires a lot of overload in other to establish connections and therefore the cost of the reliability is the overall performance. TCP provides mechanisms to facilitate efficient data transfer through flow control and congestion avoidance

### Flow Control

- When a receiver has data to process that is beyond its capacity, it will need to buffer to wait for it to be processed. This can create a backlog, and so the receiver will include a Window size in the TCP header that can dynamic changed to limit the amount of data transferred when the receiver is has too much data to process

### Congestion Avoidance

- when the network itself is congested the data is lost in transit
  - excess frames are dropped by a router if there is heavy congestion
- this dropped packets will need to be retransmitted because an acknowledgement is never received
  - an algorithms uses the amount of data loss as a feedback mechanism to detect and avoid further congestion by reducing size of transmission window

### Disadvantage of TCP

- high overhead latency to establish TCP connection
- potential head of line blocking where one message being delivered/processed blocks other message from being transmitted due to in-order delivery of segments

### User Datagram Protocol (UDP)

- UDP's PDU is called a datagram and it does not provide the same reliability as TCP, Its headers include source port, destination port, length and checksum
- it has the same ability to provide multiplexing like TCP
  but it does not provide guarantee of delivery
  does not guarantee message order
  there is no built in congestion avoidance or flow control
- it is a connectionless protocol

- UDP does not create all this overhead of reliability but it allows it to be a base template for UDP based applications to add personalized features to the protocol for different use cases
- UDP provides freedom, but it should implement some congestion avoidance in order to avoid overwhelming the network
- Although it is unreliable, the advantage of UDP is speed and flexibility.

## Application Layer

- application layer is not the application itself but the protocols that provide communication services to applications

- easier to think of application layer protocols as reule on how applications talk to each other syntactically

- actual applications work mainly with protocols in this layer and can also be with the transport layer (such as opening a TCP connection) but rarely working directly with anything below the transport layer

### HTTP and the Web

- Internet is a network of networks
- World wide Web is a service that is accessed via the internet

- HTML (_Hypertext Markup Language_) => used to structure text documents to include headers, paragraphs, lists etc
- Uniform Resource Identifier(URI) is a string of character which identifies a particular resource
  -> a URL is a type of URL which provide the exact path to the resource
- HTTP (Hypertext Transfer Protocol) set of rules providing uniformity on the way we can access resources between applications (also referred to as request-reponse protocol)

### DNS - Domain Name System

- a mapping of a URL to it's IP address handled by the Domain Name System
- it is a distributed database called DNS servers which stores the mapping of URL to IP
- no single server contains the complete database, it is a large worldwide network that is organized hierarchially, if ONE dns server does not contain the request domain anme, the server will route the request to the another server up the hierarchy

### Typical Interaction with Internet

1. enter in URL such as http://www.google.com
2. browser create an HTTP request which is packaged and sent to the devices Network Interface
3. If device already has IP address for the domain name cached, it will use the cached IP address, otherwise it will send a DNS request to obtain the IP address
4. when the IP address is resolved the HTTP request will be packaged up and sent to the IP address
5. the remove server accepts the request and sends a response to your network interface and hands the data to your browser

Browser is typical referred to as the Client
The server is a computer that sends responses in the from of resources

**Resource** is generic term for thing you interact with on the internet, it could include images, video, web pages and other files

**Stateless** => HTTP is stateless protocol because each request/response pair is completely independent of any previous or future request/response

### What is a URL?

- Uniform Resource Locator (URL) is an address that specifics the exact location of resouces and can be broken down into 5 components

* the Scheme => tells the client how to access the resource (tells the client which protocol to use for accessing a resource)
* the host => tells the client where the resource is hosted (domain name that will be resolved to an ip address)
* the port => the port number, this allows for application specificity to allow for a socket connection (when it isnt specified, the default port is used)
* the path => this indicate which resource is being requested from the host
* the query string => a string that is made up of query parameters and is used to send data to the server (this is optional)

  - commences with a `?`
  - key value pairs seperated by a `=`
  - each key value pair is seperated by a `&`

  URL Encoding

  - url only accept certain characters in standard 128 character ASCII set
  - reserved or unsafe characters as well as characters not part of ASCII set need to be encoded

### Making HTTP Requests

- to make a request you need to include the Method (GET, POST, PUT, PATCH DELETE)
- include the path of the resource

**Request Headers** can be added when sending a request

- they give more information about the client and the resource being fetched
  **Request Body** is usually included with POST requests to push some data to the back end

### Responses

- raw data returned by server is called a response

first component is HTTP Status Code, three digit number that server sends back
200 => OK
302 => Redirect
404 => Not found
500 => Server Error

second component is headers

finally is the body of the request, usually with requested resource

## Stateful App

### Sessions

- unique token that is passed back and forth ==> _session identifer_
- every request must be inspected to see if there is a session identifier and that it is still valid

### Cookies

- _Cookie_ is a piece of data sent from server that is stored in the client during request/response,
- usually sent by server in response header is _set-cookie_ with a unique identifier

### AJAX

- Async JavaScript and XML => request that allows browswer to issue request and process responses without a full page refresh

### Security

secure http to protect from packet sniffing

cryptographic protocol named TLS (Transport Layer Security)

#### Same origin policy

- important concept that permits unrestricted interaction between resources originating from the same origin but restricts certain interatctions between resources from different origins

- _origin_ means the same scheme, hostname and port
- it does not restruct all cross-origin request (linking, redirects and form submission is typcially allowed)

- what is typcially restricted is cross-origin request where resources are being accessed programmatically using APIs such as XHR or fetch
  - to get around this for web developers who have legitimate need for making restricted kinds of cross-origin request, Cross-origin resource sharing(CORS) was developed and needs to be added as HTTP header

### Session Hijacking

- hacker steals your session identifier and pretends to be you

ways to combat

1.  expiring time limit on each session id
2.  each time a request is made the session id is reset
3.  using HTTPS to created encrypted sessions

### Cross-Site Scripting(XSS)

- injecting Javascript and HTML to input fields
  solutions

1.  sanitize user inputs by eliminating script tags and disallowing any html or javascript
2.  escaping all characters so that they are not read as code

## More HTTP

### Servers

- web server => static files, images, css, js etc
  does not require data processing
- application server => where business logic resides
  -> usually consults a data store(database) to retrieve or create data

Scheme => a specification for assigning identifiers within that schedule
-> it identifies which protocol should be used

### URLS and FilePaths

- path used to be where teh file was actually located on the server
- modern day urls, the path is just a way for you to access that resource and does not actually indicate that the resource is actually located there
- server logic will find the data and serve it to you

### HTTP VERSION LANGUAGE

- Above http 0.9 you need to include the version in the requeset
  `GET / HTTP/1.1`
- Also http 1.0 onwards, headers were included to add more information
- http 1.1 requires a header that includes the Host

## TLS (transport layer security)

Three main security services provided

- Encryption => encoding messages so that that can be decode the message can read
- Authentication => a process to verify the identity of a particular party in the message exchange
- Integrity => a process to detect whether a message has been interfered with or faked

### symmetric key encrpytion

- using the same key to encrypt and decrpyt a message

### asymmetric key encyption

- using public and private keys

- encrypting with a private key and decrypting with a public key (a way to verify identity)

- someone encrypting information with your public key and you decrypting with your private key (this means only the person the message was intended for can access the message)

### TLS HANDSHAKE

#### Encryption

- uses both asymmetric and symmetric cryptography
- asymmetric cyptography to exchange symmetric key for all future encrpytions
  -> hence the tls handshake

1. begins with `ClientHello` message that is sent immediately after `ACK` from TCP handshake

- contains tls version the client supports
- contains cipher suite that client supports

2. `ServerHello` includes the tls version to use, and the cipher suite

- also includes its public certificate with its public key
- finally it includes `ServerHelloDone`

3. Once client receives the `ServerHelloDone` it intiates the key exchange process this could be done using different algorithm that was selected as part of cipher suite.
4. after `clientKeyExchange` client also sends `ChangeCipherSpec` and includes `Finished` flag

- tells teh server that communication will now be encrypted using symmetric keys
- finished flat to say tls handshake complete

5. Server also sends `ChangeCipherSpec` and `Finished` flags and becomes communication using symmetric key encryption

#### TLS Authentication

- server send a certificate which includes public key
- the server create a signature which is an hash of some data and then encrpyts it with their private key
- the client that receives the message decrypts the message and does the same hash to confirm that the hash matches
- if the two versions match then the message could only have come from the person that was in possesion of the private key

- however this does not verify the secure connection is with a trustworthy site/person
- this is solved by using certificate authorities which is a trustworthy source that will provide a signature on the certificate of the person you want to interact using their private key and you can verify that this certificate authority is who they say they are by using their public key to check the certificate.
  - this goes all the way up to the root certificate authorities which are self signed certificates and the end point to the chain of trust
  - root CAs are a list of authorities that are stored on the browser

#### TLS Integrity

PDU of TLS includes **Message Authentication Code** is used to check if the message has been altered or tampered in transit

1. creates a digest of the data payload (hash the data)
2. encrpyt the data payload using symmetric key and send it
3. receiver will decrpyt with symmetric key and also create digest of the payload to confirm that integrity of the message
