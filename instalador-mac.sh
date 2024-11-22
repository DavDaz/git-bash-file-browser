#!/bin/bash

# Definir la ubicación de la carpeta myScripts
myScriptsFolder="$HOME/myScripts"
navegarScript="$HOME/myScripts/navegar.sh"

# Verificar si la carpeta myScripts no existe y crearla si es necesario
if [ ! -d "$myScriptsFolder" ]; then
    mkdir -p "$myScriptsFolder"
    echo "Carpeta myScripts creada en $HOME"
fi

# Copiar el archivo navegar.sh al directorio myScripts
cp "navegar.sh" "$myScriptsFolder"

# Reemplazar las barras invertidas con barras inclinadas en la ruta
navegarScript="${navegarScript//\\/\/}"

# Detectar el shell predeterminado y configurar el archivo de configuración adecuado
shell_rc=""
if [ -f "$HOME/.bashrc" ]; then
    shell_rc="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    shell_rc="$HOME/.zshrc"
else
    # Si no existe ninguno, se crea .zshrc como predeterminado
    shell_rc="$HOME/.zshrc"
    touch "$shell_rc"
    echo "Archivo .zshrc creado en $HOME."
fi

# Agregar el alias al archivo de configuración detectado
echo "# Alias para ejecutar el script de navegación" >> "$shell_rc"
echo "alias navegar=\"source $navegarScript\"" >> "$shell_rc"
echo "Alias agregado en $shell_rc. Recarga el shell con 'source $shell_rc'."

echo "Proceso completado."
