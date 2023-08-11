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
    print("Hola ${nombre}!")


# 2.
def raiz_cuadrada_de(numero: int) -> float:
    return math.sqrt(numero)
