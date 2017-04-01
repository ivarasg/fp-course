{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Course.FastAnagrams where

import Course.Core
import Course.List
import Course.Functor
import Course.Monad
import Course.Applicative
import qualified Data.Set as S

-- Return all anagrams of the given string
-- that appear in the given dictionary file.
fastAnagrams :: Chars -> Filename -> IO (List Chars)
fastAnagrams str file = map ncString . intersectBy (==) angrs . map NoCaseString . words <$> readFile file
   where angrs = NoCaseString <$> permutations str
  -- error "todo: Course.FastAnagrams#fastAnagrams"

newtype NoCaseString =
  NoCaseString {
    ncString :: Chars
  }
  deriving Ord

instance Eq NoCaseString where
  (==) = (==) `on` map toLower . ncString

instance Show NoCaseString where
  show = show . ncString
