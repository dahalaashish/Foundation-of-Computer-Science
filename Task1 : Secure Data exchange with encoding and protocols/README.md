# Introduction:

This task shows the relationship between encoding formats such as Base64, URL encoding and hex with protocols like HTTPS, TLS and SMTP to ensure data is transmitted securely and efficiently.

## 1. Encoding Formats:

## 1.1. Base64
-  Base64 is a binary to text encoding format that converts binary data into ASCII characters. It represents data using 64 printable character(A-Z,a-z,0-9,/).
-  It is used to safely transmit binary data over text based protocols(HTTP,SMTP) ,used in email attachments
#### Strength
- widely supported
- Prevents corruption during transmission

#### Weakness
- Increase data size(~ 33%)
- Easily reversible and provides no encryption or confidentiality

### 1.2. URL Encoding 
- It replaces unsafe characters in URLs with a % followed by a hexadecimal value
- For example; % = %40 and space = %20
- It is used to ensure safe transmission of special characters in HTTP requests, prevents malformed URLs, required for query strings and form submissions.

#### Strengths
- Prevents formatting errors
- essential for REST APIs

#### Weakness
- Doesnot encrypt data
- Can be abused in double encoding attacks

### 1.3. ASCII/UTF-8 Encoding
- ASCII represents text using 7-bit binary numbers. UTF-8 extends ASCII to support global characters.
#### Strength
- Universal compatibility and efficient storage
#### Weakness
- No inherent security

### 1.4 Hex encoding
- It represent binary data using hexadecimal values(0-9,A-F).
- iT is used in hash representation, debugging and network packet analysis

#### Weakness
- purely representational
- no confidentiality

## 2. Protocol Integration

Encoding formats operatie within communciation protocols. They ensure compatability, but security is achieved by only when combined with encryption mechanisms.

### 2.1. HTTP (HyperText Transfer Protocol)
- Users URL encoding in form submissions
- Transmits data in plaintext
- Vulnerable to interception

### 2.2. HTTPS(Hyper Text Transfer Protocol Secure) and TLS (Transport Layer Security)
- HTTPS = HTTP + TLS encryption
- TLS encrypts data during transmission
- Base64 appears in certificate exchange
- Provides confidentiality and integrity

### 2.3. SMTP (Simple Mail Transfer Protcol )
- Uses Base64 encoding for attachments(MIME)
- Ensures safe text based transfer
- Often combined with STARTTLS for encryption

### 2.4. REST APIs & OAuth
- URL encoding used in query parameters
- Base64 used in JWT tokens
- Enables interoperability across systems

## 3. Practical Demonstration (Docker Simulation)
This project includes:

- HTTP form data with url encoding.
- Simulated man in the middle attack(MITM)
- Three container architecture (Client -> Attacker -> Server)

### System Requirements
Before simulating this, first of all check your requirement

#### For windows :
Step 1: Install docker desktop 

```
winget install -e --id Docker.DockerDesktop
```

If winget doesnot work , download manually , opne your browser and paste this

```
https://www.docker.com/products/docker-desktop/
```

Step 2 : Then restart your computer 
- because docker requires restart of the computer after installation

#### For macOS(10.15+)

Step 1 : Install via Homebrew 
If homebrew not installed :

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install Docker Desktop:
```
brew install --cask docker
```

#### For linux(Ubuntu)

Step 1 - Update system
```
sudo apt update
```
Step 2- Install Docker engine
```
sudo apt install docker.io -y
```

Step 3 - Enable and start docker
```
sudo systemctl enable docker
sudo systemctl start docker
```

#### Final Verifcation
For your respective OS , after docker is installed , check this if it is running or not
```
docker --version
```
--- 

Now after this , let us go to the simulation

### 1. Running the HTTP encoding demmo

Step 1: Start the Docker

Step 2: Pull this image

```
docker pull albertd96/real-email-demo:v1
```

Step 3: Now run the docker image
```
docker run -p 5000:5000 albertd96/real-email-demo:v1
```
If the port 5000 is taken , you can use 8080 , 5001

Step 4: Now open your browser and paste this

```
https://localhost:5000
```
> Note : The application is containerized using Docker and published on Docker hub. Allowing reproducible deployment and testing. This ensures that the demonstration can be easily verified by pulling prebuilt images without manual configuration.
