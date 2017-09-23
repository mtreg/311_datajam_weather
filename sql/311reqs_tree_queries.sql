select count * FROM staging.reqs311 where lower(complaint_type) like 'New Tree Request' as NewTreeRe
--count * FROM staging.reqs311 where lower(complaint_type) like 'Illegal Tree Damage' as IllegalDmg

select sum(case lower(complaint_type) when 'New Tree Request' then 1 else null end) as NewTreeReq
--count(case lower(complaint_type) when 'Illegal Tree Damage' then 1 else null end) as IllegalDmg
from staging.reqs311

SELECT COUNT(complaint_type), complaint_type from staging.reqs311 
where lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%'
group by complaint_type