module Main where

import Prelude hiding (foldr, map, length, (++), concat, plus, sum)

main :: IO ()
main = print (root ["A", "BC"])

foldr c n xs = case xs of [] -> n; (y:ys) -> c y (foldr c n ys)
map f = foldr (\x xs -> f x : xs) []
length = foldr (\_ -> S) Z
(++) xs ys = foldr (:) ys xs
concat = foldr (++) []
plus n m = case n of Z -> m; S o -> S (plus o m)
sum = foldr plus Z

{-# SUPERCOMPILE root #-}
root xs = (length (concat xs), sum (map length xs))

data Nat = Z | S Nat
         deriving (Eq, Show)
