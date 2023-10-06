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


""" --- Ejercicio 3 --- """


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


print(todosLosEstudiantes())
# 2.

# 3.
# def sieteYmedio():


""" --- Ejercicio 4 ---
# 1.
def perteneceACadaUno(s: "list[list[int]]", e: int, res: "list[bool]"):


# 2.
def esMatriz(s: "list[list[int]]") -> bool:


# 3.
def filasOrdenadas(m: "list[list[int]]", res: "list[bool]"):


# 4.
"""
