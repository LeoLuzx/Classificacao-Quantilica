####################################################################################################

# SCRIPT PARA AS FUNÇÕES

####################################################################################################

# FUNÇÃO PARA INSTALAR E CARREGAR PACOTES

# Instala e carrega vários pacotes se não estiverem já instalados

instalar <- function(pkg){
  
  # Verifica se os pacotes já estão instalados. Se não, instala-os.
  # - requireNamespace() verifica se o namespace do pacote pode ser carregago
  # - Se o pacote está instalado, retorna TRUE, se não, retorna FALSE
  if (!requireNamespace(pkg, quietly = TRUE)){
    
    #Instalação dos pacotes com as dependências necessárias
    install.packages(pkg, dependencies = TRUE)
  }
  
  #Após a instalação, carrega-os. Pois, se serão instaldos, é para serem usados
  library(pkg, character.only = TRUE, quietly = TRUE)
  
}

#---------------------------------------------------------------------------------------------------

# FUNÇÃO PARA GERAR NOVA ÁREA GRÁFICA

# Gerar nova área gráfica para que não haja erro na plotagem

limpar_grafico <- function(){
  
  # Fecha o gráfico atual, se não for o 'null device'
  # - dev.cur() retorna o número do dispositivo atual
  # - Sem dispositivo ativo é 1, com dispositivo ativo, é > 1
  if (dev.cur() > 1) {
    
    # Fecha o dispositivo se houver outro ativo
    dev.off()
  }
    
  # Se não huver dispositivo ativo, abre um novo dispossitivo gráfico com dimensões maiores
  dev.new(width = 7, height = 5)
  
}

#---------------------------------------------------------------------------------------------------

# FUNÇÃO PARA PLOTAR A IMAGEM

# Plota a imagem SAR com os dados de um canal específico

# - 'imag' é a imagem como array
# - 'canal' é o canal como valor inteiro [1 a 6]
plotar_imagem <- function(imag, canal, titulo = ""){
  
  # Captura dos dados do canal
  # - Os três primeiros canais são as diagonais que são valores reais, mas a matriz é complexa
  # - Re() para obter os dados reais em 'double' pois a parte real dos dados está na forma a + 0i
  dados <- Re(imag[,,canal])
  
  # Limpa a área de plotagem
  limpar_grafico()
  
  # Correção de contraste (para visualização)
  dados_corrigidos <- dados^0.01
  
  # Transformação para manter orientação consistente
  # - Correção necessária pois a numeração da matriz da imagem começa na linha superior
  # - Já a a numeração do gráfico começa na parte inferior
  z <- t(dados_corrigidos)[, nrow(dados_corrigidos):1]
  
  # Plotagem com eixos corretos
  image(
    
    x = 1:ncol(dados_corrigidos), 
    
    y = 1:nrow(dados_corrigidos), 
    
    z = z,
        
    # Escala de cinza de 0.01 a 1
    col = gray(1:100/100),
    
    # Título do gráfico
    main = titulo,
    
    # Definindo rótulo do eixo 'x' vazio para não poluir
    xlab = "",
    
    # Definindo rótulo do eixo 'y' vazio para não poluir
    ylab = "",

    # Usa uma grade de pixels reais
    useRaster = TRUE,
    
    # Não mostrar eixos
    axes = FALSE
  )
  
}

#---------------------------------------------------------------------------------------------------

# FUNÇÃO PARA DESENHAR RETÂNGULOS

# Desenha retângulos sobre a imagem.
# - 'areas' deve ser uma lista que contém as coordenadas do retângulo: x1, x2, y1, y2
# - 'imag' é a imagem (array), usada aqui apenas para obter o número de linhas
# - 'cor_borda' é a cor da borda do retângulo (padrão "red")
# - 'largura' é a espessura da linha da borda (lwd)
desenhar_ret <- function(area, imag, cor_borda = "red", largura = 2) {
    
    # rect() desenha um retângulo no sistema de coordenadas atual do plot
    # Aqui fornecemos as 4 coordenadas: xleft, xright, ybottom, ytop
    rect(
      
      # xleft: coordenada esquerda (em índices de coluna da matriz).
      xleft = area$y1,
      
      # xright: coordenada direita (em índices de coluna da matriz).
      xright = area$y2,
      
      # - Matrizes têm índice 1 na linha superior, enquanto o gráfico o tem na parte inferior. 
      # - Para ajustar, usamos nrow(Re(imag[,,1])) para obter o número de linhas da imagem.
      # - Depois subtraímos area$x2 e somamos 1 para mapear a matriz para a coord. gráfica.
      
      # ybottom: coordenada inferior do retângulo.
      ybottom = nrow(Re(imag[,,1])) - area$x2 + 1,
      
      # ytop: coordenada superior do retângulo (também convertida)
      ytop = nrow(Re(imag[,,1])) - area$x1 + 1,
      
      # border: cor da borda do retângulo.
      border = cor_borda,
      
      # lwd: largura da linha da borda.
      lwd = largura
    )

}














