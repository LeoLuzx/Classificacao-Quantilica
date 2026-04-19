####################################################################################################

# SCRIPT AUXILIAR

####################################################################################################

#CARREGAMENTO DA IMAGEM

# Carregamento das imagens na pasta do projeto
load("imagens/sf.Rdata")

# Renomeando os objetos para maior facilidade na referência
sf <- ImgMP_Sim

# Removendo os objetos originais
rm(ImgMP_Sim)

#---------------------------------------------------------------------------------------------------

# PACOTES NECESSÁRIOS AO PROCESSAMENTO

# Lista de pacotes necessários
pacotes <- c("maxLik", "caret", "dplyr", "MASS", "grid")

# - Aplica a função instalar() para a verificação de instalação em cada pacote
# - A função invisible() evita poluir a saída. Caso haja erro na instalação, ela não o omitirá
invisible(lapply(pacotes, instalar))

#---------------------------------------------------------------------------------------------------