import Data.Char
import Data.List (sort)

-- Funzione per convertire una stringa in minuscolo
toLowerSt :: String -> String
toLowerSt = map toLower

-- Funzione per ordinare le lettere di una stringa
sortLetters :: String -> String
sortLetters = sort . toLowerSt

anagrammi s1 s2 = sortLetters s1 == sortLetters s2

-- Funzione per trovare gli anagrammi di una stringa in un elenco di parole
findAnagrams :: String -> [String] -> [String]
findAnagrams s = filter (anagrammi s)
