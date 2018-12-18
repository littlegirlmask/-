import UIKit

//3.将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；
//1题
let currentDate = Date()
var formatter = DateFormatter()
formatter.dateFormat = "yyyy年M月dd日EEEE aa KK:mm"
formatter.locale = Locale(identifier: "zh_CN")

formatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
let beijing = formatter.string(from: currentDate)
print("beijingTime:"+beijing)

formatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
let tokyo = formatter.string(from: currentDate)
print("tokyoTime :"+tokyo)

formatter.timeZone = TimeZone(abbreviation: "UTC-5:00")
let newYork = formatter.string(from: currentDate)
print("newYorkTime:"+newYork)
formatter.timeZone = TimeZone(abbreviation: "UTC+0:00")
let london = formatter.string(from: currentDate)
print("londonTime:"+london)

//2题
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
let index1 = str.index(str.startIndex, offsetBy: 6)
let index2 = str.index(str.startIndex, offsetBy: 20)
let str1 = str[index1...index2]
print(str1)
let str2 = str.replacingOccurrences(of: "OS", with: "")
print(str2)

//3题
var dict = [ "beijing": beijing, " tokyo ": tokyo, "newYork": newYork, "london": london, "str1":str1,"str2":str2] as AnyObject//将字典转换为任意类型，方便后面写入文件
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!
url.appendPathComponent("testhrl.txt")
try? dict.write(to: url, atomically: true)
