import UIKit

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
