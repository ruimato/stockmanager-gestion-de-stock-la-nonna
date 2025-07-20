#!/bin/bash

# 🚀 Script de Deploy Automático - La Nonna Stock Management
# Autor: BlackBox AI
# Versão: 1.0

echo "🍝 La Nonna Stock Management - Deploy Script"
echo "============================================="

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para imprimir mensagens coloridas
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar se Node.js está instalado
check_node() {
    if ! command -v node &> /dev/null; then
        print_error "Node.js não está instalado!"
        print_status "Instale Node.js: https://nodejs.org/"
        exit 1
    fi
    print_success "Node.js encontrado: $(node --version)"
}

# Verificar se npm está instalado
check_npm() {
    if ! command -v npm &> /dev/null; then
        print_error "npm não está instalado!"
        exit 1
    fi
    print_success "npm encontrado: $(npm --version)"
}

# Instalar dependências
install_dependencies() {
    print_status "Instalando dependências..."
    if npm install; then
        print_success "Dependências instaladas com sucesso!"
    else
        print_error "Falha ao instalar dependências!"
        exit 1
    fi
}

# Fazer build do projeto
build_project() {
    print_status "Fazendo build do projeto..."
    if npm run build; then
        print_success "Build realizado com sucesso!"
    else
        print_error "Falha no build do projeto!"
        print_status "Verifique os erros acima e tente novamente."
        exit 1
    fi
}

# Testar build localmente
test_build() {
    print_status "Testando build localmente..."
    print_warning "Pressione Ctrl+C para parar o teste e continuar com o deploy"
    npm start &
    SERVER_PID=$!
    sleep 3
    
    if kill -0 $SERVER_PID 2>/dev/null; then
        print_success "Servidor local funcionando!"
        print_status "Teste em: http://localhost:3000"
        sleep 5
        kill $SERVER_PID
    else
        print_error "Falha ao iniciar servidor local!"
        exit 1
    fi
}

# Configurar Git
setup_git() {
    print_status "Configurando Git..."
    
    if [ ! -d ".git" ]; then
        git init
        print_success "Repositório Git inicializado!"
    fi
    
    # Criar .gitignore se não existir
    if [ ! -f ".gitignore" ]; then
        cat > .gitignore << EOF
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Production
.next/
out/
build/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db

# Logs
*.log
EOF
        print_success ".gitignore criado!"
    fi
    
    git add .
    git commit -m "Deploy: La Nonna Stock Management - $(date)"
    print_success "Commit realizado!"
}

# Deploy para Vercel
deploy_vercel() {
    print_status "Iniciando deploy para Vercel..."
    
    if ! command -v vercel &> /dev/null; then
        print_status "Instalando Vercel CLI..."
        npm install -g vercel
    fi
    
    print_status "Fazendo login no Vercel..."
    vercel login
    
    print_status "Fazendo deploy..."
    if vercel --prod; then
        print_success "Deploy para Vercel realizado com sucesso!"
        print_success "Sua aplicação está no ar! 🎉"
    else
        print_error "Falha no deploy para Vercel!"
        exit 1
    fi
}

# Deploy para Netlify
deploy_netlify() {
    print_status "Iniciando deploy para Netlify..."
    
    if ! command -v netlify &> /dev/null; then
        print_status "Instalando Netlify CLI..."
        npm install -g netlify-cli
    fi
    
    print_status "Fazendo login no Netlify..."
    netlify login
    
    print_status "Fazendo deploy..."
    if netlify deploy --prod --dir=.next; then
        print_success "Deploy para Netlify realizado com sucesso!"
        print_success "Sua aplicação está no ar! 🎉"
    else
        print_error "Falha no deploy para Netlify!"
        exit 1
    fi
}

# Menu principal
show_menu() {
    echo ""
    echo "Escolha uma opção de deploy:"
    echo "1) 🌟 Vercel (Recomendado - Mais fácil)"
    echo "2) 🔷 Netlify"
    echo "3) 📋 Apenas preparar projeto (build + git)"
    echo "4) 🧪 Apenas testar localmente"
    echo "5) ❌ Sair"
    echo ""
    read -p "Digite sua escolha (1-5): " choice
}

# Função principal
main() {
    print_status "Iniciando processo de deploy..."
    
    # Verificações iniciais
    check_node
    check_npm
    
    # Mostrar menu
    show_menu
    
    case $choice in
        1)
            print_status "Deploy para Vercel selecionado!"
            install_dependencies
            build_project
            setup_git
            deploy_vercel
            ;;
        2)
            print_status "Deploy para Netlify selecionado!"
            install_dependencies
            build_project
            setup_git
            deploy_netlify
            ;;
        3)
            print_status "Preparando projeto..."
            install_dependencies
            build_project
            setup_git
            print_success "Projeto preparado! Agora você pode fazer deploy manual."
            print_status "Consulte DEPLOY_GUIDE.md para instruções detalhadas."
            ;;
        4)
            print_status "Testando localmente..."
            install_dependencies
            build_project
            print_status "Iniciando servidor local..."
            npm start
            ;;
        5)
            print_status "Saindo..."
            exit 0
            ;;
        *)
            print_error "Opção inválida!"
            exit 1
            ;;
    esac
}

# Executar função principal
main

print_success "Script finalizado! 🎉"
print_status "Para mais informações, consulte DEPLOY_GUIDE.md"
