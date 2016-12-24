{-# LANGUAGE QuasiQuotes #-}

module Main where

import           Control.Monad
import           Data.String.Interpolate
import           Data.Text               as T
import           HaPy
import           HaPy.PyPy

samplePyCode = [i|
def add(a, b):
    return a + b

print add(3, 4)
|]

main :: IO ()
main = do
  putStrLn "=== Running python code ==="
  putStrLn samplePyCode
  putStrLn "=== Output === "
  void $ execute PyPy (PythonCode (T.pack samplePyCode)) T.empty
