import random
from queue import LifoQueue as Pila
from queue import Queue as Cola


"""   Ejercicio 1   """


# 1.
def contar_lineas(nombre_archivo: str) -> int:
    file = open(nombre_archivo, "r")
    lineas: list[str] = file.readlines()
    file.close()
    return len(lineas)


# 2.
def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    file = open(nombre_archivo, "r")
    palabras_archivo: list[str] = file.read().split()
    return palabra in palabras_archivo


# 3.
def cantidad_apariciones(nombre_archivo: str, palabra: str) -> int:
    file = open(nombre_archivo, "r")
    palabras_archivo: list[str] = file.read().split()
    contador: int = 0
    for elem in palabras_archivo:
        if elem == palabra:
            contador += 1
    return contador


"""   Ejercicio 2   """


def clonar_sin_comentarios(nombre_archivo: str) -> None:
    file_in = open(nombre_archivo, "r")
    file_out = open("sinComentarios.txt", "w")
    cant_lineas_in = contar_lineas(nombre_archivo)
    while cant_lineas_in > 0:
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


def archivo_invertido(nombre_archivo: str) -> None:
    file_in = open(nombre_archivo, "r")
    file_out = open("reverso.txt", "w")
    lineas = file_in.readlines()
    # Agrego el salto de linea al que va a ser nuestro ult elemento
    lineas[-1] += "\n"
    lineas_invertidas = lineas[::-1]
    # Agrego el salto de linea al que va a ser nuestro ult elemento
    lineas_invertidas[-1] = lineas_invertidas[-1][:-1]
    file_out.write("".join(lineas_invertidas))
    file_in.close()
    file_out.close()


"""   Ejercicio 4   """


def agregar_al_final(nombre_archivo: str, frase: str) -> None:
    """
    file_r = open(nombre_archivo, "r")
    contenido_actual: str = file_r.read()
    file_r.close()

    contenido_actualizado: str = contenido_actual + "\n" + frase

    file_w = open(nombre_archivo, "w")
    file_w.write(lineas_actualizadas)
    file_w.close()
    """

    # Otra implementacion
    file_r = open(nombre_archivo, "a")
    file_r.write("\n" + frase)
    file_r.close()


"""   Ejercicio 5   """


def agregar_al_principio(nombre_archivo: str, frase: str) -> None:
    """
    file_r = open(nombre_archivo, "r")
    contenido_actual: str = file_r.read()
    file_r.close()

    lineas_actualizadas: str = frase + "\n" + contenido_actual

    file_w = open(nombre_archivo, "w")
    file_w.write(lineas_actualizadas)
    file_w.close()
    """

    # Otra implementacion
    file_r = open(nombre_archivo, "r+")
    file_r.write(frase + "\n")
    file_r.close()


"""   Ejercicio 6   """


def palabras_legibles(nombre_archivo: str) -> list[str]:
    res: list[str] = []
    file = open(nombre_archivo, "rb")
    contenido: str = file.read()
    contenido_traducido: str = ""

    for caracter in contenido:
        contenido_traducido += chr(caracter)

    for palabra in contenido_traducido.split():
        if es_legible(palabra):
            res.append(palabra)

    return res


def es_legible(palabra: str) -> bool:
    tiene_letra: bool = False
    tiene_num: bool = False
    tiene_undscore: bool = False

    for caracter in palabra:
        if "a" <= caracter <= "z" or "A" <= caracter <= "Z":
            tiene_letra = True
        elif "9" >= caracter >= "0":
            tiene_num = True
        elif caracter == "_":
            tiene_undscore = True
        else:
            return False
    return len(palabra) >= 5 and tiene_letra and tiene_num and tiene_undscore


"""   Ejercicio 7   """


def promedio_estudiante(lu: str) -> float:
    nota_total: float = 0.0
    cant_materias: int = 0
    file = open("p8_historia_academica.csv", "r")
    filas: list[str] = file.read().split("\n")

    for fila in filas:
        fila_separada: list[str] = fila.split(",")
        if fila_separada[0] == lu:
            nota_total += float(fila_separada[3])
            cant_materias += 1

    res: float = nota_total / cant_materias
    return res


# Pila/Lista LIFO (Last In First Out)
"""   Ejercicio 8   """


def generar_nros_al_azar_pila(n: int, desde: int, hasta: int) -> Pila:
    res: Pila = Pila()
    for _ in range(n):
        res.put(random.randint(desde, hasta))
    return res


"""   Ejercicio 9   """


def cantidad_elementos_pila(p: Pila) -> int:
    # p.qsize()
    aux: Pila = Pila()
    res: int = 0
    while not p.empty():
        aux.put(p.get())
        res += 1

    for _ in range(res):
        p.put(aux.get())
    return res


"""   Ejercicio 10   """


def buscar_el_maximo_pila(p: Pila) -> int:
    maximo: int = p.get()
    aux: Pila = Pila()
    aux.put(maximo)

    while not p.empty():
        elem_actual: int = p.get()
        aux.put(elem_actual)
        if maximo < elem_actual:
            maximo = elem_actual

    while not aux.empty():
        p.put(aux.get())
    return maximo


"""   Ejercicio 11   """
# completar


def esta_bien_balanceada(s: str) -> bool:
    p: Pila = Pila()

    for caracter in s:
        print(caracter)

    return p


"""   Ejercicio 12   """
# completar


# Cola/Lista FIFO (First In First Out)
"""   Ejercicio 13   """


def generar_nros_al_azar_cola(n: int, desde: int, hasta: int) -> Cola:
    numeros_random: Pila = generar_nros_al_azar_pila(n, desde, hasta)
    res: Cola = Cola()

    for _ in range(n):
        res.put(numeros_random.get())
    return res


"""   Ejercicio 14   """


def cantidad_elementos_cola(c: Cola) -> int:
    aux: Cola = Cola()
    res: int = 0
    while not c.empty():
        aux.put(c.get())
        res += 1

    while not aux.empty():
        c.put(aux.get())
    return res


"""   Ejercicio 15   """


def buscar_el_maximo_cola(c: Cola) -> int:
    aux: Cola = Cola()
    maximo = c.get()
    aux.put(maximo)
    while not c.empty():
        elem_actual = c.get()
        aux.put(elem_actual)
        if maximo < elem_actual:
            maximo = elem_actual

    while not aux.empty():
        c.put(aux.get())
    return maximo


"""   Ejercicio 16   """
# completar


def armar_secuencia_de_bingo() -> Cola[int]:
    pass


def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    pass


"""   Ejercicio 17   """
# completar


def n_pacientes_urgentes(c: Cola[(int, str, str)]) -> int:
    pass


"""   Ejercicio 18   """
# completar


def a_clientes(
    c: Cola[(str, int, bool, bool)]
) -> Cola[(str, int, bool, bool)]:
    pass


# Diccionarios
"""   Ejercicio 19   """
# completar


def agrupar_por_longitud(nombre_archivo: str) -> dict[int, int]:
    file = open(nombre_archivo, "r")
    palabras_archivo: list[str] = file.readlines()
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


"""   Ejercicio 20   """
# completar

"""   Ejercicio 21   """
# completar


def la_palabra_mas_frecuente(nombre_archivo: str) -> str:
    pass


"""   Ejercicio 22   """
# completar

historiales: dict = {}


def visitar_sitio(historiales, usuario, sitio):
    pass


def navegar_atras(historiales, usuario):
    pass


def navegar_adelante(historiales, usuario):
    pass


"""   Ejercicio 23   """
# completar
inventario: dict = {}


def agregar_producto(inventario, nombre, precio, cantidad):
    pass


def actualizar_stock(inventario, nombre, cantidad):
    pass


def actualizar_precios(inventario, nombre, precio):
    pass


def calcular_valor_inventario(inventario):
    pass
