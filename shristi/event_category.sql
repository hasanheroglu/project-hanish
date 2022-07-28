

----Table for overall type of events-----

create table category_data_overall as 
select `group`->category->NAME, count(*) as count_Category from meetup_events_stream group by `group`->category->NAME; 

----displaying the overall type of events-----

select * from category_data_overall;

----Table for events in Germany-----

create table category_data_country as 
select venue->country, `group`->category->NAME, count(*) as count_category from meetup_events_stream 
where venue->country = 'de' group by venue->country, `group`->category->NAME;

----displaying the events in Germany-----

select * from category_data_country;
