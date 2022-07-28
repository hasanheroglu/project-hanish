
-----Paid vs. unpaid events overall-----

create table paid_events as 
select payment_required, count(*) as cnt from meetup_events_stream group by payment_required;


-----Displaying Paid vs. unpaid events overall data-----

select * from paid_events;


-----Paid vs. Unpaid events for Germany-----

create table paid_events_eventtype as 
select `group`->category->NAME, payment_required, count(*) as cnt 
from meetup_events_stream 
where venue->country = 'de' group by `group`->category->NAME, payment_required;


-----Displaying Paid vs. Unpaid events for Germany data-----

select * from paid_events_eventtype;

