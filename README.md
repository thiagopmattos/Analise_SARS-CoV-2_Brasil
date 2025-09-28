# Analise_SARS-CoV-2_Brasil
Análise da evolução genômica e distribuição geográfica de genomas de SARS-CoV-2 no Brasil usando Python.
# Análise da Evolução e Distribuição Geográfica de Genomas de SARS-CoV-2 no Brasil

Este projeto explora a evolução genômica do vírus SARS-CoV-2 e sua distribuição geográfica no Brasil, utilizando um conjunto de dados de genomas sequenciados. O objetivo é quantificar a acumulação de alterações genéticas ao longo do tempo e entender a representatividade da amostragem por região e estado.

## Objetivo da Análise

1.  **Evolução Genômica:** Investigar como o número de alterações genéticas do SARS-CoV-2 (substituições, deleções, inserções) evoluiu anualmente no Brasil entre 2019 e 2025.
2.  **Distribuição Geográfica:** Analisar a distribuição das amostras genômicas por região e estado, identificando padrões de amostragem.

## Dados

O conjunto de dados utilizado é um arquivo `dados.csv` contendo informações sobre genomas de SARS-CoV-2, incluindo:
* `seqName`: Nome da sequência (contém informações de ano e localização).
* `totalSubstitutions`: Número total de substituições de nucleotídeos.
* `totalDeletions`: Número total de deleções.
* `totalInsertions`: Número total de inserções.
* Outras colunas relevantes.

**Nota:** O arquivo `dados.csv` não está incluído neste repositório devido ao seu tamanho e possível confidencialidade/origem. Para replicar a análise, seria necessário obter um conjunto de dados similar ou o original (se publicamente disponível).

## Metodologia

A análise foi realizada em um ambiente Google Colab utilizando a linguagem Python e as seguintes bibliotecas:
* **Pandas:** Para manipulação e limpeza de dados.
* **Matplotlib e Seaborn:** Para criação e visualização dos gráficos.
* **Joypy:** Para a visualização do Ridge Plot.

As etapas principais incluem:
1.  **Carregamento e Limpeza:** Leitura do CSV, extração e filtragem de anos inválidos, tratamento de valores ausentes.
2.  **Engenharia de Features:** Criação da coluna `total_alteracoes` (soma de substituições, deleções e inserções) e extração/mapeamento de `state` e `region` a partir de `seqName`.
3.  **Visualização:** Geração de gráficos de barras para distribuição geográfica e histogramas múltiplos para a evolução genômica, focando em uma representação clara e quantitativa.

## Resultados e Conclusões Principais

A análise revelou:

* **Viés de Amostragem:** A maioria das amostras provém da Região Sudeste, com São Paulo sendo o estado de maior contribuição. Isso sugere que a capacidade de sequenciamento e vigilância é heterogênea no país.
* **Evolução Contínua:** Observou-se uma clara tendência de aumento na média de alterações genéticas por amostra ao longo dos anos (especialmente de 2020 a 2025), quantificando a evolução do vírus.
* **Distribuição das Mutações:** Gráficos de histogramas por ano mostraram um deslocamento do pico de frequência para um maior número de mutações ao longo do tempo.

## Como Replicar a Análise

1.  Faça o download do arquivo `analise_covid19.ipynb` para o seu computador.
2.  Faça o upload do notebook para o Google Colab ou abra-o em um ambiente Jupyter.
3.  Faça o upload do arquivo `dados.csv` para o ambiente do Colab (se estiver usando Colab) ou coloque-o no mesmo diretório do notebook.
4.  Execute todas as células em sequência.

