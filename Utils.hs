{-|
Module      : Utils
Description : Utility functions which may be replaced by smart Haskell builtins, if possible.
-}
module Utils where

-- | Builds a list where every element from the input list appears in a pair with
-- every other element.
-- For example:
--
-- >>> combinePairs [a, b, c, d]
-- [(a,b), (a,c), (a,d), (b,c), (b,d), (c,d)]
combinePairs :: [a] -> [(a, a)]
combinePairs = combinePairsWith (,)

-- | General form of combinePairs. Takes a custom combination function.
-- For example:
--
-- >>> combinePairsWith (+) [1, 10, 100, 1000]
-- [11, 101, 1001, 110, 1010, 1100]
combinePairsWith :: (a -> a -> b) -> [a] -> [b]
combinePairsWith _ [] = []
combinePairsWith f (x:xs) = map (f x) xs ++ combinePairsWith f xs

-- | Sorts the two elements of a pair in ascending order.
sortPair :: Ord a => (a, a) -> (a, a)
sortPair (x, y) = (min x y, max x y)
