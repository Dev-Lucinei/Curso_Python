.PHONY: help install format format-check lint lint-fix test run clean

help:
	@echo "Comandos disponíveis:"
	@echo "  make install       - Instalar dependências Python e Node"
	@echo "  make format        - Formatar código Python e JS/CSS"
	@echo "  make format-check  - Verificar formatação sem modificar"
	@echo "  make lint          - Executar linters"
	@echo "  make lint-fix      - Executar linters e corrigir automaticamente"
	@echo "  make test          - Executar testes"
	@echo "  make run           - Executar servidor de desenvolvimento"
	@echo "  make clean         - Limpar arquivos temporários"

install:
	@echo "Verificando uv..."
	@command -v uv >/dev/null 2>&1 || { echo "uv não encontrado. Instalando..."; curl -LsSf https://astral.sh/uv/install.sh | sh; }
	@echo "Criando ambiente virtual..."
	uv venv
	@echo "Instalando dependências Python..."
	uv pip install -r requirements.txt
	@echo "Instalando dependências Node..."
	npm install
	@echo "✓ Dependências instaladas!"

format:
	@echo "Formatando código Python com Ruff..."
	uv run ruff format projects/
	@echo "Formatando JS/CSS/HTML com Prettier..."
	npm run format
	@echo "✓ Código formatado!"

format-check:
	@echo "Verificando formatação Python..."
	uv run ruff format --check projects/
	@echo "Verificando formatação JS/CSS/HTML..."
	npm run format:check
	@echo "✓ Verificação concluída!"

lint:
	@echo "Executando lint Python..."
	uv run ruff check projects/
	@echo "Executando lint JS/CSS/HTML..."
	npm run lint:js
	@echo "✓ Lint concluído!"

lint-fix:
	@echo "Corrigindo problemas Python..."
	uv run ruff check --fix projects/
	@echo "Formatando JS/CSS/HTML..."
	npm run format
	@echo "✓ Correções aplicadas!"

test:
	@echo "Executando testes..."
	uv run pytest
	@echo "✓ Testes concluídos!"

run:
	@echo "Iniciando servidor de desenvolvimento..."
	uv run python projects/run.py

clean:
	@echo "Limpando arquivos temporários..."
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ruff_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	rm -rf build/ dist/ *.egg-info/ 2>/dev/null || true
	@echo "✓ Limpeza concluída!"
