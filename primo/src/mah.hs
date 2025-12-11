
import Data.Map (Map, lookup, fromList)

removeElementsByValues :: [Int] -> [Int] -> [Int]
removeElementsByValues values filters = [ v | (v,f) <- zip values filters, v/=f]

data AlberoBInt = Vuoto | Nodo Int AlberoBInt AlberoBInt

haduplicati:: AlberoBInt-> Bool
haduplicati a = haduplicati1 a a

haduplicati1 :: AlberoBInt -> AlberoBInt -> Bool
haduplicati1 Vuoto _ = False
haduplicati1 (Nodo x a b) acopia 
    | conta x acopia > 1 = True
    | otherwise = haduplicati1 a acopia || haduplicati1 b acopia

conta :: Int -> AlberoBInt -> Int
conta x Vuoto = 0
conta x (Nodo y a b)
    | x==y = 1 + conta x a + conta x b
    |otherwise = conta x a + conta x b

albero1 :: AlberoBInt
albero1 = Nodo 1 (Nodo 2 Vuoto Vuoto) (Nodo 3 Vuoto Vuoto) 
albero2 :: AlberoBInt
albero2 = Vuoto 
albero3 :: AlberoBInt
albero3 = Nodo 4 (Nodo 5 Vuoto Vuoto) (Nodo 6 (Nodo 5 Vuoto Vuoto) Vuoto)


convertiLista :: [(Int, Int)] -> [[Int]]
convertiLista = map (\(x, k) -> [x * n | n <- [1 .. k]])

type Node = Int
type Graph = Map Node [Node]

cricca :: [Node] -> Graph -> Bool
cricca ns g = all (\u -> isCliqueNode u ns g) ns

-- verifica che u sia connesso a tutti gli altri nodi della lista
isCliqueNode :: Node -> [Node] -> Graph -> Bool
isCliqueNode u ns g =
  case Data.Map.lookup u g of
    Nothing      -> False                   -- nodo assente dal grafo
    Just adjList ->
      all (\v -> v == u || v `elem` adjList) ns