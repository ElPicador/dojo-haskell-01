import Tools

main :: IO()
main = do
      	mapM_ print parsedFile

{- Resultat final:
Just (Cre {creAccountFrom = BANQUE1:COMPTE1, creAccountTo = BANQUE2:COMPTE2, creAmount = 120})
Just (Cre {creAccountFrom = BANQUE2:COMPTE2, creAccountTo = BANQUE3:COMPTE3, creAmount = 120})
Just (Cre {creAccountFrom = BANQUE3:COMPTE3, creAccountTo = BANQUE1:COMPTE1, creAmount = 120})
-}
