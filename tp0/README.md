# Trabajo práctico 0: Infraestructura básica

La resolución completa del trabajo práctico está contenida en este directorio.
Se incluye un makefile que permite generar cualquier artefacto relacionado al
proyecto, así como también realizar tareas administrativas comunes.

## Estructura del directorio

El directorio del trabajo práctico está organizado en las siguientes carpetas
temáticas:

1. `docs`: Contiene el fuente latex del informe presentado, los gráficos
   insertados en el mismo y todos los documentos adicionales adjuntados al
   informe principal, como el enunciado y la carátula.
2. `gxemul`: Contiene el emulador y máquina virtual utilizada para ejecutar el
   trabajo práctico en la arquitectura MIPS requerida, en formato comprimido.
3. `source`: Contiene el código fuente de la solución desarrollada, en lenguaje
   C.
4. `test`: Contiene los scripts de test automatizados y otros archivos
   necesarios para ejecutar la regresión de prueba automática.
5. `perf`: Contiene los archivos y scripts de análisis utilizados en la
   realización de las mediciones de performance realizadas.
6. `perf/data`: Contiene los archivos procesados al realizar el análisis de
   performance. Cada uno de estos archivos tiene un nombre de la forma
   `NNk_SORT_MODE`, donde `NN` es el tamaño en kb del archivo, `SORT` es `inv`
   para sorting inverso, `sor` para sorting regular y `rnd` para sorting al
   azar y finalmente `MODE` es `ll` para archivos con tamaño de linea grande y
   baja cantidad de lineas y `sl` para archivos con tamaño de linea pequeña y
   alta cantidad de lineas.
7. `perf/times`: Contiene el resultado de ejecutar el comando time para cada
   uno de los archivos de `perf/data`, dentro de la virtual.
8. `asm`: Contiene los artefactos compilados desde el código C a assembly en
   la arquitectura analizada (MIPS).

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
ejecutable tp0 del trabajo práctico. Todos los archivos intermedios, así como
el ejecutable final linkeado se generan en la carpeta `build` del directorio
del trabajo práctico.

El sistema de compilación permite incluir flags adicionales en las llamadas al
compilador a través de la variable de entorno `ACFLAGS`. Esto permite definir
flags adicionales a la llamada de gcc, como -O4 para aplicar las optimizaciones
agresivas, etc. Por ejemplo, la linea `ACFLAGS=-O4 make` compila el ejecutable
con todas las optimizaciones disponibles.

También es posible habilitar o deshabilitar partes del sistema de log
utilizando esta misma variable de entorno. El código fuente del programa
utiliza las siguientes variables de preprocesador para habilitar estos módulos:

1. `LOG_LEVEL_WARNING`: Si está definida, habilita logs de condiciones que si
   bien no constituyen un error, indican situaciones extrañas en la ejecución
   del programa.
2. `LOG_LEVEL_DEBUG_SORT`: Si está definida, habilita los logs de depuración en
   los algoritmos de ordenamiento implementados.
3. `LOG_LEVEL_DEBUG_DATA`: Si está definida, habilita los logs de depuración en
   el módulo de procesamiento de entrada de datos (tanto por stdin como por
   archivos).

Para habilitar estos módulos, se puede utilizar la variable `ACFLAGS` para
indicar al compilador que defina estas variables de procesador. Por ejemplo, la
siguiente linea compila el ejecutable sin optimización alguna, y habilita los
logs para el módulo de procesamiento de datos de entrada:

    ACFLAGS="-O0 -DLOG_LEVEL_DEBUG_DATA" make

### Administración de máquina virtual

Dado que el trabajo práctico requiere la compilación y ejecución de código en
una arquitectura MIPS corriendo en el emulador gxemul, se incluye tareas de
administración de dicha máquina virtual.

La tarea `virtual-start` agrega una IP de loopback (172.20.0.1), expande el
archivo comprimido que contiene la virtual si no se expandió previamente y
ejecuta la imagen de la virtual en el emulador. La máquina virtual tiene como
usuario `root` y como password `orga6621`. Adicionalmente, esta tarea copia al
portapapeles el comando utilizado para habilitar el puerto `2222` en la máquina
host como tunel a través de ssh tunneling. Esto es especialmente útil para
poder conectarse a la virtual desde la máquina host: después de ejecutar `make
virtual-start` y loguearse, si se pega en la consola el contenido del
portapapeles se ejecuta un comando que abre un ssh tunnel en el puerto `2222`,
para poder conectarse a ese puerto en la máquina host por ssh

La tarea `virtual-reset` elimina la virtual expandida a través de
`virtual-start`. La próxima vez que se ejecute `virtual-start`, la máquina
virtual será expandida nuevamente, de manera de poder contar con una virtual
limpia cuando sea necesario.

La tarea `virtual-deploy-all` copia los contenidos del trabajo práctico por
`scp` al directorio `/root/tp` de la máquina virtual. Es necesario primero
habilitar el puerto `2222` por ssh tunneling como se indico previamente. Por
otro lado, la tarea `virtual-deploy-source` solo copia el makefile y los
contenidos de la carpeta `source` al mismo directorio de la máquina virtual.

La tarea `virtual-connect` abre una conexión por ssh a la máquina virtual.
Nuevamente, es necesario primero habilitar el puerto de conexión.

### Análisis de performance

Para facilitar el análisis de performance se agregaron dos tareas relacionadas.

La tarea `perf-data` lanza el ejecutable del trabajo práctico para ordenar los
datos de cada uno de los archivos en `perf/data`. Concatena la información de
time de cada uno de estos archivos en un archivo generado en `build/perf/raw`

La tarea `perf-analyze` ejecuta el script `perf/analyze.rb`, encargado de
analizar todos los archivos que se encuentren en `build/perf/raw` y generar los
CSV resumidos en `build/perf/analyzed`.

### Profiling

Para facilitar el profiling de la aplicación se agregaron las siguientes tareas:

La tarea `prof` recompila el ejecutable con las opciones `-O0 -pg`, lo que
habilita la colección de datos de profiling durante su ejecución. Cuando se
ejecute el programa, se generará el archivo gmon.out, utilizado por `gprof`
para analizar los tiempos de ejecución de cada función. Luego ejecuta el
programa y acumula las estadísticas de datos en `build/prof/raw/quicks.out`.
Finalmente utiliza el comando gprof para analizar los datos acumulados,
generando un reporte detallado de ejecución en `build/prof/analyzed/quicks`

### Generación de assembly

Se incluye una tarea `asm` que genera el código assembly de cada uno de los
archivos fuente en el directorio `build/asm/`.
