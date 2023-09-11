-- exercise 1.
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- exercise 2.
parteEntera :: Float -> Integer
parteEntera n
  | n > -1 && n < 1 = 0
  | n >= 1 = 1 + parteEntera (n - 1) + 1
  | n <= -1 = -1 + parteEntera (n + 1)

-- exercise 3.
esDivisible :: Integer -> Integer -> Bool
esDivisible 0 n2 = True
esDivisible 1 n2 = False
esDivisible n1 n2 = esDivisible (n1 - n2) n2

-- exercise 4
sumaImpares :: Integer -> Integer
sumaImpares 0 = 0
sumaImpares n = (2 * n - 1) + sumaImpares (n - 1)

-- exercise 5
medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact (n - 2)

-- exercise 6
sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos n =  (n `mod` 10) + sumaDigitos (n `div` 10)

-- exercise  7.
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
  | n < 10 = True
  | otherwise = (digitoUnidad n == digitoDecenas n) && todosDigitosIguales (n `div` 10)
  where
    digitoUnidad n = n `mod` 10
    digitoDecenas n = (n `div` 10) `mod` 10


-- exercise  8.
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i = (n `div` 10 ^ (cantDigitos n - i)) `mod` 10

cantDigitos :: Integer -> Integer
cantDigitos 0 = 0
cantDigitos n = 1 + cantDigitos (n `div` 10)


-- exercise  9.
esCapicua :: Integer -> Bool
esCapicua n = n == invertir n

invertir :: Integer -> Integer
invertir n
  | n < 10 = n
  | otherwise = digitoUnidad n * (10 ^ (cantDigitos n - 1)) + invertir (n `div` 10)
  where
    digitoUnidad n = n `mod` 10


-- exercise  10.
-- a)
f1 :: Integer -> Integer
f1 0 = 1
f1 n = 2^n + f1 (n - 1)

-- b)
f2 :: Integer -> Float -> Float
f2 1 q = q
f2 n q = q^n + f2 (n-1) q

-- c)
f3 :: Integer -> Float -> Float
f3 0 q = 0
f3 n q = q^(2 * n) + q^(2 * n - 1) + f3 (n - 1) q

{-
opcion 2
f3 1 q = q
f3 n q = f2 (2*n) q
-}

-- d)
f4 :: Integer -> Float -> Float
f4 0 q = 0
f4 n q = q^(2 * n) + q^(2 * n - 1) - q^(n - 1) + f4 (n - 1) q


-- exercise  11.
-- a)
eAprox :: Integer -> Float
eAprox 0 = 0
eAprox n = 1 / factorial (fromIntegral n) + eAprox (n - 1)

factorial :: Float -> Float
factorial 1 = 1
factorial num = num * factorial (num - 1)

-- b)
e :: Float
e = eAprox 10


-- exercise  12.
sucesion :: Integer -> Float
sucesion 1 = 2
sucesion n = 2 + 1 / sucesion (n - 1)

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = sucesion n - 1


-- exercise  13.
fn :: Integer -> Integer -> Integer
fn 1 m = fm 1 m
fn n m = fm n m + fn (n - 1) m

fm :: Integer -> Integer -> Integer
fm n 1 = n
fm n m = n^m + fm n (m - 1)


-- exercise  14.
sumaPotenciasn :: Integer -> Integer -> Integer -> Integer
sumaPotenciasn q 1 m = sumaPotenciasAuxm q 1 m
sumaPotenciasn q n m = sumaPotenciasAuxm q n m + sumaPotenciasn q (n - 1) m

sumaPotenciasAuxm :: Integer -> Integer -> Integer -> Integer
sumaPotenciasAuxm q n 1 = q^(n + 1)
sumaPotenciasAuxm q n m = q^(n + m) + sumaPotenciasAuxm q n (m - 1)


-- exercise  15.
--sumaRacionales :: Integer -> Integer -> Float
--sumaRacionales 1 1 = 0



-- exercise  16.
-- exercise  17.
-- exercise  18.
-- exercise  19.
-- exercise  20.
-- exercise  21.


