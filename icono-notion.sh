#!/bin/bash

# 1. Definir variables
URL_ICONO="https://upload.wikimedia.org/wikipedia/commons/4/45/Notion_app_logo.png"
RUTA_ICONO="$HOME/.local/share/icons/notion-custom.png"
DIRECTORIO_APPS="$HOME/.local/share/applications"

echo "Iniciando configuracion automatica del icono de Notion..."

# 2. Descargar el icono transparente si no existe
mkdir -p "$HOME/.local/share/icons"
curl -L "$URL_ICONO" -o "$RUTA_ICONO"

if [ $? -ne 0 ]; then
    echo "Error: No se pudo descargar la imagen."
    exit 1
fi

# 3. Buscar el archivo .desktop de Notion (independientemente del nombre aleatorio)
# Buscamos archivos chrome-*.desktop que contengan "notion.so"
ARCHIVO_DESKTOP=$(grep -l "notion.so" "$DIRECTORIO_APPS"/chrome-*.desktop 2>/dev/null | head -n 1)

if [ -z "$ARCHIVO_DESKTOP" ]; then
    echo "Error: No se encontro ningun archivo .desktop de la PWA de Notion en $DIRECTORIO_APPS"
    exit 1
fi

echo "Archivo detectado: $(basename "$ARCHIVO_DESKTOP")"

# 4. Actualizar el icono y limpiar el nombre
sed -i "s|^Icon=.*|Icon=$RUTA_ICONO|" "$ARCHIVO_DESKTOP"
sed -i "s|^Name=.*|Name=Notion|" "$ARCHIVO_DESKTOP"

echo "Proceso finalizado. Se ha configurado el archivo: $(basename "$ARCHIVO_DESKTOP")"
echo "Si el cambio no es inmediato, cierra sesion o reinicia GNOME."
