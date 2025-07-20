#!/bin/bash

# 🍝 Script para Copiar La Nonna Stock Management para Pasta Raiz
# Autor: BlackBox AI

echo "🍝 La Nonna Stock Management - Copiar Projeto"
echo "============================================="

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

# Detectar sistema operacional
detect_os() {
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        OS="Windows"
        DEFAULT_PATH="C:/Projetos"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="Mac"
        DEFAULT_PATH="$HOME/Projetos"
    else
        OS="Linux"
        DEFAULT_PATH="$HOME/Projetos"
    fi
    print_status "Sistema detectado: $OS"
}

# Mostrar opções de destino
show_destination_options() {
    echo ""
    echo "Onde você quer copiar o projeto?"
    echo ""
    
    if [[ "$OS" == "Windows" ]]; then
        echo "1) C:/Projetos/la-nonna-stock (Recomendado)"
        echo "2) C:/Users/$USER/Documents/Projetos/la-nonna-stock"
        echo "3) D:/Projetos/la-nonna-stock"
        echo "4) Digitar caminho personalizado"
    elif [[ "$OS" == "Mac" ]]; then
        echo "1) ~/Projetos/la-nonna-stock (Recomendado)"
        echo "2) ~/Documents/Projetos/la-nonna-stock"
        echo "3) ~/Desktop/la-nonna-stock"
        echo "4) Digitar caminho personalizado"
    else
        echo "1) ~/Projetos/la-nonna-stock (Recomendado)"
        echo "2) ~/Documents/la-nonna-stock"
        echo "3) /opt/la-nonna-stock"
        echo "4) Digitar caminho personalizado"
    fi
    
    echo ""
    read -p "Digite sua escolha (1-4): " choice
}

# Definir caminho de destino
set_destination() {
    case $choice in
        1)
            if [[ "$OS" == "Windows" ]]; then
                DESTINO="C:/Projetos/la-nonna-stock"
            else
                DESTINO="$HOME/Projetos/la-nonna-stock"
            fi
            ;;
        2)
            if [[ "$OS" == "Windows" ]]; then
                DESTINO="C:/Users/$USER/Documents/Projetos/la-nonna-stock"
            elif [[ "$OS" == "Mac" ]]; then
                DESTINO="$HOME/Documents/Projetos/la-nonna-stock"
            else
                DESTINO="$HOME/Documents/la-nonna-stock"
            fi
            ;;
        3)
            if [[ "$OS" == "Windows" ]]; then
                DESTINO="D:/Projetos/la-nonna-stock"
            elif [[ "$OS" == "Mac" ]]; then
                DESTINO="$HOME/Desktop/la-nonna-stock"
            else
                DESTINO="/opt/la-nonna-stock"
            fi
            ;;
        4)
            read -p "Digite o caminho completo: " DESTINO
            DESTINO="$DESTINO/la-nonna-stock"
            ;;
        *)
            print_error "Opção inválida!"
            exit 1
            ;;
    esac
    
    print_status "Destino selecionado: $DESTINO"
}

# Criar pasta de destino
create_destination() {
    print_status "Criando pasta de destino..."
    
    if mkdir -p "$DESTINO"; then
        print_success "Pasta criada: $DESTINO"
    else
        print_error "Falha ao criar pasta: $DESTINO"
        exit 1
    fi
}

# Copiar arquivos
copy_files() {
    print_status "Copiando arquivos do projeto..."
    
    # Lista de arquivos e pastas para copiar
    ITEMS_TO_COPY=(
        "src/"
        "public/"
        "package.json"
        "package-lock.json"
        "next.config.ts"
        "tsconfig.json"
        "tailwind.config.js"
        "components.json"
        "postcss.config.mjs"
        "eslint.config.mjs"
        ".gitignore"
        "README.md"
        "MODERNIZATION_PLAN.md"
        "DEPLOY_GUIDE.md"
        "README_DEPLOY.md"
        "COMO_EXECUTAR_SCRIPT.md"
        "COMO_COPIAR_PROJETO.md"
        "deploy.sh"
    )
    
    # Copiar cada item
    for item in "${ITEMS_TO_COPY[@]}"; do
        if [[ -e "$item" ]]; then
            if cp -r "$item" "$DESTINO/"; then
                print_success "Copiado: $item"
            else
                print_warning "Falha ao copiar: $item"
            fi
        else
            print_warning "Não encontrado: $item"
        fi
    done
}

# Dar permissão ao script de deploy
set_permissions() {
    print_status "Configurando permissões..."
    
    if chmod +x "$DESTINO/deploy.sh"; then
        print_success "Permissões configuradas para deploy.sh"
    else
        print_warning "Falha ao configurar permissões"
    fi
}

# Verificar cópia
verify_copy() {
    print_status "Verificando cópia..."
    
    REQUIRED_FILES=("package.json" "src" "deploy.sh")
    
    for file in "${REQUIRED_FILES[@]}"; do
        if [[ -e "$DESTINO/$file" ]]; then
            print_success "✓ $file"
        else
            print_error "✗ $file (FALTANDO!)"
            return 1
        fi
    done
    
    return 0
}

# Mostrar próximos passos
show_next_steps() {
    echo ""
    print_success "🎉 Projeto copiado com sucesso!"
    echo ""
    print_status "📁 Localização: $DESTINO"
    echo ""
    print_status "🚀 Próximos passos:"
    echo ""
    
    if [[ "$OS" == "Windows" ]]; then
        echo "1. Abrir PowerShell ou CMD"
        echo "2. cd \"$DESTINO\""
    else
        echo "1. Abrir Terminal"
        echo "2. cd \"$DESTINO\""
    fi
    
    echo "3. npm install"
    echo "4. npm run dev  (para testar)"
    echo "5. ./deploy.sh  (para colocar no ar)"
    echo ""
    
    print_status "🌟 Ou execute tudo de uma vez:"
    echo ""
    
    if [[ "$OS" == "Windows" ]]; then
        echo "cd \"$DESTINO\" && npm install && npm run dev"
    else
        echo "cd \"$DESTINO\" && npm install && npm run dev"
    fi
    
    echo ""
    print_success "✅ Seu projeto está pronto para deploy!"
}

# Função principal
main() {
    print_status "Iniciando cópia do projeto La Nonna Stock Management..."
    
    detect_os
    show_destination_options
    set_destination
    create_destination
    copy_files
    set_permissions
    
    if verify_copy; then
        show_next_steps
    else
        print_error "Alguns arquivos não foram copiados corretamente!"
        print_status "Verifique manualmente a pasta: $DESTINO"
        exit 1
    fi
}

# Executar
main

print_success "Script finalizado! 🎉"
