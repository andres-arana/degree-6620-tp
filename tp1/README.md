# README

## Estructura del directorio

El directorio del trabajo práctico está organizado en las siguientes carpetas
temáticas:

1. `docs`: Contiene el fuente latex del informe presentado, los gráficos
   insertados en el mismo y todos los documentos adicionales adjuntados al
   informe principal, como el enunciado y la carátula.
2. `gxemul`: Contiene el emulador y máquina virtual utilizada para ejecutar el
   trabajo práctico en la arquitectura MIPS requerida, en formato comprimido.
3. `source`: Contiene el código fuente de la solución desarrollada, en lenguaje
   C y assembly según corresponda.

Adicionalmente, se incluye un archivo makefile con la definición de tareas de
generación de artefactos y de utilidades varias. Todos los artefactos generados
a través de make se situan en una carpeta `build` dentro del directorio del
trabajo práctico, como los archivos de código objeto, los ejecutables finales
linkeados o el pdf del informe.

## Makefile

El makefile incluido contiene varias tareas documentadas a continuación.

### Limpieza

La tarea `clean` elimina todos los artefactos generados por make. Es
especialmente útil para regenerar el ejecutable del trabajo práctico bajo otras
condiciones de compilación (por ejemplo, con diferentes niveles de optimización
o módulos de log).

### Compilación de ejecutables

La tarea default `build` genera los directorios necesarios, compila y linkea el
ejecutable tp1 del trabajo práctico. Todos los archivos intermedios, así como
el ejecutable final linkeado se generan en la carpeta `build` del directorio
del trabajo práctico.

El sistema de compilación permite incluir flags adicionales en las llamadas al
compilador a través de la variable de entorno `ACFLAGS`. Esto permite definir
flags adicionales a la llamada de gcc, como -O4 para aplicar las optimizaciones
agresivas, etc. Por ejemplo, la linea `ACFLAGS=-O4 make` compila el ejecutable
con todas las optimizaciones disponibles.

### Administración de máquina virtual

Dado que el trabajo práctico requiere la compilación y ejecución de código en
una arquitectura MIPS corriendo en el emulador gxemul, se incluye tareas de
administración de dicha máquina virtual.

La tarea `virtual-start` agrega una IP de loopback (172.20.0.1) al host,
expande el archivo comprimido que contiene la virtual si no se expandió
previamente y ejecuta la imagen de la virtual en el emulador. La máquina
virtual tiene como usuario `root` y como password `orga6620`. Adicionalmente,
esta tarea copia al portapapeles el comando utilizado para habilitar el puerto
`2222` en la máquina host como tunel a través de ssh tunneling. Esto es
especialmente útil para poder conectarse a la virtual desde la máquina host:
después de ejecutar `make virtual-start` y loguearse, si se pega en la consola
el contenido del portapapeles se ejecuta un comando que abre un ssh tunnel en
el puerto `2222`, para poder conectarse a ese puerto en la máquina host por ssh

La tarea `virtual-reset` elimina la virtual expandida a través de
`virtual-start`. La próxima vez que se ejecute `virtual-start`, la máquina
virtual será expandida nuevamente, de manera de poder contar con una virtual
limpia cuando sea necesario.

La tarea `virtual-authkey` registra la public key de ssh del host local en la
virtual, de manera de permitir ejecutar el resto de las tareas sin ingresar la
contraseña de root `orga6620` cada vez.

La tarea `virtual-deploy` copia los contenidos del trabajo práctico por
`scp` al directorio `/root/deploy` de la máquina virtual. Es necesario primero
habilitar el puerto `2222` por ssh tunneling como se indico previamente.

### Generación de documentación

La generación del informe final en PDF se realiza a través de la tarea `doc`.
Esta compila el `README.md`, generando una versión en PDF para su inclusión en
el informe final, y luego compila el fuente latex en `docs/informe.tex` y
genera el pdf final en `build/doc/informe.pdf`.

Se incluye además una tarea `doc-preview`, que regenera el informe y abre el
visor de documentos evince para poder previsualizar cómo queda el mismo.

