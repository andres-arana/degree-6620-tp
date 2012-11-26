# README

## Estructura del directorio

El directorio del trabajo práctico está organizado en las siguientes carpetas
temáticas:

1. `docs`: Contiene el fuente latex del informe presentado, los gráficos
   insertados en el mismo y todos los documentos adicionales adjuntados al
   informe principal, como el enunciado y la carátula.
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

### Generación de documentación

La generación del informe final en PDF se realiza a través de la tarea `doc`.
Esta compila el `README.md`, generando una versión en PDF para su inclusión en
el informe final, y luego compila el fuente latex en `docs/informe.tex` y
genera el pdf final en `build/doc/informe.pdf`.

Se incluye además una tarea `doc-preview`, que regenera el informe y abre el
visor de documentos evince para poder previsualizar cómo queda el mismo.

