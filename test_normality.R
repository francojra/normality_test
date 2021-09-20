
# Teste de normalidade ---------------------------------------------------------------------------------------------------------------------

# Baixar pacotes necessários ----------------------------------------------------------------------------------------------------------------------

if (!require(dplyr)) install.packages("dplyr") # Pacote para manipulação de dados
if (!require(devtools)) install.packages("devtools") # Baixar pacote com versão atualizada
devtools::install_github("kassambara/ggpubr")

# Carregar pacotes baixados ----------------------------------------------------------------------------------------------------------------

library("dplyr")
library("ggpubr")

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

my_data <- ToothGrowth
View(my_data)

# Visualizar dados aleatórios --------------------------------------------------------------------------------------------------------------

dplyr::sample_n(my_data, 10)

# Avaliar a normalidade dos dados ----------------------------------------------------------------------------------------------------------

### Avaliar se os dados de comprimento dentário "len" apresentam distribuição normal.

### Gráfico de densidade: permite um visual julgamento para verificar se os dados apresentam  
### distribuição bem formada.

library("ggpubr")
ggdensity(my_data$len, 
          main = "Density plot of tooth length",
          xlab = "Tooth length")

### QQPLOT: Q-Q: A parcela Q-Q (ou parcela de quantil-quantil) desenha a correlação entre 
### uma dada amostra e a distribuição normal. É também traçada uma linha de referência.

ggqqplot(my_data$len)

### Se muitos pontos caem em cima da linha de referência, pode-se assumir a distribuição normal.

### Nem sempre a visualização da distribuição dos dados por meio de gráficos é confiável, 
### portanto, deve-se realizar o teste de significância de Shapiro-Wilk ou Kolmogorov-Smirnov.

### O método de Shapiro-Wilk apresenta maior poder e é mais recomendado que o teste de Kolmogorov.

shapiro.test(my_data$len)

### Com o valor de P > 0.05, significa que a distribuição dos dados não é estatisticamente
### diferente da distribuição normal, então podemos assumir normalidade dos dados.

# Fonte das informações --------------------------------------------------------------------------------------------------------------------

### http://www.sthda.com/english/wiki/normality-test-in-r
