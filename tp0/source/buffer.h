#ifndef __BUFFER_H_INCLUDED__
#define __BUFFER_H_INCLUDED__

/*
 * Representa un buffer autoexpandible de chars
 */
struct buffer_t {
  /*
   * El buffer propiamente dicho
   */
  char* buffer;

  /*
   * El tamanio del buffer
   */
  unsigned int size;

  /*
   * El indice del ultimo char insertado
   */
  unsigned int current;
};

/*
 * Representa una linea lista para ser procesada
 */
struct line_t {
  /**
   * Los caracteres de la linea
   */
  char* data;

  /*
   * La cantidad de caracteres en la linea
   */
  unsigned int size;
};

/**
 * Inicializa el buffer en su estado inicial
 */
int buffer_init(struct buffer_t* buffer);

/*
 * Inserta un char en el buffer, agrandando el buffer si es necesario
 */
int buffer_push(struct buffer_t* buffer, char c);

/*
 * Alloca un nuevo string con el tamanio de lo acumulado en el buffer, y una
 * copia de lo acumulado hasta el momento. Devuelve este nuevo string alocado y
 * deja el buffer limpio para acumular nuevamente.
 */
struct line_t* buffer_reset(struct buffer_t* buffer);

/*
 * Establece si en el buffer dado existen chars que no se han obtenido aun a
 * traves de buffer_reset */
int buffer_pending(struct buffer_t* buffer);

/*
 * Libera los recursos ocupados por el buffer
 */
void buffer_cleanup(struct buffer_t* buffer);

/*
 * Compara dos lineas en orden lexicografico
 */
int line_compare(struct line_t* a, struct line_t* b);

#endif
