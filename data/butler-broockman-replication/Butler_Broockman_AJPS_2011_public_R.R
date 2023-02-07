#Set working directory
setwd("/Users/mdweaver/Desktop/ISPS Work 2013/Butler_Broockman_AJPS_2011/")

#Load data
library(foreign)
data <- read.dta("Butler_Broockman_AJPS_2011_public_dta.dta", convert.factors=F)

#################################################################
#This public data file does not include the control variables,###
#because we made a commitment to the IRB to keep the legislators#
#in the experiment anonymous. Consequently, this R file does not#
#recreate the tables in the appendices or supporting information#
#document that use these control variables.######################
#################################################################

#########
#Table 1#
#########
#No primary
out.1.1 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_noprimary==1,])
summary(out.1.1)

#Democratic Primary
out.1.2 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_demprimary==1,])
summary(out.1.2)

#Republican Primary
out.1.3 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_repprimary==1,])
summary(out.1.3)

#Primary
out.1.4 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_primary==1,])
summary(out.1.4)

###
out.1.5 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_deshawn==1 & data$treat_primary==1,])
summary(out.1.5)

out.1.6 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_jake==1 & data$treat_primary==1,])
summary(out.1.6)

out.1.7 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_primary==1,])
summary(out.1.7)


#########
#Table 2#
#########
#Republican Legislators
out.2.1 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_noprimary==1 & data$leg_republican==1,])
summary(out.2.1)

out.2.2 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_repprimary==1 & data$leg_republican==1,])
summary(out.2.2)

out.2.3 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_demprimary==1 & data$leg_republican==1,])
summary(out.2.3)

out.2.4 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_primary==1 & data$leg_republican==1,])
summary(out.2.4)

out.2.5 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_deshawn==1 & data$treat_primary==1 & data$leg_republican==1,])
summary(out.2.5)

out.2.6 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_jake==1 & data$treat_primary==1 & data$leg_republican==1,])
summary(out.2.6)

out.2.7 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_primary==1 & data$leg_republican==1,])
summary(out.2.7)

#Democratic legislators
out.2.8 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_noprimary==1 & data$leg_republican==0,])
summary(out.2.8)

out.2.9 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_repprimary==1 & data$leg_republican==0,])
summary(out.2.9)

out.2.10 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_demprimary==1 & data$leg_republican==0,])
summary(out.2.10)

out.2.11 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_primary==1 & data$leg_republican==0,])
summary(out.2.11)

out.2.12 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_deshawn==1 & data$treat_primary==1 & data$leg_republican==0,])
summary(out.2.12)

out.2.13 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_jake==1 & data$treat_primary==1 & data$leg_republican==0,])
summary(out.2.13)

out.2.14 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_primary==1 & data$leg_republican==0,])
summary(out.2.14)


#########
#Table 3#
#########
#White Democrats
out.3.1 <- lm(reply_atall ~ treat_deshawn, data=data[data$leg_republican==0 & data$leg_white==1 & data$treat_noprimary==1,])
summary(out.3.1)

#Non-white Democrats
out.3.2 <- lm(reply_atall ~ treat_deshawn, data=data[data$leg_republican==0 & data$leg_notwhite==1 & data$treat_noprimary==1,])
summary(out.3.2)

#White Republicans
out.3.3 <- lm(reply_atall ~ treat_deshawn, data=data[data$leg_republican==1 & data$leg_white==1 & data$treat_noprimary==1,])
summary(out.3.3)

#Non-white Republicans
out.3.4 <- lm(reply_atall ~ treat_deshawn, data=data[data$leg_republican==1 & data$leg_notwhite==1 & data$treat_noprimary==1,])
summary(out.3.4)


#############################
#Supporting Information File#
#############################
#######################
#Appendix C, Table SI2#
#######################

#Part (a): White Republicans
out.c.a1 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_noprimary==1 & data$leg_republican==1 & data$leg_white==1,])
summary(out.c.a1)

out.c.a2 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_repprimary==1 & data$leg_republican==1 & data$leg_white==1,])
summary(out.c.a2)

out.c.a3 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_demprimary==1 & data$leg_republican==1 & data$leg_white==1,])
summary(out.c.a3)

out.c.a4 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_primary==1 & data$leg_republican==1 & data$leg_white==1,])
summary(out.c.a4)

out.c.a5 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_deshawn==1 & data$treat_primary==1 & data$leg_republican==1 & data$leg_white==1,])
summary(out.c.a5)

out.c.a6 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_jake==1 & data$treat_primary==1 & data$leg_republican==1 & data$leg_white==1,])
summary(out.c.a6)

out.c.a7 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_primary==1 & data$leg_republican==1 & data$leg_white==1,])
summary(out.c.a7)


#Part (b): Minority Republicans
out.c.b1 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_noprimary==1 & data$leg_republican==1 & data$leg_notwhite==1,])
summary(out.c.b1)

out.c.b2 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_repprimary==1 & data$leg_republican==1 & data$leg_notwhite==1,])
summary(out.c.b2)

out.c.b3 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_demprimary==1 & data$leg_republican==1 & data$leg_notwhite==1,])
summary(out.c.b3)

out.c.b4 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_primary==1 & data$leg_republican==1 & data$leg_notwhite==1,])
summary(out.c.b4)

out.c.b5 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_deshawn==1 & data$treat_primary==1 & data$leg_republican==1 & data$leg_notwhite==1,])
summary(out.c.b5)

out.c.b6 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_jake==1 & data$treat_primary==1 & data$leg_republican==1 & data$leg_notwhite==1,])
summary(out.c.b6)

out.c.b7 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_primary==1 & data$leg_republican==1 & data$leg_notwhite==1,])
summary(out.c.b7)

#Part (c): White Democrats
out.c.c1 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_noprimary==1 & data$leg_republican==0 & data$leg_white==1,])
summary(out.c.c1)

out.c.c2 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_repprimary==1 & data$leg_republican==0 & data$leg_white==1,])
summary(out.c.c2)

out.c.c3 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_demprimary==1 & data$leg_republican==0 & data$leg_white==1,])
summary(out.c.c3)

out.c.c4 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_primary==1 & data$leg_republican==0 & data$leg_white==1,])
summary(out.c.c4)

out.c.c5 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_deshawn==1 & data$treat_primary==1 & data$leg_republican==0 & data$leg_white==1,])
summary(out.c.c5)

out.c.c6 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_jake==1 & data$treat_primary==1 & data$leg_republican==0 & data$leg_white==1,])
summary(out.c.c6)

out.c.c7 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_primary==1 & data$leg_republican==0 & data$leg_white==1,])
summary(out.c.c7)

#Part (d): Black Democrats
out.c.d1 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_noprimary==1 & data$leg_republican==0 & data$leg_black==1,])
summary(out.c.d1)

out.c.d2 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_repprimary==1 & data$leg_republican==0 & data$leg_black==1,])
summary(out.c.d2)

out.c.d3 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_demprimary==1 & data$leg_republican==0 & data$leg_black==1,])
summary(out.c.d3)

out.c.d4 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_primary==1 & data$leg_republican==0 & data$leg_black==1,])
summary(out.c.d4)

out.c.d5 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_deshawn==1 & data$treat_primary==1 & data$leg_republican==0 & data$leg_black==1,])
summary(out.c.d5)

out.c.d6 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_jake==1 & data$treat_primary==1 & data$leg_republican==0 & data$leg_black==1,])
summary(out.c.d6)

out.c.d7 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_primary==1 & data$leg_republican==0 & data$leg_black==1,])
summary(out.c.d7)

#Part (e): Non-black Minority Democrats
out.c.e1 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_noprimary==1 & data$leg_republican==0 & data$leg_notblackotherminority==1,])
summary(out.c.e1)

out.c.e2 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_repprimary==1 & data$leg_republican==0 & data$leg_notblackotherminority==1,])
summary(out.c.e2)

out.c.e3 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_demprimary==1 & data$leg_republican==0 & data$leg_notblackotherminority==1,])
summary(out.c.e3)

out.c.e4 <- lm(reply_atall ~ treat_deshawn, data=data[data$treat_primary==1 & data$leg_republican==0 & data$leg_notblackotherminority==1,])
summary(out.c.e4)

out.c.e5 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_deshawn==1 & data$treat_primary==1 & data$leg_republican==0 & data$leg_notblackotherminority==1,])
summary(out.c.e5)

out.c.e6 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_jake==1 & data$treat_primary==1 & data$leg_republican==0 & data$leg_notblackotherminority==1,])
summary(out.c.e6)

out.c.e7 <- lm(reply_atall ~ treat_repprimary, data=data[data$treat_primary==1 & data$leg_republican==0 & data$leg_notblackotherminority==1,])
summary(out.c.e7)