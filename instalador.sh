#!/bin/bash
# ESTE CODIGO NO AH SIDO PROBADO PERO ES PARA LINUX

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

# Verificar si el archivo .bashrc existe y agregar el alias si es necesario
if [ -f "$HOME/.bashrc" ]; then
    echo "# Alias para ejecutar el script de navegación" >> "$HOME/.bashrc"
    echo "alias navegar=\"source $navegarScript\"" >> "$HOME/.bashrc"
else
    echo "Archivo .bashrc no encontrado en $HOME. El alias no se ha agregado."
fi

echo "Proceso completado."
