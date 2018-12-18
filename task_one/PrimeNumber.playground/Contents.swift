//import UIKit

var str = "Hello, playground"
var primes = [Int]()
for i in 2...100{
    var isprime = true
    for j in 2..<i{
        if i%j == 0{
            isprime = false
        }
    }
    if isprime{
        primes.append(i)
    }
}
print(primes)
func compare(x: Int,y: Int)->Bool{//比较大小函数
    return x>y
}
primes.sort(by:compare)
print(primes)

primes.sort(by:{//闭包形式1
    (x:Int,y:Int)->Bool in
    return x>y
})
print(primes)

primes.sort(by:{//闭包形式2，自动判断数据类型
    (x,y) in
    return x>y
})
print(primes)

primes.sort(by: {//闭包形式3
    (x,y) in
    x>y
})
print(primes)

primes.sort{ $0 > $1 }//闭包形式4
print(primes)

primes.sort( by: > )//闭包形式5
print(primes)
