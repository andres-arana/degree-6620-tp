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
   * El tamaño del buffer
   */
  unsigned int size;

  /*
   * El indice del ultimo char insertado
   */
  unsigned int current;
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
char* buffer_reset(struct buffer_t* buffer);

/*
 * Establece si en el buffer dado existen chars que no se han obtenido aun a
 * traves de buffer_reset */
int buffer_pending(struct buffer_t* buffer);

/*
 * Libera los recursos ocupados por el buffer
 */
void buffer_cleanup(struct buffer_t* buffer);

#endif
