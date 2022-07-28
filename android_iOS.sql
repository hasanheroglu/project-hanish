
------Stream of Android and iOS events------

create STREAM android_ios_events as 
select `group`->category->NAME, 
case when LCASE(`group`->name) like '%android%'  then 'android'  when `group`->name like '%iOS%'  then 'ios' end as event_type, 
`group`->name, `group`->urlname, * 
from meetup_events_stream where (LCASE(`group`->name) like '%android%' or `group`->name like '%iOS%');


-----Overall type of android and iOS events-----

create table android_ios_events_table as 
select event_type, count(*) as count_events from android_ios_events group by event_type;


-----Displaying the overall Android vs. iOS data-----

Select * from android_ios_events_table;


-----Split of android and ios by country-----

create table android_ios_events_table_country as 
select LCASE(venue->country), event_type, count(*) as count_events from android_ios_events group by LCASE(venue->country), event_type;


-----Displaying the split of android and ios by country-----

Select * from android_ios_events_table_country;

