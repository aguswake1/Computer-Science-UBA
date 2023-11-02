import unittest
from solucion import (
    ultima_aparicion,
    elementos_exclusivos,
    contar_traducciones_iguales,
    convertir_a_diccionario,
)


class Ej1Test(unittest.TestCase):
    def test_trivial(self):
        res = ultima_aparicion([1], 1)
        self.assertEqual(res, 0)

    def test_ejemplo(self):
        res = ultima_aparicion([-1, 4, 0, 4, 100, 0, 100, 0, -1, -1], 0)
        self.assertEqual(res, 7)


class Ej2Test(unittest.TestCase):
    def test_trivial(self):
        res = elementos_exclusivos([], [])
        self.assertEqual(res, [])

    def test_ejemplo(self):
        resEsperado = [
            [3, 4, 5],
            [3, 5, 4],
            [4, 3, 5],
            [4, 5, 3],
            [5, 3, 4],
            [5, 4, 3],
        ]
        res = elementos_exclusivos(
            [-1, 4, 0, 4, 3, 0, 100, 0, -1, -1], [0, 100, 5, 0, 100, -1, 5]
        )
        self.assertIn(res, resEsperado)


class Ej3Test(unittest.TestCase):
    def test_trivial(self):
        res = contar_traducciones_iguales({}, {})
        self.assertEqual(res, 0)

    def test_ejemplo(self):
        aleman = {
            "Mano": "Hand",
            "Pie": "Fuss",
            "Dedo": "Finger",
            "Cara": "Gesicht",
        }
        ingles = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
        res = contar_traducciones_iguales(ingles, aleman)
        self.assertEqual(res, 2)


class Ej4Test(unittest.TestCase):
    def test_trivial(self):
        res = convertir_a_diccionario([])
        self.assertEqual(res, {})

    def test_ejemplo(self):
        resEsperado = {-1: 3, 0: 1, 4: 1, 100: 2}
        res = convertir_a_diccionario([-1, 0, 4, 100, 100, -1, -1])
        self.assertEqual(res, resEsperado)


if __name__ == "__main__":
    unittest.main(verbosity=2)
