# 📁 COMO COPIAR O PROJETO PARA UMA PASTA RAIZ

## 🎯 OBJETIVO
Copiar todo o projeto "La Nonna Stock Management" para uma pasta no seu computador para poder fazer deploy.

## 📋 MÉTODOS PARA COPIAR O PROJETO

### 🖥️ **MÉTODO 1: DOWNLOAD DIRETO (MAIS FÁCIL)**

#### **No VSCode:**
1. **Clicar com botão direito** na pasta raiz do projeto (onde estão todos os arquivos)
2. **Selecionar "Download"** ou "Export"
3. **Escolher local** para salvar (ex: `C:\Projetos\la-nonna-stock`)

#### **Ou usar terminal:**
```bash
# Criar pasta no seu computador
mkdir C:\Projetos\la-nonna-stock
# ou no Mac/Linux:
mkdir ~/Projetos/la-nonna-stock

# Copiar todos os arquivos
cp -r . C:\Projetos\la-nonna-stock\
# ou no Mac/Linux:
cp -r . ~/Projetos/la-nonna-stock/
```

### 🖥️ **MÉTODO 2: CRIAR ARQUIVO ZIP**

```bash
# Criar arquivo zip com todo o projeto
zip -r la-nonna-stock.zip . -x "node_modules/*" ".next/*"

# Depois extrair onde quiser no seu computador
```

### 🖥️ **MÉTODO 3: MANUAL (COPIAR E COLAR)**

1. **Selecionar todos os arquivos** no VSCode
2. **Copiar** (Ctrl+C)
3. **Criar pasta** no seu computador: `C:\Projetos\la-nonna-stock`
4. **Colar** (Ctrl+V) todos os arquivos na nova pasta

## 📂 **ESTRUTURA QUE DEVE SER COPIADA**

Certifique-se de copiar TODOS estes arquivos e pastas:

```
la-nonna-stock/
├── 📁 src/
│   ├── 📁 app/
│   ├── 📁 components/
│   ├── 📁 hooks/
│   └── 📁 lib/
├── 📁 public/
├── 📄 package.json
├── 📄 package-lock.json
├── 📄 next.config.ts
├── 📄 tsconfig.json
├── 📄 tailwind.config.js
├── 📄 components.json
├── 📄 .gitignore
├── 📄 README.md
├── 📄 MODERNIZATION_PLAN.md
├── 📄 DEPLOY_GUIDE.md
├── 📄 README_DEPLOY.md
├── 📄 COMO_EXECUTAR_SCRIPT.md
├── 📄 COMO_COPIAR_PROJETO.md
└── 📄 deploy.sh
```

## 🚀 **DEPOIS DE COPIAR - PASSOS SEGUINTES**

### 1. **Abrir terminal na nova pasta**
```bash
# Windows
cd C:\Projetos\la-nonna-stock

# Mac/Linux
cd ~/Projetos/la-nonna-stock
```

### 2. **Verificar se está tudo lá**
```bash
# Listar arquivos
ls
# ou no Windows:
dir

# Deve ver: package.json, src/, deploy.sh, etc.
```

### 3. **Instalar dependências**
```bash
npm install
```

### 4. **Testar se funciona**
```bash
npm run dev
```

### 5. **Fazer deploy**
```bash
./deploy.sh
```

## 🛠️ **SCRIPT AUTOMÁTICO PARA COPIAR**

Vou criar um script que faz tudo automaticamente:

```bash
#!/bin/bash
# Script para copiar projeto para pasta raiz

echo "🍝 Copiando La Nonna Stock Management..."

# Perguntar onde copiar
read -p "Digite o caminho onde quer copiar (ex: /home/user/Projetos): " DESTINO

# Criar pasta de destino
mkdir -p "$DESTINO/la-nonna-stock"

# Copiar arquivos (excluindo node_modules e .next)
rsync -av --exclude='node_modules' --exclude='.next' --exclude='.git' . "$DESTINO/la-nonna-stock/"

echo "✅ Projeto copiado para: $DESTINO/la-nonna-stock"
echo "📁 Próximos passos:"
echo "   cd $DESTINO/la-nonna-stock"
echo "   npm install"
echo "   ./deploy.sh"
```

## 🎯 **LOCAIS RECOMENDADOS PARA COPIAR**

### **Windows:**
- `C:\Projetos\la-nonna-stock`
- `C:\Users\SeuNome\Documents\Projetos\la-nonna-stock`
- `D:\Projetos\la-nonna-stock`

### **Mac:**
- `~/Projetos/la-nonna-stock`
- `~/Documents/Projetos/la-nonna-stock`
- `~/Desktop/la-nonna-stock`

### **Linux:**
- `~/Projetos/la-nonna-stock`
- `/home/seuusuario/Projetos/la-nonna-stock`
- `~/Documents/la-nonna-stock`

## ✅ **CHECKLIST APÓS COPIAR**

- [ ] Pasta criada no local desejado
- [ ] Todos os arquivos copiados
- [ ] `package.json` presente
- [ ] Pasta `src/` presente
- [ ] `deploy.sh` presente
- [ ] Terminal aberto na pasta correta
- [ ] `npm install` executado
- [ ] `npm run dev` funcionando
- [ ] Pronto para `./deploy.sh`

## 🆘 **SE DER PROBLEMA**

```bash
# Se faltar algum arquivo
# Volte e copie novamente todos os arquivos

# Se der erro de dependências
npm install

# Se der erro de permissão no deploy.sh
chmod +x deploy.sh

# Se não conseguir executar
# Use os comandos manuais do DEPLOY_GUIDE.md
```

## 🎉 **RESULTADO FINAL**

Após copiar e seguir os passos:
1. ✅ Projeto na sua pasta raiz
2. ✅ Dependências instaladas
3. ✅ Aplicação funcionando
4. ✅ Pronto para deploy
5. ✅ Script de deploy funcionando

**🚀 Agora você pode fazer deploy da sua aplicação!**
