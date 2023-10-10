import random

vocales: list[str] = ["a", "e", "i", "o", "u"]


""" --- Ejercicio 1 --- """


# 1.
def pertenece(s: "list[int]", e: int) -> bool:
    return e in s


def pertenece2(s: "list[int]", e: int) -> bool:
    i: int = 0
    while i < len(e):
        if s[i] == e:
            return True
        else:
            i += 1
    return False


def pertenece3(s: "list[int]", e: int) -> bool:
    for i in range(len(s)):
        if s[i] == e:
            return True

    return False


def pertenece4(s: "list[int]", e: int) -> bool:
    for elem in s:
        if elem == e:
            return True

    return False


"""
recursion
def pertenece5(s: "list[int]", e: int) -> bool:
    if len(s) == 1:
        return s[0] == e
    else:
        pertence4()
"""


def perteneceString(s: "list[any]", e: any) -> bool:
    for i in range(len(s)):
        if s[i] == e:
            return True

    return False


# 2.
def divideAtodos(s: "list[int]", e: int) -> bool:
    for i in range(len(s)):
        if s[i] % e != 0:
            return False

    return True


# 3.
def sumaTotal(s: "list[int]") -> int:
    res: int = 0
    for i in range(len(s)):
        res += s[i]
    return res


# 4.
def ordenados(s: "list[int]") -> bool:
    for i in range(len(s) - 1):
        if s[i] >= s[i + 1]:
            return False

    return True


# 5.
def mayorQueSiete(s: "list[str]") -> bool:
    for i in range(len(s)):
        if len(s[i]) > 7:
            return True

    return False


# 6.
def palindromo(palabra: str) -> bool:
    palabra_invertida: str = ""
    for i in range(len(palabra) - 1, -1, -1):
        palabra_invertida += palabra[i]

    return palabra == palabra_invertida


# 7.
def analizarFortaleza(passw: str) -> str:
    if len(passw) < 5:
        return "ROJO"
    elif esVerde(passw):
        return "VERDE"
    else:
        return "AMARILLA"


def esVerde(passw: str) -> bool:
    tiene_minusc: bool = False
    tiene_mayusc: bool = False
    tiene_num: bool = False
    for caracter in passw:
        if "a" <= caracter <= "z":
            tiene_minusc = True
        elif "A" <= caracter <= "Z":
            tiene_mayusc = True
        elif 9 >= int(caracter) >= 0:
            tiene_num = True
    return len(passw) > 8 and tiene_minusc and tiene_mayusc and tiene_num


# 8.
def transacciones(historial: "list[tuple[str, int]]") -> int:
    saldo_final: int = 0
    for elem in historial:
        if elem[0] == "I":
            saldo_final += elem[1]
        else:
            saldo_final -= elem[1]
    return saldo_final


# 9.
def tresVocalesDistintas(palabra: str) -> bool:
    for caracter in palabra:
        for vocal in vocales:
            if caracter == vocal:
                vocales.remove(vocal)

    return len(vocales) <= 2


""" --- Ejercicio 2 --- """


# 1.
def ceroEnIndexPar(listaNum: "list[int]") -> "list[int]":
    for i in range(1, len(listaNum)):
        if i % 2 == 0:
            listaNum[i] = 0
    return listaNum


# 2.
def ceroEnIndexPar2(listaNum: "list[int]") -> "list[int]":
    nueva_lista: list[int] = [listaNum[0]]

    for i in range(1, len(listaNum)):
        if i % 2 == 0:
            nueva_lista.append(0)
        else:
            nueva_lista.append(listaNum[i])
    return nueva_lista


# 3.
def sinVocales(cadena: str) -> str:
    es_vocal: bool = False
    res: str = ""
    for letra in cadena:
        for vocal in vocales:
            if letra == vocal:
                es_vocal = True

        if not es_vocal:
            res += letra
            continue

        es_vocal = False

    return res


# 4.
def reemplazaVocales(s: str) -> str:
    res: str = ""
    for letra in s:
        if perteneceString(vocales, letra):
            res += "_"
        else:
            res += letra
    return res


# 5.
def daVueltaStr(s: str) -> str:
    res: str = ""
    for i in range(len(s)):
        res += s[len(s) - i - 1]
    return res


# 6.
def eliminarRepetidos(s: str) -> str:
    res: str = []
    for caracter in s:
        if caracter not in res:
            res.append(caracter)

    return "".join(res)


""" --- Ejercicio 3 --- """


def aprobado(notas: "list[int]") -> int:
    total_notas: int = 0
    nota_menor_cuatro: bool = False

    for nota in notas:
        total_notas += nota
        if nota < 4:
            nota_menor_cuatro = True

    promedio: int = total_notas / len(notas)

    if nota_menor_cuatro or promedio < 4:
        return 3
    elif promedio >= 7:
        return 1
    else:
        return 2


""" --- Ejercicio 4 --- """


# 1.
def todosLosEstudiantes() -> "list[str]":
    todos_estudiantes: list[str] = []
    entrada: str = ""
    while entrada != "listo":
        entrada = input(
            "Ingrese el nombre de sus estudiantes, para finalizar ponga"
            " 'listo':\n"
        )
        todos_estudiantes.append(entrada)

    todos_estudiantes.pop()
    return todos_estudiantes


# 2.
def historialMonedero() -> "list[tuple[str, int]]":
    entrada: str = ""
    res: list[tuple[str, int]] = []
    while entrada != "X":
        entrada = input("Ingrese la operacion que desea realizar\n")
        if entrada != "X":
            monto: int = int(input("Ingrese el monto de la operacion: "))
            res.append((entrada, monto))

    return res


# 3.
def sieteYmedio() -> "list[float]":
    puntaje: float = 0.0
    entrada: str = ""
    mano: list[float] = []
    valor_carta: float = 0.0
    while entrada != "plantarse":
        num_random: float = 8.0
        while num_random == 8.0 or num_random == 9.0:
            num_random = float(random.randint(1, 12))

        if num_random >= 10:
            valor_carta = 0.5
        else:
            valor_carta = num_random

        puntaje += valor_carta
        mano.append(num_random)
        print(f"Su carta es {num_random}\n puntaje total obtenido: {puntaje}")

        if puntaje > 7.5:
            print("Se excedio del puntaje!")
            return mano
        elif puntaje == 7.5:
            print("Felicidades por ganar el juego")
            return mano
        else:
            entrada = input("Desea seguir sacando otra carta o plantarse?\n")
            if entrada == "plantarse":
                return mano


""" --- Ejercicio 5 --- """


# 1.
def perteneceACadaUno(
    s: "list[list[int]]", e: int, res: "list[bool]"
) -> "list[bool]":
    res.clear()
    for lista_enteros in s:
        res.append(e in lista_enteros)
    return res


"""
# 2.
def esMatriz(s: "list[list[int]]") -> bool:


# 3.
def filasOrdenadas(m: "list[list[int]]", res: "list[bool]"):


# 4.


# 5.
"""
