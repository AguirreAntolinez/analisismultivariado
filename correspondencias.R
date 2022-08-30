#Cargar librerias
paquetes<-c("readxl","summarytools","dplyr","factoextra","FactoMineR")
sapply(paquetes,require,character.only = TRUE)
#Cargar data
data<- read_excel("C:/Users/Desktop/ICFES/data_medellin.xlsx")
#Crear tabla de contingencia
tabla<-table(data$FAMI_EDUCACIONMADRE,data$PERCENTIL_GLOBAL)
#Generar coordenadas del análisis
ac<-CA(tabla, ncp = 5, graph = TRUE)
#Se valida significancia estadística 
chisq.test(data$FAMI_EDUCACIONMADRE,data$PERCENTIL_GLOBAL)
#Se plotean los resultados
fviz_ca_biplot(ac,
               title = "Analisis de Correspondencias entre la educación de los padres y el rendimiento académico de estudiantes en Medellin")
