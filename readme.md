# TOPIC:  IMPLEMENTING A CLIENT SERVER ARCHITECTURE USING MYSQL DATABASE MANAGEMENT SYSTEM (DBMS).

## Objective: To Establish connectivity to a SQL server and Client instance 

# Project Flow

I created two EC2 instances named **mysql_server and mysql_client**

on both instance, the command below  was ran to update the repo

    sudo apt update

The command below was ran to install mysql server agent

    sudo apt-get install mysql-server

After successfull installation, the sql service was started with the command below

     sudo systemctl start mysql

>**output**![sqlactive](images/sql_active.png)

On the sql client instance, the command below was used to install mysql client 

     sudo apt-get install mysql-client

To confirm if the mysql-client was succesfully installed, the command below was used

      mysql --version

>**output**![output](images/sqlconfirm.png) 

To enable connectivity to the sql-client, a new inbound rule was set on the mysql server. 

- Type of inbound rule - mysql/Aurora 
- The source IP was sent to the Ip of the client Ip with was obtained by ip addr on the client instance 

**output**![inbound_rule](images/Inbound%20rule-%20server.png)

Next step was to allow the mysql-server instance to allow connection from the remote instance(client instance)

This was done by changing the bind address on the mysqld.cnf to 0.0.0.0

The command below was used 

     sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf

**output** ![bindaddr](images/changebindaddr.png)

The next step is to create a datebase that will later be access via the client instance. 

For this step, the following steps were used

- Create a user on the sql server
- Create a table 
- Grant the created user in step 1 access to the created database

To create, the command below was used to change the instance to sql mode
       
       sudo mysql

>**output**![sql_console](images/Sql_console.png)
  
To create a user, the command below was ran

    CREATE USER 'wenger'@'%' IDENTIFIED BY 'password';

To confirm if the mysql user has been created, the command below was used

    SELECT user FROM mysql.user;
>>**output***
![createduser](images/createduser.png)    

To create a datebase, the command below was used

    CREATE DATABASE BUKAYO_SAKA
>**output**
![show_db](images/show_db.png)    

To confirm if the created datebase was successfull. Run the command below

    SHOW DATABASES;

To grant access to the created user, the command below was ran

    GRANT ALL ON BUKAYO_SAKA.* TO 'wenger'@'%' WITH GRANT OPTION;

On the client server, the command below ran to connect the mysql server to mysql client

        mysql -u hostname -h username -p     

where hostname is the mysql server instance and username is the eample_user
 >>**output**
 ![login_con](images/login_conf.png)

 upon login, we can access the databases created on the mysql server with the SHOW DATABASES; command
 >**output**
 ![show_db](images/DB_CONF.png)

 **END**









        

