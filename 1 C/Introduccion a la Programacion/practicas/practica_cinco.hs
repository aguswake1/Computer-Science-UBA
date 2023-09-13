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
--capicua :: (Eq t) => [t] -> Bool


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
--sumarN :: Integer -> [Integer] -> [Integer]


-- 5.
--sumarElPrimero :: [Integer] -> [Integer]


-- 6.
--sumarElUltimo :: [Integer] -> [Integer]


-- 7.
--pares :: [Integer] -> [Integer]


-- 8.
--multiplosDeN :: Integer -> [Integer] -> [Integer]


-- 9.
ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar s = maximo s : ordenar (quitar (maximo s) s)


-- exercise 4
-- 1.
--sacarBlancosRepetidos :: [Char] -> [Char]


-- 2.
--contarPalabras :: [Char] -> Integer


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
