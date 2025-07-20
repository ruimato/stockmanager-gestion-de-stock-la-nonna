# 🚀 COMO EXECUTAR O SCRIPT DE DEPLOY - PASSO A PASSO

## 📍 ONDE EXECUTAR

O script deve ser executado **na pasta raiz do projeto** (onde estão os arquivos da aplicação).

### 🖥️ **OPÇÃO 1: TERMINAL DO VSCODE (MAIS FÁCIL)**

1. **Abrir Terminal no VSCode:**
   - Pressione `Ctrl + `` (backtick) ou
   - Menu: `Terminal` → `New Terminal` ou
   - Pressione `Ctrl + Shift + P` → digite "Terminal" → selecione "Terminal: Create New Terminal"

2. **Verificar se está na pasta correta:**
   ```bash
   # Digite este comando para ver onde você está
   pwd
   
   # Deve mostrar algo como: /project/sandbox/user-workspace
   # E você deve ver os arquivos do projeto
   ls
   ```

3. **Executar o script:**
   ```bash
   # Execute o script
   ./deploy.sh
   ```

### 🖥️ **OPÇÃO 2: TERMINAL DO SISTEMA (Windows/Mac/Linux)**

#### **Windows (PowerShell ou CMD):**
```bash
# 1. Navegar até a pasta do projeto
cd C:\caminho\para\seu\projeto\la-nonna

# 2. Verificar se está na pasta correta
dir

# 3. Executar o script
bash deploy.sh
# OU
./deploy.sh
```

#### **Mac/Linux (Terminal):**
```bash
# 1. Navegar até a pasta do projeto
cd /caminho/para/seu/projeto/la-nonna

# 2. Verificar se está na pasta correta
ls

# 3. Executar o script
./deploy.sh
```

## 🎯 **O QUE ACONTECE QUANDO EXECUTAR**

Quando você executar `./deploy.sh`, verá este menu:

```
🍝 La Nonna Stock Management - Deploy Script
=============================================

Escolha uma opção de deploy:
1) 🌟 Vercel (Recomendado - Mais fácil)
2) 🔷 Netlify
3) 📋 Apenas preparar projeto (build + git)
4) 🧪 Apenas testar localmente
5) ❌ Sair

Digite sua escolha (1-5):
```

**Digite `1` e pressione Enter** para usar o Vercel (mais fácil).

## 🔧 **SE DER ERRO DE PERMISSÃO**

Se aparecer erro como "Permission denied":

```bash
# Dar permissão de execução ao script
chmod +x deploy.sh

# Depois executar novamente
./deploy.sh
```

## 🆘 **SE NÃO CONSEGUIR EXECUTAR O SCRIPT**

### **MÉTODO MANUAL SUPER SIMPLES:**

1. **Abrir terminal na pasta do projeto**

2. **Executar comandos um por um:**
   ```bash
   # 1. Instalar dependências
   npm install
   
   # 2. Fazer build
   npm run build
   
   # 3. Instalar Vercel CLI
   npm install -g vercel
   
   # 4. Fazer login no Vercel
   vercel login
   
   # 5. Deploy
   vercel --prod
   ```

3. **Seguir as instruções que aparecerem na tela**

## 📱 **CONTAS NECESSÁRIAS**

Antes de executar, certifique-se de ter:

1. **Conta no GitHub** (gratuita)
   - Ir para: https://github.com
   - Criar conta se não tiver

2. **Conta no Vercel** (gratuita)
   - Ir para: https://vercel.com
   - Fazer login com GitHub

## 🎬 **SEQUÊNCIA COMPLETA**

```bash
# 1. Abrir terminal na pasta do projeto
cd /caminho/para/projeto

# 2. Verificar se os arquivos estão lá
ls
# Deve ver: package.json, src/, deploy.sh, etc.

# 3. Executar script
./deploy.sh

# 4. Escolher opção 1 (Vercel)
1

# 5. Seguir instruções na tela
# O script fará:
# - npm install
# - npm run build
# - git init e commit
# - vercel login (abrirá navegador)
# - vercel deploy

# 6. PRONTO! App no ar! 🎉
```

## ✅ **CHECKLIST ANTES DE EXECUTAR**

- [ ] Terminal aberto na pasta correta do projeto
- [ ] Node.js instalado (`node --version`)
- [ ] npm instalado (`npm --version`)
- [ ] Conta GitHub criada
- [ ] Conta Vercel criada (pode criar durante o processo)

## 🎯 **RESULTADO ESPERADO**

Após executar com sucesso, você verá:
```
✅ Deploy para Vercel realizado com sucesso!
✅ Sua aplicação está no ar! 🎉

Your project is now available at:
https://la-nonna-stock-abc123.vercel.app
```

**🚀 Sua app estará online e acessível para o mundo todo!**
