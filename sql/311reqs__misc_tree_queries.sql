SELECT complaint_type, geom_2263 from staging.reqs311 
where (lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%' and created_date between '03/19/2014' and '03/19/2014 23:59:59');
--group by complaint_type


SELECT complaint_type,created_date, geom_2263 from staging.reqs311 
where (lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%' and created_date between '03/19/2014' and '03/19/2014 23:59:59');
--group by complaint_type


create schema dj311;

select distinct(complaint_type) into dj311.treecomplaint_types
from staging.reqs311
where lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%';


select distinct(complaint_type), distinct(descriptor) --into dj311.treecomplaint_types
from staging.reqs311
where lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%';

SELECT DISTINCT complaint_type,descriptor
FROM staging.reqs311
where lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%'
or lower(descriptor) like '%trees%' 
or lower(descriptor) like '%tree %' 
or  descriptor like 'Trees%'
ORDER BY complaint_type, descriptor;



select count(unique_key) FROM staging.reqs311
where lower(complaint_type) like 'Damaged Tree';
