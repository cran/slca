library(magrittr)
names(nlsy97)
nlsy_jlcpa %>% regress(SMK_98 ~ SEX, nlsy97)
\donttest{
nlsy_jlcpa %>% regress(SUB_98 ~ SEX, nlsy97)
nlsy_jlcpa %>% regress(PROF ~ SEX, nlsy97)
}
