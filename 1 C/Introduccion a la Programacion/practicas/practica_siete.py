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


# exercise 5 FALTA ESPECIFICAR
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


# exercise 6
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
    contador: int = cuenta_regresiva
    while contador >= 1:
        print(contador)
        contador -= 1
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
