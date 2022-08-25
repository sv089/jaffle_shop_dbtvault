{{
    config(
        enabled=True
    )
}}

select 
	hc.customer_pk, 	
	scd.first_name,
	scd.last_name,  
	scd.email,	
    scc.country,
    scc.age,
    scd.load_date effective_from,
    coalesce (lead(scd.load_date,1) 
    			over (partition by hc.customer_pk 
    				      order by scd.load_date)
    		, TO_DATE('99990101','YYYYMMDD')) effective_to
from dbt.hub_customer hc
left join dbt.sat_customer_details scd 
on hc.customer_pk = scd.customer_pk 
left join dbt.sat_customers_crm scc 
on hc.customer_pk = scc.customer_pk 
order by customer_pk
