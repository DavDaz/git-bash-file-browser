# git-bash-file-browser
* El objetivo del proyecto es guardar las rutas que navegas con frecuencia,
y poder volver a navegar a estas de manera rápida.

### *Ejemplo:* 
Ejecutastes la opción "navegar --save" y guardastes la ruta "c/Users/yo/Desktop" con el nombre de "Desktop",
ahora con estar en cualquier ruta de tu gitbash o bash, podras colocar navegar + <nombre_definido> y tu terminal ira a esa ruta. 

## Importante:
Recuerda que puedes ajustar las rutas y nombres de archivo según sea necesario para que coincidan con tu entorno específico. 
Además, ten en cuenta que este script asume que estás utilizando Windows y que tienes instalado Git Bash o una terminal Bash en tu sistema.

## Instalacion:
1. Clona el proyecto
2. Darle doble click o ejecutar desde una terminal el isntalador con:
   ~$ ./instalador.bat
3. Abre una terminal nueva bash o gitbach y escribe "navegar" para tener informacion
   ~$ navegar

### Uso:
Nota: los comando se ejecutan escribiendo "navegar" mas el argumento que se desea ejecutar. 
- navegar : Te permite ver las opciones que cuenta el sistema.
- navegar --help : Te muestra el mismo mensaje de ayuda.
- navegar --save <nombre>: Guarda la ruta actual con el nombre proporcionado.
- navegar --list-saved: Lista las rutas guardadas.
- navegar --use <nombre>: Navega a una ruta guardada por nombre.

### Detalles:
1. Las rutas se guardan en tu carpeta de usuario "$HOME/saved_paths/"
2. El metodo "--save" guardara la ruta en la que te encuentras y le pondra el nombre que le envies como parametro.
3. Se puede navegar colocando "navegar <nombre_ruta>"
