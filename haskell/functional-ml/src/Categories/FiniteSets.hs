-- File: src/Categories/FiniteSets.hs
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Categories.FiniteSets (FiniteSet(..), FinMap(..), apply) where

class FiniteSet a where
  universe :: [a]

instance (Bounded a, Enum a) => FiniteSet a where
  universe = [minBound .. maxBound]


data FinMap a b = FinMap [(a, b)]

apply :: Eq a => FinMap a b -> a -> b
apply (FinMap xs) a = case lookup a xs of
                        Just b  -> b
                        Nothing -> error "Not total"
