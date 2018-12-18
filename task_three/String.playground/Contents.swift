import UIKit

//b)    新建字符串：“Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.”；
//c)    返回字符串从第6个字符到第20个字符的子串；
//d)    删除其中所有的OS字符；

var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
let index1 = str.index(str.startIndex, offsetBy: 6)
let index2 = str.index(str.startIndex, offsetBy: 20)
let str1 = str[index1...index2]
print(str1)
let str2 = str.replacingOccurrences(of: "OS", with: "")
print(str2)

