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
esDivisible n1 n2
  | n1 == 0 = True
  | n1 == 1 = False
  | otherwise = esDivisible (n1 - n2) n2

-- 7.
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
| n < 10 = True
| 