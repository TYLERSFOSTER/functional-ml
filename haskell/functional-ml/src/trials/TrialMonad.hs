-- File: src/Trials/TrialMonad.hs
module Trials.TrialMonad where

-- Define the data type
data TrialMonad a = Nil | Cons a (TrialMonad a)

-- Make TrialMonad a functor
instance Functor TrialMonad where
  fmap _ Nil         = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

-- Make TrialMonad applicative
instance Applicative TrialMonad where
  pure x = Cons x Nil

  Nil <*> _ = Nil
  (Cons f fs) <*> xs = append (fmap f xs) (fs <*> xs)

-- Helper to append two TrialMonads
append :: TrialMonad a -> TrialMonad a -> TrialMonad a
append Nil ys = ys
append (Cons x xs) ys = Cons x (append xs ys)
