#!/bin/bash
#conda init
#conda activate aprendizagem
set -e

CONDA_BASE=$(conda info --base)

source "$CONDA_BASE/etc/profile.d/conda.sh"

echo "Ativando o ambiente Conda: aprendizagem"

conda activate aprendizagem


DIRETORIO_PRINCIPAL="$HOME/fiocruz"


PASTA_SAIDA_LIMPOS="$DIRETORIO_PRINCIPAL/fastp_limpos"
PASTA_SAIDA_REPORTS="$DIRETORIO_PRINCIPAL/fastp_reports"

echo "Preparando diretórios de saída..."

mkdir -p "$PASTA_SAIDA_LIMPOS"
mkdir -p "$PASTA_SAIDA_REPORTS"

echo "Diretórios prontos."
echo "---"

for R1_ARQUIVO_COMPLETO in "$DIRETORIO_PRINCIPAL"/*_R1_001.fastq.gz; do

    

    
    R1_NOME_ARQUIVO=$(basename "$R1_ARQUIVO_COMPLETO")

    
    R2_NOME_ARQUIVO=${R1_NOME_ARQUIVO/_R1_001.fastq.gz/_R2_001.fastq.gz}
    

    NOME_BASE=$(basename "$R1_NOME_ARQUIVO" _R1_001.fastq.gz)

    echo "[+] Processando amostra: $NOME_BASE"

   
    CAMINHO_SAIDA_R1_LIMPO="$PASTA_SAIDA_LIMPOS/${NOME_BASE}_R1_limpo.fastq.gz"
    CAMINHO_SAIDA_R2_LIMPO="$PASTA_SAIDA_LIMPOS/${NOME_BASE}_R2_limpo.fastq.gz"
    CAMINHO_SAIDA_HTML="$PASTA_SAIDA_REPORTS/${NOME_BASE}_report.html"
    CAMINHO_SAIDA_JSON="$PASTA_SAIDA_REPORTS/${NOME_BASE}_report.json"

   
    fastp \
        -i "$R1_ARQUIVO_COMPLETO" \
        -I "$DIRETORIO_PRINCIPAL/$R2_NOME_ARQUIVO" \
        -o "$CAMINHO_SAIDA_R1_LIMPO" \
        -O "$CAMINHO_SAIDA_R2_LIMPO" \
        -h "$CAMINHO_SAIDA_HTML" \
        -j "$CAMINHO_SAIDA_JSON"

    echo "[✓] Sucesso: Amostra $NOME_BASE processada."
    echo "---"

done

echo "Todos os arquivos foram processados!"