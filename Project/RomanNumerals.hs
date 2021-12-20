import qualified Data.Text as T

returnValue :: Char -> Int
returnValue 'M' = 1000
returnValue 'D' = 500
returnValue 'C' = 100
returnValue 'L' = 50
returnValue 'X' = 10
returnValue 'V' = 5
returnValue 'I' = 1

txtToStr a = T.unpack(a)
strToTxt a = T.pack(a)
txtConcat a b = T.concat[a,b]

--replacement rules 
--replaces the problem values
removeProblemsList = [("IV","IIII"), ("IX","VIIII"), ("XL","XXXX"), ("XC","LXXXX"), ("CD","CCCC"), ("CM","DCCCC")]
--rules to move greater values to left and package up values.
rulesList = [("IV","VI"), ("IX","XI"), ("IL","LI"),("IC","CI"), ("ID","DI"), ("IM","MI"), ("VX","XV"),("VL","LV"),("VC","CV"),("VD","DV"),("VM","MV"),("XL","LX"), ("XC","CX"), ("XD","DX"), ("XM","MX"),("LC","CL"),("LD","DL"), ("LM","ML"),("CD","DC"),("CM","MC"),("DM","MD"),("IIIII","V"), ("VV","X"), ("XXXXX","L"), ("LL","C"), ("CCCCC","D"), ("DD","M") ]
normalizeList = [("VIIII","IX"),("IIII","IV"), ("LXXXX","XC"), ("XXXX","XL"), ("DCCCC","CM"), ("CCCC","CD")]
convertToOnesList = [("V", "IIIII"), ("X", "VV"), ("L", "XXXXX"), ("C", "LL"), ("D","CCCCC"), ("M","DD")]

--applies a single rule to the word and returns the word
applyRule rule word = applyRule' rule word where
    applyRule' (l,r) word = (T.replace (strToTxt(l)) (strToTxt(r)) (word))

--applies a set of rules to a word then returns the word
applyRuleSet rules word = applyRuleSet' rules word where 
    applyRuleSet' ([]) xs = xs
    applyRuleSet' (l:r) xs = if xs == (applyRule (l) (xs)) then applyRuleSet' r (applyRule (l) (xs)) else applyRuleSet' rules (applyRule (l) (xs))   

returnIntegerValue x = T.length(applyRuleSet convertToOnesList (applyRuleSet removeProblemsList (strToTxt(x)) ))
convertToRomanNumeral x = txtToStr (cleanAndNormalize (concat(replicate (x) ("I"))))

--function to convert roman numeral into "I"s
convertToIs x = applyRuleSet convertToOnesList (applyRuleSet removeProblemsList (strToTxt(x)))

--converts string to roman numeral by removing problem values, sorting, and then normalizing
cleanAndNormalize x = applyRuleSet normalizeList (applyRuleSet rulesList (applyRuleSet removeProblemsList (strToTxt x)))
normalize x = applyRuleSet normalizeList (applyRuleSet rulesList ((strToTxt x)))

--Adds two string roman numerals
add a b = normalize (txtToStr(txtConcat ( applyRuleSet removeProblemsList (strToTxt(a)) ) (applyRuleSet removeProblemsList (strToTxt(b)) )))

--Applies subtraction, x-y
sub x y = if returnIntegerValue y > returnIntegerValue x then error "Error: Negative Number" 
    else cleanAndNormalize (txtToStr(T.drop (returnIntegerValue y)((convertToIs x))))

--Applies multiplication
mult x y = cleanAndNormalize (concat(replicate (returnIntegerValue y) (x)))

main = do
    print $ add "I" "IV"
    print $ sub "X" "I"
    print $ mult "V" "IV"
    -- print $ add (convertToRomanNumeral 4) (convertToRomanNumeral 6)
    -- print $ returnIntegerValue "XV"
    -- print $ applyRule ("hi","hello") (strToTxt "hi hi")
    -- print $ applyRuleSet [("a","b"),("c","d")] (strToTxt "abcd")
    -- print $ cleanAndNormalize "IIII"
