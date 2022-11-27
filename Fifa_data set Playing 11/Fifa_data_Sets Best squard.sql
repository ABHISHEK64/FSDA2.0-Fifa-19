create database fifa_19;
use fifa_19;
CREATE TABLE fifa_set (
	a DECIMAL(38, 0) NOT NULL, 
	`ID` DECIMAL(38, 0) NOT NULL, 
	`Name` VARCHAR(22) NOT NULL, 
	`Age` DECIMAL(38, 0) NOT NULL, 
	`Photo` VARCHAR(46) NOT NULL, 
	`Nationality` VARCHAR(20) NOT NULL, 
	`Flag` VARCHAR(36) NOT NULL, 
	`Overall` DECIMAL(38, 0) NOT NULL, 
	`Potential` DECIMAL(38, 0) NOT NULL, 
	`Club` VARCHAR(35), 
	`Club Logo` VARCHAR(47) NOT NULL, 
	`Value` VARCHAR(7) NOT NULL, 
	`Wage` VARCHAR(5) NOT NULL, 
	`Special` DECIMAL(38, 0) NOT NULL, 
	`Preferred Foot` VARCHAR(5), 
	`International Reputation` DECIMAL(38, 0), 
	`Weak Foot` DECIMAL(38, 0), 
	`Skill Moves` DECIMAL(38, 0), 
	`Work Rate` VARCHAR(14), 
	`Body Type` VARCHAR(19), 
	`Real Face` BOOL, 
	`Position` VARCHAR(3), 
	`Jersey Number` DECIMAL(38, 0), 
	`Joined` DATE, 
	`Loaned From` VARCHAR(35), 
	`Contract Valid Until` VARCHAR(12), 
	`Height` VARCHAR(4), 
	`Weight` VARCHAR(6), 
	`LS` VARCHAR(4), 
	`ST` VARCHAR(4), 
	`RS` VARCHAR(4), 
	`LW` VARCHAR(4), 
	`LF` VARCHAR(4), 
	`CF` VARCHAR(4), 
	`RF` VARCHAR(4), 
	`RW` VARCHAR(4), 
	`LAM` VARCHAR(4), 
	`CAM` VARCHAR(4), 
	`RAM` VARCHAR(4), 
	`LM` VARCHAR(4), 
	`LCM` VARCHAR(4), 
	`CM` VARCHAR(4), 
	`RCM` VARCHAR(4), 
	`RM` VARCHAR(4), 
	`LWB` VARCHAR(4), 
	`LDM` VARCHAR(4), 
	`CDM` VARCHAR(4), 
	`RDM` VARCHAR(4), 
	`RWB` VARCHAR(4), 
	`LB` VARCHAR(4), 
	`LCB` VARCHAR(4), 
	`CB` VARCHAR(4), 
	`RCB` VARCHAR(4), 
	`RB` VARCHAR(4), 
	`Crossing` DECIMAL(38, 0), 
	`Finishing` DECIMAL(38, 0), 
	`HeadingAccuracy` DECIMAL(38, 0), 
	`ShortPassing` DECIMAL(38, 0), 
	`Volleys` DECIMAL(38, 0), 
	`Dribbling` DECIMAL(38, 0), 
	`Curve` DECIMAL(38, 0), 
	`FKAccuracy` DECIMAL(38, 0), 
	`LongPassing` DECIMAL(38, 0), 
	`BallControl` DECIMAL(38, 0), 
	`Acceleration` DECIMAL(38, 0), 
	`SprintSpeed` DECIMAL(38, 0), 
	`Agility` DECIMAL(38, 0), 
	`Reactions` DECIMAL(38, 0), 
	`Balance` DECIMAL(38, 0), 
	`ShotPower` DECIMAL(38, 0), 
	`Jumping` DECIMAL(38, 0), 
	`Stamina` DECIMAL(38, 0), 
	`Strength` DECIMAL(38, 0), 
	`LongShots` DECIMAL(38, 0), 
	`Aggression` DECIMAL(38, 0), 
	`Interceptions` DECIMAL(38, 0), 
	`Positioning` DECIMAL(38, 0), 
	`Vision` DECIMAL(38, 0), 
	`Penalties` DECIMAL(38, 0), 
	`Composure` DECIMAL(38, 0), 
	`Marking` DECIMAL(38, 0), 
	`StandingTackle` DECIMAL(38, 0), 
	`SlidingTackle` DECIMAL(38, 0), 
	`GKDiving` DECIMAL(38, 0), 
	`GKHandling` DECIMAL(38, 0), 
	`GKKicking` DECIMAL(38, 0), 
	`GKPositioning` DECIMAL(38, 0), 
	`GKReflexes` DECIMAL(38, 0), 
	`Release Clause` VARCHAR(7)
);
load data infile 
'D:\data.csv'
into table fifa_set
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
select *from fifa_set;
#avg skills value of goal keepar
SELECT 
    Name,
    Position,
    `Contract Valid Until`,
    ROUND(AVG(GKReflexes), 1) AS Goal_Keeper_Reflexes,
    ROUND(AVG(GKDiving), 1) AS Goal_Keeper_Diving,
    ROUND(AVG(GKKicking), 1) AS Goal_Keeper_Kicking,
    ROUND(AVG(GKHandling), 1) AS Goal_Keeper_Handling,
    ROUND(AVG(GKPositioning), 1) AS Goal_Keeper_Positioning,
    ROUND(AVG(SprintSpeed), 1) AS Goal_Keeper_SprintSpeed
FROM
    fifa_set
WHERE
    Position = 'GK';
    select * from fifa_set;
SELECT 
    name,
    position,
    Nationality,
    `Contract Valid Until`,
    `Value`,
    GKReflexes,
    GkDiving,
    GKKicking,
    GKHandling,
    SprintSpeed,
    GKPositioning
FROM
    fifa_set
where Position = 'GK'
    AND GKReflexes > (select AVG(GKReflexes) from fifa_set)
    AND GKDiving > (select AVG(GKDiving) from fifa_set)
    AND GKKicking > (select AVG(GKKicking) from fifa_set)
    And Gkhandling> ( select Avg(GKhandling) from fifa_set)
    and GKPositioning>( select AVG(GKPositioning) from fifa_set)
    and SprintSpeed>( select AVG(SprintSpeed) from fifa_set)
    and `Contract Valid Until` <2022 ;
### Avg defenders
select distinct(position) from fifa_set;
select avg(height) as height,avg(HeadingAccuracy),avg(shortPassing),avg(LongPassing),avg(ballcontrol),avg(Agility),avg(jumping) from fifa_set
where position in ('CB','RB','LB');
select name,position,nationality,value,`Contract Valid Until`,height,HeadingAccuracy,shortPassing,LongPassing,ballcontrol,Agility,jumping from fifa_set
where height>(select avg(height) from fifa_set)
and HeadingAccuracy>(select avg(HeadingAccuracy) from fifa_set)
and shortPassing>(select avg(shortPassing) from fifa_set)
and LongPassing>(select avg(LongPassing) from fifa_set)
and ballcontrol>(select avg(ballcontrol) from fifa_set)
and agility>(select avg(Agility) from fifa_set)
and jumping>(select avg(jumping) from fifa_set)
and position in ('CB','RB','LB')
and `Contract Valid Until` <2022
and `value` like '_1_M';
### Mid Fielder
select distinct(`Work Rate`) from fifa_set;
select name,nationality,position,`value`,`Contract Valid Until`,`Work Rate`,Stamina,ShortPassing,LongPassing from fifa_set
where 
`Work Rate`='High/ High'and
Stamina>(select avg(Stamina) from fifa_set)
and
ShortPassing>(select avg(ShortPassing) from fifa_set)
and
LongPassing>(select avg(LongPassing) from fifa_set)
and
position in('CM','LM','RM')
and `contract valid until`<2021
and `value` like '_1_M' or `value` like'__1._M'
order by `Contract Valid Until` desc
limit 10;
### Striker####
select name,nationality,position,`value`,`Contract Valid Until`,`Work Rate`,
Penalties,LongShots,Finishing,BallControl from fifa_set
where
position  in('LW','RW','CF','ST')
and Penalties>(select Avg(penalties) from fifa_set)
and LongShots>(select Avg(LongShots) from fifa_set)
and Finishing>(select Avg(Finishing) from fifa_set)
and BallControl>(select Avg(BallControl) from fifa_set)
and `Contract Valid Until`<=2022 limit 10;