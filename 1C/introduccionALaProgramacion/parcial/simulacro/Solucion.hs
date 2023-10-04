module Solucion where

-- 1. 
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((x, y):xs) = x /= y && not (pertenece (x, y) xs) && not (pertenece (y, x) xs) && relacionesValidas xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece elemento (x:xs)
  | elemento == x = True
  | otherwise = pertenece elemento xs


-- 2.
personas :: [(String, String)] -> [String]
personas s = listaPersonasSinRepetir (listaPersonasRepetidas s)

listaPersonasSinRepetir :: [String] -> [String]
listaPersonasSinRepetir [] = []
listaPersonasSinRepetir (x:xs)
  | pertenece x xs = listaPersonasSinRepetir xs
  | otherwise = x : listaPersonasSinRepetir xs

listaPersonasRepetidas :: [(String, String)] -> [String]
listaPersonasRepetidas [] = []
listaPersonasRepetidas ((x,y):xs) = x : y : listaPersonasRepetidas xs


{-
  3.
  Existe ambiguedad en el asegura, pero se asume por el nombre del problema, que retornamos una lista con
  las relaciones de Juan, siendo este excluido de la misma.
  "Juan" -> [("Juan", "Pepe"), ("Juan","Jose"), ("Martin","Pepe")] -> ["Pepe", "Jose"]
-}

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe persona ((x,y):xs)
  | persona == x = y : amigosDe persona xs
  | persona == y = x : amigosDe persona xs
  | otherwise = amigosDe persona xs


-- 4.
personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos s = personaConMasAmigosAux  s (personas s)

personaConMasAmigosAux :: [(String, String)] -> [String] -> String
personaConMasAmigosAux _ [] = ""
personaConMasAmigosAux _ [x] = x
personaConMasAmigosAux rel (x:y:xs)
  | length (amigosDe x rel) >= length (amigosDe y rel) = personaConMasAmigosAux rel (x:xs)
  | otherwise = personaConMasAmigosAux rel (y:xs)


{-

Otra opcion era:

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos l = amigosCont (personas l) l

amigosCont :: [String] -> [(String, String)] -> String
amigosCont [x] _ = x
amigosCont (x:xs) l
    | cantAmigos x > cantAmigos (amigosCont xs l) = x
    | otherwise = amigosCont xs l
    where cantAmigos persona = length (amigosDe persona l)



-}