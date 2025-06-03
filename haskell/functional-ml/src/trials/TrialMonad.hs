-- File: src/trials/TrialMonad.hs
module Trials.TrialMonad where

-- Define the data type
data TrialMonad a = Nil | Cons a (TrialMonad a)

-- Make TrialMonad a functor
instance Functor TrialMonad where
  fmap _ Nil         = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)


