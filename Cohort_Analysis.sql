-- I. Overivew
-- Overview of the online_retail table
select 
    invoiceno,
    stockcode,
    description,
    quantity,
    invoicedate,
    unitprice,
    customerid,
    country
from online_retail;

-- II. Data Cleaning:

-- Remove Bad Records and create clean temporary table
create temporary table online_retail_clean as
with retail as (
    select *
    from online_retail
    where customerid != ''
),
quantity_unit_price as (
    select *
    from retail
    where cast(quantity as decimal) > 0 
    and cast(unitprice as decimal) > 0
),
dup_check as (
    select 
        *, 
        row_number() over (
            partition by invoiceno, stockcode, cast(quantity as decimal) 
            order by str_to_date(invoicedate, '%m/%d/%Y %H:%i')
        ) as dup
    from quantity_unit_price
)
select * 
from dup_check
where dup = 1;

-- III. Cohort Analysis:

-- 1. Cohort Creation
create temporary table cohort as
select
    customerid,
    min(str_to_date(invoicedate, '%m/%d/%Y %H:%i')) as first_purchase_date,
    date_format(
        min(str_to_date(invoicedate, '%m/%d/%Y %H:%i')),
        '%Y-%m-01'
    ) as cohort_date
from online_retail_clean
group by customerid;

select
    customerid,
    min(str_to_date(invoicedate, '%m/%d/%Y %H:%i')) as first_purchase_date,
    date_format(
        min(str_to_date(invoicedate, '%m/%d/%Y %H:%i')),
        '%Y-%m-01'
    ) as cohort_date
from online_retail_clean
group by customerid

-- 2. Cohort Index Calculation

create temporary table cohorts_retention as
with cte as (
    select
        o.*,
        c.cohort_date,
        year(str_to_date(o.invoicedate, '%m/%d/%Y %H:%i')) as invoice_year,
        month(str_to_date(o.invoicedate, '%m/%d/%Y %H:%i')) as invoice_month,
        year(c.cohort_date) as cohort_year,
        month(c.cohort_date) as cohort_month
    from online_retail_clean o
    left join cohort c on o.customerid = c.customerid
),
cte2 as (
    select 
        cte.*,
        invoice_year - cohort_year as year_diff,
        invoice_month - cohort_month as month_diff
    from cte 
)
select 
    cte2.*,
    year_diff * 12 + month_diff + 1 as cohort_index
from cte2;

-- 3. Cohort Pivot Table
create temporary table cohort_pivot as
select 
    cohort_date,
    sum(case when cohort_index = 1 then 1 else 0 end) as '1',
    sum(case when cohort_index = 2 then 1 else 0 end) as '2',
    sum(case when cohort_index = 3 then 1 else 0 end) as '3',
    sum(case when cohort_index = 4 then 1 else 0 end) as '4',
    sum(case when cohort_index = 5 then 1 else 0 end) as '5',
    sum(case when cohort_index = 6 then 1 else 0 end) as '6',
    sum(case when cohort_index = 7 then 1 else 0 end) as '7',
    sum(case when cohort_index = 8 then 1 else 0 end) as '8',
    sum(case when cohort_index = 9 then 1 else 0 end) as '9',
    sum(case when cohort_index = 10 then 1 else 0 end) as '10',
    sum(case when cohort_index = 11 then 1 else 0 end) as '11',
    sum(case when cohort_index = 12 then 1 else 0 end) as '12',
    sum(case when cohort_index = 13 then 1 else 0 end) as '13'
from (
    select distinct 
        customerid,
        cohort_date,
        cohort_index
    from cohorts_retention
) as t
group by cohort_date
order by cohort_date;

-- 4. Cohort Retention Rate
select 
    cohort_date, 
    round(1.0 * `1`/`1` * 100, 2) as '1',
    round(1.0 * `2`/`1` * 100, 2) as '2',
    round(1.0 * `3`/`1` * 100, 2) as '3',
    round(1.0 * `4`/`1` * 100, 2) as '4',
    round(1.0 * `5`/`1` * 100, 2) as '5',
    round(1.0 * `6`/`1` * 100, 2) as '6',
    round(1.0 * `7`/`1` * 100, 2) as '7',
    round(1.0 * `8`/`1` * 100, 2) as '8',
    round(1.0 * `9`/`1` * 100, 2) as '9',
    round(1.0 * `10`/`1` * 100, 2) as '10',
    round(1.0 * `11`/`1` * 100, 2) as '11',
    round(1.0 * `12`/`1` * 100, 2) as '12',
    round(1.0 * `13`/`1` * 100, 2) as '13'
from cohort_pivot;

-- 5. Clean up temporary tables
drop temporary table if exists online_retail_clean;
drop temporary table if exists cohort;
drop temporary table if exists cohorts_retention;
drop temporary table if exists cohort_pivot;













