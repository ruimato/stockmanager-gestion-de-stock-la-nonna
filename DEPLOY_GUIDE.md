# 🚀 GUIA COMPLETO DE DEPLOY - LA NONNA STOCK MANAGEMENT

## 📋 OPÇÕES DE DEPLOY

### 1. 🌟 VERCEL (RECOMENDADO - MAIS FÁCIL)

#### Passo a Passo Vercel:

**1. Preparar o Projeto**
```bash
# 1. Criar build de produção para testar
npm run build

# 2. Testar localmente
npm start
```

**2. Deploy via GitHub (Método Mais Fácil)**
```bash
# 1. Inicializar Git (se ainda não feito)
git init
git add .
git commit -m "Initial commit - La Nonna Stock Management"

# 2. Criar repositório no GitHub
# - Ir para github.com
# - Criar novo repositório "la-nonna-stock"
# - Copiar URL do repositório

# 3. Conectar ao GitHub
git remote add origin https://github.com/SEU_USUARIO/la-nonna-stock.git
git branch -M main
git push -u origin main
```

**3. Deploy no Vercel**
```bash
# Opção A: Via CLI
npm i -g vercel
vercel login
vercel --prod

# Opção B: Via Website (Mais Fácil)
# 1. Ir para vercel.com
# 2. Fazer login com GitHub
# 3. Clicar "New Project"
# 4. Importar repositório "la-nonna-stock"
# 5. Configurar:
#    - Framework Preset: Next.js
#    - Build Command: npm run build
#    - Output Directory: .next
# 6. Clicar "Deploy"
```

**4. Configurações Avançadas Vercel**
```bash
# Criar arquivo vercel.json na raiz do projeto
{
  "framework": "nextjs",
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "regions": ["fra1"]
}
```

---

### 2. 🔷 NETLIFY

#### Passo a Passo Netlify:

**1. Preparar Build**
```bash
# Instalar Netlify CLI
npm install -g netlify-cli

# Build do projeto
npm run build
npm run export  # Se necessário
```

**2. Deploy**
```bash
# Via CLI
netlify login
netlify init
netlify deploy --prod --dir=out

# Via Website
# 1. Ir para netlify.com
# 2. Conectar com GitHub
# 3. Selecionar repositório
# 4. Configurar:
#    - Build command: npm run build
#    - Publish directory: .next
```

---

### 3. 🐳 DOCKER + VPS

#### Passo a Passo Docker:

**1. Criar Dockerfile**
```dockerfile
# Criar arquivo Dockerfile na raiz
FROM node:18-alpine AS base

# Install dependencies only when needed
FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm ci

# Rebuild the source code only when needed
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build

# Production image, copy all the files and run next
FROM base AS runner
WORKDIR /app

ENV NODE_ENV production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public

COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

ENV PORT 3000

CMD ["node", "server.js"]
```

**2. Criar .dockerignore**
```
node_modules
.next
.git
*.md
Dockerfile
.dockerignore
```

**3. Build e Deploy**
```bash
# Build da imagem
docker build -t la-nonna-stock .

# Testar localmente
docker run -p 3000:3000 la-nonna-stock

# Deploy para VPS
docker save la-nonna-stock | gzip > la-nonna-stock.tar.gz
scp la-nonna-stock.tar.gz user@seu-servidor.com:/home/user/
ssh user@seu-servidor.com
docker load < la-nonna-stock.tar.gz
docker run -d -p 80:3000 --name la-nonna la-nonna-stock
```

---

### 4. ☁️ AWS (AVANÇADO)

#### Passo a Passo AWS:

**1. Preparar para AWS**
```bash
# Instalar AWS CLI
npm install -g @aws-amplify/cli

# Configurar
amplify configure
amplify init
```

**2. Deploy**
```bash
amplify add hosting
amplify publish
```

---

### 5. 🔧 VPS TRADICIONAL (Ubuntu/CentOS)

#### Passo a Passo VPS:

**1. Preparar Servidor**
```bash
# Conectar ao servidor
ssh root@seu-servidor.com

# Instalar Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instalar PM2
npm install -g pm2

# Instalar Nginx
sudo apt update
sudo apt install nginx
```

**2. Upload do Projeto**
```bash
# No seu computador
scp -r . user@seu-servidor.com:/var/www/la-nonna/

# No servidor
cd /var/www/la-nonna
npm install
npm run build
```

**3. Configurar PM2**
```bash
# Criar ecosystem.config.js
module.exports = {
  apps: [{
    name: 'la-nonna-stock',
    script: 'npm',
    args: 'start',
    cwd: '/var/www/la-nonna',
    instances: 'max',
    exec_mode: 'cluster',
    env: {
      NODE_ENV: 'production',
      PORT: 3000
    }
  }]
}

# Iniciar aplicação
pm2 start ecosystem.config.js
pm2 startup
pm2 save
```

**4. Configurar Nginx**
```nginx
# /etc/nginx/sites-available/la-nonna
server {
    listen 80;
    server_name seu-dominio.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
```

```bash
# Ativar site
sudo ln -s /etc/nginx/sites-available/la-nonna /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

---

## 🔒 CONFIGURAÇÕES DE SEGURANÇA

### SSL/HTTPS (Certbot)
```bash
# Instalar Certbot
sudo apt install certbot python3-certbot-nginx

# Obter certificado
sudo certbot --nginx -d seu-dominio.com

# Renovação automática
sudo crontab -e
# Adicionar: 0 12 * * * /usr/bin/certbot renew --quiet
```

### Variáveis de Ambiente
```bash
# Criar .env.production
NODE_ENV=production
NEXTAUTH_URL=https://seu-dominio.com
NEXTAUTH_SECRET=sua-chave-secreta-muito-forte
DATABASE_URL=sua-url-do-banco
```

---

## 📊 MONITORAMENTO

### Logs e Monitoramento
```bash
# Ver logs PM2
pm2 logs la-nonna-stock

# Monitoramento
pm2 monit

# Status
pm2 status
```

---

## 🚀 RECOMENDAÇÃO FINAL

**Para iniciantes: USE VERCEL**
1. É gratuito para projetos pequenos
2. Deploy automático via GitHub
3. SSL automático
4. CDN global
5. Zero configuração

**Passos Rápidos Vercel:**
1. `git init && git add . && git commit -m "Initial commit"`
2. Criar repositório no GitHub
3. `git remote add origin URL_DO_REPO`
4. `git push -u origin main`
5. Ir para vercel.com
6. Conectar GitHub e importar projeto
7. Clicar "Deploy"
8. Pronto! Sua app estará no ar em minutos

**URL final será algo como:** `https://la-nonna-stock-seu-usuario.vercel.app`

---

## 🆘 TROUBLESHOOTING

### Problemas Comuns:
```bash
# Erro de build
npm run build  # Verificar se build funciona localmente

# Erro de dependências
rm -rf node_modules package-lock.json
npm install

# Erro de porta
# Verificar se PORT está configurado corretamente

# Erro de memória
# Aumentar limite: NODE_OPTIONS="--max-old-space-size=4096"
```

### Suporte:
- Vercel: https://vercel.com/docs
- Netlify: https://docs.netlify.com
- Next.js: https://nextjs.org/docs/deployment
