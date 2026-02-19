# Scenario : College Club Membership Management
<p align="left">
  <img src="https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white" />
</p>

### Problem Overview : 

This project demonstrates the process of database normalization for a College club membership management system. This project aim is to make unnormalized dataset into normalized dataset inorder to remove redudancy, prevent anomalies, and improve data integrity.

### This project includes:
- Process of normalization(1NF --> 2NF --> 3NF)
- ER diagram
- SQL table creation , insertion , update, join,  queries
- Critical evaluation of normalization impact
--- 
### Basic Things to Know :- 
- Primary Key : It is a column or set of columns that uniquely identifies each record in a table and must have unique values.
- Foreign Key : It is a column or set of columns that refers to the primary key of another table and can have duplicate values.
- Composite Key : It is a primary key made up of two or more columns used together to uniquely identify a record and mostly used in many-to-many relationships.
- Insertion Anomaly : An insertion anomaly occurs when a new record cannot be inserted into a table without adding unnecessary or unrelated data.
- Update Anomaly : An Update Anomaly occurs when the same data is stored in multiple rows, and updating it in one place requires updating it in all other places.
- Deletion Anomaly : A Deletion Anomaly occurs when deleting a record unintentionally removes additional important information from the database.
- ER diagram : It is a visual representation of how data is organized in a database that mainly shows **entities, relationships and attributes**
---
 ### Issues in the given dataset :

![Unnormalized Dataset](https://github.com/dahalaashish/Foundation-of-Computer-Science/blob/main/Task3/diagrams/unnormalized_data.png)

  *Figure1 : Unnormalized Dataset*

The initial dataset contained:

- Repeating groups
- Redundant data
- Update anomalies
- Insert anomalies
- Deletion anomalies

  These issues negatively affect data consistency and scalability.
---
## Normalization Process
### Types
**First Normal Form(1NF)**
- Each column contains atomic (single) values.
- No repeating groups or multiple values in one cell.
- Each record is unique.

**Second Normal Form(2NF)**
- Must be in 1NF.
- Removed partial dependencies. 
- Ensured non-key attributes depend fully on primary key.

**Third Normal Form(3NF)**
- Must be in 2NF
- Removed transitive dependencies  
- Created separate entities for independent data
---
### ER Diagram
The final database structure consists of the following entities:

- Student(StudentName, StudentID, Email)
- Club(ClubName, ClubRoom)
- Membership(StudentID, ClubName, JoinDate)

Relationships:
- A student can join multiple clubs.
- A club can have multiple students.
- Membership acts as a connection.

![ER DIAGRAM](https://github.com/dahalaashish/Foundation-of-Computer-Science/blob/main/Task3/diagrams/er_diagram.drawio%20(1).png) 
  *Figure 5: ER Diagram*
