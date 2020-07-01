proc import 
out=CUSPtemp 
datafile=/*location of CUSP dataset*/ 
DBMS=xlsx replace; 
getnames=yes;
run;
data cusp;
set cusptemp;
if state ne '';
run;
proc import 
out=CRDT
datafile=/*location of CRDT dataset*/ 
DBMS=csv replace; 
getnames=yes;
run;

proc sql;
create table CRDT_CUSP as
select a.*,b.*
from cusp a left join CRDT b 
on a.POSTCODE=b.STATE
;
quit;
