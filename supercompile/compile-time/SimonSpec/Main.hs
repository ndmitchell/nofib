module Main where

main :: IO ()
main = print (length (f1 0))

{-# SUPERCOMPILE f1 #-}
f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12 :: Int -> [Int]
f1 x = f2 y ++ f2 (y + 1)
  where y = (x + 1) * 2
f2 x = f3 y ++ f3 (y + 1)
  where y = (x + 1) * 2
f3 x = f4 y ++ f4 (y + 1)
  where y = (x + 1) * 2
f4 x = f5 y ++ f5 (y + 1)
  where y = (x + 1) * 2
f5 x = f6 y ++ f6 (y + 1)
  where y = (x + 1) * 2
f6 x = f7 y ++ f7 (y + 1)
  where y = (x + 1) * 2
f7 x = f8 y ++ f8 (y + 1)
  where y = (x + 1) * 2
f8 x = f9 y ++ f9 (y + 1)
  where y = (x + 1) * 2
f9 x = f10 y ++ f10 (y + 1)
  where y = (x + 1) * 2
f10 x = f11 y ++ f11 (y + 1)
  where y = (x + 1) * 2
f11 x = f12 y ++ f12 (y + 1)
  where y = (x + 1) * 2
f12 x = [x + 1]
