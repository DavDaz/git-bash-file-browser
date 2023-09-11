#!/bin/bash

# Directorio de rutas guardadas
saved_paths_dir="$HOME/saved_paths"

# Función para mostrar la ayuda
show_help() {
    echo "Uso: $0 [options] <palabra_clave>"

    # Obtener y mostrar las rutas guardadas dinámicamente
    if [ -d "$saved_paths_dir" ]; then
        echo "Rutas de navegacion disponibles:"
        for file in "$saved_paths_dir"/*; do
            name="$(basename "$file")"
            path="$(cat "$file")"
            echo "  - $name: Navega a $path"
        done
    else
        echo "No hay rutas guardadas."
    fi

    echo "Opciones:"
    echo "  --save <nombre>: Guarda la ruta actual con el nombre proporcionado"
    echo "  --list-saved: Lista las rutas guardadas"
    echo "  --use <nombre>: Navega a una ruta guardada por nombre"
    echo "  --help: Muestra este mensaje de ayuda"
}

# Función para navegar a una ruta específica
navigate_to() {
    local target="$1"
    local target_path=""

    # Si el argumento es una ruta absoluta, usarla directamente
    if [ -d "$target" ]; then
        target_path="$target"
    # Si el argumento es una palabra clave, buscar la ruta correspondiente
    elif [ -f "$saved_paths_dir/$target" ]; then
        target_path="$(cat "$saved_paths_dir/$target")"
    else
        echo "Ruta no válida: $target"
        return 1
    fi

    cd -P "$target_path"
    echo "Navegación exitosa a $target_path"
}

# Función para guardar la ruta actual
save_path() {
    local name="$1"
    local current_path="$(pwd)"

    if [ ! -d "$saved_paths_dir" ]; then
        mkdir -p "$saved_paths_dir"
    fi

    echo "$current_path" > "$saved_paths_dir/$name"
    echo "Ruta guardada con el nombre: $name"
}

# Función para listar las rutas guardadas
list_saved_paths() {
    if [ -d "$saved_paths_dir" ]; then
        echo "Rutas guardadas:"
        for file in "$saved_paths_dir"/*; do
            echo "$(basename "$file") : $(cat "$file")"
        done
    else
        echo "No hay rutas guardadas."
    fi
}

# Uso del script
if [ $# -eq 0 ]; then
    show_help
    
fi

while [ $# -gt 0 ]; do
    case "$1" in
        "--help")
            show_help
            break
            ;;
        "--save")
            if [ $# -lt 2 ]; then
                echo "Error: Se requiere un nombre para guardar la ruta."
                break
            fi
            save_path "$2"
            break
            ;;
        "--list-saved")
            list_saved_paths
            break
            ;;
        "--use")
            if [ $# -lt 2 ]; then
                echo "Error: Se requiere un nombre de ruta guardada."
                break
            fi
            saved_path="$(cat "$saved_paths_dir/$2" 2>/dev/null)"
            if [ -z "$saved_path" ]; then
                echo "Ruta guardada no encontrada con el nombre: $2"
                break
            fi
            navigate_to "$saved_path"
            break
            ;;
        *)
            navigate_to "$1"
            break
            ;;
    esac
done
