--CREATING SCHEMAS
create schema ethiopia;

create schema india;

create schema peru;

create schema vietnam;

--CREATING VIEWS AND CREATING TABLES WITH THW VIEWS(SCHEMAS ARE NAMED AFTER THE 4 COUNTRIES)
create view household
as 
select region, clustid, commid, typesite, childloc, childid, round, yc,headid, headage, hhsize
from dbo.ethiopia_constructed;

select * into ethiopia.household
from household;

create view household2
as 
select region, clustid, commid, typesite, childloc, childid, round, yc,headid, headage, hhsize
from dbo.india_constructed;

select * into india.household
from household2;

create view household3
as 
select region, clustid, placeid, typesite, childloc, childid, round, yc,headid, headage, hhsize
from dbo.peru_constructed;

select * into peru.household
from household3;

create view household4
as 
select region, clustid, commid, typesite, childloc, childid, round, yc,headid, headage, hhsize
from dbo.vietnam_constructed;

select * into vietnam.household
from household4;

create view basicamenity
as 
select sv_new, cd_new, drwaterq_new, toiletq_new, elecq_new, childid, round, cookingq_new,hq_new
from dbo.ethiopia_constructed;

select * into ethiopia.basicamenity
from basicamenity;

create view basicamenity2
as 
select sv, cd, drwaterq, toiletq, elecq, childid, round, cookingq,hq
from dbo.india_constructed;

select * into india.basicamenity
from basicamenity2;

create view basicamenity3
as 
select sv, cd, drwaterq, toiletq, elecq, childid, round, cookingq,hq
from dbo.peru_constructed;

select * into peru.basicamenity
from basicamenity3;

create view basicamenity4
as 
select sv_new, cd_new, drwaterq_new, toiletq_new, elecq_new, childid, round, cookingq_new,hq_new
from dbo.vietnam_constructed;

select * into vietnam.basicamenity
from basicamenity4;

create view literacy
as 
select hschool, hstudy, commsch, enrol, levlread, childid, round, levlwrit,hplay
from dbo.ethiopia_constructed;

select * into ethiopia.literacy
from literacy;

create view literacy2
as 
select hschool, hstudy, commsch, enrol, levlread, childid, round, levlwrit,hplay
from dbo.india_constructed;

select * into india.literacy
from literacy2;

create view literacy3
as 
select hschool, hstudy, commsch, enrol, levlread, childid, round, levlwrit,hplay
from dbo.peru_constructed;

select * into peru.literacy
from literacy3;

create view literacy4
as 
select hschool, hstudy, commsch, enrol, levlread, childid, round, levlwrit,hplay
from dbo.vietnam_constructed;

select * into vietnam.literacy
from literacy4;

--TRANSFORMING THE TABLES BY CREATING STOREED PROCEDURES FOR ALL ENCODING
create procedure ethiopiahousehold_transfromed
as 
begin
	UPDATE ethiopia.household
	set region = 
	case 
	when region = 1	then 'Tigray'
	when region = 2	then 'Afar'
	when region = 3	then 'Amhara'
	when region = 4	then 'Oromiya'
	when region = 5	then 'Somali'
	when region = 6	then 'Benshangul Gumz'
	when region = 7	then 'SNNP'
	when region = 12 then 'Gambela'
	when region = 13 then 'Harari'
	when region = 14 then 'Addis Ababa City Administration'
	when region = 15 then 'Dire Dawa City Administration'
	else 'null'
	end 

	UPDATE ethiopia.household
	set typesite =
	case
	when typesite = 0 then 'urban'
	when typesite = 1 then 'rural'
	else 'null'
	end 

	UPDATE ethiopia.household
	set childloc =
	case 
	when childloc = 0 then 'no'
	when childloc = 1 then 'yes'
	else 'null'
	end 
	
	UPDATE ethiopia.household
	set yc =
	case 
	when yc = 0	then 'Older cohort'
	when yc = 1	then 'Younger cohort'
	else 'null'
	end

	UPDATE ethiopia.household
	set headage =
	case 
	when headage = -9999 then 'nk' 
	else 'null'
	end
	
end;
go

execute ethiopiahousehold_transfromed;

create procedure indiahousehold_transfromed
as 
begin
	UPDATE india.household
	set region = 
	case 
	when region = 24 then 'Others'
	when region = 23 then 'Telangana'
	when region = 77 then 'Not known'
	when region = 22 then 'Rayalaseema'
	when region = 21 then 'Coastal Andhra'
	else 'null'
	end 

	UPDATE india.household
	set typesite =
	case
	when typesite = 1 then 'urban'
	when typesite = 2 then 'rural'
	when typesite = 77 then 'Not known'
	else 'null'
	end 
	
	UPDATE india.household
	set childloc =
	case 
	when childloc = 0 then 'no'
	when childloc = 1 then 'yes'
	else 'null'
	end 
	
	UPDATE india.household
	set yc =
	case 
	when yc = 0	then 'Older cohort'
	when yc = 1	then 'Younger cohort'
	else 'null'
	end 
end;
go

execute indiahousehold_transfromed;

create procedure peruhousehold_transfromed
as 
begin
	UPDATE peru.household
	set region =
	case 
	when region = 32 then 'Sierra'
	when region = 33 then 'Selva'
	when region = 88 then 'N/A'
	when region = 31 then 'Costa'
	else 'null'
	end 

	UPDATE peru.household
	set typesite =
	case
	when typesite = 1 then 'urban'
	when typesite = 2 then 'rural'
	else 'null'
	end 

	UPDATE peru.household
	set childloc =
	case 
	when childloc = 0 then 'no'
	when childloc = 1 then 'yes'
	else 'null'
	end 

	UPDATE peru.household
	set yc =
	case 
	when yc = 0	then 'Older cohort'
	when yc = 1	then 'Younger cohort'
	else 'null'
	end 

	UPDATE peru.household
	set headage =
	case 
	when headage = -9999 then 'nk' 
	else 'null'
	end

end;
go 

execute peruhousehold_transfromed;


create procedure vietnamhousehold_transfromed
as 
begin
	UPDATE vietnam.household
	set region = 
	case 
	when region = 51 then 'Northern Uplands'
	when region = 52 then 'Red River Delta'
	when region = 53 then 'Phu Yen'
	when region = 54 then 'Da Nang'
	when region = 55 then 'Highlands'
	when region = 56 then 'South Eastern'
	when region = 57 then 'Mekong River Delta'
	when region = 58 then 'Other'
	else 'null'
	end 

	UPDATE vietnam.household
	set typesite =
	case
	when typesite = 1 then 'urban'
	when typesite = 2 then 'rural'
	else 'null'
	end 

	UPDATE vietnam.household
	set childloc =
	case 
	when childloc = 0 then 'no'
	when childloc = 1 then 'yes'
	else 'null'
	end
	
	UPDATE vietnam.household
	set yc =
	case 
	when yc = 0	then 'Older cohort'
	when yc = 1	then 'Younger cohort'
	else 'null'
	end 
end;
go

execute vietnamhousehold_transfromed;

create procedure ethiopiabasicamenity_transformed
as
begin
	update ethiopia.basicamenity
	set drwaterq_new =
	case 
	when drwaterq_new = 0 then 'no'
	when drwaterq_new = 1 then 'yes'
	else 'null'
	end 

	update ethiopia.basicamenity
	set toiletq_new =
	case 
	when toiletq_new = 0 then 'no'
	when toiletq_new = 1 then 'yes'
	else 'null'
	end 

	update ethiopia.basicamenity
	set elecq_new =
	case 
	when elecq_new = 0 then 'no'
	when elecq_new = 1 then 'yes'
	else 'null'
	end 

	update ethiopia.basicamenity
	set cookingq_new =
	case 
	when cookingq_new = 0 then 'no'
	when cookingq_new = 1 then 'yes'
	else 'null'
	end 
end;
go

execute ethiopiabasicamenity_transformed;

create procedure indiabasicamenity_transformed
as
begin
	update india.basicamenity
	set drwaterq =
	case 
	when drwaterq = 0 then 'no'
	when drwaterq = 1 then 'yes'
	else 'null'
	end 

	update india.basicamenity
	set toiletq =
	case 
	when toiletq = 0 then 'no'
	when toiletq = 1 then 'yes'
	else 'null'
	end 

	update india.basicamenity
	set elecq =
	case 
	when elecq = 0 then 'no'
	when elecq = 1 then 'yes'
	else 'null'
	end 

	update india.basicamenity
	set cookingq =
	case 
	when cookingq = 0 then 'no'
	when cookingq = 1 then 'yes'
	else 'null'
	end 
end;
go

execute indiabasicamenity_transformed;

create procedure perubasicamenity_transformed
as
begin
	update peru.basicamenity
	set drwaterq = 
	case 
	when drwaterq = 0 then 'no'
	when drwaterq = 1 then 'yes'
	else 'null'
	end 

	update peru.basicamenity
	set toiletq =
	case 
	when toiletq = 0 then 'no'
	when toiletq = 1 then 'yes'
	else 'null'
	end 

	update peru.basicamenity
	set elecq =
	case 
	when elecq = 0 then 'no'
	when elecq = 1 then 'yes'
	else 'null'
	end 

	update peru.basicamenity
	set cookingq =
	case 
	when cookingq = 0 then 'no'
	when cookingq = 1 then 'yes'
	else 'null'
	end 
end;
go

execute perubasicamenity_transformed;

create procedure vietnambasicamenity_transformed
as
begin
	update vietnam.basicamenity
	set drwaterq_new = 
	case 
	when drwaterq_new = 0 then 'no'
	when drwaterq_new = 1 then 'yes'
	else 'null'
	end 

	update vietnam.basicamenity
	set toiletq_new =
	case 
	when toiletq_new = 0 then 'no'
	when toiletq_new = 1 then 'yes'
	else 'null'
	end 

	update vietnam.basicamenity
	set elecq_new =
	case 
	when elecq_new = 0 then 'no'
	when elecq_new = 1 then 'yes'
	else 'null'
	end 

	update vietnam.basicamenity
	set cookingq_new =
	case 
	when cookingq_new = 0 then 'no'
	when cookingq_new = 1 then 'yes'
	else 'null'
	end 
end;
go

execute vietnambasicamenity_transformed;

create procedure ethiopialiteracy_transformed
as 
begin
	update ethiopia.literacy
	set enrol =
	case 
	when enrol = 0 then 'no'
	when enrol = 1 then 'yes'
	when enrol = 99 then 'missing'
	when enrol = 77 then 'nk'
	when enrol = 88 then 'n/a'
	else 'null'
	end 

	update ethiopia.literacy
	set levlread =
	case 
	when levlread = 1 then 'cant read anything'
	when levlread = 2 then 'reads letters'
	when levlread = 3 then 'reads word'
	when levlread = 4 then 'reads sentence'
	else 'null'
	end 

	update ethiopia.literacy
	set levlwrit = 
	case 
	when levlwrit = 1 then 'no'
	when levlwrit = 2 then 'yes with difficulty or errors'
	when levlwrit = 3 then 'yes without difficulty or errors'
	else 'null'
	end 
end;
go 

execute ethiopialiteracy_transformed;

create procedure indialiteracy_transformed
as 
begin
	update india.literacy
	set enrol =
	case 
	when enrol = 0 then 'no'
	when enrol = 1 then 'yes'
	when enrol = 99 then 'missing'
	when enrol = 77 then 'nk'
	when enrol = 88 then 'n/a'
	else 'null'
	end 

	update india.literacy
	set levlread =
	case 
	when levlread = 1 then 'cant read anything'
	when levlread = 2 then 'reads letters'
	when levlread = 3 then 'reads word'
	when levlread = 4 then 'reads sentence'
	else 'null'
	end 

	update india.literacy
	set levlwrit =
	case 
	when levlwrit = 1 then 'no'
	when levlwrit = 2 then 'yes with difficulty or errors'
	when levlwrit = 3 then 'yes without difficulty or errors'
	else 'null'
	end 
end;
go 

execute indialiteracy_transformed;


create procedure peruliteracy_transformed
as 
begin
	update peru.literacy
	set enrol =
	case 
	when enrol = 0 then 'no'
	when enrol = 1 then 'yes'
	when enrol = 99 then 'missing'
	when enrol = 77 then 'nk'
	when enrol = 88 then 'n/a'
	else 'null'
	end 

	update peru.literacy
	set levlread =
	case 
	when levlread = 1 then 'cant read anything'
	when levlread = 2 then 'reads letters'
	when levlread = 3 then 'reads word'
	when levlread = 4 then 'reads sentence'
	else 'null'
	end 

	update peru.literacy
	set levlwrit =
	case 
	when levlwrit = 1 then 'no'
	when levlwrit = 2 then 'yes with difficulty or errors'
	when levlwrit = 3 then 'yes without difficulty or errors'
	when levlwrit = 79 then 'Refused to answer'
	else 'null'
	end 
end;
go

execute peruliteracy_transformed;


create procedure vietnamliteracy_transformed
as 
begin
	update vietnam.literacy
	set enrol =
	case 
	when enrol = 0 then 'no'
	when enrol = 1 then 'yes'
	else 'null'
	end 

	update vietnam.literacy
	set levlread =
	case 
	when levlread = 1 then 'cant read anything'
	when levlread = 2 then 'reads letters'
	when levlread = 3 then 'reads word'
	when levlread = 4 then 'reads sentence'
	else 'null'
	end 

	update vietnam.literacy
	set levlwrit =
	case 
	when levlwrit = 1 then 'no'
	when levlwrit = 2 then 'yes with difficulty or errors'
	when levlwrit = 3 then 'yes without difficulty or errors'
	else 'null'
	end 
end;
go 

execute vietnamliteracy_transformed;

--ALTERING THE COLUMNS FOR MY PRIMARY KEY (childid, round) to not nullable(Ethiopia)
alter table ethiopia.basicamenity 
alter column childid varchar(50) not null;

alter table ethiopia.basicamenity 
alter column round varchar(50) not null;

--creating composite key by altering keys
alter table ethiopia.basicamenity
add constraint chiround primary key (childid,round);

--ALTERING THE COLUMNS FOR MY PRIMARY KEY (childid, round) to not nullable(Inida)
alter table india.basicamenity 
alter column childid varchar(50) not null;

alter table india.basicamenity 
alter column round varchar(50) not null;

--creating composite key by altering keys
alter table india.basicamenity
add constraint chiround_india primary key (childid,round);

--ALTERING THE COLUMNS FOR MY PRIMARY KEY (childid, round) to not nullable(Peru)
alter table peru.basicamenity 
alter column childid varchar(50) not null;

alter table peru.basicamenity 
alter column round varchar(50) not null;

--creating composite key by altering keys
alter table peru.basicamenity
add constraint chiround_peru primary key (childid,round);

--ALTERING THE COLUMNS FOR MY PRIMARY KEY (childid, round) to not nullable(Vietnam)
alter table vietnam.basicamenity 
alter column childid varchar(50) not null;

alter table vietnam.basicamenity 
alter column round varchar(50) not null;

--creating composite key by altering keys
alter table vietnam.basicamenity
add constraint chiround_vietnam primary key (childid,round);

--adding foriegn key to table(ethiopia.household)
alter table ethiopia.household 
add constraint childroundhh_fk foreign key (childid, round)
references ethiopia.basicamenity (childid, round);

--adding foriegn key to table(ethiopia.literacy)
alter table ethiopia.literacy 
add constraint childroundlit_fk foreign key (childid, round)
references ethiopia.basicamenity (childid, round);

--adding foriegn key to table(india.household)
alter table india.household 
add constraint indiachildroundhh_fk foreign key (childid, round)
references india.basicamenity (childid, round);

--adding foriegn key to table(india.literacy)
alter table india.literacy 
add constraint indiachildroundlit_fk foreign key (childid, round)
references india.basicamenity (childid, round);

--adding foriegn key to table(peru.household)
alter table peru.household 
add constraint peruchildroundhh_fk foreign key (childid, round)
references peru.basicamenity (childid, round);

--adding foriegn key to table(peru.literacy)
alter table peru.literacy 
add constraint peruchildroundlit_fk foreign key (childid, round)
references peru.basicamenity (childid, round);

--adding foriegn key to table(vietnam.household)
alter table vietnam.household 
add constraint vietnamchildroundhh_fk foreign key (childid, round)
references vietnam.basicamenity (childid, round);

--adding foriegn key to table(vietnam.literacy)
alter table vietnam.literacy 
add constraint vietnamchildroundlit_fk foreign key (childid, round)
references vietnam.basicamenity (childid, round);


--REPORT 1 (Effects of Area of residence on child school enrollment across the 4 countries) 

create procedure enrol_rate @country nvarchar(50)
as
begin

	with t_lit as (select country = case when childid like 'et%' then 'Ethiopia'
	when childid like 'in%' then 'India'
	when childid like 'pe%' then 'Peru'
	when childid like 'vn%' then 'Vietnam'
	end,
	 enrol, childid
	from 
	(select * from ethiopia.literacy
	union
	select * from india.literacy
	union 
	select * from peru.literacy
	union
	select * from vietnam.literacy) as l
	where enrol = 'Yes')

	select country, count(enrol) as count_enrol, typesite
	from t_lit
	inner join 
	(select * from ethiopia.household
	union 
	select * from india.household
	union
	select * from peru.household
	union
	select * from vietnam.household) as h
	on t_lit.childid = h.childid
	where typesite != 'null' and typesite != 'not known' and country = @country
	group by country, typesite 

end;
exec enrol_rate 'Ethiopia';

exec enrol_rate 'india';

exec enrol_rate 'peru';

exec enrol_rate 'vietnam'


--REPORT 2(Comparative analysis of how children in urban and rural residences can have access to electricity across the 4 countries when access to electricity is YES)

--IN INDIA 

create view India.ElectricityAnalysis
as
select typesite as residence_type, count(elecq_new) as electricity_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where elecq_new = 'yes' and hh.childid like 'in%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from india.ElectricityAnalysis;

 --REPORT 2(Comparative analysis of how children in urban and rural residences can have access to electricity across the 4 countries when access to electricity is YES)
 --IN ETHIOPIA

create view ETHIOPIA.ElectricityAnalysis
as
select typesite as residence_type, count(elecq_new) as electricity_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where elecq_new = 'yes' and hh.childid like 'et%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from ETHIOPIA.ElectricityAnalysis;


--REPORT 2(Comparative analysis of how children in urban and rural residences can have access to electricity across the 4 countries when access to electricity is YES)
--IN PERU

create view PERU.ElectricityAnalysis
as
select typesite as residence_type, count(elecq_new) as electricity_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where elecq_new = 'yes' and hh.childid like 'pe%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from PERU.ElectricityAnalysis;


--REPORT 2(Comparative analysis of how children in urban and rural residences can have access to electricity across the 4 countries when access to electricity is YES)
--IN VIETNAM

create view VIETNAM.ElectricityAnalysis
as
select typesite as residence_type, count(elecq_new) as electricity_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where elecq_new = 'yes' and hh.childid like 'vn%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from VIETNAM.ElectricityAnalysis;


--REPORT 2(Comparative analysis of how children in urban and rural residences can have access to electricity across the 4 countries when access to electricity is NO)

--IN INDIA 

create view India.ElectricityAnalysisNO
as
select typesite as residence_type, count(elecq_new) as electricity_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where elecq_new = 'no' and hh.childid like 'in%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from india.ElectricityAnalysisNO;

 --REPORT 2(Comparative analysis of how children in urban and rural residences can have access to electricity across the 4 countries when access to electricity is NO)
 --IN ETHIOPIA

create view ETHIOPIA.ElectricityAnalysisNO
as
select typesite as residence_type, count(elecq_new) as electricity_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where elecq_new = 'NO' and hh.childid like 'et%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from ETHIOPIA.ElectricityAnalysisNO;


--REPORT 2(Comparative analysis of how children in urban and rural residences can have access to electricity across the 4 countries when access to electricity is NO)
--IN PERU

create view PERU.ElectricityAnalysisNO
as
select typesite as residence_type, count(elecq_new) as electricity_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where elecq_new = 'NO' and hh.childid like 'pe%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from PERU.ElectricityAnalysisNO;


--REPORT 2(Comparative analysis of how children in urban and rural residences can have access to electricity across the 4 countries when access to electricity is NO)
--IN VIETNAM

create view VIETNAM.ElectricityAnalysisNO
as
select typesite as residence_type, count(elecq_new) as electricity_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where elecq_new = 'NO' and hh.childid like 'vn%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from VIETNAM.ElectricityAnalysisNO;


 --REPORT 3(Comparative analysis of households in urban and rural residences and their access to sanitation across the 4 countries when access to sanitation is NO(ETHIOPIA))

 
create view Ethiopia.SanitationAnalysisNO
as
select typesite as residence_area, count(toiletq_new) as NOsanitation_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where toiletq_new = 'NO' and hh.childid like 'et%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from Ethiopia.SanitationAnalysisNO;

 --REPORT 3(Comparative analysis of households in urban and rural residences and their access to sanitation across the 4 countries when access to sanitation is NO(INDIA))


 create view INDIA.SanitationAnalysisNO
as
select typesite as residence_area, count(toiletq_new) as NOsanitation_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where toiletq_new = 'NO' and hh.childid like 'IN%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from INDIA.SanitationAnalysisNO;


 --REPORT 3(Comparative analysis of households in urban and rural residences and their access to sanitation across the 4 countries when access to sanitation is NO(PERU))


 create view PERU.SanitationAnalysisNO
as
select typesite as residence_area, count(toiletq_new) as NOsanitation_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where toiletq_new = 'NO' and hh.childid like 'PE%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from PERU.SanitationAnalysisNO;


  --REPORT 3(Comparative analysis of households in urban and rural residences and their access to sanitation across the 4 countries when access to sanitation is NO(VIETNAM))

 create view VIETNAM.SanitationAnalysisNO
as
select typesite as residence_area, count(toiletq_new) as NOsanitation_access
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as hh 
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as ba
  on hh.childid = ba.childid
  where toiletq_new = 'NO' and hh.childid like 'VN%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from VIETNAM.SanitationAnalysisNO;

 --REPORT 4 (Effects of Area of residence on their lack of access to safe drinking water across the 4 countries) 

create procedure NOSafe_Water @country nvarchar(50)
as
begin

	with Nosafewater as (select country = case when childid like 'et%' then 'Ethiopia'
	when childid like 'in%' then 'India'
	when childid like 'pe%' then 'Peru'
	when childid like 'vn%' then 'Vietnam'
	end,
	 drwaterq_new, childid
	from 
	(select * from ethiopia.basicamenity
	union
	select * from india.basicamenity
	union 
	select * from peru.basicamenity
	union
	select * from vietnam.basicamenity) as l
	where drwaterq_new = 'no')

	select country, count(drwaterq_new) as Nosafewater, typesite
	from Nosafewater
	inner join 
	(select * from ethiopia.household
	union 
	select * from india.household
	union
	select * from peru.household
	union
	select * from vietnam.household) as h
	on Nosafewater.childid = h.childid
	where typesite != 'null' and typesite != 'not known' and country = @country
	group by country, typesite 

end;
exec NOSafe_Water 'Ethiopia';

exec NOSafe_Water 'india';

exec NOSafe_Water 'peru';

exec NOSafe_Water 'vietnam';


--Report 5(HOW MANY CHILDREN DO NOT IN THEIR HOUSEHOLD HAVE ACCESS TO ADEQUATE FUEL FOR COOKING IN THEIR HOUSEHOLD)
 
create view INDIA.NOaccess_to_cooking_fuel
as
select typesite as INDIA, count(cookingq_new) as noaccess_to_cooking_fuel
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as H
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as B
  on H.childid = B.childid
  where cookingq_new = 'NO' and H.childid like 'IN%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from INDIA.NOaccess_to_cooking_fuel;

 create view Ethiopia.NOaccess_to_cooking_fuel
as
select typesite as Ethiopia, count(cookingq_new) as noaccess_to_cooking_fuel
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as H
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as B
  on H.childid = B.childid
  where cookingq_new = 'NO' and H.childid like 'et%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from Ethiopia.NOaccess_to_cooking_fuel;

 create view Peru.NOaccess_to_cooking_fuel
as
select typesite as Peru, count(cookingq_new) as noaccess_to_cooking_fuel
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as H
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as B
  on H.childid = B.childid
  where cookingq_new = 'NO' and H.childid like 'pe%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from Peru.NOaccess_to_cooking_fuel;

 create view Vietnam.NOaccess_to_cooking_fuel
as
select typesite as Vietnam, count(cookingq_new) as noaccess_to_cooking_fuel
  from 
  (select * from ethiopia.household
  union
  select * from india.household
  union
  select * from peru.household
  union 
  select * from vietnam.household) as H
  inner join 
  (select * from ethiopia.basicamenity 
   union
  select * from india.basicamenity
  union
  select * from peru.basicamenity
  union 
  select * from vietnam.basicamenity) as B
  on H.childid = B.childid
  where cookingq_new = 'no' and H.childid like 'vietn%' and typesite != 'null' and typesite != 'not known'
  group by typesite;
 
 select * from Vietnam.NOaccess_to_cooking_fuel;

