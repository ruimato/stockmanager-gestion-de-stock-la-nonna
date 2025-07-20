# 🚀 COMO COLOCAR A APP NO AR - GUIA RÁPIDO

## 🎯 MÉTODO MAIS FÁCIL (RECOMENDADO)

### Opção 1: Script Automático
```bash
# Execute o script automático
./deploy.sh

# Escolha opção 1 (Vercel)
# O script fará tudo automaticamente!
```

### Opção 2: Manual Rápido (Vercel)
```bash
# 1. Preparar projeto
npm install
npm run build

# 2. Configurar Git
git init
git add .
git commit -m "La Nonna Stock Management"

# 3. Criar repositório no GitHub
# - Ir para github.com
# - Criar novo repositório "la-nonna-stock"
# - Copiar URL

# 4. Conectar ao GitHub
git remote add origin https://github.com/SEU_USUARIO/la-nonna-stock.git
git push -u origin main

# 5. Deploy no Vercel
# - Ir para vercel.com
# - Fazer login com GitHub
# - Clicar "New Project"
# - Importar "la-nonna-stock"
# - Clicar "Deploy"
# - PRONTO! 🎉
```

## 📱 RESULTADO

Sua app estará disponível em:
- **Vercel**: `https://la-nonna-stock-seu-usuario.vercel.app`
- **Domínio personalizado**: Configurável no painel do Vercel

## 🔧 OUTRAS OPÇÕES

Para métodos avançados, consulte:
- `DEPLOY_GUIDE.md` - Guia completo com todas as opções
- `./deploy.sh` - Script automático com menu interativo

## 🆘 PROBLEMAS?

```bash
# Se der erro de build
npm run build

# Se der erro de dependências
rm -rf node_modules package-lock.json
npm install

# Se der erro de Git
git init
git add .
git commit -m "Initial commit"
```

## ✅ CHECKLIST RÁPIDO

- [ ] Node.js instalado
- [ ] Projeto funcionando localmente (`npm run dev`)
- [ ] Conta no GitHub
- [ ] Conta no Vercel
- [ ] Executar `./deploy.sh` ou seguir passos manuais

**🎉 Em 5-10 minutos sua app estará no ar!**
