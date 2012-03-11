module Main where

main :: IO ()
main = print (idList_check [1, 2])

sameLength xs ys = case xs of
    []     -> case ys of []     -> True
                         (_:_)  -> False
    (_:as) -> case ys of []     -> False
                         (_:bs) -> sameLength as bs

-- idList : xs -> {rs | sameLength xs rs}
idList xs = case xs of []     -> []
                       (a:as) -> a : idList as

{-# SUPERCOMPILE idList_check #-}
idList_check xs = let rs = idList xs
                  in case sameLength xs rs of True -> rs

{-

In g-function form:

sameLength [] ys = sameLengthNil ys
sameLength (a:as) ys = sameLengthCons as ys

sameLengthNil [] = True
sameLengthNil (b:bs) = False

sameLengthCons as [] = False
sameLengthCons as (b:bs) = sameLength as bs

Here is the sketch:

h0 xs = let rs = idList xs
        in ok rs (sameLength xs rs)
      => case xs of
           [] -> h1 = let rs = idList []
                      in ok rs (sameLength [] rs)
                    ==> []
           (a:as) -> h2 a as = let rs = idList (a:as)
                               in ok rs (sameLength (a:as) rs)
                             => let rs1 = idList as
                                in ok (a:rs1) (sameLength (a:as) (a:rs1))
                             => let rs1 = idList as
                                in ok (a:rs1) (sameLength as rs1)
                             => case as of
                                  [] -> h1 a = let rs1 = idList []
                                               in ok (a:rs1) (sameLength [] rs1)
                                             => a:[]
                                  (a1:as1) -> h2 a a1 as1 = let rs1 = idList (a1:as1)
                                                            in ok (a:rs1) (sameLength (a1:as1) rs1)
                                                          => let rs2 = idList as1
                                                             in ok (a:a1:rs2) (sameLength (a1:as1) (a1:rs2))
                                                          => let rs2 = idList as1
                                                             in ok (a:a1:rs2) (sameLength as1 rs2)
                                                          => case as1 of
                                                               [] -> h3 a a1 = let rs2 = idList []
                                                                               in ok (a:a1:rs2) (sameLength [] rs2)
                                                                             => a:a1:[]
                                                               (a2:as2) -> h4 a a1 a2 as2 = let rs2 = idList (a2:as2)
                                                                                            in ok (a:a1:rs2) (sameLength (a2:as2) rs2)
                                                                                          => let rs3 = idList as2
                                                                                             in ok (a:a1:a2:rs3) (sameLength (a2:as2) (a2:rs3))
                                                                                          => let rs3 = idList as2
                                                                                             in ok (a:a1:a2:rs3) (sameLength as2 rs3)

Generalise the argument to "ok" to get tieback. Only issue is that (without speculation) that will force rs2 to be resid for work duplication reasons.
However, if we do call by name things will work smoothly and "BAD will vanish". We hope!

-}
