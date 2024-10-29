# FDW - Foreign Data Wrapper

A foreign data wrapper is an extension available in PostgreSQL that allows you to consume data from different data sources not necessarily another PostgreSQL database system. Foreign data wrappers can serve all sorts of purposes:

* Completing a data flow cycle
* Your data may be segregated across databases, but still related in ways that makes being able to combine or aggregate it desirable
* Allows you to control the permissions on the foreign tables
* Improve performance and to check data integrity on microservice architecture

Steps to set up

1. [Set up in Local Server](#set-up-in-local-server)
2. [Set up in Remote server](#set-up-in-remote-server-where-actual-datatable-is-located) (Where actual data/table is located)
3. [Troubleshoot](#troubleshoot)


## Set up in Local Server

1. Add `postgres_fdw` extension

![Adding Extension](./img/fwd/fwd_extension.png)

2. Create two function
    1. Handler with name `postgres_fdw_handler` with
        * Attribute
          * Language - `c`
          * Return method - `simple`
          * Data type - `fwd_handler`
        * Definition
          * Symbol - `$libdir/postgres_fdw`
          * Library - `postgres_fdw_handler`
        * Disable `SQL` code

    2. Validator with name `postgres_fdw_validator`
        * Attribute
          * Language - `c`
          * Return method - `simple`
          * Data type `void`
        * Parameters
          * Create parameter with
            * name - p1
            * type - text[]
          * Create another parameter with
            * name - p2
            * type - oid
        * Definition
          * Symbol - `$libdir/postgres_fdw`
          * Library - `postgres_fdw_validator`
        * Disable `SQL` code

![Handler](./img/fwd/fwd_func_handler.png)
![Validator](./img/fwd/fwd_func_validator.png)

3. Create FDW (Foreign  Data Wrapper), with the above created `handler` and `validator`.

    * name `postgres_fdw`
    * Select the above created `handler` fuction on the Handler & `vallidator` function on Validator dropdown
    * Disable `SQL` code

![FWD](./img/fwd/fwd.png)

4. Create `Foreign Server` with the following options
    1. dbname - `postgres`
    2. host   - `127.0.0.1`
    3. port   - `5432`

!> Please ensure that the `remote database cluster` has the `pg_hba.conf` entry corresponding to the database server for which the foreign server has to be created. [Set up remote server](#set-in-remote-server)

Debug with following SQL

```sql
select * from pg_foreign_server;
```

![Foreign Server](./img/fwd/fwd_server.png)

5. Click on `USER MAPPING` and create new mapping
  
1. Select `server` and enter the user name and password in the options, with `key-value` pair

      ```sql
      user     : fdw_user
      password : thirumal
      ```

Debug with following query

```sql
select * from pg_user_mapping
```

![User Mapping](./img/fwd/user_mapping.png)

6. Create (OR) Import `foreign table`

 `SQL` to import schema

 ```sql
  IMPORT FOREIGN SCHEMA foreign_schema FROM SERVER foreign_server INTO public;
 ```

 Create `schema` with same name, if it's not available and create `foreign table` with `server` from the selection under `New` -> `schema`

 ![Foreign Table](./img/fwd/foreign_table.png)

## Set up in Remote server (Where actual data/table is located)

1. Create `read_only` user (Eg:`fdw_user`) in the `remote server` with enough `privilage` on the `schema/tables`.

2. Check [Role](/pgmodeler/Role.md) page

3. Give permission for foriegn server to access by modifying the configuration file `pg_hba.conf` that is located in `/etc/postgresql/{version}/main`

```bash
# IPv4 local connections:
host    db_name     fdw_user             127.0.0.1/32            scram-sha-256
```

## Troubleshoot

Error:

```SQL
ERROR:  permission denied for table login_user
CONTEXT:  remote SQL command: SELECT login_user_id, login_uuid, date_of_birth, individual, row_created_on FROM public.login_user 
```

Solution:

1. Check the role is added
2. Check the permission for the role is added for the table
