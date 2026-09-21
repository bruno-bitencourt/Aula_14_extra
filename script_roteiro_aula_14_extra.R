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

# Ao terminar a Tarefa 2 commit com a mensagem " script - tarefa 1 a 2" e envie para o repositório Aula_14_Extra


# Tarefa 3: Leitura do banco de dados Tabela_PAM.csv (com o nome tabela_pam) e:
# agregar ao banco dados_aula14 as informações de VALOR_P10 e VALOR_P90
# criar a variável PAM (somente quando TIPO_VEICULO = "Carro"), de acordo com IDADE_PROPRIETARIO e SEXO_PROPRIETARIO, com as seguintes categorias:
# PAM = "PIC", se VALOR_VEICULO < VALOR_P10; "AIC", se VALOR_P10 <= VALOR_VEICULO <= VALOR_P90; "GIC", se VALOR_VEICULO > VALOR_P90

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

# Ao terminar a Tarefa 4 commit com a mensagem " script - tarefa 1 a 4" e envie para o repositório Aula_14_Extra


# Tarefa 5: Exportar o banco de dados BANCO_AULA14_RJ com o nome BANCO_AULA14_RJ.csv

# Ao terminar a Tarefa 5 commit com a mensagem "dados e script - Etapa 2" e envie para o repositório Aula_14_Extra
