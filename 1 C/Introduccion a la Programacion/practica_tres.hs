--- exercise 1 ---
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

funcionH :: Int -> Int
funcionH n = funcionF (funcionG n)

funcionK :: Int -> Int
funcionK n = funcionG (funcionF n)

--- exercise 2 ---
{- a.
    problema absoluto (n: Z) : Z {
        requiere: {True}
        asegura: {res = if n >= 0 then n else n * (-1)}
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
        en los asegura hay lazy? es decir se indefine o tengo que especificar los casos
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

{- g.
    problema sumaDistintos (x: Z, y: Z,z : Z) : Z {
        requiere: { True }
        asegura{ (∃s: seq<X>)(x pertenece a s e y pertenece a s y z pertenece a s y noHayOtrosElem(s, x, y, z) y noHayRepetidos(s) res = sumatoria de i = 0 hasta |s|-1) de s[i]}
        asegura:
        {
            result = x + y + z <-> x != y != z) creo que estaria mal porque no contempla casos
            result =
        }
-}
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z
  | x == y && x == z = x
  | x == y = z + x
  | x == z = y + x
  | z == y = x + y
  | otherwise = x + y + z

{-
problema esMultiploDe (x: Z, y: Z) : Bool {
        requiere: { x >= y }
        asegura:
        {
            result = true <-> (∃n:Z)(n * y = x)
        }
-}
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = x `div` y == 0

-- 4f.
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
