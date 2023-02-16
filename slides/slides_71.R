## ----packages-----------------------------------------------------------------
library(estimatr)
library(modelsummary)


## -----------------------------------------------------------------------------
dat <- read.csv('../data/banerjee-et-al.csv')

str(dat)


## ----table2, echo = FALSE-----------------------------------------------------
area_controls <- c('area_pop_base', 
                   'area_debt_total_base', 'area_business_total_base', 'area_exp_pc_mean_base', 'area_literate_head_base', 'area_literate_base')

controls <- paste(area_controls, collapse = ' + ')
outcomes <- c('spandana_1', 'othermfi_1', 'anymfi_1', 'anybank_1', 'anyinformal_1',  'anyloan_1', 'everlate_1', 'mfi_loan_cycles_1')

lm_list <- lm_list2 <- list()
for(out in outcomes){
  ff <- formula(paste0(out, ' ~ treatment +', controls))
  lm_list[[out]] <- lm_robust(ff, data = dat, clusters = areaid, weights = w1)
  lm_list2[[out]] <- mean(dat[which(dat$treatment ==0),out], na.rm = TRUE)
}

names(lm_list) <- c('Spandana', 'Other MFI', 'Any MFI', 'Other bank', 'Informal', 'Total', 'Ever Late', 'Num Cycles')
modelsummary(lm_list, stars = TRUE,
             coef_map = 'treatment', 
             add_rows = cbind(`Control mean` = 'Control mean', round(as.data.frame(lm_list2),3)), 
             # gof_omit = 'R2',
             output = '../assets/banerjee-et-al-table2.tex')


## -----------------------------------------------------------------------------

formula1 <- formula(paste0('spandana_1 ~ treatment', 
                           '+ area_pop_base',
                           '+ area_debt_total_base',
                           '+ area_business_total_base',
                           '+ area_exp_pc_mean_base',
                           '+ area_literate_head_base',
                           '+ area_literate_base'))

lm_robust(formula1, data = dat, clusters = areaid, weights = w1)


## -----------------------------------------------------------------------------

formula2 <- formula('spandana_1 ~ treatment')

lm_robust(formula2, data = dat, clusters = areaid, weights = w1)


## ----table2alt, echo = FALSE--------------------------------------------------

lm_list_alt<- list()
for(out in outcomes){
  ff <- formula(paste0(out, ' ~ treatment'))
  lm_list_alt[[out]] <- lm_robust(ff, data = dat, clusters = areaid, weights = w1)
}

names(lm_list_alt) <- c('Spandana', 'Other MFI', 'Any MFI', 'Other bank', 'Informal', 'Total', 'Ever Late', 'Num Cycles')
modelsummary(lm_list_alt, stars = TRUE,
             coef_map = 'treatment', 
             add_rows = cbind(`Control mean` = 'Control mean', round(as.data.frame(lm_list2),3)), 
             # gof_omit = 'R2',
             output = '../assets/banerjee-et-al-table2alt.tex')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
hist(rnorm(10))


## ----echo = FALSE-------------------------------------------------------------
f <- 'slides_71.Rnw'
knitr::purl(f)
knitr::Sweave2knitr(f)

