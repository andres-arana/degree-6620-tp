# Trabajo práctico 0: Infraestructura básica

La resolución completa del trabajo práctico está contenida en este directorio.
Se incluye un makefile que permite generar cualquier artefacto relacionado al
proyecto, así como también realizar tareas administrativas comunes.

## Documentación

La documentación del proyecto está incluida completamente en el directorio
`docs`. Se incluye el pdf del enunciado, la carátula, y los fuentes latex del
informe propiamente dicho en este directorio.

La documentación completa se puede generar utilizando la tarea `build-docs` del
makefile, a través del comando `make build-docs`. Todos los archivos
intermedios de latex, así como el pdf final, serán ubicados en la carpeta
`build` al ejecutar esta tarea.

## Ejecutables

El programa utilizado para realizar el análisis del trabajo práctico está
desarrollado en C, y su código fuente se encuentra en la carpeta `source`.

El ejecutable final se puede generar utilizando la tarea por defecto del
makefile, a través del comando `make`. Todos los archivos intermedios de
compilación, así como el ejecutable final serán ubicados en la carpeta `build`
al ejecutar esta tarea.

Se pueden generar distintos ejecutables con diferentes niveles de log a la
salida de errores. El tipo de ejecutable a generar se controla a través de las
siguientes variables de make:

1. `LOG_WARNING`: El ejecutable contendrá instrucciones para emitir por
   la salida de errores avisos de situaciones que si bien no son errores
   podrían indicar algún error en la lógica de ejecución.
2. `LOG_DEBUG_SORT`: El ejecutable contendrá instrucciones para emitir
   por la salida de errores avisos de información adicional de depuración en
   los módulos de ordenación (tanto quicksort como stoogesort).
3. `LOG_DEBUG_DATA`: El ejecutable contendrá instrucciones para emitir
   por la salida de errores avisos de información adicional de depuración en
   el módulo de procesamiento de la entrada al sistema.

Por ejemplo, para generar un ejecutable con instrucciones adicionales para la
depuración de los módulos de sort, es necesario invocar el comando `make
LOG_DEBUG_SORT=1`. Alternativamente, make podría levantar estas variables del
entorno, por lo que utilizando bash es posible ejecutar `export
LOG_DEBUG_SORT=1` una única vez para la sesión y generar el ejecutable con
`make` de ahí en adelante. Mientras mantengamos abierta la sesión, se generará
siempre el ejecutable con la información adicional para depuración de los
módulos de sort.

**Advertencia**: Make no recompila los fuentes al cambiar estos flags de log,
por lo que si ya se precompiló algún fuente con un setting de log, no basta con
invocar make con los nuevos flags para recompilarlo. Es necesario ejecutar el
comando `make clean` (ver en Otras tareas administrativas) para que se
recompile todo el proyecto como corresponde.

## Otras tareas administrativas

El makefile también incluye una tarea `clean` para limpiar todos los resultados
intermedios y finales de la generación de ejecutables y documentación. Se puede
ejecutar dicha tarea a través del comando `make clean`.

En lo relacionado a la administración de la máquina virtual utilizada para la
ejecución del trabajo práctico, se incluye una tarea para levantar la instancia
virtual a través del comando `make virtual`.

