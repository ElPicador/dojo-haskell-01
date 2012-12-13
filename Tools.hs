module Tools where

import Data.List.Split (splitOn) -- cabal install split
import Data.List.Utils (startswith) -- cabal install MissingH
import Data.Char (isDigit)
import Data.Maybe (isJust, fromJust)

inputSample :: String
inputSample = "01 BANQUE1 COMPTE1 BANQUE2 COMPTE2 120\n01 BANQUE2 COMPTE2 BANQUE3 COMPTE3 120\n01 BANQUE3 COMPTE3 BANQUE1 COMPTE1 120"

data Account = Account { accountBank :: String, accountName :: String }
    deriving (Eq)

instance Show Account where
	show account = (accountBank account) ++ ":" ++ (accountName account)

isValidBankName :: String -> Bool
isValidBankName = startswith "BANQUE"

isValidAccountName :: String -> Bool
isValidAccountName = startswith "COMPTE"

getInt :: String -> Maybe Int
--getInt string = if all isDigit string then Just ((read string) :: Int) else Nothing
getInt string = if all isDigit string then Just (read string) else Nothing

-- Commentaire
data Cre = Cre { creAccountFrom :: Account, creAccountTo :: Account, creAmount :: Int }
    deriving (Eq, Show)

-- 01 BANQUE1 COMPTE1 BANQUE2 COMPTE2 120
getCre :: String -> Maybe Cre
getCre string = if isValid then Just cre
	else Nothing
	where
		isValid = length ws == 6 && isValidAmount && isValidAccounts && isValidPrefix
		ws = splitOn " " string
		[p, b1, c1, b2, c2, a] = ws
		isValidPrefix = p == "01"
		isValidAmount = isJust $ getInt a
		isValidAccounts = all isValidBankName [b1, b2] && all isValidAccountName [c1, c2]
		cre = Cre (Account b1 c1) (Account b2 c2) (fromJust $ getInt a)

parsedFile = map getCre ls
	where ls = splitOn "\n" inputSample

