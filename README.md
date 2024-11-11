# Project 3_Database Design - Car Rental Firm

## Overview
This project is about designing a database for a car rental company, **Happy-Holidays**, created as part of the Structured Query Language unit CITS1402 at the University of Western Australia. The database is designed to manage core aspects of the rental business, including vehicles, depots, client information, bookings, tariffs, and insurance. This repository includes an Entity-Relationship Diagram (ERD), logical schema model, and SQL code for database creation, population, and querying.

## Project Objectives
The main goals of this project are:
1. **Database Design**: Develop an optimized database structure to manage car rental operations efficiently.
2. **Data Integrity**: Ensure relational integrity and compliance with specifications through foreign key constraints and cascading updates.
3. **SQL Querying and Management**: Demonstrate SQL proficiency by building, populating, and querying the database.

## Project Components
1. **Entity-Relationship Diagram (ERD)**: A manual visual representation of the database structure, illustrating entities, attributes, and relationships.
2. **Logical Database Schema**: A detailed breakdown of the tables, primary keys, foreign keys, and multiplicities constraints.
3. **SQL Code**:
   - **Database Creation**: SQL code to define tables, primary and foreign keys, and establish relationships.
   - **Data Population**: Sample `INSERT` statements to populate the tables with sample data.
   - **Queries**: A variety of SQL queries demonstrating retrieval of data.
   - **Triggers and Views**: SQL triggers to maintain data integrity and views for specific data insights.

## Database Structure
### Key Tables:
1. **Vehicle**: Stores details about each vehicle, including registration, color, make, model, and depot.
2. **Depot**: Contains information on each rental location, including address, phone numbers, and email.
3. **Daily Tariff**: Manages rental tariffs, detailing conditions and daily rates.
4. **HiredVehicle**: Logs vehicle rentals, client information, and rental conditions.
5. **Client**: Contains both individual and company client details, including contact information.
6. **Insurance**: Records insurance options available for rentals.

## Tools Used
- **SQL (SQLite Studio)**: Used for all database creation, manipulation, and querying.
- **draw.io**: For designing the ERD diagram online.

## Files
- **`Case Study CITS1402.pdf`**: Document outlining the project requirements and specifications for designing a relational database for the "Happy-Holidays" car rental firm, detailing the entities, attributes, and relationships needed for the database.
- **`Database Design_Car Rental Firm.sql`**: SQL script containing commands to create, populate, and manage the database for the car rental firm.
- **`ERD project.pdf`**: The hand-drawn diagram illustrating the database structure for the car rental firm, including entities, relationships, and cardinalities, providing a visual representation of the system’s data architecture.
- **`logical representation - CITS1402.pdf`**: A detailed logical model of the database, including table structures, primary and foreign keys, and constraints, outlining how each table is structured and related to support data integrity and functionality.

## Learning Outcomes
This project demonstrates:
- Proficiency in SQL database design, normalization, and querying.
- Understanding of relational database integrity through foreign key constraints and cascading updates.
- Application of theoretical database concepts in a practical, real-world scenario.

## License
This project is original work created for educational purposes. It is licensed under the MIT License, which permits use, distribution, and modification of this code, provided proper attribution is given to the original author (Jaylen Dang).


