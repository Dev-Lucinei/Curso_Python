# Stack Tecnológico

## Backend
- **Framework**: Flask 3.1.1
- **Linguagem**: Python 3.8+
- **CORS**: flask-cors 5.0.1 (habilitado globalmente)
- **Logging**: Módulo `logging` da biblioteca padrão Python

## Frontend
- **Templates**: Jinja2 (sistema de templates do Flask)
- **Assets Estáticos**: CSS e JavaScript vanilla
- **Editor**: Implementação customizada de editor de código

## Armazenamento de Dados
- **Formato**: Arquivos JSON
- **Biblioteca**: Módulo `json` da biblioteca padrão Python
- **Manipulação de Paths**: `pathlib` para compatibilidade cross-platform

## Testes
- **Framework**: pytest
- **Test Client**: Flask test client
- **Fixtures**: pytest fixtures com `monkeypatch` para isolamento
- **Cobertura**: Testes unitários, testes de API e meta-testes para validação de exercícios

## Execução de Código
- **Método**: `exec()` do Python com ambiente controlado
- **Isolamento**: `io.StringIO` com `contextlib.redirect_stdout/stderr`
- **Segurança**: Captura de stdout/stderr previne poluição do console do servidor

## Comandos Comuns

### Desenvolvimento
```bash
# Executar servidor de desenvolvimento
uv run python projects/run.py
# ou com venv ativado
python projects/run.py

# Servidor roda em http://localhost:5000 ou http://0.0.0.0:5000
```

### Testes
```bash
# Executar todos os testes
uv run pytest
# ou
pytest

# Executar arquivo de teste específico
uv run pytest projects/testes/test_app.py

# Executar com saída verbosa
uv run pytest -v

# Executar com cobertura
uv run pytest --cov=projects
```

### Dependências
```bash
# Instalar uv (se ainda não tiver)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Criar ambiente virtual e instalar dependências
uv venv
source .venv/bin/activate  # Linux/macOS
.\.venv\Scripts\activate   # Windows
uv pip install -r requirements.txt

# Ou usar uv diretamente (sem ativar venv)
uv pip install -r requirements.txt

# Instalar dependências Node (Prettier)
npm install
```

### Formatação e Linting
```bash
# Usando Make (recomendado)
make format        # Formatar todo o código
make lint          # Executar linters
make lint-fix      # Corrigir problemas automaticamente

# Comandos diretos
uv run ruff format projects/       # Formatar Python
uv run ruff check projects/        # Lint Python
uv run ruff check --fix projects/  # Lint e corrigir Python
npm run format                     # Formatar JS/CSS/HTML
npm run format:all                 # Formatar tudo

# Pre-commit (opcional)
uv pip install pre-commit
pre-commit install
pre-commit run --all-files
```

## Formatadores e Linters

### Python
- **Ruff**: Linter e formatador moderno (substitui Black, isort, flake8)
- **Configuração**: `pyproject.toml`
- **Linha máxima**: 120 caracteres
- **Estilo**: PEP 8 com aspas duplas

### JavaScript/CSS/HTML
- **Prettier**: Formatador de código
- **Configuração**: `.prettierrc`
- **Linha máxima**: 100 caracteres (JS/CSS), 120 (HTML)
- **Indentação**: 4 espaços

### Pre-commit Hooks
- **Ferramenta**: pre-commit
- **Configuração**: `.pre-commit-config.yaml`
- **Executa**: Ruff, Prettier e verificações gerais antes de cada commit

## Configuração

- **Debug Mode**: Habilitado em `run.py` para desenvolvimento
- **Host**: 0.0.0.0 (acessível pela rede)
- **Port**: 5000
- **Logging**: Configurado em `pytest.ini` e em nível de módulo nos arquivos Python
- **Formatação**: Automática ao salvar (VS Code)
