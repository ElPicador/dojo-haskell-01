module Tests where

import Tools
import Test.HUnit

tests = TestList [
		show (Account "BANQUE1" "COMPTE1") ~?= "BANQUE1:COMPTE1",
    isValidBankName "BANQUE" ~?= True,
    isValidBankName "TOTO" ~?= False,
    isValidAccountName "COMPTE1" ~?= True,
    isValidAccountName "TOTO" ~?= False,
    getInt "ERT" ~?= Nothing,
    getInt "3456" ~?= Just 3456,
    getCre "01 BANQUE1 COMPTE1 BANQUE2 COMPTE2 120" ~?= (Just $ Cre (Account "BANQUE1" "COMPTE1") (Account "BANQUE2" "COMPTE2") 120),
    getCre "BANQUE1 COMPTE1 BANQUE2 COMPTE2 120" ~?= Nothing,
    getCre "01 BANQUE1 COMPTE1 BANQUE2 COMPTE2 qqq" ~?= Nothing,
    getCre "01 toto COMPTE1 toto COMPTE2 120" ~?= Nothing,
    getCre "02 BANQUE1 COMPTE1 BANQUE2 COMPTE2 120" ~?= Nothing
	]

main = runTestTT tests
