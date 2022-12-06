/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select products.name, categories.name
from products
inner join categories on categories.CategoryID = products.CategoryID
where categories.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.Name, products.Price, reviews.Rating
 from products
 inner join reviews on reviews.ProductID = products.ProductID
 where reviews.rating = 5; 
 /* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName, employees.LastName, Sum(Sales.Quantity) as Total from sales
inner join employees on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID
order by total desc
limit 2;
/*James Hamilton and Jane McCarty */

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'department name', c.Name as 'Category Name' from departments as d
inner join categories as c on c.DepartmentID = d. DepartmentID
where c.Name = 'Appliances' or c.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name, sum(s.quantity) as 'total sold', sum(s.quantity * s.priceperunit) as 'Total Price' from products as p
inner join sales as s on s.ProductID = p.ProductID
where p.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.reviewer, r.rating, r.comment
from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.firstname, e.lastname, p.name, e.employeeid, sum(s.quantity) as TotalSold
from Sales as s
inner join employees as e on e.employeeid = s.employeeid
inner join products as p on p.productid = s.productid
group by e.employeeid, p.productid;