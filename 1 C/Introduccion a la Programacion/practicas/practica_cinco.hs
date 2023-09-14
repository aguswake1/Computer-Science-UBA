-- exercise 1
-- 1.
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs


-- 2.
ultimo :: [t] -> t
ultimo [el] = el
ultimo s = ultimo (tail s)


-- 3.
principio :: [t] -> [t]
principio [el] = []
principio (el:xs) = el : principio xs


-- 4.
reverso :: [t] -> [t]
reverso [] = []
reverso [el] = [el]
reverso (el:xs) = reverso xs ++ [el]


-- exercise 2
-- 1.
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs)
    | x == n = True
    | otherwise = n `pertenece` xs


-- 2.
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:xs)
    | x == head xs = todosIguales xs
    | otherwise = False


-- 3.
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs)
    | x `pertenece` xs = False
    | otherwise =  todosDistintos xs


-- 4.
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs)
    | pertenece x xs = True
    | otherwise = hayRepetidos xs


-- 5.
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar x (y:xs)
    | x == y = xs
    | otherwise = y : quitar x xs


-- 6.
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos x (y:xs)
    | x == y && noPertenece = xs
    | x == y = quitarTodos x xs
    | otherwise = y : quitarTodos x xs
    where noPertenece = not (x `pertenece` (y:xs))


-- 7.
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs)
    | x `pertenece` xs = x : eliminarRepetidos (quitarTodos x xs)
    | otherwise = x : eliminarRepetidos xs


-- 8.
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] _ = False
mismosElementos _ [] = False
mismosElementos (x:xs) ys
    | x `pertenece` ys = mismosElementos (quitarTodos x xs) (quitarTodos x ys)
    | otherwise = False


-- 9.
capicua :: (Eq t) => [t] -> Bool
capicua s = s == reverso s


-- exercise 3
-- 1.
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs


-- 2.
productoria :: [Integer] -> Integer
productoria [] = 1
productoria [x] = x
productoria (x:xs) = x * productoria xs


-- 3.
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs)
    | x > maximo xs = x
    | otherwise = maximo xs


-- 4.
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n [x] = [n + x]
sumarN n (x:xs) = (n + x) : sumarN n xs


-- 5.
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)


-- 6.
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo s = sumarN (head (reverso s)) s


-- 7.
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | even x = x : pares xs
    | otherwise = pares xs


-- 8.
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)
    | n `mod` x == 0 = x : multiplosDeN n xs
    | otherwise = multiplosDeN n xs


-- 9.
ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar s = maximo s : ordenar (quitar (maximo s) s)


-- exercise 4
-- 1.
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (' ':' ':xs) = sacarBlancosRepetidos (' ':xs)
sacarBlancosRepetidos (x:y:xs) = x : sacarBlancosRepetidos (y:xs)


-- 2.
contarPalabras :: [Char] -> Int
contarPalabras [] = 0
contarPalabras xs = contarEspacios (quitarEspaciosIniFin (sacarBlancosRepetidos xs)) + 1

quitarEspaciosIniFin :: [Char] -> [Char]
quitarEspaciosIniFin [] = []
quitarEspaciosIniFin (x:xs)
    | x ==' ' && head (reverse xs) == ' ' = quitarUltimo xs
    | x ==' ' = xs
    | head (reverse xs)==' ' = quitarUltimo (x:xs)
    | otherwise = x:xs

contarEspacios :: [Char] -> Int
contarEspacios [] = 0
contarEspacios (x:xs)
    | x == ' '= 1 + contarEspacios xs
    | otherwise = contarEspacios xs

quitarUltimo :: [Char] -> [Char]
quitarUltimo [] = []
quitarUltimo [x] = []
quitarUltimo (x:xs) = x : quitarUltimo xs


-- 3.
--palabras :: [Char] -> [[Char]]


-- 4.
--palabraMasLarga :: [Char] -> [Char]


-- 5.
{-
aplanar :: [[Char]] -> [Char]
aplanar [x] = [x]
aplanar (x:xs) = x ++ aplanar xs
-}


-- 6.
--aplanarConBlancos :: [[Char]] -> [Char]


-- 7.
--aplanarConNBlancos :: [[Char]] -> Integer -> [Char]


-- exercise 5
-- 1.
--sumaAcumulada :: (Num t) => [t] -> [t]



-- 2.
--descomponerEnPrimos :: [Integer] -> [[Integer]]
-- dp [x] = descomposicion [x]
-- descomposicion x : descomponerENprimos xs
{-
esPrimo :: Integer -> Bool
esPrimo n = cantDivisoresHasta n n
-}
cantDivisoresHasta :: Integer -> Integer -> Integer
cantDivisoresHasta n 1 = 1
cantDivisoresHasta n k
    | n `mod` k == 0 = 1 + cantDivisoresHasta n k-1
    | otherwise = cantDivisoresHasta n k-1

descomposicion :: Integer -> [Integer]
descomposicion n
    | even n =  []
