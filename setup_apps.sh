#!/bin/bash

echo "🌟 Instalando aplicaciones esenciales y personalización..."

# 0. Actualización del sistema (primero)
echo "🔄 Actualizando el sistema..."
sudo dnf upgrade --refresh -y

# 1. Habilitar Flathub (El mercado completo)
echo "📦 Configurando Flathub..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# 2. Instalación de herramientas de sistema y retoques (DNF)
echo "🛠️ Instalando herramientas de personalización y Timeshift..."
sudo dnf install -y gnome-tweaks gnome-extensions-app timeshift

# 3. Instalación de aplicaciones principales (Flatpak)
# Usamos Flatpak para OnlyOffice y Extension Manager por su estabilidad
echo "📥 Instalando aplicaciones (OnlyOffice, Notion, Extension Manager)..."
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak install flathub io.github.mrvladislav.extman -y   # Extension Manager

# 4. Instalación de Zen Browser
# Zen Browser se suele distribuir como AppImage o vía Flatpak (comunidad)
echo "🌐 Instalando Zen Browser..."
flatpak install flathub io.github.zen_browser.zen -y

echo "🧭 Configurando Zen Browser como navegador predeterminado..."
if command -v xdg-settings &> /dev/null; then
  xdg-settings set default-web-browser io.github.zen_browser.zen.desktop || true
fi
if command -v xdg-mime &> /dev/null; then
  xdg-mime default io.github.zen_browser.zen.desktop x-scheme-handler/http || true
  xdg-mime default io.github.zen_browser.zen.desktop x-scheme-handler/https || true
  xdg-mime default io.github.zen_browser.zen.desktop text/html || true
fi

# 5. Limpieza y actualización de base de datos de iconos
sudo dnf autoremove -y
echo "✅ ¡Aplicaciones instaladas correctamente!"

echo "---------------------------------------------------------"
echo "📋 RESUMEN DE TU NUEVO ESCRITORIO:"
echo "1. Busca 'Retoques' (GNOME Tweaks) para botones de minimizar/maximizar."
echo "2. Abre 'Extension Manager' para buscar extensiones como 'Dash to Dock'."
echo "3. Configura 'Timeshift' AHORA para crear tu primer punto de restauración."
echo "4. 'Zen Browser' ya está en tu menú de aplicaciones."
echo "---------------------------------------------------------"
