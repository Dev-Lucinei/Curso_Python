#!/bin/bash

# Script de configuração do ambiente de desenvolvimento
# Curso Interativo Python

set -e

echo "🚀 Configurando ambiente de desenvolvimento..."
echo ""

# Verificar uv
if ! command -v uv &> /dev/null; then
    echo "📦 uv não encontrado. Instalando..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$PATH"
    echo "✓ uv instalado"
else
    echo "✓ uv encontrado: $(uv --version)"
fi

# Verificar Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 não encontrado. Por favor, instale Python 3.8 ou superior."
    exit 1
fi

echo "✓ Python encontrado: $(python3 --version)"

# Verificar Node/npm
if ! command -v npm &> /dev/null; then
    echo "⚠️  npm não encontrado. Prettier não será instalado."
    echo "   Para instalar: https://nodejs.org/"
    SKIP_NPM=true
else
    echo "✓ npm encontrado: $(npm --version)"
fi

# Criar ambiente virtual com uv
echo ""
echo "📦 Criando ambiente virtual com uv..."
if [ -d ".venv" ]; then
    echo "⚠️  Ambiente virtual já existe. Pulando criação."
else
    uv venv
    echo "✓ Ambiente virtual criado"
fi

# Ativar ambiente virtual
echo ""
echo "🔧 Ativando ambiente virtual..."
source .venv/bin/activate

# Instalar dependências Python com uv
echo ""
echo "📚 Instalando dependências Python com uv..."
uv pip install -r requirements.txt
echo "✓ Dependências Python instaladas"

# Instalar dependências Node
if [ "$SKIP_NPM" != true ]; then
    echo ""
    echo "📚 Instalando dependências Node..."
    npm install
    echo "✓ Dependências Node instaladas"
fi

# Instalar pre-commit (opcional)
echo ""
read -p "Deseja instalar pre-commit hooks? (s/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    uv pip install pre-commit
    pre-commit install
    echo "✓ Pre-commit hooks instalados"
fi

# Executar testes
echo ""
read -p "Deseja executar os testes? (s/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    echo "🧪 Executando testes..."
    uv run pytest
fi

echo ""
echo "✅ Configuração concluída!"
echo ""
echo "📝 Próximos passos:"
echo "   1. Ativar ambiente virtual: source .venv/bin/activate"
echo "   2. Executar servidor: uv run python projects/run.py"
echo "   3. Acessar: http://localhost:5000"
echo ""
echo "🛠️  Comandos úteis:"
echo "   make help          - Ver todos os comandos disponíveis"
echo "   make format        - Formatar código"
echo "   make test          - Executar testes"
echo "   make run           - Iniciar servidor"
echo ""
echo "💡 Dica: Use 'uv run' para executar comandos sem ativar o venv"
echo "   Exemplo: uv run python projects/run.py"
echo ""
