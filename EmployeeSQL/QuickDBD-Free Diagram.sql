-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/VNeY8v
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [titles] (
    [title_id] VARCHAR  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

CREATE TABLE [employees] (
    [emp_no] INT  NOT NULL ,
    [emp_title_id] VARCHAR  NOT NULL ,
    [birth_date] VARCHAR  NOT NULL ,
    [first_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    [sex] VARCHAR  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [departments] (
    [dept_no] INT  NOT NULL ,
    [dept_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emps] (
    [dept_no] INT  NOT NULL ,
    [emp_no] INT  NOT NULL 
)

CREATE TABLE [dept_managers] (
    [dept_no] VARCHAR  NOT NULL ,
    [emp_no] INT  NOT NULL 
)

CREATE TABLE [salaries] (
    [emp_no] INT  NOT NULL ,
    [salary] INT  NOT NULL 
)

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [titles] ([title_id])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_title_id]

ALTER TABLE [dept_emps] WITH CHECK ADD CONSTRAINT [FK_dept_emps_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_emps] CHECK CONSTRAINT [FK_dept_emps_dept_no]

ALTER TABLE [dept_emps] WITH CHECK ADD CONSTRAINT [FK_dept_emps_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emps] CHECK CONSTRAINT [FK_dept_emps_emp_no]

ALTER TABLE [dept_managers] WITH CHECK ADD CONSTRAINT [FK_dept_managers_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_managers] CHECK CONSTRAINT [FK_dept_managers_dept_no]

ALTER TABLE [dept_managers] WITH CHECK ADD CONSTRAINT [FK_dept_managers_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_managers] CHECK CONSTRAINT [FK_dept_managers_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

COMMIT TRANSACTION QUICKDBD