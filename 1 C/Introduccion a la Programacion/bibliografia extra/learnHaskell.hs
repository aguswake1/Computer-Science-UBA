-- Fuente: http://aprendehaskell.es/main.html

succ 8 -- sucesor
min 10 11
max 10 11
div 10 5
10 `div` 5
conanO'Brien = "¡Soy yo, Conan O'Brien!" -- funcion constante
let lostNumbers = [4,8,15,16,23,42]
[1, 2, 3, 4] ++ [9, 10, 11, 12]
--[1, 2, 3, 4, 9, 10, 11, 12]
"hello" ++ " " ++ "world"
--"hello world"
['w', 'o'] ++ ['o', 't']
--"woot"

-- operador cons, no hace falta que haskell recorra toda la lista para agregar elemento
'U' : "n gato negro"
-- "Un gato negro"
5 : [1, 2, 3, 4, 5]
-- [5, 1, 2, 3, 4, 5]

-- [1,2,3] es una alternativa sintáctica de 1:2:3:[]
