from queue import LifoQueue as Pila
from queue import Queue as Cola


"""   Ejercicio 1   """


# 1.
def contar_lineas(nombre_archivo: str) -> int:
    file: file = open(nombre_archivo, "r")
    lineas: list[str] = file.readlines()
    file.close()
    return len(lineas)


# 2.
def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    file: file = open(nombre_archivo, "r")
    palabras_archivo: list[str]= file.read().split()
    return palabra in palabras_archivo


# 3.
def cantidad_apariciones(nombre_archivo: str, palabra: str) -> int:
    file: file = open(nombre_archivo, "r")
    palabras_archivo: list[str]= file.read().split()
    contador: int = 0
    for elem in palabras_archivo:
        if elem == palabra:
            contador += 1
    return contador


"""   Ejercicio 2   """


def clonar_sin_comentarios(nombre_archivo: str) -> None:
    file_in: file_in = open(nombre_archivo, "r")
    file_out: file_out = open("sinComentarios.txt", "w")
    cant_lineas_in = contar_lineas(nombre_archivo)
    while (cant_lineas_in > 0):
        linea: str = file_in.readline()
        palabras_linea: list[str] = linea.split()
        if not es_comentario(palabras_linea):
            file_out.write(linea)
        cant_lineas_in -= 1
    file_in.close()
    file_out.close()


def es_comentario(lista_palabras: "list[str]") -> bool:
    return lista_palabras[0] == "#" and lista_palabras[0][0] == "#"


"""   Ejercicio 3   """
def evil_archivo():
    pass


# Pila/Lista LIFO (Last In First Out)
"""   Ejercicio 10   """
def buscar_el_maximo_pila(p: Pila) -> int:
    maximo: int = p.get()
    aux: Pila = Pila()

    while (not p.empty()):
        elem_actual: int = p.get()
        aux.put(elem_actual)
        if maximo < elem_actual:
            maximo = elem_actual
            
    while (not aux.empty()):
        elem_actual = aux.get()
        p.put(elem_actual)
    return maximo


#pila = Pila()
#pila.put(1)
#pila.put(10)
#pila.put(5)


# Cola/Lista FIFO (First In First Out)
"""   Ejercicio 15   """
def buscar_el_maximo_cola(c: Cola) -> int:
    maximo = c.get()
    while (not c.empty()):
        elem_actual = c.get()
        if maximo < elem_actual:
            maximo = elem_actual
    return maximo


#c = Cola()
#c.put(1)
#c.put(5)
#c.put(6)


"""   Ejercicio 19   """
def agrupar_por_longitud(nombre_archivo: str) -> "dict[int, int]":
    file: file = open(nombre_archivo, "r")
    palabras_archivo: list[str]= file.readlines()
    return palabras_archivo
"""
for linea in palabra_archivo:
    palabras = linea.split()
    for palabra in palabras:
        clave = len(palabra)
        if d.get(clave) is not None:
        
            d[clave] += 1
        else:
            d[clave] = 1
        
version 2

lista_gigante_de_palabras = []
"""

print(agrupar_por_longitud("p8.txt"))