
-----Public vs Members meetups overall----- 

create table event_access as 
select venue_visibility, count(*) as cnt from meetup_events_stream 
group by venue_visibility;


-----Displaying Public vs Members meetups overall data-----

select * from event_access;


-----Public vs Members meetups in Germany-----

create table event_access_de as 
select venue_visibility, count(*) as cnt from meetup_events_stream 
where venue->country = 'de'  
group by venue_visibility;


-----Displaying Public vs Members meetups in Germany-----

select * from event_access_de;


