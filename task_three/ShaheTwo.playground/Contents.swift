import UIKit

//4.从网上下载一张照片并保存到本地沙盒的Document的某文件中；

let imageURL = URL(string: "http://img5.imgtn.bdimg.com/it/u=4072195473,563587794&fm=11&gp=0.jpg")
let data = try? Data(contentsOf: imageURL ?? <#default value#>)
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!
url.appendPathComponent("pic.jpg")
try data?.write(to: url)
