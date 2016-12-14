###############################################################################
# Pratica:  FDSC        Fonte: http://metrico.statanything.com/               #
#                                            INSTRUTOR:  jkarlos/Raniere      #
# Data: 14/12/2016                                                            #
###############################################################################





install.packages("rgdal")
install.packages("leaflet")
install.packages("readOGR")


library(rgdal)
library(leaflet)




# no RStudio o diretorio de trabalho corrente do R aponta para o local
# aonde o script está






# From ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_municipais/municipio_2015/UFs/SC/



sc <- readOGR("C:/Fernando/Estudo R/Municipios SC/42MUE250GC_SIR.shp", verbose = FALSE)

dir()
getwd()

# aonde estão dos dados?
print(sc@data)

# que dados temos la?
print(colnames(sc@data))


# um valor aleatrorio entre 0 a 1000 para cada municipio

sc@data$valor <- as.numeric(round(runif(nrow(sc@data), 0, 1000), 0))


# particionando os valores em 10 faixas

sc@data$bin <- cut(sc@data$valor, seq(0,1000, by = 100),
                   include.lowest = TRUE, dig.lab = 4)




# criar uma paleta de cores entre vermelho e branco
rbPal <- colorRampPalette(c('red', 'white'))


   # cujas cores 
sc@data$col <- rbPal(30)[as.numeric(cut(sc@data$valor, seq(0, 3000, by = 300)))]                                 

# plota o mapa com as cores
plot(sc, col = sc@data$col)


demo(colorRampPalette)




