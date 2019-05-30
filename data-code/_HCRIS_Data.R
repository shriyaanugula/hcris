########################################################################################
## Author:        Ian McCarthy
## Date Created:  5/30/2019
## Date Edited:   5/30/2019
## Notes:         R file to call other HCRIS code and combine data
########################################################################################
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr)

########################################################################################
## Set file paths
########################################################################################
path.code="D:\\CloudStation\\Professional\\Research Projects\\_Git\\HCRIS\\data-code"
path.data="D:\\CloudStation\\Professional\\Research Projects\\_Git\\HCRIS\\data"


########################################################################################
## Run code for different HCRIS versions (1996 and 2010)
########################################################################################
source(paste(path.code,"\\H1_HCRISv1996.R",sep=""),local=TRUE,echo=FALSE)
source(paste(path.code,"\\H2_HCRISv2010.R",sep=""),local=TRUE,echo=FALSE)


final.hcris.v2010 %>% filter(provider_number==332008)
final.hcris.v1996 %>% group_by(year) %>% count()
final.hcris.v2010 %>% group_by(year) %>% count()
