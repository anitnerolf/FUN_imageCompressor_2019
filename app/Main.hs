module Main where

import Lib
import Control.Exception
import System.Exit

main :: IO ()
main = do
       result <- try getArguments :: IO (Either SomeException ())
       case result of
            Left err -> do
                 print err
                 exitWith $ ExitFailure 84
            Right _ -> exitWith $ ExitSuccess