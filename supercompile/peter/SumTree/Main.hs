module Main where

import System.Environment

main :: IO ()
main = do
    [n] <- fmap (map read) getArgs
    print (root n)

-- What Supero 3 does:
--  * Unrolls buildTree so it does two iterations before recursing back to the start
--  * Totally eliminates the intermediate tree containing the squared values: the sum is done directly on the output of buildTreee

sumtr t = case t of
    Leaf x -> x
    Branch l r -> sumtr l + sumtr r

squaretr t = case t of
    Leaf x -> Leaf (x*x)
    Branch l r -> Branch (squaretr l) (squaretr r)

buildTree n t = case n == 0 of
    True -> t
    False -> buildTree (n-1) (Branch t t)

{-# SUPERCOMPILE root #-}
root :: Int -> Int
root n = sumtr (squaretr (buildTree n (Leaf 1)))

data Tree a = Leaf a | Branch (Tree a) (Tree a)
