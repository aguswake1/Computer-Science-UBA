-- 1.
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- 2.
parteEntera :: Float -> Integer
parteEntera n
  | n > -1 && n < 1 = 0
  | n >= 1 = parteEntera (n - 1) + 1
  | n <= -1 = parteEntera (n + 1) - 1

-- 3.
esDivisible :: Integer -> Integer -> Bool
esDivisible 0 n2 = True
esDivisible 1 n2 = False
esDivisible n1 n2 = esDivisible (n1 - n2) n2

-- 4
sumaImpares :: Integer -> Integer
sumaImpares 0 = 0
sumaImpares n = (2 * n - 1) + sumaImpares (n - 1)

-- 5
medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = medioFact (n - 2) * n

-- 6
sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos n = sumaDigitos (n `div` 10) + (n `mod` 10)

-- 7.
-- todosDigitosIguales :: Integer -> Bool