DROP TABLE staging.reqs311;
CREATE TABLE staging.reqs311

(

gid serial NOT NULL,

unique_key numeric(10,0),

created_date timestamp,

closed_date timestamp,

agency character varying(10),

agency_name character varying(128),

complaint_type character varying(50),

descriptor text,

location_type character varying(50),

incident_zip character varying(10),

incident_address character varying(128),

street_name character varying(128),

cross_street_1 character varying(128),

cross_street_2 character varying(128),

incident_street_1 character varying(128),

incident_street_2 character varying(128),

address_type character varying(50),

city character varying(50),

landmark character varying(50),

facility_type character varying(50),

status text,

due_date timestamp,

resolution_description character varying(512),

resolution_action_update_date timestamp,

community_board character varying(50),

borough character varying(80),

x_coordinate numeric(10,0),

y_coordinate numeric(10,0),

park_facility_name character varying(100),

park_borough  character varying(80),

school_name  character varying(100), 

school_number  character varying(80),

school_region  character varying(80),

school_code character varying(80),

school_phone_number character varying(80),

school_address character varying(200),

school_city character varying(80),

school_state character varying(80),

school_zip character varying(80),

school_not_found character varying(80),

school_or_citywide_complaint character varying(80),

vehicle_type character varying(80),

taxi_company_borough character varying(80),

taxi_pick_up_location character varying(80),

bridge_highway_name character varying(100),

bridge_highway_direction character varying(80),

road_ramp character varying(80),

bridge_highway_segment character varying(100),

garage_lot_name character varying(80),

ferry_direction character varying(80),

ferry_terminal_name character varying(100),

latitude numeric(80,18),

longitude numeric(80,18),

location character varying(50),

geom_2263 geometry,

CONSTRAINT unique_key PRIMARY KEY (gid),

CONSTRAINT enforce_dims_the_geom CHECK (st_ndims(geom_2263) = 2),

CONSTRAINT enforce_geotype_geom CHECK (geometrytype(geom_2263) = 'POINT'::text OR geom_2263 IS NULL),

CONSTRAINT enforce_srid_the_geom CHECK (st_srid(geom_2263) = 2263)

);