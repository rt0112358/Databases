use SO;

with prod_cats as (
    select
        CategoryID, COUNT(*) as "Products Ordered Per Category"
    from 
        Products
    inner join 
        Order_Details on Products.ProductNumber=Order_Details.ProductNumber
    group by
        CategoryID
)

select 
    * 
from 
    prod_cats;





    