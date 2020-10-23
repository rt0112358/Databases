USE SO;

select 
    distinct p.ProductNumber,
    p.ProductName
from 
    Products p
where p.ProductNumber not in (
    select 
        distinct ProductNumber
    from 
        Order_Details
)