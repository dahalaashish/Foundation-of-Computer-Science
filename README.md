# Overview

### Task1: Encoding Formats and Protocol Integration
This task investigates the relationship between encoding formats such as Base64, URL Encoding, ASCII, UTF-8, and Hex. It also shows how these formats combined with protocols like HTTPS, TLS, and SMTP to ensure data is transmitted securely and efficiently. Rather than treating encoding as a standalone concept, this task examines how encoding and protocols work together as layers in real world communication system.

This task cover following things:

- Encoding formats : A breakdown of Base64, URL encoding, ASCII, UTF-8 and Hex including their strengths, weaknesses, and appropriate use cases.
  
- Protocol Integration : How encoding formats operate inside protocols like HTTPS, TLS, SMTP, REST APIs, and OAuth in real-world scenarios such as email transmission, web authentication, and file transfer.
- Risks & Obfuscation: How attackers exploit encoding to bypass security filters, including a simulated Man-in-the-Middle attack demonstration.
- Practical Demonstrations: Hands-on Docker-based simulations showcasing HTTP form data handling with URL encoding and a basic MITM attack simulation
- Proposed Enhancements: Suggestions for improving encoding efficiency and security, such as compressed encoded payloads and secure decode validation policies.

KEY TECHNOLOGIES: Base64, URL Encoding, ASCII , UTF-8, HTTPS, TLS, SMPTP, REST API , OAuth, Docker

---

### Task2: Classroom Seating Arrangement Problem
This task uses a simple classroom seating scenario to explore main computer science concepts. A teacher must seat students so that friends and students from the same city are never sitting next to each other. This is  a problem that is easy to verify but hard to solve.
The task is broken into three parts: 
- Understanding why this is a P vs NP type problem,
- Exploring a brute force approach and why it breaks down with larger numbers of students, and
- Finally applying a heuristic (smart) approach that trades perfection for speed and practicality.

KEY TECHNOLOGIES: P VS NP , Brute Force, Heuristics, Factorial Complexity, Constraint Satisfaction, Algorithm Design

---

### Task 3: ClubBase Database Normalization and SQL operations

This task takes a poorly structured college club membership table and transforms it into a clean, normalized database. Starting from a single flat table full of redundant and duplicate data, the task walks through the full normalization process and demonstrates proper database design in practice.
The task covers:
- Identifying data problems and anomalies(delete , update and insertion), 
- Normalizing the data through 1NF, 2NF, and 3NF, 
- Designing an ER diagram, writing basic SQL operations, and 
- using JOIN queries to retrieve meaningful data across multiple tables.

KEY CONCEPTS: Database Normalization, 1NF, 2NF , 3NF ER DIAGRAM, Primary and foreign keys, join operations, Data redudancy, Anomalies
