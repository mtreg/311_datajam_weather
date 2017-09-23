SELECT complaint_type, geom_2263 from staging.reqs311 
where (lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%' and created_date between '03/19/2014' and '03/19/2014 23:59:59');
--group by complaint_type

--identify complaint types for which 
select distinct complaint_type, descriptor from staging.reqs311
where lower(complaint_type) like '%trees%' 
or lower(complaint_type) like '%tree %' 
or  complaint_type like 'Trees%' 
or complaint_type like 'Dead Tree'
or lower(descriptor) like '%trees%' 
or lower(descriptor) like '%tree %' 
or  descriptor like 'Trees%'
or  descriptor like 'trees%'
order by complaint_type;

select count(*) from staging.reqs311 where complaint_type like 'Dead Tree'

select unique_key, created_date, descriptor, location_type, borough, community_board, geom_2263 into dj311.damagedtree_loc FROM staging.reqs311
where complaint_type like 'Damaged Tree';

select unique_key, created_date, descriptor, location_type, borough, community_board, geom_2263 into dj311.dead_damagedtree_loc FROM staging.reqs311
where complaint_type like 'Damaged Tree' or complaint_type like 'Dead Tree';

select dead_damagedtree_loc.*, nyc_commdist.borocd FROM dj311.dead_damagedtree_loc
join staging.nyc_commdist on ST_Contains(nyc_commdist.geom_2263, dead_damagedtree_loc.geom_2263);
--where damagedtree_loc.complaint_type like 'Damaged Tree';


-- select count(dpr_2015tree_census.gid) as streetree_count, nyc_commdist.borocd, nyc_commdist.geom_2263 from 
-- staging.nyc_commdist join ecological.dpr_2015tree_census on st_contains(nyc_commdist.geom_2263, dpr_2015tree_census.geom_2263)
-- group by nyc_commdist.borocd, nyc_commdist.geom_2263

--intersects is about a minute faster than contains.
select count(dpr_2015tree_census.gid) as streetree_count, nyc_commdist.borocd, nyc_commdist.geom_2263 into dj311.trees_cd from 
staging.nyc_commdist join ecological.dpr_2015tree_census on st_intersects(nyc_commdist.geom_2263, dpr_2015tree_census.geom_2263)
group by nyc_commdist.borocd, nyc_commdist.geom_2263;


--dead and damaged tree 311 requests by city council district
select count(dead_damagedtree_loc.*) as damagedtrees, nyc_commdist.borocd, nyc_commdist.geom_2263 into dj311.dead_damagedtree_borocd FROM dj311.dead_damagedtree_loc
join staging.nyc_commdist on st_intersects(nyc_commdist.geom_2263, dead_damagedtree_loc.geom_2263)
group by borocd, nyc_commdist.geom_2263;

--streetTrees by city council district
select count(dpr_2015tree_census.gid) as streetree_count, nyc_commdist.borocd, nyc_commdist.geom_2263 into dj311.trees_cd from 
staging.nyc_commdist join ecological.dpr_2015tree_census on st_intersects(nyc_commdist.geom_2263, dpr_2015tree_census.geom_2263)
group by nyc_commdist.borocd, nyc_commdist.geom_2263;


--calculate damaged trees per street trees
select damagedtrees, streetree_count, damagedtrees::numeric/streetree_count::numeric as treecalls_streetree, damagedtree_borocd.borocd, damagedtree_borocd.geom_2263 into dj311.dead_damaged_street_borocd from
dj311.damagedtree_borocd join dj311.trees_cd on  trees_cd.borocd=damagedtree_borocd.borocd





select damtrees, streetree_count, damtrees::numeric/streetree_count::numeric as treecalls_x_streettree, community_board, geom_2263 from
(select count(damagedtree_loc.*) as damtrees, streetree_count,  community_board, trees_cd.geom_2263 from
dj311.damagedtree_loc, dj311.trees_cd 
where created_date between '03/19/2014' and '03/31/2014 23:59:59'-- and location_type like 'street'
group by community_board,streetree_count,  trees_cd.geom_2263) as foo;







	--trees_cd.geom_2263 as cd_geom_2263
