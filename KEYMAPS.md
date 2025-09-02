# 🚀 Neovim Configuration - Keymaps Reference

## 📋 Tabla de Contenidos

- [Navegación](#navegación)
- [Edición](#edición)
- [Búsqueda](#búsqueda)
- [Explorador de Archivos](#explorador-de-archivos)
- [Telescope](#telescope)
- [LSP](#lsp)
- [Git](#git)
- [Terminal](#terminal)
- [Buffers](#buffers)
- [Trouble](#trouble)

---

## 🧭 Navegación

| Tecla            | Modo   | Descripción                      |
| ---------------- | ------ | -------------------------------- |
| `<C-h/j/k/l>`    | Normal | Navegar entre ventanas           |
| `<C-h/j/k/l>`    | Insert | Movimiento en modo insert        |
| `<C-Up/Down>`    | Normal | Redimensionar ventana vertical   |
| `<C-Left/Right>` | Normal | Redimensionar ventana horizontal |
| `<S-h/l>`        | Normal | Navegar entre buffers            |
| `<leader>bd`     | Normal | Cerrar buffer actual             |

---

## ✏️ Edición

| Tecla     | Modo          | Descripción                 |
| --------- | ------------- | --------------------------- |
| `<C-s>`   | Normal/Insert | Guardar archivo             |
| `jk`      | Insert        | Salir del modo insert       |
| `<A-j/k>` | Normal/Visual | Mover líneas arriba/abajo   |
| `</>>`    | Visual        | Indentar mantener selección |
| `p`       | Visual        | Pegar sin perder clipboard  |
| `J`       | Normal        | Unir líneas (mejorado)      |
| `<C-d/u>` | Normal        | Scroll centrado             |
| `n/N`     | Normal        | Búsqueda centrada           |

---

## 🔍 Búsqueda

| Tecla        | Modo   | Descripción                             |
| ------------ | ------ | --------------------------------------- |
| `<Esc>`      | Normal | Limpiar resaltado                       |
| `<leader>sr` | Normal | Buscar y reemplazar palabra bajo cursor |

---

## 📁 Explorador de Archivos

| Tecla        | Modo   | Descripción     |
| ------------ | ------ | --------------- |
| `<leader>e`  | Normal | Toggle NvimTree |
| `<leader>ef` | Normal | Focus NvimTree  |

---

## 🔭 Telescope

| Tecla        | Modo   | Descripción                |
| ------------ | ------ | -------------------------- |
| `<leader>ff` | Normal | Buscar archivos            |
| `<leader>fg` | Normal | Buscar en contenido (grep) |
| `<leader>fb` | Normal | Buscar buffers             |
| `<leader>fh` | Normal | Buscar ayuda               |
| `<leader>fr` | Normal | Archivos recientes         |
| `<leader>fc` | Normal | Cambiar colorscheme        |

### Navegación en Telescope

| Tecla     | Descripción        |
| --------- | ------------------ |
| `<C-j/k>` | Navegar resultados |
| `<C-q>`   | Enviar a quickfix  |

---

## 🔧 LSP

| Tecla        | Modo          | Descripción           |
| ------------ | ------------- | --------------------- |
| `gD`         | Normal        | Ir a declaración      |
| `gd`         | Normal        | Ir a definición       |
| `K`          | Normal        | Mostrar documentación |
| `gi`         | Normal        | Ir a implementación   |
| `<C-k>`      | Normal        | Signature help        |
| `<leader>D`  | Normal        | Type definition       |
| `<leader>rn` | Normal        | Renombrar símbolo     |
| `<leader>ca` | Normal/Visual | Code actions          |
| `gr`         | Normal        | Referencias           |
| `<leader>f`  | Normal        | Formatear archivo     |

### Workspace

| Tecla        | Descripción              |
| ------------ | ------------------------ |
| `<leader>wa` | Agregar workspace folder |
| `<leader>wr` | Remover workspace folder |
| `<leader>wl` | Listar workspace folders |

---

## 🌿 Git

| Tecla        | Modo          | Descripción     |
| ------------ | ------------- | --------------- |
| `]c`         | Normal        | Siguiente hunk  |
| `[c`         | Normal        | Hunk anterior   |
| `<leader>hs` | Normal/Visual | Stage hunk      |
| `<leader>hr` | Normal/Visual | Reset hunk      |
| `<leader>hS` | Normal        | Stage buffer    |
| `<leader>hu` | Normal        | Undo stage hunk |
| `<leader>hR` | Normal        | Reset buffer    |
| `<leader>hp` | Normal        | Preview hunk    |
| `<leader>hb` | Normal        | Blame line      |
| `<leader>tb` | Normal        | Toggle blame    |
| `<leader>hd` | Normal        | Diff this       |
| `<leader>td` | Normal        | Toggle deleted  |

---

## 💻 Terminal

| Tecla         | Modo            | Descripción                     |
| ------------- | --------------- | ------------------------------- |
| `<C-\>`       | Normal/Terminal | Toggle terminal flotante        |
| `<Esc>`       | Terminal        | Salir modo terminal             |
| `jk`          | Terminal        | Salir modo terminal             |
| `<C-h/j/k/l>` | Terminal        | Navegar ventanas desde terminal |

---

## 📄 Buffers

| Tecla        | Modo   | Descripción      |
| ------------ | ------ | ---------------- |
| `<S-h>`      | Normal | Buffer anterior  |
| `<S-l>`      | Normal | Buffer siguiente |
| `<leader>bd` | Normal | Cerrar buffer    |

---

## 🚨 Trouble (Diagnósticos)

| Tecla        | Modo   | Descripción           |
| ------------ | ------ | --------------------- |
| `<leader>xx` | Normal | Toggle Trouble        |
| `<leader>xw` | Normal | Workspace diagnostics |
| `<leader>xd` | Normal | Document diagnostics  |
| `<leader>xl` | Normal | Location list         |
| `<leader>xq` | Normal | Quickfix list         |
| `gR`         | Normal | LSP references        |

---

## 💡 Comentarios

| Tecla | Modo          | Descripción                 |
| ----- | ------------- | --------------------------- |
| `gcc` | Normal        | Toggle comentario línea     |
| `gc`  | Normal/Visual | Toggle comentario linewise  |
| `gbc` | Normal        | Toggle comentario bloque    |
| `gb`  | Normal/Visual | Toggle comentario blockwise |

---

## 🎨 Características Adicionales

### Autopairs

- Cierre automático de paréntesis, corchetes y comillas
- `<M-e>` para fast wrap

### Surround (nvim-surround)

- `ys{motion}{char}` - Agregar surround
- `ds{char}` - Eliminar surround
- `cs{old}{new}` - Cambiar surround

### Treesitter

- Resaltado de sintaxis mejorado
- Text objects: `af/if` (función), `ac/ic` (clase)
- Navegación: `]m/[m` (función), `]]/[[` (clase)

### Which-key

- Presiona `<leader>` y espera para ver atajos disponibles
- Ayuda contextual automática

---

## 🎯 Leader Key

**Leader key**: `<Space>`

## 📝 Notas

- Los atajos están optimizados para productividad
- Usa `which-key` para descubrir nuevos atajos
- La mayoría de plugins tienen configuración sensible por defecto
- Los diagnósticos LSP se muestran automáticamente
