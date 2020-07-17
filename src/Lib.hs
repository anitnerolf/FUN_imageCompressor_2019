module Lib
    ( getArguments
    ) where

import System.IO
import System.Environment (getArgs)
import System.Exit
import Text.Read

setUsage :: IO ()
setUsage = do
        putStrLn "USAGE: ./imageCompressor n e IN\n\n\tn\tnumber of colors in the final image\n\te\tconvergence limit\n\tIN\tpath to the file containing the colors of the pixels"

checkNoArguments :: Int -> Int
checkNoArguments x
               | x < 1      = 84
               | x == 3     = 0
               | otherwise  = 84


checkNumbers :: [String] -> Int
checkNumbers args
                  | ((readMaybe (args !! 0) :: Maybe Int) == Nothing) = 84
                  | ((readMaybe (args !! 1) :: Maybe Float) == Nothing) = 84
                  | otherwise  = 0


checkIfNegative :: [String] -> Int
checkIfNegative args
                    | (read (args !! 0) :: Integer) <= 0 = 84
                    | (read (args !! 1) :: Float) <= 0   = 84
                    | (read (args !! 1) :: Float) > 1    = 84
                    | otherwise   = 0


checkRes :: [String] -> IO()
checkRes args = do
                let b = checkIfNegative args
                case b of
                     84     -> do setUsage
                                  exitWith $ ExitFailure 84
                     _      -> do
                               z <- readFile (args !! 2)
                               return ()
                               


checkArguments :: [String] -> IO()
checkArguments args = do
                      let a = checkNumbers args
                      case a of
                           84   -> do setUsage
                                      exitWith $ ExitFailure 84
                           _    -> do checkRes args


getArguments :: IO ()
getArguments = do
               args <- getArgs
               let x = length args
               let y = checkNoArguments x
               let z = ""
               case y of
                    84  -> do setUsage
                              exitWith $ ExitFailure 84
                    _   -> do checkArguments args