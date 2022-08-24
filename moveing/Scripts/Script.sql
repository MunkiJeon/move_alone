select * from calculate where c_date >= '2022-08-01' and c_date <= '2022-08-30';

update matching set start_point = "sfse", end_point = 'sdfsd' where res_num = 22001001 

insert into scategory values(nextval(scateseq), ?, '응', 5);

select count(level) from user where level = 1;

select count(reservat_date) from matching where reservat_date >= '2022-08-25' and reservat_date < '2022-08-26';


select pro.NO, pro.LCNAME, scate.name as SCNAME, pro.NAME, pro.ORIPRICE,
					 pro.DISCPRICE, pro.INFO, pro.MAINIMGN 
					from scategory scate inner join (select pro.NO, lcate.NAME as lcname, pro.SCNO, pro.NAME, 
					pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN 
					from lcategory lcate inner join product pro 
					on lcate.no = pro.lcno) pro 
					on scate.no = pro.scno ;
				
				
select lcate.no as lno, lcate.name as lname, lcate.step as lstep, scate.no as sno, scate.name as sname, scate.step as sstep
from (select * from lcategory order by step asc) lcate left outer join (select * from scategory order by lcno asc, step asc) scate
on lcate.no = scate.lcno
order by lstep asc, sstep asc
					
				
select lcate.no as lno, lcate.name as lname, lcate.step as lstep, scate.no as sno, scate.name as sname, scate.step as sstep
from (select * from lcategory order by step asc) lcate left outer join (select * from scategory order by lcno asc, step asc) scate
on lcate.no = scate.lcno
order by lstep asc, sstep asc


select * from lcategory order by step asc


ALTER TABLE stock 
ADD CONSTRAINT fk
FOREIGN KEY (no)
REFERENCES product (no);

ALTER TABLE calculate  ADD no int(10);

update product set count = 100 where no = 1;
update product set count = 121 where no = 2;
update product set count = 143 where no = 10;
update product set count = 213 where no = 11;
update product set count = 192 where no = 14;


ALTER TABLE calculate ADD CONSTRAINT ws PRIMARY KEY (no);

ALTER TABLE calculate MODIFY no INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE calculate MODIFY no INT NOT NULL AUTO_INCREMENT;

