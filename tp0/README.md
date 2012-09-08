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

El ejecutable final se puede generar utilizando la tarea `build` del makefile,
a través del comando `make build`. Todos los archivos intermedios de
compilación, así como el ejecutable final serán ubicados en la carpeta `build`
al ejecutar esta tarea.

## Otras tareas administrativas

El makefile también incluye una tarea `clean` para limpiar todos los resultados
intermedios y finales de la generación de ejecutables y documentación. Se puede
ejecutar dicha tarea a través del comando `make clean`.

En lo relacionado a la administración de la máquina virtual utilizada para la
ejecución del trabajo práctico, se incluye una tarea para levantar la instancia
a través del comando `make virtual`.
