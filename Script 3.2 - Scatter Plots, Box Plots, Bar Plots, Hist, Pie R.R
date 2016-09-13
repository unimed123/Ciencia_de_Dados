###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 12/09/2016 - inicio aula: 9:00pm     dd/mm/aaaa - fim aula: 00:pm    #
###############################################################################
 
# Scatterplots

# Define os dados
set.seed(67)
x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)

# Cria o Plot
plot(x,y, col = 123, pch = 10, main = "Mult Scatterplot",
     col.main = 'red',cex.main = 1.5, xlab = 'indep',
     ylab = 'depend')

# Adiciona outros dados
points(z,t, col = 'blue', pch = 4)

# Adiciona outros dados
points(y,t, col = 777, pch = 9)

# Cria legenda
legend (-5,5.9, legend = c('Nivel 1', 'Nivel 2', 'Nivel 3'),
       col = c(123, 'blue',777), pch = c(10,4,9),
               cex = 0.65, bty = 'n')

# Boxplots
?boxsplot
?sleep

# Permite utilizar as colunas sem especificar o nome do dataset
attach(sleep)

# Construcao do boxplot
sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = 'Duracao do sono',
                       col.main = 'red', ylab = 'horas',
                       xlab = 'Droga', col = c('black', 'red'))
# Calculo da media
means = by(extra, group, mean)

# Adiciona a media no grafico
points(means, col = 'white')

# Boxplot horizontal
horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab = '', xlab='', horizontal = T)
horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab='', xlab='', horizontal = T,
                            col = c('blue', 'red'))

# Histogramas
?hist
?cars

# Definindo os dados

dados = cars$speed

# Construindo um histograma
hist(dados)
hist(dados, breaks = 10)
hist(dados, labels = T, breaks = c(0,5,10,20,30))
hist(dados, labels = T, breaks = 10)
hist(dados, labels = T, ylim = c(0,10), breaks = 10)

# Adicionando linhas ao histograma
hey = hist(dados, breaks = 10)
xaxis = seq(min(dados), max(dados), length(10))
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis*diff(hey$mids)*length(dados)

lines(xaxis, yaxis, col ='red')

# Graficos de pizza
? pie

# Criando as fatias
fatias = c(40,20,40)

# Nomeando os labels
paises = c('Brasil', 'Argentina', 'Chile')

# Unindo paises e fatias
paises = paste(paises, fatias)

# Especificar os labéus
paises = paste(paises, '%', sep = '')

colors()

# Construindo um grafico
pie(fatias, labels = paises,
    col=c('darksalmon','gainsboro', 'lemonchiffon4'),
    main = "Distribuicao de Vendas")


# Trabalhando com dataframes
?iris
attach(iris)
Values = table(Species)
labels = paste(names(Values))
pie(Values, labels = labels, main = "Distribuicao de Especies")

head(iris)

# 3 D
library(plotrix)

pie3D(fatias, labels = paises, explode = 0.08,
      col = c("steelblue1", 'tomato2', 'tan3'),
      main = "Distribuicao de Vendas")

# Bar Plots
?barplot

# Preparando os dados
casamentos <- matrix( c(652,1537,598,242,36,46,38,21,218,327,106,67),
                      nrow = 3, byrow = T)

# Nomeando a matriz
colnames(casamentos) <- c('0','1-150','151-300','>300')
rownames(casamentos) <- c('Casado', "Divorciado","Solteiro")

# Construindo o plot
barplot(casamentos)
barplot(casamentos, beside = T)

# Transposta da matriz
barplot(t(casamentos), beside = T, ylim = c(0,1800))










