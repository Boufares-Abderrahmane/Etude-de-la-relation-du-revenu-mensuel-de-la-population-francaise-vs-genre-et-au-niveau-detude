##les packages##
library(questionr)
library(Hmisc)
library(gtsummary)
library(tidyverse)
library(funModeling)
library(tidyverse)
library(summarytools)
library(tidyr)
library(writexl)
gtsummary::theme_gtsummary_language("fr")
####Analyse univarie####
##Analyse uni quan##
dim(`Genre_Educ_Rev(1)`)
str(`Genre_Educ_Rev(1)`)
summary(`Genre_Educ_Rev(1)`)
df<-`Genre_Educ_Rev(1)`
m<-mean(df$Salaire)
m
me<-median(df$Salaire)
me
min<-min(df$Salaire)
max<-madf$Salaire)
n<-nrow(df)
n
s<-sd(df$Salaire)
s
sc<-sqrt((6400/6399)*(s)^2)
sc
IC<-m+c(-1,1)*1.96*(sc/sqrt(n))
IC
quantile(df$Salaire, probs = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1))
pop<-rnorm(6400,m, sc)
pop
plot(density(df$Salaire))
t.test(df$Salaire,mu=mean(df$Salaire))##estimation de la moyen par intervalle de confiance:[2175.646,2217.012]##

boxplot(df$Salaire,legend.text = TRUE, main = "Salaire",
        xlab = "Reussite", ylab = "Effectifs")
##Analyse uni quali/educ##
df$Educ<-factor(df$Educ, labels=c("Avant BAC","BAC","BAC+2","BAC+3","BAC+5 et plus "))
summary(df$Educ)
prop.table(table(df$Educ))
binconf(600,6400,method="all",0.05) ## Estimation de l'intervalle de confiance pour niveau avant Bac
"est de [0.08671704,0.1011556] et une estimation ponctuel de 0.09375"##
binconf(1800,6400,method="all",0.05)## Estimation de l'intervalle de confiance pour niveau Bac
"est de [0.2702583,0.2924413] et une estimation ponctuel de 0.28125"##
binconf(1500,6400,method="all",0.05)## Estimation de l'intervalle de confiance pour niveau Bac+2
"est de [0.2240416,0.2449510] et une estimation ponctuel de 0.234375"##
binconf(1000,6400,method="all",0.05)## Estimation de l'intervalle de confiance pour niveau Bac+3
"est de [0.1474344,0.1653800] et une estimation ponctuel de 0.15625"##
binconf(1500,6400,method="all",0.05)## Estimation de l'intervalle de confiance pour niveau Bac+5 et plus
"est de [0.2240416,0.2449510] et une estimation ponctuel de 0.234375"##
prop.test(c(600,1800),c(6400,6400))
prop.test(c(600,1500),c(6400,6400))
prop.test(c(600,1000),c(6400,6400))
prop.test(c(600,1800),c(6400,6400))
tab2<-table(df$Educ)
tab2
barplot(prop.table(tab2),main="Diagramme en Barres des niveaux d'étude de l'echantillon",
        xlab="niveau d'études", ylab="Proportions", ylim=c(0,0.3),col=c("dodgerblue"),border=NA)

text(Graph_PCS,tab2+20,c("17.3%","25.1%","16.6%","40.9%"),cex=1)
##Analyse uni quali/genre##
df$Genre<-factor(df$Genre, labels=c("Femme","Homme"))
binconf(3249,6400,0.05,method ="all")
binconf(3151,6400,0.05,method ="all")
pt1<-prop.table(table(df$Genre))
prop.test(c(3249,3151),c(6400,6400))
prop.test(c(3151,3249),c(6400,6400))
summary(df$Genre)
t1<-table(df$Genre)
##Analyse bivarie salaire/edu##
df$Educ<-factor(df$Educ, labels=c("Avant BAC","BAC","BAC+2","BAC+3","BAC+5 et plus "))
pairwise.t.test(df$Salaire,df$Educ)
df%>%
  select(Salaire,Educ) %>%
  tbl_summary(by=Educ,
              label=list(Salaire~"Salaire moyen par niveau d'education"),
              statistic = list(all_continuous()~"{mean}({sd})"),
              digits=all_continuous()~2,
              include = c(Salaire) )
add_n() %>%
  add_difference(pvalue_fun = ~style_pvalue(.x, digits = 2))
anova(lm(df$Salaire~df$Educ))
tab1<-table(df$Educ,df$Salaire)
t.test(df$Salaire,mu=mean(df$Salaire))
##Analyse bivarie salaire/Genre##
pairwise.t.test(df$Salaire,df$Genre)
df %>%
  select(Salaire,Genre) %>%
  tbl_summary(by=Genre,
              label=list(Salaire~"Salaire moyen par genre"),
              statistic = list(all_continuous()~"{mean}({sd})"),
              digits=all_continuous()~2,
              include = c(Salaire) )%>%
  add_n()
var_moy=anova(lm(df$Salaire~df$Educ))[1,2]/n
moy_var<-anova(lm(df$Salaire~df$Educ))[2,2]/n
wilcox.test(df$Salaire[df$Genre=="Femme"],df$Salaire[df$Genre=="Homme"])
anova(lm(df$Salaire~df$Genre))
##Analyse bivarie genre/edu##
df %>%
  select(Educ,Genre) %>%
  tbl_summary(by=Genre
  )
df %>%
  tbl_cross(
    row=Genre,
    col=Educ,
    label=list(Educ~"Niveau d'education",Genre~"Genre"),
    percent="row"
  )
a<-table(df$Educ,df$Genre)
a
chisq.test(a)
cramer.v(a)
##Analyse bivarie Salaire/genre/edu##

df %>%
  select(Educ,Salaire,Genre) %>%
  tbl_summary(by=Genre,
              label=list(Educ~"Niveau d'éducation des individus"),
              statistic = list(all_continuous()~"{mean}({median})"))
kruskal.test(data=df,df$Salaire~df$Educ)
n<-length(df$Educ)
var_moy=anova(lm(df$Salaire~df$Educ))[1,2]/n
moy_var<-anova(lm(df$Salaire~df$Educ))[2,2]/n
rap_cor<-sqrt(var_moy/(var_moy+moy_var))
rap_cor
prop.test(c(299,301),c(3249,3151))
prop.test(c(870,930),c(3249,3151))
prop.test(c(495,505),c(3249,3151))
prop.test(c(794,706),c(3249,3151))
prop.test(c(794,706),c(3249,3151))
