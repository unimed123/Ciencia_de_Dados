###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 02/08/2016 - inicio aula: 8:13pm     fim aula: 9:53pm                                 #
###############################################################################

# Expressoes Regulares

# grep(pattern, x, ignore.case = FALSE, perl = value, fixed = FALSE, useBytes, invert = FALSE)
# grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# regexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)

str <- c('Expressoes', 'regulares', 'em linguagem R',
         'permitem a busca de padroes', 'e exploracao de textos',
         'como por exemplo',
         'podemos buscar padroes em digitos',
         '10992451280')

length(str)
str


# grep()
grep('ex', str, value = FALSE)
grep('ex', str, value = TRUE)
grep('\\d', str, value = F)
grep('\\d', str, value = T)

# grepl()
grepl('\\d+', str)
grepl('\\D', str)

# gsub()
gsub('em', '|', str)
gsub('ex', 'EX', str, ignore.case = T)

# sub
sub('em', 'EM', str)
sub('em', 'EM', str, ignore.case = F)

# regexpr()
frase <- "Isso Ã© uma string."
regexpr(pattern = "u", frase)


# gregexpr()
gregexpr(pattern = "u", frase)


str2 <- c('2678 eh maior que 45 - @???!Â§$', 'vamos escrever 14 scripts R')
str2

#gsub()
gsub('\\d', '',str2)
gsub('\\D', '', str2)
gsub('\\s', '', str2)
gsub('[iot]', 'x', str2)
gsub('[[:punct:]]', '', str2)
gsub('[^@]', '', str2)



