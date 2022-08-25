{{
    config(
        enabled=True
    )
}}

select 
	hc.customer_pk, 
	hc.customer_key, 	
	scd.first_name,
	scd.last_name,
	scd.email,	
    hc.load_date hub_load_date,
    scd.load_date scd_load_date    
from dbt.hub_customer hc
left join dbt.sat_customer_details scd 
on hc.customer_pk = scd.customer_pk 
