import UIKit

let dict=[["name":"mask","age":20],["name":"tom","age":21]]
let name=dict.map{($0["name"]!)}
print(name)

let str=["abc","cba","acb","1","2","3"]
print(str)
var str1=str.filter{
    Int($0) != nil}
print(str1)
var str2=str.reduce("",{$0 + "," + $1})
str2.remove(at:str2.startIndex)
print(str2)

var arr=[125,33,0,98,-50]
let arr1=arr.reduce((max:arr[0],min:arr[0],sum:0), { (max: max($0.max, $1), min: min($0.min, $1), $0.sum + $1) })
print(arr1)

func f1(x:Int)->Int{
    return x
}
func f2(x:String)->Int{
    return Int(x)!
}
func f3() -> Int {
    return 2
}

func f4(x:Int) {}

func f5(x:Double) -> Double {
    return x
}
let funArray:[Any]=[f1,f2,f3,f4,f5]
for(index,value) in funArray.enumerated() {//因为循环过程中需要设计到数组的下标，要将数组元素一一列举出来，所以需要调用数组的enumerated()方法。
    if value is (Int)->Int{
        print(index) //输出类型为(Int) -> Int的函数在数组中的下标，
    }
}

extension Int{
    func sqrt()->Double{
        return Darwin.sqrt(Double(self))
    }
}
sqrt(5.sqrt())

func getMaxAndMin<T: Comparable>(a: [T]) -> (T, T) {
    var max = a[0]
    var min = a[0]
    for i in a {
        if i > max {
            max = i
        } else if i < min {
            min = i
        }
    }
    return (max, min)
}
print(getMaxAndMin(a:[1, 7, 3, 15]))
print(getMaxAndMin(a:[3.2,2.5,9.5,4.7]))
print(getMaxAndMin(a: ["a", "b", "o"]))

