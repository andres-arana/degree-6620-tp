#ifndef __CONFIG_H_INCLUDED__
#define __CONFIG_H_INCLUDED__

#include <stdio.h>

/* Define el nivel de log de errors, para mostrar errores */
#define LOG_LEVEL_ERROR

/* Define el nivel de log de warnings, para mostrar advertencias */
#define LOG_LEVEL_WARNING

/* Define el nivel de log de debug, para mostrar valores de depuracion */
#define LOG_LEVEL_DEBUG

/* Define las macros de log de errores */
#ifdef LOG_LEVEL_ERROR
#define LOG_ERROR_STRING(WHAT) fprintf(stderr, "ERROR: %s\n", (WHAT))
#else
#define LOG_ERROR_STRING(WHAT)
#endif

/* Define las macros de log de warnings */
#ifdef LOG_LEVEL_WARNING
#define LOG_WARN_STRING(WHAT) fprintf(stderr, "WARNING: %s\n", (WHAT))
#else
#define LOG_WARN_STRING(WHAT)
#endif

/* Define las macros de debug */
#ifdef LOG_LEVEL_DEBUG
#define LOG_DEBUG_STRING(WHAT) fprintf(stderr, "DEBUG: %s\n", (WHAT))
#define LOG_DEBUG_SVAR(WHAT) fprintf(stderr, "DEBUG: Var [" #WHAT "] has value [%s]\n", (WHAT))
#define LOG_DEBUG_IVAR(WHAT) fprintf(stderr, "DEBUG: Var [" #WHAT "] has value [%d]\n", (WHAT))
#else
#define LOG_WARN_STRING(WHAT)
#define LOG_DEBUG_SVAR(WHAT)
#define LOG_DEBUG_IVAR(WHAT)
#endif



#endif
