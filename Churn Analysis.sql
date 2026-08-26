use db_churn
select * from stg_churn;

-- explore
select gender, (COUNT(gender)*1.0/(select count(gender) from stg_churn)) as 'pct' from stg_churn GROUP BY gender

select customer_status, count(*) as 'Total_Count', sum(Total_Revenue) as 'Total_Rev', sum(total_revenue)*100.0/ (select sum(total_revenue) from stg_churn) as 'rev_pct'
from stg_churn GROUP BY Customer_Status

select state, count(*) as 'Total_Count', sum(Total_Revenue) as 'Total_Rev', sum(total_revenue)*100.0/ (select sum(total_revenue) from stg_churn) as 'rev_pct'
from stg_churn GROUP BY state order by rev_pct desc

select APPROX_COUNT_DISTINCT(internet_type) from stg_churn
select DISTINCT(internet_type) from stg_churn

create table #testing (
    ID tinyint primary key IDENTITY,
    loc VARCHAR(50)
)
insert into #testing (loc)
    values ('SL'
);

-- create table #prod (
--     ID tinyint primary key IDENTITY,
--     loc VARCHAR(50)
-- );

-- insert into #prod(loc)
-- select loc from #testing;


SELECT *  
into [db_churn].[dbo].[#prod]
from [db_churn].[dbo].[#testing]

SELECT *from #testing
SELECT *from #prod
drop TABLE #testing
drop TABLE #prod