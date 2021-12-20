def rewrite(rewrite_rules, output):
    for rule in rewrite_rules:
        if rule[0] in output:
            print(output,":", rule[0], "->", rule[1], "=", output.replace(rule[0], rule[1], 1))
            output = output.replace(rule[0], rule[1], 1) 
            output = rewrite(rewrite_rules, output)
    return output 

#print(rewrite([("aa","a"), ("ab","ba")],"aabbaa") )
#print(rewrite([("aa","a"), ("ab","ba")],"aabbaa") )
# print(rewrite([("mb","s"), ("bm","s"), ("ms","sm"), ("bs","sb") ],"mmmmbbbb") )
# print(rewrite([("mb","s"), ("bm","s"), ("ms","sm"), ("bs","sb") ],"mbmbmbmb") )
print(rewrite([("ab","a"), ("aaa","a")],"abaaaba"))
print(rewrite([("aaa","a"), ("aaa","a")],"abaaaba"))
#print(rewrite([("ba","b"), ("ab","a"), ("aaa","a")],"abaaaba"))
