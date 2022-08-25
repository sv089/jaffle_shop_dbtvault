{{
    config(
        enabled=True
    )
}}

{% set relation = api.Relation.create(schema='dbt', identifier='sat_order_details') %}

select
    to_char(order_date, 'IYYY-IW') as week_number, 
    status as status, 
    count(*) as orders_count
from {{ relation.schema + '.' + relation.identifier }}
group by to_char(order_date, 'IYYY-IW') , status