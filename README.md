# DE_Assignment
## Problem 2
<p>Please write a "text sanitizer" application in any OOP languages (Python 3 preferred)<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;-receive CLI arguments "source" & "target"<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;-read a text file from "source" as an input data<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;-sanitize the input text (receive string and return string)<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-lowercase the input<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-replace "tab" with "____"<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;-generate simple statistic<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-count number of occurrence of each alphabet.<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;print output(both sanitized text & statistic) to console<br>

## Problem 3
<p>Please write SQL to extract the product names and product classes for the top 2 sales for each product class in our product universe, ordered by class and 
then by sales. If there are any tie breakers, use the lower quantity to break the tie.<br>
<p><br>
<p><strong>Sales Transaction</strong><br>

| transaction_id | product_id | quantity |
|----------------|------------|----------|
| 1              | 1          | 5        |
| 1              | 2          | 7        |
| 2              | 3          | 1        |
| 3              | 2          | 3        |
| ..             | ..         | ..       |

<p><strong>Product</strong><br>

| product_id | product_name | retail_price | product_class_id |
|------------|--------------|--------------|------------------|
| 1          | aa           | 10           | 1                |
| 2          | bb           | 20           | 1                |
| 3          | cc           | 30           | 2                |
| ..         | ..           | ..           | .                |

<p><strong>Product Class</strong><br>

| product_class_id product_class_name | product_name |
|-------------------------------------|--------------|
| 1 Class A                           | aa           |
| 2 Class B                           | bb           |
| 3 Class C                           | cc           |
| .. ..                               | ..           |

<p><strong>Expected Output</strong><br>

| product_class_name | rank | product_name | sales_value |
|--------------------|------|--------------|-------------|
| Class A            | 1    | aa           | 12345       |
| Class A            | 2    | bb           | 9999        |
| Class B            | 1    | cc           | 2500        |
| Class B            | 2    | dd           | 2500        |
| ..                 | ..   | ..           | ..          |
