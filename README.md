# git-bash-file-browser
* El objetivo del proyecto es guardar las rutas que navegas con frecuencia,
y poder volver a navegar a estas de manera rápida.

### *Ejemplo:* 
Digamos que abristes tu terminal (bash) y te encuentras en la ruta "c/Users/yo/Escritorio" y ejecutastes la opción "navegar --save Desktop". y con ese comando se guarda la ruta "c/Users/yo/Escritorio" con el nombre de "Desktop",
ahora con estar en cualquier ruta de tu gitbash o bash, podras colocar "navegar Desktop"  y tu terminal ira a esa ruta guardada. 

## Importante:
Recuerda que puedes ajustar las rutas y nombres de archivo según sea necesario para que coincidan con tu entorno específico. 
Además, ten en cuenta que este script asume que estás utilizando Windows y que tienes instalado Git Bash o una terminal Bash en tu sistema.

## Instalacion Windows:
1. Clona el proyecto
2. Darle doble click o ejecutar desde una terminal el isntalador con:
   ~$ ./instalador.bat
3. Abre una terminal nueva bash o gitbach y escribe "navegar" para tener informacion
   ~$ navegar

## Instalacion Linux:
1. Clona el proyecto
2. Darle permiso al ejecutable sh con:
   ~$ chmod +x instalador.sh
4. Darle doble click o ejecutar desde una terminal el isntalador con:
   ~$ ./instalador.sh
5. Abre una terminal nueva bash o gitbach y escribe "navegar" para tener informacion
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
