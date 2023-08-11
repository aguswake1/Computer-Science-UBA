import math


# exercise 1
# 1.
def raizDe2() -> float:
    return round(math.sqrt(2), 4)


# 2.
def imprimir_hola() -> None:
    print("hola")


# 3.
def imprimir_un_verso() -> None:
    print(
        """
    Feeling my way through the darkness
    Guided by a beating heart
    I can't tell where the journey will end
    But I know where to start
    """
    )


# 4.
def factorial_de_dos() -> int:
    return math.factorial(2)


# 5, 6, 7. para no repetir el codigo, podemos usar un parametro.
def factorial(num: int) -> int:
    return math.factorial(num)


# exercise 2
# 1.
def imprimir_saludo(nombre: str) -> None:
    print(f"Hola {nombre}!")


# 2.
def raiz_cuadrada_de(numero: int) -> float:
    return math.sqrt(numero)


# 3.
def imprimir_dos_veces(estribillo: str) -> str:
    print(estribillo * 2)


# 4. m es multiplo de n?
def es_multiplo_de(n: int, m: int) -> bool:
    return m % n == 0


# 5.
def es_par(numero: int) -> bool:
    return es_multiplo_de(2, numero)


# 6.
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    porciones_pizza: int = 8
    cant_pizzas: float = (comensales * min_cant_de_porciones) / porciones_pizza
    return math.ceil(cant_pizzas)


# exercise 3
# 1.
def alguno_es_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 or numero2 == 0


# 2.
def ambos_son_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 and numero2 == 0


# 3.
def es_nombre_largo(nombre: str) -> bool:
    return 3 <= len(nombre) <= 8


# 4.
def es_bisiesto(anio: int) -> bool:
    return (anio % 4 == 0 and not (anio % 100 == 0)) or anio % 400 == 0


# exercise 4
# 1.
def peso_pino(altura: int) -> int:
    return 0


# 2.
def es_peso_util(peso: int) -> bool:
    return 0


# 3.y 4.
def sirve_pino(altura: int) -> bool:
    return es_peso_util(peso_pino(altura))


# exercise 5
