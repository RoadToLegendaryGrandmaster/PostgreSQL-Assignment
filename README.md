# Explain the Primary Key and Foreign Key concepts in PostgreSQL ?

### Primary key:

In a database, all the row in a table are uniquely idenfified by primary key. Suppose, in a classroom there are 30 students, all students have their identity number, and we can uniquely identify by their id number. In a database table, primary key works same as identity for each row. There are some contidions for make a column a primary key: - Key should be unique - Primary key field cant be empty or null

### Foreign Key:

In a database, there is another key that can identify the row that is used alongside with primary key. Many table are in a database are linked togather by foregin key. By sql queries we can combine multiple table togather with foregin key. There are some comditions for make a column a foregin key: - Foregin key should be primary key in other table. - Foregin key can ne null - There are some condition/behaivour for deleting the row from primary table, and it will effect the secondary table that are linked togather with foregin key. In primary table, the foregin key is primary key of other table.

Example of a table:

## Student Table

student_id | name | degree | enroll_year | course_id
1001 | abc | bsc | 2019 | 502
1002 | asds | bsc | 2013 | 632
1003 | ads | bsc | 2019 | 783

Here, student_id is primary key, and course_id is foregin key

## Course Table

course_id | course_name | credit
502 | PHY | 3.0
632 | CHE | 3.0
783 | BIO | 3.0
2004 | CSE | 4.0

Here, course_id is primary key, and there is no foregin key.
