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
path.temp="D:\\CloudStation\\Professional\\Research Data\\Hospital Cost Reports"


########################################################################################
## Combine different HCRIS versions (1996 and 2010)
########################################################################################
source(paste(path.code,"\\H1_HCRISv1996.R",sep=""),local=TRUE,echo=FALSE)
source(paste(path.code,"\\H2_HCRISv2010.R",sep=""),local=TRUE,echo=FALSE)

## create missing variables for columns introduced in v2010 of hcris forms
final.hcris.v1996 = final.hcris.v1996 %>%
  mutate(hvbp_payment=NA, hrrp_payment=NA)

## combine v1996 and v2010 hcris forms, and sort by provider_number/year
final.hcris=rbind(final.hcris.v1996,final.hcris.v2010) %>%
  arrange(provider_number,year)

## count of hospitals/provider_number by year
final.hcris %>% group_by(year) %>% count()




########################################################################################
## Spot check with original data pull
########################################################################################
HCRIS.check=read_csv(paste(path.temp,"\\Final HCRIS Data\\HospitalData_2008.txt",sep=""))
final.hcris.v1996 %>% filter(provider_number==332008, year==2008) %>% select(beds,tot_charges,tot_discounts,tot_operating_exp,ip_charges)
HCRIS.check %>% filter(Provider_Number==332008) %>% select(Beds,Tot_Charges,Tot_Discounts,Tot_OpExp,IP_Charges)

final.hcris.v1996 %>% filter(provider_number==332008, year==2008) %>% select(ancillary_charges,tot_discharges,mcare_discharges,mcaid_discharges,tot_mcare_payment,secondary_mcare_payment)
HCRIS.check %>% filter(Provider_Number==332008) %>% select(AncServ_Charges,Total_Discharges,Mcare_Discharges,Mcaid_Discharges,Tot_McarePymt,Sec_McarePymt)

HCRIS.check=read_csv(paste(path.temp,"\\Final HCRIS Data\\HospitalData_2015.txt",sep=""))
final.hcris.v2010 %>% filter(provider_number==332008, year==2015) %>% select(beds,tot_charges,tot_discounts,tot_operating_exp,ip_charges)
HCRIS.check %>% filter(Provider_Number==332008) %>% select(Beds,Tot_Charges,Tot_Discounts,Tot_OpExp,IP_Charges)

final.hcris.v2010 %>% filter(provider_number==332008, year==2015) %>% select(ancillary_charges,tot_discharges,mcare_discharges,mcaid_discharges,tot_mcare_payment,secondary_mcare_payment,hvbp_payment,hrrp_payment)
HCRIS.check %>% filter(Provider_Number==332008) %>% select(AncServ_Charges,Total_Discharges,Mcare_Discharges,Mcaid_Discharges,Tot_McarePymt,Sec_McarePymt,HVBP_Payment,HRRP_Payment)

