# Healthcare Cost Report Information System (HCRIS)
This repository provides the necessary code and links to download and organize key hospital information contained in the Healthcare Cost Report Information System.

## Raw Data
All of the raw data are publicly available from the Centers for Medicare and Medicaid Services (CMS) website: [HCRIS DATA](https://www.cms.gov/Research-Statistics-Data-and-Systems/Downloadable-Public-Use-Files/Cost-Reports/Cost-Reports-by-Fiscal-Year.html). These data are also available through the NBER: [NBER HCRIS Data](https://www.nber.org/data/hcris.html). 

The flat files in the NBER source should match to the raw files downloadable from CMS, but the NBER page includes additional details and links to more documentation. You can also access a subset of variables directly as SAS, Stata, or .csv files, in which case you don't need any of the raw data or the code below.

## Raw Code Files
After downloading the flat files, the following code files will extract selected variables and form a final analytic dataset. There are two R code files, one for each of the different versions of HCRIS worksheets (v1996 at [H1_HCRISv1996.R](https://github.com/imccart/HCRIS/blob/master/data-code/H1_HCRISv1996.R) and v2010 at [H2_HCRISv2010.R](https://github.com/imccart/HCRIS/blob/master/data-code/H2_HCRISv2010.R), respectively). 

The top sections of each of the code files assign the location of the selected variables. These code files are almost identical; however, not all variables are in the same location of the HCRIS worksheets under v1996 and v2010. New variables can easily be added if you know the worksheet, line number, and column number of the relevant variable. If the variable is numeric, it should be in the numeric tables, and if its a character, it should be in the alphanumeric tables. This information should be indicated in the "source" column when assigning each variable's location, with possible values of 'numeric' or 'alpha'. 


## Master Code File
There is also a master code file that calls each of the individual code files and organizes the resulting data into unique hospital/year combinations. [_HCRIS_Data.R](https://github.com/imccart/HCRIS/blob/master/data-code/HCRIS_Data.R)
