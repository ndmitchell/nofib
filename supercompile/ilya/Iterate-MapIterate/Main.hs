module Main where

import Prelude hiding (foldr, map, iterate)

main :: IO ()
main = print (case root (+1) 0 of (as, bs) -> (case as of a:_ -> a, case bs of b:_ -> b))

foldr c n xs = case xs of [] -> n; (y:ys) -> c y (foldr c n ys)
map f = foldr (\x xs -> f x : xs) []
iterate f x = x : iterate f (f x)

{-# SUPERCOMPILE root #-}
root f x = (iterate f (f x), map f (iterate f x))
