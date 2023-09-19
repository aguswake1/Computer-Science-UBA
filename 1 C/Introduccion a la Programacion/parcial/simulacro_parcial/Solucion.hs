
module Solucion where

-- [("Juan", "Pepe"), ("Juan", "Jorge")] -> True
-- [("Juan", "Pepe"), ("Juan", "Juan")] -> False
-- [("Juan", "Pepe"), ("Juan", "Pepe")] -> False
-- [("Juan", "Pepe"), ("Pepe", "Juan")] -> False
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((x, y):xs) = relacionValida && relacionesValidas xs
    where relacionValida = x /= y && notElem (x, y) xs && notElem (y, x) xs


-- [("Juan", "Pepe"), ("Juan","Jose")] -> ["Pepe","Juan","Jose"]
personas :: [(String, String)] -> [String]
personas [] = []
personas ((x, y):xs)
    | personasAux x xs && personasAux y xs = personas xs
    | personasAux x xs = y : personas xs
    | personasAux y xs = x : personas xs
    | otherwise = x : y : personas xs

personasAux :: String -> [(String, String)] -> Bool
personasAux _ [] = False
personasAux str ((x,y):xs) = str == x || str == y || personasAux str xs

-- definir sacar repetidos
{-
personasConRepetidos :: [(String, String)] -> [String]
personasConRepetidos [] = []
personasConRepetidos ((x,y):xs) = x:y:personas xs

personas :: [(String, String)] -> [String]
personas l = sacarRepetidos (personasConRepetidos l)
-}


{-
Existe ambiguedad en el asegura, pero se asume por el nombre del problema que retornamos una lista con
las relaciones de Juan, siendo este excluido de la misma.
"Juan" -> [("Juan", "Pepe"), ("Juan","Jose"), ("Martin","Pepe")] -> ["Pepe", "Jose"]
-}
amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe s ((x,y):xs)
    | s == x = y : amigosDe s xs
    | s == y = x : amigosDe s xs
    | otherwise = amigosDe s xs


personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos l = amigosCont (personas l) l

amigosCont :: [String] -> [(String, String)] -> String
amigosCont [x] _ = x
amigosCont (x:xs) l
    | cantAmigos x > cantAmigos (amigosCont xs l) = x
    | otherwise = amigosCont xs l
    where cantAmigos persona = length (amigosDe persona l)
