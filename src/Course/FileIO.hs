{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RebindableSyntax #-}

module Course.FileIO where

import Course.Core
import Course.Applicative
import Course.Monad
import Course.Functor
import Course.List

{-

Useful Functions --

  getArgs :: IO (List Chars)
  putStrLn :: Chars -> IO ()
  readFile :: Chars -> IO Chars
  lines :: Chars -> List Chars
  void :: IO a -> IO ()

Abstractions --
  Applicative, Monad:

    <$>, <*>, >>=, =<<, pure

Problem --
  Given a single argument of a file name, read that file,
  each line of that file contains the name of another file,
  read the referenced file and print out its name and contents.

Example --
Given file files.txt, containing:
  a.txt
  b.txt
  c.txt

And a.txt, containing:
  the contents of a

And b.txt, containing:
  the contents of b

And c.txt, containing:
  the contents of c

To test this module, load ghci in the root of the project directory, and do
    >> :main "share/files.txt"

Example output:

$ ghci
GHCi, version ...
Loading package...
Loading ...
[ 1 of 28] Compiling (etc...
...
Ok, modules loaded: Course, etc...
>> :main "share/files.txt"
============ share/a.txt
the contents of a

============ share/b.txt
the contents of b

============ share/c.txt
the contents of c

-}

-- /Tip:/ use @getArgs@ and @run@
main :: IO ()
main = run . snd =<< getFile . headOr "" =<< getArgs
  -- error "todo: Course.FileIO#main"

type FilePath = Chars

-- /Tip:/ Use @getFiles@ and @printFiles@.
run :: Chars -> IO ()
run = (printFiles =<<) . getFiles . lines
  -- error "todo: Course.FileIO#run"

getFiles :: List FilePath -> IO (List (FilePath, Chars))
getFiles = sequence . map getFile
  -- error "todo: Course.FileIO#getFiles"

getFile :: FilePath -> IO (FilePath, Chars)
getFile path = readFile path >>= return . (,) path
  -- error "todo: Course.FileIO#getFile"

printFiles :: List (FilePath, Chars) -> IO ()
-- printFiles = (const (return () ) =<<) . sequence . map (\(path, contents) -> printFile path contents)
printFiles = (const (return () ) =<<) . sequence . map uc_printFile
  where uc_printFile = uncurry printFile
  -- error "todo: Course.FileIO#printFiles"

printFile :: FilePath -> Chars -> IO ()
printFile path contents = putStrLn . unlines $ ("====== " ++ path):.contents:.Nil
  -- error "todo: Course.FileIO#printFile"
