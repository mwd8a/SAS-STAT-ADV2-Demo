Advanced SAS Demo 2
===================

## Overview

In this demonstration, we test some variables for *effect modification* and *confounding*. This is accomplished by categorical analysis and logistic regression. The key SAS procedures used are PROC FREQ and PROC LOGISTIC. 

The data set CHOL is created by running the code in **chol_raw.sas**. The variables in this data set are given below
 
* **ID** for *Subject ID*
* **AGE** for *Age*
* **HT** for *Height*
* **WT** for *Weight*
* **SBP** for *Systolic Blood Pressure*
* **DBP** for *Diastoloic Blood Pressure*
* **HDL** for *High Density Lipids*
* **GENDER** for *'male' or 'female'*
* **TG** for *Triglycerides*
* **BMI** for *Body mass index*

The values for GENDER are then coded as 0='male' and 1='female'. The SAS data set **CHOL\_CATS** is created by setting **CHOL** and adding categorical variables

* **HDL\_HI** : value is 1 (if HDL > 47) and 0 otherwise
* **AGE\_HI** : value is 1 (if AGE > 17) and 0 otherwise
* **TG\_HI** : value is 1 (if TG > 68) and 0 otherwise
* **BMI\_HI** : value is 1 (if BMI > 3.0718476) and 0 otherwise

The file **SAS_Adv2.sas** contains the SAS code from the analysis. The SAS output can be viewed in the file **Results / SAS_Adv2.sas.pdf**. 

A detailed account of the analysis can be read in the file **SAS_Stat_Adv2.pdf**.

## Part 1A

We examine whether GENDER (Z-variable) modifies the association between HDL\_HI (Y-variable) and AGE\_HI (X-variable) using PROC FREQ. 

## Part 1B

We examine whether GENDER (Z-variable) modifies the association between HDL\_HI (Y-variable) and AGE\_HI (X-variable) using PROC LOGISTIC. 

## Part 2A

We examine whether AGE\_HI (Z-variable) is a confounder for the association between TG\_HI (Y-variable) and BMI\_HI (X-variable) using PROC FREQ.

## Part 2B

We examine whether AGE\_HI (Z-variable) is a confounder for the association between TG\_HI (Y-variable) and BMI\_HI (X-variable) using PROC LOGISTIC. 