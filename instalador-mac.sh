#!/bin/bash

# Definir la ubicación de la carpeta myScripts y el script navegar.sh
myScriptsFolder="$HOME/myScripts"
navegarScript="$HOME/myScripts/navegar.sh"

# Verificar si la carpeta myScripts no existe y crearla si es necesario
if [ ! -d "$myScriptsFolder" ]; then
    mkdir -p "$myScriptsFolder"
    echo "Carpeta myScripts creada en $HOME"
fi

# Copiar el archivo navegar.sh al directorio myScripts (sin reemplazar si ya existe)
if [ ! -f "$navegarScript" ]; then
    cp "navegar.sh" "$myScriptsFolder"
    echo "Script navegar.sh copiado a $myScriptsFolder"
else
    echo "El script navegar.sh ya existe en $myScriptsFolder. No se reemplazó."
fi

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

# Eliminar alias conflictivo si existe
if grep -q "alias navegar=" "$shell_rc"; then
    sed -i '' '/alias navegar=/d' "$shell_rc"  # Elimina la línea del alias
    echo "Alias navegar eliminado de $shell_rc."
fi

# Agregar la función navegar al archivo de configuración
if ! grep -q "function navegar()" "$shell_rc"; then
    cat >> "$shell_rc" <<EOF

# Función para ejecutar el script de navegación
function navegar() {
    source "$navegarScript" "\$@"
}
EOF
    echo "Función navegar agregada en $shell_rc."
else
    echo "La función navegar ya está definida en $shell_rc. No se realizó ningún cambio."
fi

echo "Instalación completada. Recarga el shell con 'source $shell_rc' o reinicia tu terminal."
