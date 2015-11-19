import System.IO
import Data.Char

main = do hSetBuffering stdout NoBuffering

          putStrLn "What encoding should be used?"
          name <- getLine
          contents <- readFile name
          putStrLn "What file should be encoded?"
          textName <- getLine
          text <- readFile textName
          let rstrip = reverse.dropWhile isSpace.reverse
              readLister = read :: String -> [(Char,String)]
              encode x = snd $ head $ filter ((==x).fst) (readLister contents)
              encode :: Char -> String
          print $ concat $ map encode (rstrip text) 
