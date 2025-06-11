# What is PostgreSQL?
PostgresSQL is a relational database management system. Where user can store data, modify the data, retrive the data, and can put data according to specific some order and rules. PostgresSQL uses for relation between tables. In a table all the cells are in columns and rows. Each column and row are identify by some data type and data with same type. To use this database we need some kind of special declarative way known as SQL. 

Example of some SQL:

```sql
select * from universe
where planet = 'Earth';
```



# Explain the Primary Key and Foreign Key concepts in PostgreSQL ?

### Primary key:

In a database, all the row in a table are uniquely idenfified by primary key. Suppose, in a classroom there are 30 students, all students have their identity number, and we can uniquely identify by their id number. In a database table, primary key works same as identity for each row. There are some contidions for make a column a primary key: - Key should be unique - Primary key field cant be empty or null

### Foreign Key:

In a database, there is another key that can identify the row that is used alongside with primary key. Many table are in a database are linked togather by foregin key. By sql queries we can combine multiple table togather with foregin key. There are some comditions for make a column a foregin key: - Foregin key should be primary key in other table. - Foregin key can ne null - There are some condition/behaivour for deleting the row from primary table, and it will effect the secondary table that are linked togather with foregin key. In primary table, the foregin key is primary key of other table.

Example of a table:

## Student Table

| student_id | name | degree | enroll_year | course_id |
| ---------- | ---- | ------ | ----------- | --------- |
| 1001       | abc  | bsc    | 2019        | 502       |
| 1002       | asds | bsc    | 2013        | 632       |
| 1003       | ads  | bsc    | 2019        | 783       |

Here, student_id is primary key, and course_id is foregin key

## Course Table

| course_id | course_name | credit |
| --------- | ----------- | ------ |
| 502       | PHY         | 3.0    |
| 32        | CHE         | 3.0    |
| 783       | BIO         | 3.0    |
| 2004      | CSE         | 4.0    |

Here, course_id is primary key, and there is no foregin key.

# What is the difference between the VARCHAR and CHAR data types?

In sql varchar type can store more than one character or string. varchar is generally used for long string. But if we need just sigle characher or small character that we can use char type in sql. char is fixed length.

Example:

If we want to store a person name, "Ali ahmad" then we can use Varchar data type for storing, in var char we can use space.
If we want to use small character witout space we can use char to that.

To store address we can use varchar,
To store symbole or short name we can use

```sql
create table product (
    prod_id id primary key,
    prod_name varchar(100),
    prod_des varchar(300),
    prod_tag char(5)
)
```

# Explain the purpose of the WHERE clause in a SELECT statement.

By using select statement we can select a table, and get all the data from the table. But if we want to add some conditions base retrival, then we can use where clause.

Where clause accept conditions that will apply when using select statement.

Example:

```sql
SELECT product_name, price FROM product
WHERE priduct_name LIKE %laptop%;
```

This example will show only based on conditions that have laptop key word in it. But we can do many more condition using where clause.

# What are the LIMIT and OFFSET clauses used for?

```sql
select * from person
where gender = 'f'
limit 10
```
This example will show, 10 person data where gender is female. By using limit, we can set a range of data limitation.

```sql
select * from person
where gender = 'f'
offset 5
```
This example will show, all person accept first 5 person data, where gender is female. By using offset we can skip the beginning data.

We can also use limit and offset togather.

```sql
select * from person
where gender = 'f'
offset 10
limit 20
```
This example will show 20 data of person, skipping 10 perfon from beginning where gender is female. so output will be from, start 11 to 32 finish



