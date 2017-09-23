copy staging.reqs311(unique_key,created_date,closed_date,agency,agency_name,complaint_type,descriptor,location_type,incident_zip,incident_address,street_name,cross_street_1,cross_street_2,incident_street_1,incident_street_2,address_type,city,landmark,facility_type,status,due_date,resolution_description,resolution_action_update_date,community_board,borough,x_coordinate,y_coordinate,park_facility_name,park_borough,school_name,school_number,school_region,school_code,school_phone_number,school_address,school_city,school_state,school_zip,school_not_found,school_or_citywide_complaint,vehicle_type,taxi_company_borough,taxi_pick_up_location,bridge_highway_name,bridge_highway_direction,road_ramp,bridge_highway_segment,garage_lot_name,ferry_direction,ferry_terminal_name,latitude,longitude,location
) FROM 'D:\Treglia_Data\MLT_GISData\US_Data\New York\311_Service_Requests_from_2010_to_Present.csv' DELIMITERS ',' NULL '' CSV HEADER;


--311Reqs_Cleaned

--copy staging.reqs311(unique_key,created_date,closed_date,agency,agency_name,complaint_type,descriptor,location_type,incident_zip,incident_address,street_name,cross_street_1,cross_street_2,incident_street_1,incident_street_2,address_type,city,landmark,facility_type,status,due_date,resolution_description,resolution_action_update_date,community_board,borough,x_coordinate,y_coordinate,park_facility_name,park_borough,school_name,school_number,school_region,school_code,school_phone_number,school_address,school_city,school_state,school_zip,school_not_found,school_or_citywide_complaint,vehicle_type,taxi_company_borough,taxi_pick_up_location,bridge_highway_name,bridge_highway_direction,road_ramp,bridge_highway_segment,garage_lot_name,ferry_direction,ferry_terminal_name,latitude,longitude,location
--) FROM 'D:\Treglia_Data\MLT_GISData\US_Data\New York\311Reqs_Cleaned.csv' DELIMITERS ',' NULL 'NA' CSV HEADER;



--copy staging.testreqs311(unique_key,created_date,closed_date,agency,agency_name,complaint_type,descriptor,location_type,incident_zip,incident_address,street_name,cross_street_1,cross_street_2,incident_street_1,incident_street_2,address_type,city,landmark,facility_type,status,due_date,resolution_description,resolution_action_update_date,community_board,borough,x_coordinate,y_coordinate,park_facility_name,park_borough,school_name,school_number,school_region,school_code,school_phone_number,school_address,school_city,school_state,school_zip,school_not_found,school_or_citywide_complaint,vehicle_type,taxi_company_borough,taxi_pick_up_location,bridge_highway_name,bridge_highway_direction,road_ramp,bridge_highway_segment,garage_lot_name,ferry_direction,ferry_terminal_name,latitude,longitude,location
--) FROM 'D:\Treglia_Data\MLT_GISData\US_Data\New York\311_Service_Requests_from_2010_to_Present.csv' DELIMITERS ',' NULL '' CSV HEADER;


UPDATE staging.reqs311
SET geom_2263 = ST_GeomFromText('POINT(' || x_coordinate || ' ' || y_coordinate || ')',2263);