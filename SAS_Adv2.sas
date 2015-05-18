/* first, run chol_raw.sas to create sas data set CHOL in the work directory */

/* Create variables hdl_hi, age_hi, tg_hi, and bmi_hi */
data chol_cats;
	set chol;
	hdl_hi = hdl > 47;
	age_hi = age > 17;
	tg_hi = tg > 68;
	bmi_hi = bmi > 3.0718476;
run;

/* Part 1A */
title 'Part 1A';
title2 'proc freq : hdl_hi = age_hi , test for interaction';
proc freq data=chol_cats;
	tables gender*age_hi*hdl_hi / chisq relrisk cmh;
run;

/* Part 1B */
title 'Part 1B';
title2 'proc logistic : hdl_hi = age_hi , test for interaction';
proc logistic data=chol_cats;
	model hdl_hi (event='1') = age_hi gender age_hi*gender;
run;

/* female study */
title 'Part 1B';
title2 'proc logistic: hdl_hi = age_hi (females only)';
proc logistic data=chol_cats;
	where gender = 1;
	model hdl_hi (event='1') = age_hi;
run;

/* male study */
title 'Part 1B';
title2 'proc logistic: hdl_hi = age_hi (males only)';
proc logistic data=chol_cats;
	where gender = 0;
	model hdl_hi (event='1') = age_hi;
run;

/* Part 2A */
title 'Part 2A';
title2 'proc freq: tg_hi = bmi_hi , tests for confounding';
proc freq data=chol_cats;
	tables bmi_hi*tg_hi / chisq relrisk;
    tables age_hi*bmi_hi*tg_hi / chisq relrisk cmh;
	tables gender*bmi_hi*tg_hi / chisq relrisk cmh;
run;

/* Part 2B */
title 'Part 2B';
title2 'proc logistic: tg_hi = bmi_hi';
proc logistic data=chol_cats;
	model tg_hi (event='1') = bmi_hi;
run;

title 'Part 2B';
title2 'proc logistic: tg_hi = bmi_hi age_hi';
proc logistic data=chol_cats;
	model tg_hi (event='1') = bmi_hi age_hi;
run;

title 'Part 2B';
title2 'proc logistic: tg_hi = bmi_hi gender';
proc logistic data=chol_cats;
	model tg_hi (event='1') = bmi_hi gender;
run;