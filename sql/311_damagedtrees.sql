select unique_key, created_date, descriptor, location_type, borough, community_board, geom_2263 into dj311.damagedtree_loc FROM staging.reqs311
where complaint_type like 'Damaged Tree';


select damagedtree_loc.*, nyc_commdist.borocd into dj311.damaged_tree_borocd FROM dj311.damagedtree_loc
join staging.nyc_commdist on ST_Contains(nyc_commdist.geom_2263, damagedtree_loc.geom_2263);
--where damagedtree_loc.complaint_type like 'Damaged Tree';




select * into dj311.damagedtree FROM staging.reqs311
where complaint_type like 'Damaged Tree';




select * from dj311.damagedtree limit 10



SELECT * FROM staging.reqs311

--identify complaint types for which 
select distinct(complaint_type, descriptor) from staging.reqs311
where lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%' or
lower(descriptor) like '%trees%' 
or lower(descriptor) like '%tree %' 
or  descriptor like 'Trees%';