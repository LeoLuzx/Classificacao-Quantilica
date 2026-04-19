####################################################################################################

# SCRIPT PARA A EXECUÇÃO DO MODELO

####################################################################################################

# CARREGAMENTO DOS SCRIPTS

# - echo = FALSE é para não mostar o código rodando no prompt se houver execução no script
# - verbose = FALSE é para reduzir o retorno no prompt

# CARREGAMENTO DAS FUNÇÕES
source("funcoes.R", echo = FALSE, verbose = FALSE)

# CARREGAMENTO DOS ELEMENTOS AUXILIARES
source("codigo_aux.R", echo = FALSE, verbose = FALSE)

#---------------------------------------------------------------------------------------------------

#VISUALIZAÇÃO DAS IMAGENS

# Plotagem da imagem (canal HH)
plotar_imagem(sf, 1)

# Plotagem da imagem (canal HV)
plotar_imagem(sf, 2)

# Plotagem da imagem (canal VV)
plotar_imagem(sf, 3)

#---------------------------------------------------------------------------------------------------

# DEFINIÇÃO DE ÁREAS PARA TREINO

# Definindo 2 áreas para a classe oceano
oce_treino_1 <- list(x1 = 45, x2 = 65, y1 = 30, y2 = 50)
oce_treino_2 <- list(x1 = 10, x2 = 30, y1 = 40, y2 = 60)

# Definindo 2 áreas para a classe floresta
flo_treino_1 <- list(x1 = 70, x2 = 90, y1 = 110, y2 = 130)
flo_treino_2 <- list(x1 = 5, x2 = 25, y1 = 115, y2 = 135)

# Definindo 2 áreas para a classe urbano
cid_treino_1 <- list(x1 = 120, x2 = 140, y1 = 40, y2 = 60)
cid_treino_2 <- list(x1 = 125, x2 = 145, y1 = 100, y2 = 120)

# Desenhando as áreas de treino sobre a imagem

desenhar_ret(oce_treino_1, sf, "white")
desenhar_ret(oce_treino_2, sf, "white")

desenhar_ret(flo_treino_1, sf, "green")
desenhar_ret(flo_treino_2, sf, "green")

desenhar_ret(cid_treino_1, sf, "yellow")
desenhar_ret(cid_treino_2, sf, "yellow")

#---------------------------------------------------------------------------------------------------

# DEFINIÇÃO DAS ÁREAS DE TESTE

# Área de teste para o oceano
oce_teste = list(x1 = 20, x2 = 40, y1 = 10, y2 = 30)

# Área de teste para a floresta
cid_teste = list(x1 = 120, x2 = 140, y1 = 10, y2 = 30)

# Área de teste para a cidade
flo_teste = list(x1 = 75, x2 = 95, y1 = 70, y2 = 90)

# Desenhando as áreas de teste sobre a imagem

desenhar_ret(oce_teste, sf, "red")
desenhar_ret(flo_teste, sf, "red")
desenhar_ret(cid_teste, sf, "red")

#---------------------------------------------------------------------------------------------------

















