# FDW - Foreign Data Wrapper

Foreign-data wrappers are objects used to consume data from different data sources not necessarily another PostgreSQL database system.

1. Add `postgres_fdw` extension

![Adding Extension](./img/fwd/fwd_extension.png)

2. Create two function
    1. Handler with name `postgres_fdw_handler`
    2. Validator with name `postgres_fdw_validator`
    ![Handler](./img/fwd/fwd_func_handler.png)
    ![Validator](./img/fwd/fwd_func_validator.png)

3. Create FDW (Foreign  Data Wrapper), with the above created `handler` and `validator`.


    ![FWD](./img/fwd/fwd.png)


4. Create `Foreign Server` with the following options
    1. dbname
    2. host

    ![Foreign Server](./img/fwd/fwd_server.png)


