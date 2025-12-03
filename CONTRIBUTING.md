# Guia de Contribuição

## Configuração do Ambiente

### 1. Instalar Dependências

```bash
# Criar ambiente virtual
python -m venv .venv
source .venv/bin/activate  # Linux/macOS

# Instalar dependências Python
pip install -r requirements.txt

# Instalar dependências Node (para Prettier)
npm install
```

### 2. Configurar Formatadores

O projeto usa:
- **Ruff**: Formatador e linter Python (rápido e moderno)
- **Prettier**: Formatador para JavaScript, CSS e HTML

#### Instalação Manual (se necessário)

```bash
# Python
pip install ruff black pytest

# Node
npm install -g prettier
```

## Comandos Disponíveis

### Usando Make (Recomendado)

```bash
make help          # Ver todos os comandos disponíveis
make install       # Instalar todas as dependências
make format        # Formatar todo o código
make format-check  # Verificar formatação sem modificar
make lint          # Executar linters
make lint-fix      # Corrigir problemas automaticamente
make test          # Executar testes
make run           # Iniciar servidor
make clean         # Limpar arquivos temporários
```

### Usando NPM

```bash
npm run format           # Formatar JS/CSS/HTML
npm run format:check     # Verificar formatação JS/CSS/HTML
npm run format:python    # Formatar Python
npm run format:all       # Formatar tudo
npm run lint:js          # Lint JS/CSS/HTML
npm run lint:python      # Lint Python
npm run lint:all         # Lint tudo
npm run fix:python       # Corrigir problemas Python
```

### Usando Comandos Diretos

```bash
# Python - Ruff
ruff format projects/              # Formatar
ruff format --check projects/      # Verificar formatação
ruff check projects/               # Lint
ruff check --fix projects/         # Lint e corrigir

# JavaScript/CSS/HTML - Prettier
prettier --write "projects/**/*.{js,css,html}"    # Formatar
prettier --check "projects/**/*.{js,css,html}"    # Verificar
```

## Padrões de Código

### Python

- **Comprimento de linha**: 120 caracteres
- **Indentação**: 4 espaços
- **Aspas**: Duplas (`"`)
- **Imports**: Organizados automaticamente pelo Ruff
- **Docstrings**: Estilo Google/NumPy

### JavaScript

- **Comprimento de linha**: 100 caracteres
- **Indentação**: 4 espaços
- **Aspas**: Simples (`'`)
- **Ponto e vírgula**: Obrigatório
- **Trailing comma**: ES5

### HTML/CSS

- **Indentação**: 4 espaços
- **Comprimento de linha**: 120 caracteres (HTML), 100 (CSS)

## Workflow de Desenvolvimento

### Antes de Commitar

```bash
# 1. Formatar código
make format

# 2. Executar linters
make lint

# 3. Executar testes
make test

# 4. Verificar se tudo está OK
make format-check
```

### Configuração do VS Code

O projeto inclui configurações do VS Code em `.vscode/settings.json`:

- **Formatação automática ao salvar**
- **Organização automática de imports**
- **Remoção de espaços em branco**
- **Inserção de linha final**

Extensões recomendadas (`.vscode/extensions.json`):
- Ruff (charliermarsh.ruff)
- Prettier (esbenp.prettier-vscode)
- Python (ms-python.python)
- Pylance (ms-python.vscode-pylance)

### Pre-commit Hook (Opcional)

Para garantir que o código está formatado antes de cada commit:

```bash
# Instalar pre-commit
pip install pre-commit

# Criar .pre-commit-config.yaml (já incluído no projeto)
# Instalar hooks
pre-commit install

# Executar manualmente
pre-commit run --all-files
```

## Estrutura de Commits

Use commits semânticos:

```
feat: adicionar nova funcionalidade
fix: corrigir bug
docs: atualizar documentação
style: formatação, ponto e vírgula, etc
refactor: refatoração de código
test: adicionar ou modificar testes
chore: atualizar dependências, configurações
```

Exemplo:
```bash
git commit -m "feat: adicionar tema escuro na interface"
git commit -m "fix: corrigir bug na validação de exercícios"
git commit -m "docs: atualizar README com instruções de instalação"
```

## Testes

```bash
# Executar todos os testes
pytest

# Executar com cobertura
pytest --cov=projects

# Executar teste específico
pytest projects/testes/test_app.py

# Executar com verbose
pytest -v
```

## Troubleshooting

### Ruff não encontrado
```bash
pip install ruff
# ou
pip install -r requirements.txt
```

### Prettier não encontrado
```bash
npm install
# ou
npm install -g prettier
```

### Conflitos de formatação
```bash
# Limpar cache
make clean

# Reinstalar dependências
make install

# Formatar novamente
make format
```

## Recursos

- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [Prettier Documentation](https://prettier.io/docs/en/)
- [Python Style Guide (PEP 8)](https://pep8.org/)
- [Flask Best Practices](https://flask.palletsprojects.com/en/latest/patterns/)
