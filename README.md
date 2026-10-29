# Sistemas Lineares 3x3 Escalonados — Turma 2º 4
**Professor Natanael de Matemática**

Aplicativo web educacional interativo otimizado para celulares (iPhone e Android) e computadores, integrado ao **Supabase** para listagem de alunos da Turma 2º 4, resolução passo a passo em animações estilo Manim, envio de fotos dos cadernos e painel de acompanhamento de entregas em tempo real.

---

## 🚀 Como Rodar e Publicar no Antigravity / Terminal

### 1. Testar localmente no Antigravity / VS Code
Abra a pasta do projeto no terminal do Antigravity e execute:

```bash
# Opção A: com npx (não precisa instalar nada)
npx serve .

# Opção B: com Python
python3 -m http.server 8080
```
Abra o link gerado (ex: `http://localhost:8080` ou a prévia do Antigravity) para ver o aplicativo funcionando.

---

### 2. Publicar no GitHub e GitHub Pages

No terminal do Antigravity, execute os comandos na sequência:

```bash
# 1. Inicializar o repositório Git
git init

# 2. Adicionar todos os arquivos
git add .

# 3. Criar o commit inicial
git commit -m "Publicação do aplicativo de Sistemas 3x3 - Turma 2º 4"

# 4. Definir a branch principal como main
git branch -M main

# 5. Conectar com o seu repositório no GitHub (substitua com o link do seu repo criado em github.com/new)
git remote add origin https://github.com/SEU_USUARIO_GITHUB/NOME_DO_REPOSITORIO.git

# 6. Enviar para o GitHub
git push -u origin main
```

#### Ativando o GitHub Pages:
1. No seu repositório no GitHub, clique em **Settings** (Configurações) no menu superior.
2. Na barra lateral esquerda, clique em **Pages**.
3. Em **Build and deployment > Branch**, selecione `main` e a pasta `/ (root)`, depois clique em **Save**.
4. Em 1 minuto, o link público seguro estará ativo (ex.: `https://seu-usuario.github.io/sistemas-3x3/`) para você enviar no WhatsApp da Turma 2º 4!

---

## 📊 Estrutura e Funcionalidades

1. **Seleção de Alunos:** Conectado à tabela `remota_alunos` do Supabase. O estudante seleciona seu nome no menu suspenso ou busca com o filtro rápido.
2. **6 Questões Escalonadas:** Resolução de sistemas 3x3 por substituição regressiva de baixo para cima com animações fluidas estilo Manim.
3. **Envio da Foto do Caderno:** O aluno tira a foto direto da câmera do celular ou anexa da galeria para cada questão.
4. **Painel do Professor Natanael (Botão 'Entregas'):**
   - **✓ Entregaram:** Lista os estudantes que concluíram a tarefa, data/hora, respostas digitadas e miniaturas com zoom das fotos do caderno.
   - **⏳ NÃO Entregaram:** Cruza a lista oficial de alunos com os envios e mostra exatamente quais alunos ainda estão pendentes.
   - **Exportar CSV:** Gera a planilha de acompanhamento da turma com 1 clique.
