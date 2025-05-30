module Main where

import CoreLibrary (greet)

main :: IO ()
main = putStrLn (greet "Tyler")
