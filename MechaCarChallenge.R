library(dplyr)

mecha <- read.csv(file="MechaCar_mpg.csv")

mecha_Lm = lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = mecha)

summary(mecha_Lm)

suspension <- read.csv(file="Suspension_Coil.csv")

total_summary <- suspension %>% summarize(Mean = mean(PSI), Median = median(PSI), 
                                          Variance = var(PSI), SD = sd(PSI))

lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), 
                                      Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

t.test(suspension$PSI,mu=1500)

t.test(subset(suspension,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(suspension,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(suspension,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)
