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
quitar el (x:xs)
    | not (el `pertenece` (x:xs)) = x:xs
    | el == x = xs
    | otherwise = x : quitar el xs


-- 6.
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos el (x:xs)
    | noPertenece = x:xs
    | el == x && noPertenece = xs
    | el == x = quitarTodos el xs
    | otherwise = x : quitarTodos el xs
    where noPertenece = not (el `pertenece` (x:xs))

-- 7.
--eliminarRepetidos :: (Eq t) => [t] -> [t]


-- 8.
--mismosElementos :: (Eq t) => [t] -> [t] -> Bool


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
--sumarN n x:xs =


-- 9.
ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar s = maximo s : ordenar (eliminar (maximo s) s)


eliminar :: Integer -> [Integer] -> [Integer]
eliminar _ [] = []
eliminar x (y:ys)
    | x == y = ys
    | otherwise = y:eliminar x ys


-- exercise 4
-- 5.
{-
aplanar :: [[Char]] -> [Char]
aplanar [x] = [x]
aplanar (x:xs) = x ++ aplanar xs
-}

-- exercise 5
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
