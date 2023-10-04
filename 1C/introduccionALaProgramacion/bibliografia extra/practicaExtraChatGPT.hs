{-
  Problema: Fusionar listas y tuplas en una cadena
  Expected input: [("Hola",3),("Mundo",2),("!",4)]
  Expected output: "HolaHolaHolaMundoMundo!!!!"
-}

fusionarCadenas :: [(String, Integer)] -> String
fusionarCadenas [] = ""
fusionarCadenas ((x,y):xs) = fusionarCadenasAux x y ++ fusionarCadenas xs

fusionarCadenasAux :: String -> Integer -> String
fusionarCadenasAux x 1 = x
fusionarCadenasAux x y = x ++ fusionarCadenasAux x (y - 1)


{-
  Problema: Generar una lista de tuplas de caracteres únicos
  Expected input: ["hola", "mundo", "abc"]
  Expected output: [('h','o'),('h','l'),('h','a'),('o','l'),('o','a'),('l','a'),('m','u'),('m','n'),('m','d'),('m','o'),('u','n'),('u','d'),('n','d'),('n','o'),('d','o'),('a','b'),('a','c'),('b','c')]
-}

listaTuplasUnicas :: [String] -> [(Char, Char)]
listaTuplasUnicas [] = []
listaTuplasUnicas (x:xs)
  | length x == 1 = listaTuplasUnicas xs
  | otherwise = listaTuplasUnicasAux x ++ listaTuplasUnicas (tail x:xs)

listaTuplasUnicasAux :: String -> [(Char, Char)]
listaTuplasUnicasAux [x] = []
listaTuplasUnicasAux (x:y:xs) = [(x,y)] ++ listaTuplasUnicasAux (x:xs)


{-
  Problema: Contar caracteres en una lista de cadenas
  Expected input: ["hola", "mundo", "abc"]
  Expected output: [('h',1), ('a',2),('b',1),('c',1),('d',1),('l',1),('m',1),('n',1),('o',2),('u',1)]
-}

contarCaracteres :: [String] -> [(Char, Integer)]
contarCaracteres [] = []
contarCaracteres ("":xs) = contarCaracteres xs
contarCaracteres (x:xs) = (head x, contarCaracteresAux (head x) (x:xs)) : contarCaracteres (eliminarCaracteres (head x) (x:xs))

contarCaracteresAux :: Char -> [String] -> Integer
contarCaracteresAux _ [] = 0
contarCaracteresAux letra ("":xs) = contarCaracteresAux letra xs
contarCaracteresAux letra (x:xs)
  | head x == letra = 1 + contarCaracteresAux letra ((tail x):xs)
  | otherwise = contarCaracteresAux letra ((tail x):xs)

eliminarCaracteres :: Char -> [String] -> [String]
eliminarCaracteres _ [] = []
eliminarCaracteres caracter (x:xs) = eliminarCaracteresAux caracter x : eliminarCaracteres caracter xs

eliminarCaracteresAux :: Char -> String -> String
eliminarCaracteresAux _ [] = "" 
eliminarCaracteresAux caracter (x:xs)
  | caracter == x = eliminarCaracteresAux caracter xs
  | otherwise = x : eliminarCaracteresAux caracter xs


{-
  Problema: Verificar si en una lista de tuplas, al menos una cumple que la suma de los elementos de la tupla es un número par.
  Expected input: [(2, 3), (1, 5), (4, 2)]
  Expected output: True
-}

verificarCondicion :: [(Integer, Integer)] -> Bool
verificarCondicion [] = False
verificarCondicion ((x,y):xs) = even (x + y) || verificarCondicion xs


{-
Problema: Gestión de una biblioteca de libros
Supongamos que estás desarrollando un sistema de gestión para una biblioteca de libros.

Debes implementar dos funciones en Haskell:
librosDisponibles: Esta función toma una lista de tuplas, donde cada tupla contiene el título de un libro
y un valor booleano que indica si el libro está disponible para préstamo. La función debe devolver una lista de
títulos de libros que están disponibles para préstamo.

buscarLibro: Esta función toma el título de un libro y la lista de tuplas de la biblioteca.
Debe devolver un valor booleano que indique si el libro está en la biblioteca y si está disponible para préstamo.
-}

librosDisponibles :: [(String, Bool)] -> [String]
librosDisponibles [] = []
librosDisponibles ((x,y):xs)
  | y = x : librosDisponibles xs
  | otherwise = librosDisponibles xs

buscarLibro :: String -> [(String, Bool)] -> Bool
buscarLibro libro biblioteca = elem libro (librosDisponibles biblioteca)


{-
Problema: Calcular el promedio de calificaciones de estudiantes

Supongamos que tienes una lista de tuplas, donde cada tupla contiene el nombre de un estudiante y su
calificación en un examen. Debes implementar una función en Haskell para calcular el promedio de calificaciones de
todos los estudiantes.
-}

promedioCalificaciones :: [(String, Double)] -> Double
promedioCalificaciones calificaciones = (promedioCalificacionesAux calificaciones) / fromIntegral (length calificaciones)

promedioCalificacionesAux :: [(String, Double)] -> Double
promedioCalificacionesAux [] = 0
promedioCalificacionesAux ((x,y):xs) = y + promedioCalificacionesAux xs

{-
Problem: Calculate the average grade for each course
Suppose you have a list of tuples, where each tuple contains a student's name, the course they are enrolled
in, and their grade in that course. Your task is to implement a function in Haskell that calculates the average
grade for each course and returns a list of tuples, where each tuple contains the course name and its average grade.
-}
studentGrades :: [(String, String, Double)]
studentGrades = [("Alice", "Math", 9.5), ("Bob", "Math", 8.0), ("Charlie", "Physics", 7.5), ("David", "Math", 9.0), ("Eve", "Physics", 8.5), ("Frank", "Physics", 8.0)]

-- Example usage:
--averageGradesPerCourse studentGrades
-- Should return [("Math", 8.833333333333334), ("Physics", 8.0)]

-- Given a list of tuples (student name, course name, grade), calculate the average grade for each course.

averageGradesPerCourse :: [(String, String, Double)] -> [(String, Double)]
averageGradesPerCourse [] = []
averageGradesPerCourse ((x,y,z):xs) = (y, (averageCourseCalification y ((x,y,z):xs) / fromIntegral (length ((x,y,z):xs) - length (deleteCourse y ((x,y,z):xs))))) : averageGradesPerCourse (deleteCourse y ((x,y,z):xs))

averageCourseCalification :: String -> [(String, String, Double)] -> Double
averageCourseCalification _ [] = 0
averageCourseCalification course ((x, y, z):xs)
  | course == y = (z + averageCourseCalification course xs) 
  | otherwise = averageCourseCalification course xs
 
deleteCourse :: String -> [(String, String, Double)] -> [(String, String, Double)]
deleteCourse _ [] = []
deleteCourse course ((x,y,z):xs)
  | course == y = deleteCourse course xs
  | otherwise = (x,y,z) : deleteCourse course xs


{-

Problem: Managing a Hospital Database with Tuples

You are tasked with developing a system to manage a hospital's patient records. Patients are represented by tuples containing their personal information and medical records. You need to implement the following:

A list of patient records, where each record is a tuple containing:

Patient's name (string)
Patient's age (integer)
List of medical conditions (list of strings)
List of prescribed medications (list of strings)
A function addPatient that takes the current database (a list of patient records) and a new patient record (a tuple), and returns an updated database with the new patient added.

A function removePatient that takes the current database and a patient's name (a string), and returns an updated database with the patient removed if they exist.

A function searchPatients that takes the current database and a list of medical conditions (a list of strings). It should return a list of patients (their names) who have all the specified medical conditions.

A function prescribeMedication that takes the current database, a patient's name (a string), and a new medication (a string). It should return an updated database with the medication added to the patient's record.

A function averageAge that takes the current database and calculates the average age of all patients.


-}

patientDatabase :: [(String, Integer, [String], [String])]
patientDatabase = [("Agustin Olano", 21, ["Healthy"], ["Vitamins"]), ("Juan Perez", 32, ["Diabetes"], ["Insuline medication"]), ("Paola Martinez", 70, ["Osteoporosis"], ["pills"])]


addPatient :: [(String, Integer, [String], [String])] -> (String, Integer, [String], [String]) -> [(String, Integer, [String], [String])]
addPatient s newPatient = s ++ [newPatient]

removePatient :: [(String, Integer, [String], [String])] -> String -> [(String, Integer, [String], [String])]
removePatient [] _ = []
removePatient ((x,y,z,j):xs) exPatient
  | x == exPatient = removePatient xs exPatient
  | otherwise = (x,y,z,j) : removePatient xs exPatient

searchPatients :: [(String, Integer, [String], [String])] -> [String] -> [String]
searchPatients [] _ = []
searchPatients ((x,_,z,_):xs) diagnosis
  | z == diagnosis = x : searchPatients xs diagnosis
  | otherwise = searchPatients xs diagnosis

prescribeMedication :: [(String, Integer, [String], [String])] -> String -> String -> [(String, Integer, [String], [String])]
prescribeMedication [] _ _ = []
prescribeMedication ((x,y,z,j):xs) patient newMedication
  | x == patient = ((x,y,z,j ++ [newMedication]):xs)
  | otherwise = (x,y,z,j): prescribeMedication xs patient newMedication

averageAge :: [(String, Integer, [String], [String])] -> Double
averageAge s = sumAges s / fromIntegral (length s)

sumAges :: [(String, Integer, [String], [String])] -> Double
sumAges [] = 0
sumAges ((_,age,_,_):xs) = fromIntegral age + sumAges xs

{-
Ejercicio 2:
Crea una función llamada amigosMutuos que tome dos personas x e y y una lista de relaciones (String, String) y determine si x e y son
amigos mutuos, es decir, si ambos son amigos entre sí.

Ejercicio 3:
Escribe una función llamada cantidadAmigosComunes que tome dos personas x e y y una lista de relaciones (String, String) y
devuelva la cantidad de amigos en común que tienen x e y.

Ejercicio 4:
Crea una función llamada amigoDeAmigo que tome una persona x y una lista de relaciones (String, String) y devuelva una lista de personas
que son amigos de amigos de x, es decir, personas que tienen una relación de segundo grado con x.
-}

amigosMutuos :: String -> String -> [(String, String)] -> Bool
amigosMutuos _ _ [] = False
amigosMutuos amigo1 amigo2 ((x,y):xs) = (amigo1 == x && amigo2 == y) || (amigo2 == x && amigo1 == y) || amigosMutuos amigo1 amigo2 xs

cantidadAmigosComunes :: String -> String -> [(String, String)] -> Integer
cantidadAmigosComunes _ _ [] = 0
cantidadAmigosComunes amigo1 amigo2 ((x,y):xs)
  | amigos amigo1 x && amigos amigo2 x && amigos amigo1 y && amigos amigo2 y = 2 + cantidadAmigosComunes amigo1 amigo2 xs
  | amigos amigo1 x && amigos amigo2 x = 1 + cantidadAmigosComunes amigo1 amigo2 xs
  | amigos amigo1 y && amigos amigo2 y = 1 + cantidadAmigosComunes amigo1 amigo2 xs
  | otherwise = cantidadAmigosComunes amigo1 amigo2 xs
  where amigos persona1 persona2 = amigosMutuos persona1 persona2 ((x,y):xs)

--amigoDeAmigo :: String -> [(String, String)] -> [String]
