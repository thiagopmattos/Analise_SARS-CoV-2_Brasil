# Análise Completa da Evolução e Distribuição Geográfica de Genomas de SARS-CoV-2 no Brasil

Este projeto demonstra uma pipeline completa de bioinformática e análise de dados, desde o pré-processamento de sequências genômicas FastQ até a visualização e interpretação da evolução do SARS-CoV-2 no Brasil.

## Conteúdo do Repositório

* **`analise_covid19.ipynb`**: Notebook Jupyter/Colab contendo toda a análise de dados, visualizações e conclusões sobre a evolução genômica e distribuição das amostras.
* **`process_fastq.sh`**: Script Shell Bash para o pré-processamento de arquivos FastQ brutos, utilizando a ferramenta `fastp` para controle de qualidade.
* **`README.md`**: Este arquivo, fornecendo uma visão geral do projeto e instruções.

## 1. Análise de Dados (Notebook: `analise_covid19.ipynb`)

Este notebook explora o conjunto de dados de genomas de SARS-CoV-2 para responder a duas perguntas principais:

### 1.1. Objetivo da Análise

1.  **Evolução Genômica:** Como o número de alterações genéticas (substituições, deleções, inserções) do SARS-CoV-2 evoluiu anualmente no Brasil entre 2019 e 2025.
2.  **Distribuição Geográfica:** Análise da representatividade das amostras genômicas por região e estado.

### 1.2. Dados

O notebook utiliza um arquivo `dados.csv` (derivado de dados genômicos) que contém informações cruciais como `seqName` (com ano e localização), `totalSubstitutions`, `totalDeletions` e `totalInsertions`.

**Nota:** O arquivo `dados.csv` não está incluído diretamente neste repositório. Para replicar a análise, seria necessário gerar este arquivo a partir de dados FastQ brutos (usando o `process_fastq.sh` e uma etapa de alinhamento/variantes) ou obter um conjunto de dados similar publicamente disponível.

### 1.3. Metodologia (Análise no Notebook)

A análise foi realizada em um ambiente Google Colab utilizando Python e as bibliotecas Pandas, Matplotlib e Seaborn. As etapas incluem:
* Carregamento e Limpeza de Dados: Extração e filtragem de anos, tratamento de valores ausentes.
* Engenharia de Features: Criação de `total_alteracoes` e extração de `state`/`region`.
* Visualização: Gráficos de barras para distribuição geográfica e múltiplos histogramas para a evolução genômica.

### 1.4. Resultados e Conclusões Principais (Notebook)

* **Viés de Amostragem:** A maioria das amostras provém da Região Sudeste, com São Paulo sendo o estado de maior contribuição.
* **Evolução Contínua:** Média de alterações genéticas por amostra aumentou consistentemente de 2020 a 2025, quantificando a evolução do vírus.

## 2. Pré-processamento de FastQ (Script: `process_fastq.sh`)

Este script Shell é responsável por preparar os arquivos FastQ brutos para a análise genômica.

### 2.1. Funcionalidade

O script automatiza:
* **Ativação do Ambiente Conda:** Garante que o ambiente `aprendizagem` (onde `fastp` está instalado) seja ativado.
* **Organização de Diretórios:** Cria `fastp_limpos` e `fastp_reports`.
* **Processamento com `fastp`:** Para cada par FastQ (`*_R1_001.fastq.gz` e `*_R2_001.fastq.gz`):
    * Realiza controle de qualidade (remoção de adaptadores, reads de baixa qualidade).
    * Gera FastQ limpos (`_limpo.fastq.gz`), relatórios HTML (`_report.html`) e JSON (`_report.json`).

### 2.2. Pré-requisitos (para `process_fastq.sh`)

* Ambiente **Bash**.
* **Conda/Miniconda/Anaconda** instalado.
* Ambiente Conda chamado `aprendizagem` com **`fastp`** instalado (`conda install -c bioconda fastp`).

### 2.3. Como Usar (o `process_fastq.sh`)

1.  **FastQ Brutos:** Coloque seus arquivos FastQ brutos (seguindo o padrão `*_R1_001.fastq.gz` e `*_R2_001.fastq.gz`) no diretório **`$HOME/fiocruz`**.
2.  **Salve o Script:** Salve `process_fastq.sh` em um local de sua preferência (ex: no `$HOME/fiocruz`).
3.  **Permissão de Execução:** `chmod +x process_fastq.sh`
4.  **Execute:** `./process_fastq.sh`

### 2.4. Saída Esperada (do `process_fastq.sh`)

O script criará, dentro de `$HOME/fiocruz/`:
* `fastp_limpos/`: FastQ limpos.
* `fastp_reports/`: Relatórios HTML e JSON.

## Como Replicar o Projeto Completo

1.  **Prepare o Ambiente:** Instale Conda, crie o ambiente `aprendizagem` e instale `fastp` nele.
2.  **Pré-processe os FastQ:**
    * Obtenha seus arquivos FastQ brutos e coloque-os em `$HOME/fiocruz`.
    * Faça o download de `process_fastq.sh` deste repositório para `$HOME/fiocruz`.
    * Dê permissão de execução ao script (`chmod +x process_fastq.sh`) e execute-o (`./process_fastq.sh`).
    * **Observação:** O script `process_fastq.sh` gera FastQ limpos. A etapa de **gerar o `dados.csv`** a partir desses FastQ limpos (que envolve alinhamento, chamada de variantes e contagem de mutações) não está neste repositório. Você precisará de ferramentas de bioinformática adicionais (ex: `minimap2`, `samtools`, `bcftools`, scripts customizados) para ir dos FastQ limpos ao `dados.csv`.
3.  **Analise os Dados (Notebook):**
    * Faça o download de `analise_covid19.ipynb` deste repositório.
    * Obtenha o arquivo `dados.csv` (gerado na etapa anterior ou de outra fonte) e certifique-se de que ele esteja no mesmo diretório do notebook se estiver usando Colab/Jupyter local.
    * Abra o notebook e execute todas as células em sequência.
