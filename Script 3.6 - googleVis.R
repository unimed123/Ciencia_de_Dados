###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 26/10/2016 - inicio aula: 4:44pm     27/10/2016 - fim aula:8:19pm        #
###############################################################################

# googleVis - Visualizacao Interativas

# Baseado no Google Chart (visualizacao de dados na web)
# googleVis e um pacote que fornece interface entre o R e o Google Charts
# Utiliza JavaScript e arquivos JSON. Os dados sao transformados em formato JSON
# O resultado e gerado em HTML5 ou Flash
# Pode-se criar os mais variados tipos de graficos e mapas. Inclusive Google Maps
# Voce pode incorporar os graficos criados em paginas HTML ou apps
# Verificar termos de uso, antes de utilizar.

install.packages('googleVis')
library(googleVis)

# Criando uma Dataframe
df = data.frame(Pais = c('BR', 'CH', 'AR'),
                Exportacao = c(10,13,14),
                Importacao = c(23,13,32))
              
# Grafico de Linha
Line <- gvisLineChart(df)
plot(Line)

# Grafico de Barras
Column <- gvisColumnChart(df)
plot(Column)

# Grafico de Barras horizontais
Bar <- gvisBarChart(df)
plot(Bar)

# Grafico de Pizza
Pie <-gvisPieChart(df)
plot(Pie)

# Graficos Combinados
Combo <- gvisComboChart(df, xvar = 'Pais',
                        yvar = c('Exportacao', 'Importacao'),
                        options = list(seriesType = 'bars',
                                       series='{1: {type:"line"}}'))

plot(Combo)


# Scatter Chart

Scartter <- gvisScatterChart(women,
                             options = list(
                               legend = "none",
                               lineWidth = 2, pointSize=0,
                               title="Women",vAxis = "{title:'weight (lbs')}",
                               hAxis="{title:'height (in)'}" ,
                               width=300, heigth=300))
                            
plot(Scartter)                            
                             
# Bubble
Bubble <- gvisBubbleChart(Fruits, idvar="Fruit",
                          xvar="Sales", yvar="Expenses",
                          colorvar = "Year", sizevar = "Profit",
                          options=list(
                            hAxis='{minValue:75, marValue:125}'
                          ))
plot(Bubble)

# Customizado
M <- matrix(nrow = 6, ncol = 6)
M[col(M)==row(M)] <- 1:6
dat <- data.frame(X=1:6,M)
SC <- gvisScatterChart(dat,
                       options = list(
                         title="Customizing points",
                         legend = "rigth",
                         pointSize=30,
                         series="{
                         0:{pointShape:'circle'},
                         1:{pointShape: 'triangle'},
                         2:{pointShape:'square'},
                         3:{pointShape: 'diamond'},
                         4:{pointShape: 'star'},
                         5:{pointShape: 'polygon'}
                         }"))
                        

plot(SC)

# Gauge
Gauge <- gvisGauge(CityPopularity,
                   options=list(min=0, max=800, greenFrom=500,
                                greenTo=800, yellowFrom=300, yellowTo=500,
                                redFrom=0, redTo=300, width=400, heigth=300))

plot(Gauge)

# Mapas
Intensity <- gvisIntensityMap(df)
plot(Intensity)

# Geo chart
AndrewMap <- gvisMap(Andrew, "LatLong", "Tip",
                     options=list(showTip=TRUE,
                                  showLine=TRUE,
                                  enableScrollWheel=TRUE,
                                  mapType='terrain',
                                  useMapTypeControl=TRUE))

plot(AndrewMap)

# Dados em grafico. Nivel de analfabetismo nos EUA
require(datasets)
states <- data.frame(state.name, state.x77)
GeoStates <- gvisGeoChart(states, "state.name","Illiteracy",
                          options=list(region="US",
                                        displayMode="regions",
                                        resolution="provinces",
                                        width=600, heith=400))
plot(GeoStates)
                          
# Mais exemplos
demo(googleVis)
                          
                          
                          
                          






