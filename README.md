# 🚀 Configuración de Entorno Fedora (Laravel + DDEV + Apps)

Este repositorio contiene scripts de automatización para configurar un entorno de desarrollo profesional en Fedora Workstation, optimizado para un equipo con **i7-7700HQ y 16GB de RAM**.

## 📂 Contenido de los Scripts

1.  **`setup_apps.sh`**: Instala aplicaciones de productividad y personalización.
    * OnlyOffice, Notion, Zen Browser.
    * Herramientas de retoque (GNOME Tweaks, Extension Manager).
    * Sistema de copias de seguridad (Timeshift).
2.  **`setup_apps_dev.sh`**: Instala el núcleo de desarrollo.
    * Docker, DDEV y Git.
    * VSCode, Sublime Text y DBeaver.
    * Configuración de identidad Git y generación de claves SSH.


---

## 🛠️ Instrucciones de Uso

Para ejecutar estos scripts, primero debes otorgarles permisos de ejecución desde la terminal.

### 1. Dar permisos de ejecución
Abre la terminal en la carpeta donde descargaste los archivos y ejecuta:

```bash
chmod +x setup_apps.sh setup_apps_dev.sh
```

### 2. Ejecutarlos en orden
En el mismo terminal vamos a ejecutar:

```bash
./setup_apps.sh
./setup_apps_dev.sh
```
