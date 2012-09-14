#ifndef __CONFIG_H_INCLUDED__
#define __CONFIG_H_INCLUDED__

#include <stdio.h>

/* Define el nivel de log de errors, para mostrar errores */
#define LOG_LEVEL_ERROR

/* Define el nivel de log de warnings, para mostrar advertencias */
#define LOG_LEVEL_WARNING

/* Define el nivel de log de debug, para mostrar valores de depuracion */
#define LOG_LEVEL_DEBUG
#define LOG_LEVEL_DEBUG_SORT
#define LOG_LEVEL_DEBUG_DATA

/* Define las macros de log de errores */
#ifdef LOG_LEVEL_ERROR
#define LOG_ERROR(WHAT) fprintf(stderr, "ERROR: %s\n", (WHAT))
#else
#define LOG_ERROR(WHAT)
#endif

/* Define las macros de log de warnings */
#ifdef LOG_LEVEL_WARNING
#define LOG_WARN(WHAT) fprintf(stderr, "WARNING: %s\n", (WHAT))
#else
#define LOG_WARN(WHAT)
#endif

/* Define las macros de debug */
#ifdef LOG_LEVEL_DEBUG
#define LOG_DEBUG(WHAT) fprintf(stderr, "DEBUG: %s\n", (WHAT))
#define LOG_DEBUG_SVAR(WHAT) fprintf(stderr, "DEBUG: Var [" #WHAT "] has value [%s]\n", (WHAT))
#define LOG_DEBUG_IVAR(WHAT) fprintf(stderr, "DEBUG: Var [" #WHAT "] has value [%d]\n", (WHAT))
#else
#define LOG_DEBUG(WHAT)
#define LOG_DEBUG_SVAR(WHAT)
#define LOG_DEBUG_IVAR(WHAT)
#endif

#ifdef LOG_LEVEL_DEBUG_SORT
#define LOG_SORT_DEBUG(WHAT) LOG_DEBUG(WHAT)
#define LOG_SORT_DEBUG_SVAR(WHAT) LOG_DEBUG_SVAR(WHAT)
#define LOG_SORT_DEBUG_IVAR(WHAT) LOG_DEBUG_IVAR(WHAT)
#else
#define LOG_SORT_DEBUG(WHAT)
#define LOG_SORT_DEBUG_SVAR(WHAT)
#define LOG_SORT_DEBUG_IVAR(WHAT)
#endif

#ifdef LOG_LEVEL_DEBUG_DATA
#define LOG_DATA_DEBUG(WHAT) LOG_DEBUG(WHAT)
#define LOG_DATA_DEBUG_SVAR(WHAT) LOG_DEBUG_SVAR(WHAT)
#define LOG_DATA_DEBUG_IVAR(WHAT) LOG_DEBUG_IVAR(WHAT)
#else
#define LOG_DATA_DEBUG(WHAT)
#define LOG_DATA_DEBUG_SVAR(WHAT)
#define LOG_DATA_DEBUG_IVAR(WHAT)
#endif

#endif
