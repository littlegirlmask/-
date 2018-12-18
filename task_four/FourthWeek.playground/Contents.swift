//: Playground - noun: a place where people can play
import UIKit
import PlaygroundSupport

//第一题
let fileManager = FileManager.default
let  docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.path

var file = docPath?.appending("/hrl")
if fileManager.fileExists(atPath: file!){
    let image = file?.appending("/pic.jpg")
    if fileManager.fileExists(atPath: image!){
        print("文件存在")
    }else{
        let url = URL(string: "http://pic.58pic.com/58pic/12/80/78/38758PICX4Z.jpg")
        let data = try Data(contentsOf: url!)
        try data.write(to: URL(fileURLWithPath: image!),options: .atomicWrite)
    }
}else{
    try fileManager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
    print("文件不存在，创建文件")
}


//第二、三题
//自定义视图
class MyView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        //边框
        UIColor.green.setStroke()
        path.stroke()
        //填充
        UIColor.yellow.setFill()
        path.fill()
    }
}

class Controller:UIViewController{
    var label : UILabel!
    var circle : MyView!
    override func loadView() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 1000))
        view.backgroundColor = UIColor.gray
        //创建圆
        let circle = MyView(frame: CGRect(x: 100, y: 300, width: 200, height: 100))
        circle.backgroundColor = UIColor.clear
        view.addSubview(circle)
        label = UILabel(frame: CGRect(x: 100, y: 20, width: 200, height: 50))
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "hello world"
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 550, width: 200, height: 50))
        button.backgroundColor = UIColor.brown
        button.setTitle("Click me", for: .normal)
        
        button.addTarget(self , action: #selector(Controller.clicked), for: .touchUpInside)
        view.addSubview(button)
        
    }
    @IBAction func clicked(){
        print("clicked successfully")
        label?.text = "clicked successfully"
        UIView.animate(withDuration: 1){
            self.circle.center = CGPoint(x: 200, y: 0)
        }
    }
}
let con = Controller()
PlaygroundPage.current.liveView = con


var url2 = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
enum MyError:Error {
    case Zero
    case NotURL
}

guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html") else{
    throw MyError.NotURL
    }

let jsondata = try! Data(contentsOf: weatherUrl)

let json = try! JSONSerialization.jsonObject(with: jsondata, options: .allowFragments)
guard let dic = json as? [String:Any] else{
       throw MyError.NotURL
};guard let weather = dic["weatherinfo"] as? [String:String] else{
     throw MyError.NotURL
   }
let temp1 = weather["temp1"]
let temp2 = weather["temp2"]

let imageUrl = URL(string: "http://pic26.nipic.com/20121227/10193203_131357536000_2.jpg")!
let imageData = try? Data(contentsOf: imageUrl)
url2.appendPathComponent("mypic.jpg")
try? imageData?.write(to: url2)
let image = UIImage(data: imageData!)

