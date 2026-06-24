with cte as(
select *,lag(spend) over(PARTITION by product_id order by transaction_date) as prev_year_spend,
extract(year from transaction_date) as year 
from user_transactions order by year)
select cte.year,cte.product_id,cte.spend as curr_year_spend,cte.prev_year_spend, ROUND((spend-prev_year_spend) * 100.0 / prev_year_spend, 2) AS yoy_rate from cte
group by cte.product_id,cte.year,cte.spend,cte.prev_year_spend order by cte.product_id;

