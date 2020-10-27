USE SO;

select *
from (
select 
    CategoryID, COUNT(*) as "Products Ordered Per Category"
from 
    Products
inner join 
    Order_Details on Products.ProductNumber=Order_Details.ProductNumber
group by
    CategoryID
) sub
;