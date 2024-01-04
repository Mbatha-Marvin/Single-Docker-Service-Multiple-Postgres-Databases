# Single Postgres Docker Compose Service Multiple Databases and Users.



# Description

---

This is a simple docker compose that creates more than one user and database in a single postgres docker compose service. 

This compose file is ideal for development of micro services which have individual databases.

***NOTE*** : This is intended for development environments.



## Installation

---

1. Clone the repository
   
   ```bash
   git clone 
   ```

2. Rename the example.env file to .env and edit the POSTGRES_MULTIPLE_DATABASES environment variable to add your Users and Databases. The database entries are space separated for example
   
   ```textile
   POSTGRES_MULTIPLE_DATABASES='user_1:database_name_1:database_password_1 user_2:database_name_2:database_password_2 user_3:database_name_3:database_password_3'
   ```

3. Run the compose file:
   
   ```bash
   docker-compose up -d
   ```
