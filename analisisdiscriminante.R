# analisismultivariado
#En este repositorio se encuentran código en R para el desarrollo de técnicas estadísticas para el análisis multivariado.
dismodel<-lda(df$factor~df$var1+df$var2+df$var3)
dismodel
predicdis<-predict(dismodel,df)$class
predicdis
df$predicdis<-predicdis
sum(df$varfactor == df$predicdis)
tea <- 1 - sum(df$varfactor == df$predicdis)/sum(complete.cases(df))
