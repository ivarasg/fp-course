{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module Course.Anagrams where

import Course.Core
import Course.List
import Course.Functor
import Course.Monad

{-

Functions you will need
--
* fmap :: (a -> b) -> IO a -> IO b
* readFile :: FilePath -> IO Str
* lines :: Str -> [Str]
* permutations :: [a] -> [[a]]
* intersectBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
* toLower :: Char -> Char

Functions that might help
-
* on :: (b -> b -> c) -> (a -> b) -> a -> a -> c

-}


-- Return all anagrams of the given string
-- that appear in the given dictionary file.
anagrams :: Chars -> Filename -> IO (List Chars)
anagrams str file = intersectBy equalIgnoringCase angrs . words <$> readFile file
   where angrs = permutations str
  -- error "todo: Course.Anagrams#anagrams"

-- Compare two strings for equality, ignoring case
equalIgnoringCase :: Chars -> Chars -> Bool
equalIgnoringCase s1 s2 = map toLower s1 == map toLower s2
-- equalIgnoringCase = on (==) $ map toLower
  -- error "todo: Course.Anagrams#equalIgnoringCase"
