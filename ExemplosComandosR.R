#Exemplos de comandos R - Obtidos do cursa da DSA - 2019
# element-wise, elemento por elemento - matriz A e B, significa que faz  ação para o elemento de A com Elemento de B
help("iris") ## sintaxe para obter ajuda
RSiteSearch('filter') ## help via web

# A função c() cria um vetor de valores

install.packages("nomedopct") ## instalar pct
library(nomepct)  ## instanciar pct

# Configurando o diretório de trabalho
vsCaminho = "C:/Users/miro/Documents/_Miro/DSA/Big Data Analytics com R e MS Azure ML"
setwd(vsCaminho) ## setar 
getwd() ## obter

# diretório de trabalho
list.files() 
dir()

# Criar vetor
v1 = seq(1:30)
v2 = rep(1:30)
v3 <- c('a','b','c','d','e','6','7','8','9','10')
class(v1)

# Criar matriz 4x4 preenchida com números inteiros
m1 = matrix(c(1,2,3,4,5,6,7,8),nr=4,nc=4) # se faltar nr para completar será repetido a seq.
m2 <- matrix(seq(1:16),nr=4,nc=4)

# Criar lista como o vetor e matriz
l1 = list(v1,m1)


lista1 <- list(1:10, c("Zico", "Ronaldo", "Garrincha"), rnorm(10))
# Para nomear os elementos - Listas Nomeadas
names(lista1) <- c("inteiros", "caracteres", "numÃ©ricos")
lista1
# Nomear os elementos diretamente
lista2 <- list(elemento1 = 3:5, elemento2 = c(7.2,3.5))
# Trabalhando com elementos especÃ�ficos da lista
names(lista1) <- c("inteiros", "caracteres", "numÃ©ricos")
lista1

# Trabalhando com elementos específicos da lista
lista1$caracteres
length(lista1$inteiros)
lista1$inteiros


# Criar Dataframe - Usando a função read.table() com arquivo do link
df <- data.frame(read.table("http://data.princeton.edu/wws509/datasets/effort.dat"))
arq = "http://data.princeton.edu/wws509/datasets/effort.dat"
df2 <- data.frame(read.csv(file = arq, header = TRUE, sep = ""))
View(df2) #visualizar em forma de tabela
# Transforme em dataframe nomeado com os seguintes labels:
names(df) <- c("config", "esfc", "chang")
df

# Trabalhando com dataset iris 
iris
dim(iris) 
summary(iris)

# Criar um plot usando as duas primeiras colunas do dataframe iris
plot(iris[1:2])
##ou
plot(iris$Sepal.Length, iris$Sepal.Width)

# Função subset, criar um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
subset(iris, Sepal.Length > 7)

#filtros
# criar df que seja cópia do dataframe iris e usando a função slice() do pct dplyr, divida o dataframe em um subset de 15 linhas
subcpiris = slice(iris,1:15)
# Função filter, retornar apenas valores em que Sepal.Length > 6
filter(subcpiris,Sepal.Length > 5)

#Loops
# loop imprime lista
lst2 <- list(2, 3, 5, 7, 11, 13)
i=0
while (i <= length(lst2)) {
  print(lst2[i])
  i=i+1
}
vec1 <- c(12, 3, 4, 19, 34)
for(i in 1:length(vec1))
{
  if (vec1[i]>=10)
  {
    print(vec1[i])
    print ("Nr >= 10")
  }
  else
  {
    print(vec1[i])
    print("Nr < 10")
  }
}
#06/03/20
# Conectando no banco de dados sqlite
con = dbConnect(RSQLite::SQLite(), dbname="database.sqlite")
#Listar as tabelas do banco
dbListTables(con)
#carregando uma tabela
dbReadTable(con, "Player")
Player = dbReadTable(con, "Player")
#Visualizando a tabela
View(players)
#Exemplo de replace
?str_replace_all

#07/05/20
#Comandos para trabalhar leitura de html
#Usar pcts rvest, stringr, tidyr
pagina <- read_html(url)
#remover linhas, o detalhe é o sinal de -
tab <- tab[-(1:2), ]
#renomear coluna
names(tab) <- c("number", "date", "site", "result")
#Separar colunas - remove = true, remove a coluna origem
tab <- separate(tab, coluna_origem, c('col1', 'col2'), sep = ', ', remove = TRUE)
#Criar novas colunas e limpar dados de colunas com gsub
pattern = " \\d+$" # usando express-ao regular para formar 
#Criando uma nova coluna
tab$winnerScore = as.numeric(str_extract(tab$winner,pattern))
tab$loserScore = as.numeric(str_extract(tab$loser,pattern))
#Limpando as informações que forma para as novas colunas
tab$winner = gsub(pattern,"",tab$winner)
tab$loser = gsub(pattern,"",tab$loser)
head(tab)
#Gerar um arquivo csv a partir do DF
write.csv(tab,"arqx.csv",row.names = F)


