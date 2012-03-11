module Main where

main :: IO ()
main = print (foo1 0)

{-# SUPERCOMPILE foo1 #-}
foo1 x = a + b
  where
    x' = x + 1
    a = foo2 x'
    b = foo2 x'
--
foo2 x = a + b
  where
    x' = x + 1
    a = foo3 x'
    b = foo3 x'
--
foo3 x = a + b
  where
    x' = x + 1
    a = foo4 x'
    b = foo4 x'
--
foo4 x = a + b
  where
    x' = x + 1
    a = foo5 x'
    b = foo5 x'
--
foo5 x = a + b
  where
    x' = x + 1
    a = foo6 x'
    b = foo6 x'
--
foo6 x = a + b
  where
    x' = x + 1
    a = foo7 x'
    b = foo7 x'
--
foo7 x = a + b
  where
    x' = x + 1
    a = foo8 x'
    b = foo8 x'
--
foo8 x = x -- 896
  -- I got bored of waiting for the longer version to supercompile, hence this truncated version

-- foo8 x = a + b
--   where
--     x' = x + 1
--     a = foo9 x'
--     b = foo9 x'
-- --
-- foo9 x = a + b
--   where
--     x' = x + 1
--     a = foo10 x'
--     b = foo10 x'
-- --
-- foo10 x = x -- 4608
