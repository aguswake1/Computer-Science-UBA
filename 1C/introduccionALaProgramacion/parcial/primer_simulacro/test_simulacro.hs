import Test.HUnit
import Solucion

main = runTestTT tests

tests = test [
    "relacionesValidas: una sola correcta" ~: (relacionesValidas [relacion1_2]) ~?= True,
    "relacionesValidas: una sola incorrecta" ~: (relacionesValidas [relacion1_1]) ~?= False,
    "personas: una sola relacion, 2 personas" ~: (sonIguales (personas [relacion1_2])  [usuario1, usuario2]) ~?= True,
    "personas: dos relaciones, 3 personas" ~: (sonIguales (personas [relacion1_2, relacion1_3]) [usuario1, usuario2, usuario3]) ~?= True,
    "amigosDe: una sola relacion, 1 solo amigo" ~: (amigosDe usuario1 [relacion1_2] ) ~?= [usuario2],
    "personaConMasAmigos: 2 relaciones, 1 solo max" ~: (personaConMasAmigos [relacion1_2, relacion1_3]) ~?= usuario1
 ]

-- Ejemplos

usuario1 = "Juan"
usuario2 = "Natalia"
usuario3 = "Pedro"

relacion1_2 = (usuario1, usuario2)
relacion1_1 = (usuario1, usuario1)
relacion1_3 = (usuario1, usuario3)


-- FUNCIONES PARA TESTING, NO BORRAR
-- expectAny permite saber si el elemenot que devuelve la función es alguno de los esperados
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- sonIguales permite ver que dos listas sean iguales si no importa el orden
quitar :: (Eq t) => t -> [t] -> [t]
-- requiere x pertenece a y
quitar x (y:ys)
 | x == y = ys
 | otherwise = y : quitar x ys

incluido :: (Eq t) => [t] -> [t] -> Bool
incluido [] l = True
incluido (x:c) l = elem x l && incluido c (quitar x l)

sonIguales :: (Eq t) => [t] -> [t] -> Bool
sonIguales xs ys = incluido xs ys && incluido ys xs