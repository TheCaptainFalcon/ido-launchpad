use proj_2;

select * from projects;
select * from performance_metrics;

-- top performing projects with an added difference multiplier from ath to current
select project_name, ticker_symbol, category, sub_category, tge_roi, ath_roi, format((ath_roi / tge_roi), 2) as roi_diff
from projects 
left join performance_metrics on projects.project_id = performance_metrics.project_id
order by tge_roi desc;

select * from launchpad;
select * from projects;

-- success by launchpad (prior success)
select launchpad_name,  round(avg(tge_roi), 2) as avg_tge_roi, round(avg(ath_roi), 2) as avg_ath_roi
from projects
left join performance_metrics on projects.project_id = performance_metrics.project_id
inner join ido on projects.project_id = ido.project_id
inner join launchpad on ido.launchpad_id = launchpad.launchpad_id
where tge_roi >= 2.00 and projects.status = "ACTIVE"
GROup by launchpad.launchpad_id
order by tge_roi desc;

select * from performance_metrics;

-- marketcap and volume of top 5 projects
select project_name, category, format(market_cap, 0) as 'market cap', format(daily_volume, 0) as 'daily volume'
from performance_metrics
left join projects on performance_metrics.project_id = projects.project_id
order by market_cap desc
limit 5;

select * from ido;

-- avg days to reach ath by blockchain
select blockchain, round(avg(days_to_reach_ath), 0) as avg_days_to_reach_ath
from ido
group by blockchain
order by avg_days_to_reach_ath desc;

select * from launchpad;
-- avg days to reach ath by launchpad
select launchpad_name, round(avg(days_to_reach_ath), 0) as avg_days_to_reach_ath
from launchpad
inner join ido on launchpad.launchpad_id = ido.launchpad_id
group by launchpad_name;

-- avg days to reach ath by project category
select category, round(avg(days_to_reach_ath), 0) as avg_days_to_reach_ath
from projects
inner join ido on projects.project_id = ido.project_id
group by category
order by avg_days_to_reach_ath desc;

select * from ido;

-- raised by ido and total raised by category
select category, raised_by_ido, total_raised
from ido
inner join projects on ido.project_id = projects.project_id
group by category
order by raised_by_ido desc;

select * from ido;
select * from performance_metrics;

-- roi by launchpad
select launchpad_name, round(avg(tge_roi), 2) as avg_tge_roi, round(avg(ath_roi), 2) as avg_ath_roi, (round(avg((ath_roi - tge_roi)), 2)) as avg_roi_diff
from performance_metrics
inner join projects on performance_metrics.project_id = projects.project_id
inner join ido on projects.project_id = ido.project_id
inner join launchpad on ido.launchpad_id = launchpad.launchpad_id
group by launchpad_name
order by avg_tge_roi desc;


-- roi by blockchain
select blockchain, round(avg(tge_roi), 2) as avg_tge_roi
from performance_metrics
inner join projects on performance_metrics.project_id = projects.project_id
inner join ido on projects.project_id = ido.project_id
group by blockchain
order by avg_tge_roi desc;


-- roi by category
select category, round(avg(tge_roi), 2) as avg_tge_roi
from performance_metrics
inner join projects on performance_metrics.project_id = projects.project_id
group by category
order by avg_tge_roi desc;
