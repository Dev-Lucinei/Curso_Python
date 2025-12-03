# Guia de Temas - Curso Interativo Python

## Visão Geral

O sistema de temas permite alternar entre modo claro e escuro, com persistência da preferência do usuário via localStorage.

## Variáveis CSS

Todas as cores são definidas como variáveis CSS em `:root` e `[data-theme="dark"]`:

### Tema Claro (padrão)
- `--bg-primary`: #f8f9fa (fundo principal)
- `--bg-secondary`: #ffffff (fundo de cards)
- `--bg-tertiary`: #e9ecef (jumbotron, áreas destacadas)
- `--text-primary`: #333 (texto principal)
- `--text-secondary`: #6c757d (texto secundário)

### Tema Escuro
- `--bg-primary`: #1a1a1a (fundo principal)
- `--bg-secondary`: #2d2d2d (fundo de cards)
- `--bg-tertiary`: #3a3a3a (jumbotron, áreas destacadas)
- `--text-primary`: #e0e0e0 (texto principal)
- `--text-secondary`: #a0a0a0 (texto secundário)

## Funcionamento

1. **Detecção Inicial**: Verifica localStorage ou preferência do sistema
2. **Alternância**: Botão no navbar alterna entre temas
3. **Persistência**: Preferência salva em localStorage
4. **CodeMirror**: Alterna entre temas 'default' (claro) e 'monokai' (escuro)

## Adicionar Suporte a Novos Elementos

Para adicionar suporte a tema escuro em novos elementos:

```css
.novo-elemento {
    background-color: var(--bg-secondary);
    color: var(--text-primary);
}
```

Para estilos específicos do tema escuro:

```css
[data-theme="dark"] .novo-elemento {
    /* estilos específicos */
}
```

## Arquivos Modificados

- `projects/static/css/style.css` - Variáveis e estilos de tema
- `projects/static/js/main.js` - Lógica de alternância de tema
- `projects/static/js/editor.js` - Suporte a tema no CodeMirror
- `projects/templates/base.html` - Botão de alternância no navbar
