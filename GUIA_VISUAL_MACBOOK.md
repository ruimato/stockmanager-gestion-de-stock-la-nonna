# 🍎 GUIA VISUAL PARA MACBOOK - LA NONNA STOCK MANAGEMENT

## 🎯 PASSO A PASSO COM IMAGENS (ASCII)

### 📱 **PASSO 1: ABRIR TERMINAL NO VSCODE**

```
┌─────────────────────────────────────────────────────────────┐
│  VSCode - La Nonna Stock Management                         │
├─────────────────────────────────────────────────────────────┤
│  📁 src/                                                    │
│  📁 public/                                                 │
│  📄 package.json                                            │
│  📄 deploy.sh                                               │
│  📄 copiar-projeto.sh                                       │
│                                                             │
│  ┌─────────────────────────────────────────────────────────┐ │
│  │ TERMINAL (Cmd + `)                                      │ │
│  │ $ ./copiar-projeto.sh                                   │ │
│  │ 🍝 La Nonna Stock Management - Copiar Projeto           │ │
│  │ =============================================           │ │
│  │                                                         │ │
│  └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

**AÇÃO:** Pressione `Cmd + `` para abrir terminal no VSCode

### 📱 **PASSO 2: EXECUTAR SCRIPT DE CÓPIA**

```
┌─────────────────────────────────────────────────────────────┐
│ TERMINAL - Copiar Projeto                                   │
├─────────────────────────────────────────────────────────────┤
│ $ ./copiar-projeto.sh                                       │
│                                                             │
│ 🍝 La Nonna Stock Management - Copiar Projeto               │
│ =============================================               │
│ [INFO] Sistema detectado: Mac                               │
│                                                             │
│ Onde você quer copiar o projeto?                            │
│                                                             │
│ 1) ~/Projetos/la-nonna-stock (Recomendado) ← ESCOLHA ESTA  │
│ 2) ~/Documents/Projetos/la-nonna-stock                     │
│ 3) ~/Desktop/la-nonna-stock                                │
│ 4) Digitar caminho personalizado                           │
│                                                             │
│ Digite sua escolha (1-4): █                                │
└─────────────────────────────────────────────────────────────┘
```

**AÇÃO:** Digite `1` e pressione Enter

### 📱 **PASSO 3: SCRIPT COPIANDO ARQUIVOS**

```
┌─────────────────────────────────────────────────────────────┐
│ TERMINAL - Copiando Arquivos                                │
├─────────────────────────────────────────────────────────────┤
│ [INFO] Destino selecionado: ~/Projetos/la-nonna-stock      │
│ [INFO] Criando pasta de destino...                         │
│ [SUCCESS] Pasta criada: ~/Projetos/la-nonna-stock          │
│ [INFO] Copiando arquivos do projeto...                     │
│ [SUCCESS] Copiado: src/                                     │
│ [SUCCESS] Copiado: public/                                  │
│ [SUCCESS] Copiado: package.json                             │
│ [SUCCESS] Copiado: deploy.sh                                │
│ [SUCCESS] Copiado: README.md                                │
│ [INFO] Configurando permissões...                          │
│ [SUCCESS] Permissões configuradas para deploy.sh           │
│                                                             │
│ 🎉 Projeto copiado com sucesso!                             │
│                                                             │
│ 📁 Localização: ~/Projetos/la-nonna-stock                  │
└─────────────────────────────────────────────────────────────┘
```

**RESULTADO:** Projeto copiado com sucesso!

### 📱 **PASSO 4: ABRIR TERMINAL DO MAC**

```
┌─────────────────────────────────────────────────────────────┐
│  🍎 MacBook - Desktop                                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│    🔍 Spotlight Search (Cmd + Espaço)                      │
│    ┌─────────────────────────────────────────────────────┐   │
│    │ Terminal                                            │   │
│    │ 💻 Terminal.app                     ← CLIQUE AQUI   │   │
│    │ 📄 Terminal Manual                                  │   │
│    └─────────────────────────────────────────────────────┘   │
│                                                             │
│                                                             │
│  OU use: Applications → Utilities → Terminal                │
└─────────────────────────────────────────────────────────────┘
```

**AÇÃO:** `Cmd + Espaço` → digite "Terminal" → Enter

### 📱 **PASSO 5: NAVEGAR PARA PASTA E INSTALAR**

```
┌─────────────────────────────────────────────────────────────┐
│ 💻 Terminal - MacBook                                       │
├─────────────────────────────────────────────────────────────┤
│ Last login: Mon Jan 15 10:30:45 on ttys000                 │
│ user@MacBook-Pro ~ $ cd ~/Projetos/la-nonna-stock          │
│ user@MacBook-Pro la-nonna-stock $ ls                       │
│ README.md            deploy.sh            public/           │
│ package.json         src/                 node_modules/     │
│                                                             │
│ user@MacBook-Pro la-nonna-stock $ npm install              │
│ npm WARN deprecated ...                                     │
│ added 1247 packages from 632 contributors                  │
│                                                             │
│ [SUCCESS] Dependências instaladas!                         │
│                                                             │
│ user@MacBook-Pro la-nonna-stock $ █                        │
└─────────────────────────────────────────────────────────────┘
```

**COMANDOS:**
```bash
cd ~/Projetos/la-nonna-stock
npm install
```

### 📱 **PASSO 6: EXECUTAR DEPLOY**

```
┌─────────────────────────────────────────────────────────────┐
│ 💻 Terminal - Deploy                                        │
├─────────────────────────────────────────────────────────────┤
│ user@MacBook-Pro la-nonna-stock $ ./deploy.sh              │
│                                                             │
│ 🍝 La Nonna Stock Management - Deploy Script               │
│ =============================================               │
│ [SUCCESS] Node.js encontrado: v20.12.1                     │
│ [SUCCESS] npm encontrado: 10.5.0                           │
│                                                             │
│ Escolha uma opção de deploy:                                │
│ 1) 🌟 Vercel (Recomendado - Mais fácil) ← ESCOLHA ESTA     │
│ 2) 🔷 Netlify                                               │
│ 3) 📋 Apenas preparar projeto (build + git)                │
│ 4) 🧪 Apenas testar localmente                             │
│ 5) ❌ Sair                                                  │
│                                                             │
│ Digite sua escolha (1-5): █                                │
└─────────────────────────────────────────────────────────────┘
```

**AÇÃO:** Digite `1` e pressione Enter

### 📱 **PASSO 7: PROCESSO DE DEPLOY**

```
┌─────────────────────────────────────────────────────────────┐
│ 💻 Terminal - Deploy em Progresso                           │
├─────────────────────────────────────────────────────────────┤
│ [INFO] Deploy para Vercel selecionado!                     │
│ [INFO] Instalando dependências...                          │
│ [SUCCESS] Dependências instaladas com sucesso!             │
│ [INFO] Fazendo build do projeto...                         │
│ ✓ Creating an optimized production build                   │
│ ✓ Compiled successfully                                     │
│ [SUCCESS] Build realizado com sucesso!                     │
│ [INFO] Configurando Git...                                 │
│ [SUCCESS] Repositório Git inicializado!                    │
│ [SUCCESS] Commit realizado!                                │
│ [INFO] Fazendo login no Vercel...                          │
│                                                             │
│ > Opening browser to login... 🌐                           │
└─────────────────────────────────────────────────────────────┘
```

### 📱 **PASSO 8: LOGIN NO SAFARI**

```
┌─────────────────────────────────────────────────────────────┐
│ 🌐 Safari - Vercel Login                                   │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ 🔒 vercel.com/login                                     │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                             │
│              ⚡ Vercel                                      │
│                                                             │
│         Continue with GitHub                                │
│    ┌─────────────────────────────────────────────────────┐   │
│    │  🐙 Continue with GitHub     ← CLIQUE AQUI          │   │
│    └─────────────────────────────────────────────────────┘   │
│                                                             │
│         Continue with GitLab                                │
│    ┌─────────────────────────────────────────────────────┐   │
│    │  🦊 Continue with GitLab                            │   │
│    └─────────────────────────────────────────────────────┘   │
│                                                             │
│         Continue with Email                                 │
└─────────────────────────────────────────────────────────────┘
```

**AÇÃO:** Clique em "Continue with GitHub"

### 📱 **PASSO 9: DEPLOY FINALIZADO**

```
┌─────────────────────────────────────────────────────────────┐
│ 💻 Terminal - Deploy Concluído                             │
├─────────────────────────────────────────────────────────────┤
│ ✅ Authentication complete. Welcome to Vercel!             │
│ [INFO] Fazendo deploy...                                   │
│ 🔗 Linked to user/la-nonna-stock (created .vercel)        │
│ 🔍 Inspect: https://vercel.com/user/la-nonna-stock/xyz     │
│ ✅ Production: https://la-nonna-stock-abc123.vercel.app    │
│                                                             │
│ [SUCCESS] Deploy para Vercel realizado com sucesso!        │
│ [SUCCESS] Sua aplicação está no ar! 🎉                     │
│                                                             │
│ 🌟 URL da sua aplicação:                                   │
│ https://la-nonna-stock-abc123.vercel.app                   │
│                                                             │
│ [SUCCESS] Script finalizado! 🎉                            │
│ user@MacBook-Pro la-nonna-stock $ █                        │
└─────────────────────────────────────────────────────────────┘
```

### 📱 **PASSO 10: APLICAÇÃO ONLINE**

```
┌─────────────────────────────────────────────────────────────┐
│ 🌐 Safari - Sua Aplicação Online                           │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ 🔒 https://la-nonna-stock-abc123.vercel.app             │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                             │
│  🍝 La Nonna                    🔍 [Pesquisar...]  👤 LN   │
│  Gestion de Stock                                           │
│                                                             │
│  📊 Tableau de Bord                                        │
│  Vue d'ensemble de votre gestion de stock - La Nonna       │
│                                                             │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌────────┐ │
│  │Total Produit│ │Stock Faible │ │Expire Bientôt│ │Valeur  │ │
│  │     8       │ │     3       │ │      7       │ │3805 CHF│ │
│  │ +12% ↑      │ │ -8% ↓       │ │ +15% ↑       │ │ +8% ↑  │ │
│  └─────────────┘ └─────────────┘ └─────────────┘ └────────┘ │
│                                                             │
│  🎉 SUA APLICAÇÃO ESTÁ NO AR! 🎉                           │
└─────────────────────────────────────────────────────────────┘
```

## 🎯 **RESUMO VISUAL DOS COMANDOS**

```
┌─────────────────────────────────────────────────────────────┐
│ 📋 SEQUÊNCIA COMPLETA - MACBOOK                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ 1️⃣ VSCode: Cmd + ` → ./copiar-projeto.sh → escolher 1     │
│                                                             │
│ 2️⃣ Mac: Cmd + Espaço → "Terminal" → Enter                  │
│                                                             │
│ 3️⃣ Terminal: cd ~/Projetos/la-nonna-stock                  │
│                                                             │
│ 4️⃣ Terminal: npm install                                   │
│                                                             │
│ 5️⃣ Terminal: ./deploy.sh → escolher 1                      │
│                                                             │
│ 6️⃣ Safari: Login com GitHub                                │
│                                                             │
│ 7️⃣ 🎉 APP NO AR! 🎉                                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**🚀 EM 10 MINUTOS SUA APP ESTARÁ ONLINE! 🍎**
