import math


"""               ---- exercise 1 ----               """


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


"""               ---- exercise 2 ----               """


# 1.
def imprimir_saludo(nombre: str) -> None:
    print(f"Hola {nombre}!")


# 2.
def raiz_cuadrada_de(numero: int) -> float:
    return math.sqrt(numero)


# 3.
def imprimir_dos_veces(estribillo: str) -> str:
    return estribillo * 2


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


"""               ---- exercise 3 ----               """


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


"""               ---- exercise 4 ----               """


# 1.
def peso_pino(altura: int) -> int:
    altura_cm: int = altura * 100
    peso_hasta_300 = min(900, altura_cm * 3)
    peso_mayor_300 = (altura_cm - 300) * 2
    peso_estimado = peso_hasta_300 + max(0, peso_mayor_300)
    return peso_estimado


# 2.
def es_peso_util(peso: int) -> bool:
    return 400 <= peso <= 1000


# 3. y 4.
def sirve_pino(altura: int) -> bool:
    return es_peso_util(peso_pino(altura))


"""               ---- exercise 5 ---- FALTA ESPECIFICAR              """


# 1.
def devolver_el_doble_si_es_par(numero: int) -> int:
    return numero * 2 if numero % 2 == 0 else numero


# 2.
def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) -> int:
    return numero if numero % 2 == 0 else numero + 1


# 3.
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(
    numero: int,
) -> int:
    if numero % 3 == 0:
        return 2 * numero
    elif numero % 9 == 0:
        return 3 * numero
    else:
        return numero


# 4.
def longitud_nombre(nombre: str) -> str:
    return (
        "Tu nombre tiene muchas letras!"
        if len(nombre) >= 5
        else "Tu nombre tiene menos de 5 caracteres"
    )


# 5.
def vacaciones_o_no(sexo: str, edad: int) -> None:
    mujer_no_jubilada: bool = (18 <= edad < 60) and sexo.lower() == "f"
    hombre_no_jubilado: bool = (18 <= edad < 65) and sexo.lower() == "m"
    return (
        print("Te toca trabajar")
        if mujer_no_jubilada or hombre_no_jubilado
        else print("Anda de vacaciones")
    )


"""               ---- exercise 6 ----               """


# 1
def uno_al_diez() -> None:
    contador: int = 1
    while contador <= 10:
        print(contador)
        contador += 1


# 2.
def pares() -> None:
    contador: int = 10
    while contador <= 40:
        if contador % 2 == 0:
            print(contador)
        contador += 1


# 3.
def eco() -> None:
    contador: int = 1
    while contador <= 10:
        print("eco")
        contador += 1


# 4.
def despegue_cohete(cuenta_regresiva: int) -> None:
    while cuenta_regresiva >= 1:
        print(cuenta_regresiva)
        cuenta_regresiva -= 1
    print("Despegue")


# 5.
def viaje_en_el_tiempo(anio_partida: int, anio_del_pasado: int) -> None:
    while anio_partida > anio_del_pasado:
        anio_partida -= 1
        print(
            f"Ha viajado un anio al pasado, estamos en el anio {anio_partida}"
        )


# 6.
def viaje_en_el_tiempo_aristoteles(anio_partida: int) -> None:
    while anio_partida > -364:
        anio_partida -= 20
        print(
            "Ha viajado veinte anios al pasado, estamos en el anio"
            f" {anio_partida}"
        )


"""               ---- exercise 7 ----               """


# 1
def uno_al_diez_for() -> None:
    for i in range(1, 11):
        print(i)


# 2.
def pares_for() -> None:
    for i in range(10, 41, 2):
        print(i)


# 3.
def eco_for() -> None:
    for i in range(1, 11):
        print("eco")


# 4.
def despegue_cohete_for(cuenta_regresiva: int) -> None:
    for i in range(cuenta_regresiva, 0, -1):
        print(i)
    print("Despegue")


# 5.
def viaje_en_el_tiempo_for(anio_partida: int, anio_del_pasado: int) -> None:
    for i in range(anio_partida - 1, anio_del_pasado - 1, -1):
        print(f"Ha viajado un anio al pasado, estamos en el anio {i}")


# 6.
def viaje_en_el_tiempo_aristoteles_for(anio_partida: int) -> None:
    for i in range(anio_partida - 20, -384, -20):
        print(f"Ha viajado veinte anios al pasado, estamos en el anio {i}")


"""               ---- exercise 8 ----               """

# 1. Se declara la variable "x" y se le asigna el valor entero 5, luego
# se declara la variable "y" se le asigna el valor entero 7.


# 2. (1.) + Ahora declaramos la variable "z" y la definimos como la suma de "x"
#  e "y". Esto lo podemos ver como 5 + 7, dandonos como resultado que z = 12.


# 3. A la variable "x" se le asigna el valor entero 5 y luego se la redefine
# asignandole el valor de tipo cadena de caracteres "hola".


# 4. A la variable "x" se le asigna el valor booleano True, y a la variable
# "y" se le asigna el valor booleano False. Ahora declaramos la variable "res"
# y la definimos como la conjuncion (AND logico) entre "x" e "y". Esto como
# resultado nos da que res = False.


# 5. Se define la variable "x" con el valor booleano False, y a la variable
# "res" con el valor not (x). Esto quiere decir que la variable res tiene
# la operacion logica de negacion (NOT), con lo cual se niega el valor que
# contiene "x", dando como resultado res = True.


"""               ---- exercise 9 ----               """


def rt(x: int, g: int) -> int:
    g += 1
    return x + g


g: int = 0


def ro(x: int) -> int:
    global g
    g += 1
    return x + g


# 1. La primera vez que evaluamos ro(1) nos da 2, la segunda ro(1) = 3
# y la tercera ves nos da ro(1) = 4. Esto se debe a que funcion modifica la
# variable g de manera global, incrementandola de a uno.


# 2. rt(1,0) siempre tiene como resultado 2, ya que, la funcion trabaja con
# variables locales que tienen scope local (variable muere fuera de la funcion)


# 3. En la funcion rt(x, g) lo que se hace es primero incrementar la variable
# local "g", luego la funcion devuelve la suma entre la variable "x" y "g".
# En la funcion ro(x) primero se avisa que vamos a usar la variable "g" que se
# encuentra definida de manera global, y a esta se la incrementa en uno y luego
# se retorna la suma entre "x" y la variable global "g".


# 4. rt(x, g) requiere = {True}. Asegura = {res = x + (g + 1)}
# ro(x) requiere = {True}. Asegura = {res = x + (global g + 1)}
