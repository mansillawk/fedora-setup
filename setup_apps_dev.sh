#!/bin/bash

echo "🚀 Iniciando instalación de entorno de desarrollo en Fedora..."

# 2. Configuración de Repositorios Externos
echo "📦 Configurando repositorios para VSCode, Sublime Text y DBeaver..."

# VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Sublime Text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# DBeaver
sudo dnf config-manager --add-repo https://dbeaver.io/repo/fedora/dbeaver.repo

# 3. Instalación de aplicaciones
echo "📥 Instalando programas..."
sudo dnf install -y code sublime-text dbeaver-ce git moby-engine docker-compose curl

# 4. Instalación de DDEV
echo "🚢 Instalando DDEV..."
curl -fsSL https://ddev.com/install.sh | bash

# 5. Configuración de Docker (necesario para DDEV)
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

# 6. Configuración de Git
echo "🔧 Configurando Git..."

# Comprobación si git está instalado
if ! command -v git &> /dev/null
then
    echo "❌ Error: Git no se instaló correctamente."
    exit
fi

# Setup de identidad (Aquí deberás cambiar los datos si no los pides por terminal)
read -p "Introduce tu nombre para Git: " git_name
read -p "Introduce tu email para Git: " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"

# Crear clave SSH para servidores (GitHub, GitLab, etc.)
echo "🔑 Generando clave SSH..."
ssh-keygen -t ed25519 -C "$git_email" -f ~/.ssh/id_ed25519 -N ""

echo "---------------------------------------------------------"
echo "✅ ¡Instalación completada!"
echo "⚠️  IMPORTANTE: Para que Docker funcione sin sudo, REINICIA el equipo ahora."
echo "🔑 Tu clave pública SSH para añadir a GitHub/GitLab es:"
cat ~/.ssh/id_ed25519.pub
echo "---------------------------------------------------------"

# 7. Actualización final del sistema
# Esto es útil si hay paquetes nuevos después de repo agregado.
echo "🔄 Actualizando el sistema al final..."
sudo dnf upgrade --refresh -y
