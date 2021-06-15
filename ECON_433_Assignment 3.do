use "H:\Maimonides Data.dta", clear

*Figure 1A

gen f_csize= enrolment/ (int((enrolment-1)/40)+1)

egen mean_class_size= mean(class_size), by(enrolment) 
egen mean_f_csize= mean(f_csize), by(enrolment)

sort enrolment class_size f_csize

scatter mean_class_size enrolment || line mean_f_csize enrolment, lpatt(shortdash) lcolor(black) scheme(s1color) graphregion(color(white)) title("Figure 1a")


*Figure 2A

egen mean_testsc= mean(test_scores), by(enrolment)

sort enrolment mean_f_csize mean_testsc

line mean_testsc enrolment, yaxis(1) || line mean_f_csize enrolment, yaxis(2) lpatt(shortdash) lcolor(black) scheme(s1color) graphregion(color(white)) title("Figure 2a")



*Figure 3A

reg mean_testsc enrolment PD
predict resid_testsc, residual   

reg f_csize enrolment PD
predict resid_f_csize, residual

line resid_testsc enrolment, yaxis(1) ytitle("Test_scores residual") legend(label(1 test_scores residual)) || line resid_f_csize enrolment, yaxis(2) ytitle("FClass Size residual", axis(2)) legend(label(2 F_CSize residual))lpatt(shortdash) lcolor(black) scheme(s1color) graphregion(color(white)) title("Figure 3a")
