##### Atividade aula 14 - extra - banco 2 - equivalente ao SINASC ######
##### Na branch main inserir os comandos e salvar o script com o nome script_aula_14_extra#####

# Tarefa 1: Leitura do banco de dados banco 2 = SINASC.csv com o nome de dados_aula14
# Ler o arquivo, verificar estrutura dos dados e dar uma olhada nos dados
dados_aula14 <- read.csv2("banco 2 SINASC.csv")
str(dados_aula14)
head(dados_aula14)
# Ao terminar a Tarefa 1 commit com a mensagem " script - tarefa 1" e envie para o repositório Aula_14_Extra


# Tarefa 2: Manipulação dos dados
# Padronizar as categorias SEXO_PROPRIETARIO para Masculino e Feminino
# Atribuir legendas para a variável TIPO_VEICULO, sendo 1: Carro e 2: Moto
# Criar uma nova variável em dados_aula14 F_IDADE categorizando as idades em: 22 a 34, 35 a 45
dados_aula14$SEXO_PROPRIETARIO[toupper(dados_aula14$SEXO_PROPRIETARIO) %in% c("M", "MASCULINO")] <- "Masculino"
dados_aula14$SEXO_PROPRIETARIO[toupper(dados_aula14$SEXO_PROPRIETARIO) %in% c("F", "FEMININO")] <- "Feminino"
dados_aula14$TIPO_VEICULO <- factor(dados_aula14$TIPO_VEICULO, levels = c(1, 2), labels = c("Carro", "Moto"))
dados_aula14$F_IDADE <- cut(dados_aula14$IDADE_PROPRIETARIO, breaks = c(21, 34, 45), labels = c("22 a 34", "35 a 45"))

# Ao terminar a Tarefa 2 commit com a mensagem " script - tarefa 1 a 2" e envie para o repositório Aula_14_Extra


# Tarefa 3: Leitura do banco de dados Tabela_PAM.csv (com o nome tabela_pam) e:
# agregar ao banco dados_aula14 as informações de VALOR_P10 e VALOR_P90
# criar a variável PAM (somente quando TIPO_VEICULO = "Carro"), de acordo com IDADE_PROPRIETARIO e SEXO_PROPRIETARIO, com as seguintes categorias:
# PAM = "PIC", se VALOR_VEICULO < VALOR_P10; "AIC", se VALOR_P10 <= VALOR_VEICULO <= VALOR_P90; "GIC", se VALOR_VEICULO > VALOR_P90

tabela_pam <- read.csv2("Tabela_PAM.csv")
dados_aula14 <- merge(dados_aula14, tabela_pam, all.x = TRUE)
dados_aula14$PAM <- NA
dados_aula14$PAM[dados_aula14$TIPO_VEICULO == "Carro" & dados_aula14$VALOR_VEICULO < dados_aula14$VALOR_P10] <- "PIC"
dados_aula14$PAM[dados_aula14$TIPO_VEICULO == "Carro" & dados_aula14$VALOR_VEICULO >= dados_aula14$VALOR_P10 & dados_aula14$VALOR_VEICULO <= dados_aula14$VALOR_P90] <- "AIC"
dados_aula14$PAM[dados_aula14$TIPO_VEICULO == "Carro" & dados_aula14$VALOR_VEICULO > dados_aula14$VALOR_P90] <- "GIC"

# Ao terminar a Tarefa 3 commit com a mensagem " script - tarefa 1 a 3" e envie para o repositório Aula_14_Extra

 
# Tarefa 4: Criar o banco de dados BACO_AULA14_RJ, POR MUNICÍPIO, com as seguintes variáveis listadas abaixo. 
# Variáveis que se referem a medidas de posição e de dispersão devem ser calculadas sem considerar NAs

# Atenção: a 1a linha do banco deve ser da UF 33
# ANO: 2025
# NIVEL: UF ou MUNICIPIO
# CODIGO: código do municipio (ou da UF)
# TVV: total de veiculos vendidos
# TVRC: total de vendas com registros completos nas 5 variáveis originais de banco 2 = SINASC
# TVVF: total de veículos vendidos para mulher
# TVVM: total de veículos vendidos para homem
# TVCF: total de carros vendidos para mulheres
# TVCM: total de carros vendidos para homens
# TVMF: total de motos vendidas para mulheres
# TVMM: total de motos vendidas para homens
# TVC_22_34: total de carros vendidos para pessoas na faixa etária de 22 a 34 anos
# TVC_35_45: total de carros vendidos para pessoas na faixa etária de 35 a 45 anos
# IMVCF: idade média das mulheres proprietárias de veículo carro 
# DPVCF: desvio-padrão das idades das mulheres proprietárias de veículo carro
# IVCF_P25: percentil 25 das idades das mulheres proprietárias de veículo carro
# IVCF_P50: percentil 50 das idades das mulheres proprietárias de veículo carro
# IVCF_P75: percentil 75 das idades das mulheres proprietárias de veículo carro
# IMVMM: idade média dos homens proprietários de veículo moto 
# DPVMM: desvio-padrão das idades dos homens proprietários de veículo moto
# IVMM_P25: percentil 25 das idades dos homens proprietários de veículo moto
# IVMM_P50: percentil 50 das idades dos homens proprietários de veículo moto
# IVMM_P75: percentil 75 das idades dos homens proprietários de veículo moto
# TPIC: total de compradores com perfil PIC
# TAIC: total de compradores com perfil AIC
# TGIC: total de compradores com perfil GIC

library(dplyr)

vars_originais <- c("MUNICIPIO", "SEXO_PROPRIETARIO", "IDADE_PROPRIETARIO", "TIPO_VEICULO", "VALOR_VEICULO")
dados_aula14$REGISTRO_COMPLETO <- complete.cases(dados_aula14[, vars_originais])

resumo_uf <- dados_aula14 %>%
  summarise(
    ANO = 2025,
    NIVEL = "UF",
    CODIGO = 33,
    TVV = n(),
    TVRC = sum(REGISTRO_COMPLETO, na.rm = TRUE),
    TVVF = sum(SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE),
    TVVM = sum(SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE),
    TVCF = sum(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE),
    TVCM = sum(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE),
    TVMF = sum(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE),
    TVMM = sum(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE),
    TVC_22_34 = sum(TIPO_VEICULO == "Carro" & F_IDADE == "22 a 34", na.rm = TRUE),
    TVC_35_45 = sum(TIPO_VEICULO == "Carro" & F_IDADE == "35 a 45", na.rm = TRUE),
    IMVCF = mean(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], na.rm = TRUE),
    DPVCF = sd(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], na.rm = TRUE),
    IVCF_P25 = if(any(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], 0.25, na.rm = TRUE) else NA_real_,
    IVCF_P50 = if(any(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], 0.50, na.rm = TRUE) else NA_real_,
    IVCF_P75 = if(any(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], 0.75, na.rm = TRUE) else NA_real_,
    IMVMM = mean(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], na.rm = TRUE),
    DPVMM = sd(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], na.rm = TRUE),
    IVMM_P25 = if(any(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], 0.25, na.rm = TRUE) else NA_real_,
    IVMM_P50 = if(any(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], 0.50, na.rm = TRUE) else NA_real_,
    IVMM_P75 = if(any(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], 0.75, na.rm = TRUE) else NA_real_,
    TPIC = sum(PAM == "PIC", na.rm = TRUE),
    TAIC = sum(PAM == "AIC", na.rm = TRUE),
    TGIC = sum(PAM == "GIC", na.rm = TRUE)
  )

resumo_mun <- dados_aula14 %>%
  group_by(CODIGO = MUNICIPIO) %>%
  summarise(
    ANO = 2025,
    NIVEL = "MUNICIPIO",
    TVV = n(),
    TVRC = sum(REGISTRO_COMPLETO, na.rm = TRUE),
    TVVF = sum(SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE),
    TVVM = sum(SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE),
    TVCF = sum(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE),
    TVCM = sum(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE),
    TVMF = sum(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE),
    TVMM = sum(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE),
    TVC_22_34 = sum(TIPO_VEICULO == "Carro" & F_IDADE == "22 a 34", na.rm = TRUE),
    TVC_35_45 = sum(TIPO_VEICULO == "Carro" & F_IDADE == "35 a 45", na.rm = TRUE),
    IMVCF = mean(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], na.rm = TRUE),
    DPVCF = sd(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], na.rm = TRUE),
    IVCF_P25 = if(any(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], 0.25, na.rm = TRUE) else NA_real_,
    IVCF_P50 = if(any(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], 0.50, na.rm = TRUE) else NA_real_,
    IVCF_P75 = if(any(TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Carro" & SEXO_PROPRIETARIO == "Feminino"], 0.75, na.rm = TRUE) else NA_real_,
    IMVMM = mean(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], na.rm = TRUE),
    DPVMM = sd(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], na.rm = TRUE),
    IVMM_P25 = if(any(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], 0.25, na.rm = TRUE) else NA_real_,
    IVMM_P50 = if(any(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], 0.50, na.rm = TRUE) else NA_real_,
    IVMM_P75 = if(any(TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino", na.rm = TRUE)) quantile(IDADE_PROPRIETARIO[TIPO_VEICULO == "Moto" & SEXO_PROPRIETARIO == "Masculino"], 0.75, na.rm = TRUE) else NA_real_,
    TPIC = sum(PAM == "PIC", na.rm = TRUE),
    TAIC = sum(PAM == "AIC", na.rm = TRUE),
    TGIC = sum(PAM == "GIC", na.rm = TRUE)
  ) %>%
  select(ANO, NIVEL, CODIGO, everything())

BACO_AULA14_RJ <- bind_rows(resumo_uf, resumo_mun)


# Ao terminar a Tarefa 4 commit com a mensagem " script - tarefa 1 a 4" e envie para o repositório Aula_14_Extra


# Tarefa 5: Exportar o banco de dados BANCO_AULA14_RJ com o nome BANCO_AULA14_RJ.csv

# Ao terminar a Tarefa 5 commit com a mensagem "dados e script - Etapa 2" e envie para o repositório Aula_14_Extra
