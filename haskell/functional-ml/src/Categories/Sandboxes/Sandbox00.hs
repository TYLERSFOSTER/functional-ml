-- File: src/Categories/Sandboxes/Sandbox00.hs
module Main where

import Categories.FiniteSets

-- Some finite types
data Color = Red | Green | Blue deriving (Show, Eq, Enum, Bounded)

data Bool3 = F | M | T deriving (Show, Eq, Enum, Bounded)

-- Show FinMap as a function table
instance (Show a, Show b) => Show (FinMap a b) where
  show (FinMap xs) = unlines [show a ++ " ↦ " ++ show b | (a,b) <- xs]

-- Compose two FinMaps (category composition)
compose :: Eq b => FinMap b c -> FinMap a b -> FinMap a c
compose (FinMap g) (FinMap f) =
  FinMap [ (a, apply (FinMap g) b) | (a, b) <- f ]

-- Build a total FinMap safely
fromTotalList :: (FiniteSet a, Eq a) => [(a, b)] -> Maybe (FinMap a b)
fromTotalList xs =
  let keys = map fst xs
  in if all (`elem` keys) universe then Just (FinMap xs) else Nothing

-- Main playground
main :: IO ()
main = do
  putStrLn "Universe of Color:"
  print (universe :: [Color])

  let f = FinMap [(Red, F), pair Green M, pair Blue T]
      g = FinMap [(F, 0), pair M 1, pair T 2]
      h = compose g f  -- h : Color -> Int

  putStrLn "\nMap f: Color -> Bool3"
  print f

  putStrLn "\nMap g: Bool3 -> Int"
  print g

  putStrLn "\nComposed map h = g . f: Color -> Int"
  print h

  putStrLn "\nApply h to Red:"
  print $ apply h Red

  where pair = (,)
