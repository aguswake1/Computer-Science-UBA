-- exercise 1
-- a.
funcionF :: Int -> Int
funcionF 1 = 8
funcionF 4 = 131
funcionF 16 = 16

{- b.
    problema f (n: Z) : Z {
        requiere: {n = 8 ∨ n = 16 ∨ n = 131}
        asegura: {(n = 8 -> result = 16) ∧ (n = 16 -> result = 4) ∧ (n = 131 -> result = 1)}
    }
-}
funcionG :: Int -> Int
funcionG 8 = 16
funcionG 16 = 4
funcionG 131 = 1

-- c.
funcionH :: Int -> Int
funcionH n = funcionF (funcionG n)

funcionK :: Int -> Int
funcionK n = funcionG (funcionF n)

-- exercise 2
{- a.
    problema absoluto (n: Z) : Z {
        requiere: {True}
        asegura: {res = |n|}
    }
-}
absoluto :: Int -> Int
absoluto n
  | n >= 0 = n
  | otherwise = n * (-1)

absoluto' :: Int -> Int
absoluto' = abs

{- b.
    problema maximoabsoluto (x: Z, y: Z) : Z {
        requiere: { True }
        asegura: { result = x -> absoluto x >= absoluto y ∨ result = y -> absoluto x < absoluto y }
    }
-}
maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y
  | abs x >= abs y = abs x
  | otherwise = abs y

{- c.
    problema maximo3 (x: Z, y: Z, z: Z) : Z {
        requiere: { True }
        asegura: {res = x -> x >= y ∧ x >= z ∨ res = y -> y > x ∧ y > z ∨ res = z -> z > x ∧ z > y)}
    }
-}
maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z
  | x >= y && x >= z = x
  | y > z = y
  | otherwise = z

{- d.
    problema algunoEs0 (x: ℝ, y: ℝ) : Bool {
        requiere: { True }
        asegura: {result = True <-> x = 0 ∨ y = 0}
    }
-}
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y
  | x == 0 || y == 0 = True
  | otherwise = False

algunoEs0' :: Float -> Float -> Bool
algunoEs0' 0 y = True
algunoEs0' x 0 = True
algunoEs0' x y = False

{- e.
    problema ambosSon0 (x: ℝ, y: ℝ) : Bool {
        requiere: { True }
        asegura: { result = True <-> x = 0 ∧ y = 0 }
    }
-}
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y
  | x == 0 && y == 0 = True
  | otherwise = False

ambosSon0' :: Float -> Float -> Bool
ambosSon0' 0 0 = True
ambosSon0' x y = False

{- f.
    problema mismoIntervalo (x: ℝ, y: ℝ) : Bool {
        requiere: { True }
        asegura:
        {
            result = True <-> (x ∈ (-∞,3] ∧ y ∈ (-∞,3]) ∨ (x ∈ (3,7] ∧ y ∈ (3,7]) ∨ (x ∈ (7, ∞) ∧ y ∈ (7, ∞))
        }
-}
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y
  | x > 7 && y > 7 = True
  | x <= 3 && y <= 3 = True
  | x <= 7 && x > 3 && y <= 7 && y > 3 = True
  | otherwise = False

{- g. Si bien hay distintas posibles interpretaciones al problema, vamos a darle la siguiente:
Cuando hay algun numero repetido no lo sumo.
    problema sumaDistintos (x: Z, y: Z,z : Z) : Z {
        requiere: { True }
        asegura: {((x != y) ∧ (x != z) ∧ (y != z)) -> res = x + y + z}
        asegura: {((x = y) ∧ (x != z)) -> res = z}
        asegura: {((x != y) ∧ (x = z)) -> res = y}
        asegura: {((x != y) ∧ (x != z) ∧ (y = z)) -> res = x}
        asegura: {((x = y) ∧ (x = z)) -> res = 0}
-}
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z
  | x == y && x == z = 0
  | x == y = z
  | x == z = y
  | z == y = x
  | otherwise = x + y + z

{- h.
problema esMultiploDe (x: N, y: N) : Bool {
        la condicion de ser mayor estricto que 1 es porque 1 no es multiplo de nadie.
        requiere: { x >= y ∧ x > 1 ∧ y > 1 }
        asegura:
        {
            res = true <-> (∃n:N)(n * y = x)
        }
-}
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = x `mod` y == 0

{- i.
problema digitoUnidades(n: N) : N {
        requiere: { True }
        asegura:{res = ultimoDigito(n)}
-}
digitoUnidades :: Int -> Int
digitoUnidades n = n `mod` 10

{- j.
problema digitoDecenas(n: Z) : Z {
        requiere: { n > 0 }
        asegura:{res = anteUltimoDigito(n)}
-}
digitoDecenas :: Int -> Int
digitoDecenas n = (n `div` 10) `mod` 10

-- exercise 3
estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b
  | (a * a) `mod` (a * b) == 0 = True
  | otherwise = False

-- exercise 4 faltan especificaciones
-- a.
prodInt :: (Int, Int) -> (Int, Int) -> (Int, Int)
prodInt (x1, y1) (x2, y2) = (x1 * x2, y1 * y2)


-- b.
todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor (x1, y1) (x2, y2)
  | x1 < x2 && y1 < y2 = True
  | otherwise = False


-- c.
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt ((x1 - x2) ** 2 + (y1 - y2) ** 2)


-- d.
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (x, y, z) = x + y + z


-- e.
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (x, y, z) num
  | x `mod` num == 0 && y `mod` num == 0 && z `mod` num == 0 = x + y + z
  | x `mod` num == 0 && y `mod` num == 0 = x + y
  | x `mod` num == 0 && z `mod` num == 0 = x + z
  | y `mod` num == 0 && z `mod` num == 0 = y + z
  | x `mod` num == 0 = x
  | y `mod` num == 0 = y
  | z `mod` num == 0 = z
  | otherwise = 0


-- f.
{-
En la especificacion todo ocurre de manera simultanea, no sistematica.

Hay que modificar esta especificacion porque es demasiado especifica, no serviria para mayor escala (tupla mas grande).

problema posPrimerPar((n1,n2,n3): Z x Z x Z)): Z{
    requiere { True }

    asegura {
        if mod n1 2 == 0 then res = 1 else res = 4 fi
    }
    asegura {
        if mod n1 2 == 0 then res = 2 else res = 4 fi
    }
    asegura {
        if mod n1 2 == 0 then res = 3 else res = 4 fi
    }
-}
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (n1, n2, n3)
  | even n1 = 1
  | even n2 = 2
  | even n3 = 3
  | otherwise = 4


-- g.
crearPar :: a -> b -> (a, b)
crearPar x y = (x, y)


-- h.
invertir :: (a, b) -> (b, a)
invertir (x, y) = (y, x)


-- exercise 5
todosMenores :: (Int, Int, Int) -> Bool
todosMenores (n1, n2, n3)
  | auxF n1 > auxG n1 && auxF n2 > auxG n2 && auxF n3 > auxG n3 = True
  | otherwise = False


auxF :: Int -> Int
auxF n
  | n <= 7 = n ^ 2
  | otherwise = 2 * n - 1


auxG :: Int -> Int
auxG n
  | even n = n `div` 2
  | otherwise = 3 * n + 1


-- exercise 6
bisiesto :: Int -> Bool
bisiesto anio = not (anio `mod` 4 /= 0 || (anio `mod` 100 == 0 && anio `mod` 400 /= 0))


-- exercise 7
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x1, y1, z1) (x2, y2, z2) = abs ((x1 - x2) + (y1 - y2) + (z1 - z2))


-- exercise 8
comparar :: Int -> Int -> Int
comparar a b
  | sumaUltimosDosDigitos a  < sumaUltimosDosDigitos b = 1
  | sumaUltimosDosDigitos a  > sumaUltimosDosDigitos b = -1
  | otherwise = 0


sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos n = digitoUnidades n + digitoDecenas n