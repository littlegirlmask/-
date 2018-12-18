import UIKit

//5.从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析；
enum MyError:Error{
    case Zero
    case NotURL
}
guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/sk/101010100.html")
    else{
        throw MyError.NotURL
}
let jsondate = try! Data(contentsOf: weatherUrl)
let json = try! JSONSerialization.jsonObject(with: jsondate, options: .allowFragments)
print(json)

guard let dict = json as?[String:Any] else{//把json文件转化为字典
    throw MyError.NotURL
}
guard let weather = dict["weatherinfo"] as? [String:String] else{
    throw MyError.NotURL
}
print(weather)
let temp = weather["temp"]
print(temp!)
