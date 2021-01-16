# IBM-Employee-Attrition-Data-Analysis
Design a relational database to analyze IBM's employees' data to determine the factors that make an employee leave. Using this information solutions will be suggested to reduce the employee attrition rate. Oracle Data Modeler and Oracle SQL Developer will be used for this project.

The Dataset is from Kaggle:

###### https://www.kaggle.com/pavansubhasht/ibm-hr-analytics-attrition-dataset

# Problem Statement

IBM is suffering from employees’ attritions for multiple reasons, including the distance from home and the average monthly income, costing them their skilled workers.

# Solutions

1. Using the IBM employee database, the primary or most frequent factor leading to employee attrition is going to be found after analyzing the data in the database 
2. Using the IBM employee database, the least important or the least frequent factor 
leading to employee attrition is going to be found after analyzing the data in the 
database 
3. Finally, the list of factors is going to be prioritized in terms of which cause the most 
to attrition to the ones which cause the least attrition. 

# Data Dictionary 

![alt text](https://github.com/Rabih-Tahouf/IBM-Employee-Attrition-Data-Analysis/blob/main/images/Data%20Dictionary.jpg)

# Data Model

The Data model after the normalization process was done using Oracle SQL Modeler:

![alt text](https://github.com/Rabih-Tahouf/IBM-Employee-Attrition-Data-Analysis/blob/main/images/Data%20Model.jpg)

# Database Schema

The Database schema in Oracle SQL Developer:

![alt text](https://github.com/Rabih-Tahouf/IBM-Employee-Attrition-Data-Analysis/blob/main/images/Database%20Schema.jpg)

# Insert Data

A sample screenshot of an insert statement into the history table:

![alt text](https://github.com/Rabih-Tahouf/IBM-Employee-Attrition-Data-Analysis/blob/main/images/Inserting%20Data.jpg)


# Data Analysis and Visualization

Data analysis was done on the data using SQL. Then visualizations were done on the queried data. A sample is shown below:

![alt text](https://github.com/Rabih-Tahouf/IBM-Employee-Attrition-Data-Analysis/blob/main/images/Sample%20data%20visualization.jpg)

From the visualization we can observe that The percentage of attrition is highest amongst sales representatives and lowest amongst managers, manufacturing directors, and healthcare representatives.

Problem: 40% of Sales representatives leave thier job.
Potential Solution: Incentivize sales representatives to stay with better work-life balance, and better pay. 

The other visualizations and solutions can be viewed in the report uploaded to this repository. 
