
bro 

sort serial pernum


*First some data transformation 

*generate mothers

gen women=. 
replace women=1 if sex==2 & age>=30 & age<=45 & race==1 & women==.


gen married_women=1 if women==1 & pernum==sploc[_n-1] &serial==serial[_n-1]


*generate husbands but first recode labforce

recode labforce (1=0 "No") (2=1 "Yes"), gen(labforce1)

gen hus_labforce=. 
gen hus_inctot=.
gen hus_incearn=. 
gen hus_educd=.


replace hus_labforce=labforce1[_n-1] if married_women==1 & pernum==sploc[_n-1]

replace hus_inctot=inctot[_n-1] if married_women==1 & pernum==sploc[_n-1]

replace hus_incearn=incearn[_n-1] if married_women==1 & pernum==sploc[_n-1]

replace hus_educd=educd[_n-1] if married_women==1 & pernum==sploc[_n-1]


/*recode educd. 1-9 follows the sequence from top to bottom of education 
categories as presented in the table, i.e. 1001=5-8 years to 1009=PhD*/

recode educd (021=1001) (024=1001) (030=1002) (040=1003) (050=1004) ///
(061=1005) (062=1006) (065=1007) (071=1007) (081=1007) (101=1008) /// 
(114=1009) (115=1009) (116=1010) 

tab educd

***************************Table 1****************************	

*Age 
sum age if women==1

*Currently married 
gen curmarr=1 if women==1 & marst==1 
replace curmarr=0 if curmarr==. 
sum curmarr if women==1 

*Never married 

gen nevmarr=1 if women==1 & marst==6
replace nevmarr=0 if nevmarr==. 
sum nevmarr if women==1 

*In labour force 

gen w_inlab=1 if labforce1==1 & women==1 
replace w_inlab=0 if w_inlab==. 
sum w_inlab if women==1 

*Total inc 

sum inctot if women==1

*Total earnings 

sum incearn if women==1 

*Total earnings for workers 

sum incearn if women==1 & empstat==1 

*Education 

gen edu5to8=.
replace edu5to8=1 if educd==1001 & women==1
replace edu5to8=0 if edu5to8==.
sum edu5to8 if women==1

gen edu9=. 
replace edu9=1 if educd==1002 & women==1
replace edu9=0 if edu9==.
sum edu9 if women==1

gen edu10=. 
replace edu10=1 if educd==1003 & women==1
replace edu10=0 if edu10==.
sum edu10 if women==1

gen edu11=. 
replace edu11=1 if educd==1004 & women==1
replace edu11=0 if edu11==.
sum edu11 if women==1

gen edu12nd=.
replace edu12nd=1 if educd==1005 & women==1
replace edu12nd=0 if edu12nd==.
sum edu12nd if women==1

gen edu12d=.
replace edu12d=1 if educd==1006 & women==1
replace edu12d=0 if edu12d==.
sum edu12d if women==1

gen edusomcol=.
replace edusomcol=1 if educd==1007 & women==1
replace edusomcol=0 if edusomcol==.
sum edusomcol if women==1

gen educol=. 
replace educol=1 if educd==1008 & women==1
replace educol=0 if educol==.
sum educol if women==1


gen edumas=. 
replace edumas=1 if educd==1009 & women==1
replace edumas=0 if edumas==.
sum edumas if women==1

gen eduphd=. 
replace eduphd=1 if educd==1010 & women==1
replace eduphd=0 if eduphd==.
sum eduphd if women==1


/**Husband in labour force (husbands of married women, hence I 
added more restrictions to the subsample, see 14, 27-33)**/

sum hus_labforce

**Husband's total income
sum hus_inctot 

**Husband's total earnings
sum hus_incearn

**Husband's education 

gen husedu5to8=.
replace husedu5to8=1 if educd[_n-1]==1001 & married_women==1
replace husedu5to8=0 if husedu5to8==.
sum husedu5to8 if married_women==1

gen husedu9=. 
replace husedu9=1 if educd[_n-1]==1002 & women==1
replace husedu9=0 if husedu9==.
sum edu9 if married_women==1

gen husedu10=. 
replace husedu10=1 if educd[_n-1]==1003 & women==1
replace husedu10=0 if husedu10==.
sum husedu10 if married_women==1

gen husedu11=. 
replace husedu11=1 if educd[_n-1]==1004 & women==1
replace husedu11=0 if husedu11==.
sum husedu11 if married_women==1

gen husedu12nd=.
replace husedu12nd=1 if educd[_n-1]==1005 & women==1
replace husedu12nd=0 if husedu12nd==.
sum husedu12nd if married_women==1

gen husedu12d=.
replace husedu12d=1 if educd[_n-1]==1006 & women==1
replace husedu12d=0 if husedu12d==.
sum husedu12d if married_women==1

gen husedusomcol=.
replace husedusomcol=1 if educd[_n-1]==1007 & women==1
replace husedusomcol=0 if husedusomcol==.
sum husedusomcol if married_women==1

gen huseducol=. 
replace huseducol=1 if educd[_n-1]==1008 & women==1
replace huseducol=0 if huseducol==.
sum huseducol if married_women==1

gen husedumas=. 
replace husedumas=1 if educd[_n-1]==1009 & women==1
replace husedumas=0 if husedumas==.
sum husedumas if married_women==1

gen huseduphd=. 
replace huseduphd=1 if educd[_n-1]==1010 & women==1
replace huseduphd=0 if huseduphd==.
sum huseduphd if married_women==1


