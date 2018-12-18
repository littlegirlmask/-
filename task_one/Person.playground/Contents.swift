import UIKit

var str = "Hello, playground"

enum Gender:Int{
    case male
    case female
    static func > (lhs:Gender,rhs:Gender) ->Bool{////重载>操作符，方便后面排序使用
        return lhs.rawValue < rhs.rawValue
    }
}
class Person{//Person类
    var firstName: String
    var lastName: String
    var age: Int
    var gender: Gender
    var fullName:String{
        return firstName+" "+lastName
    }
    var description:String{//计算属性，可直接使用print输出对象内容
        return "fullName:\(fullName),age:\(age),gerder:\(gender)"
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender){//指定构造函数
        self.firstName=firstName
        self.lastName=lastName
        self.age=age
        self.gender=gender
    }
    convenience init(name: String){
        self.init(firstName:name,lastName:"",age:40,gender:Gender.male)
    }
    
    static func ==(p1: Person,p2: Person)->Bool{//重载==
        return p1.fullName == p2.fullName
    }
    
    static func !=(p1: Person,p2: Person)->Bool{//重载!=
        return p1.fullName != p2.fullName
    }
}
class Teacher:Person{//Teacher类
    var title:String
    init(firstName:String, lastName:String, age:Int, gender:Gender,title:String){
        self.title=title
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init(name:String,num:String){
        self.init(firstName:name, lastName:"",age:44, gender: Gender.female,title:num)
    }
    override var description:String{////重写父类的计算属性
        return super.description+" title:\(title)"
    }
}
class Student:Person{//Student类
    var stuNo: String
    init(firstName:String, lastName:String, age:Int, gender:Gender,stuNo:String){
        self.stuNo=stuNo
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init(name:String,num:String){
        self.init(firstName:name, lastName:"",age:20, gender: Gender.female,stuNo:num)
    }
    override var description:String{
        return super.description+"stuNo:\(stuNo)"
    }
}
var p1=Person(firstName:"he", lastName:"ruili",age:21, gender: Gender.female)
var p2=Person(name:"mask")
var t1=Teacher(firstName:"li",lastName:"guiyang",age:44, gender: Gender.male,title:"professor")
var s1=Student(firstName:"yang",lastName:"yang",age:27,gender: Gender.male,stuNo:"2016110301")
var s2=Student(name:"marry",num:"2016110303")
print(p1.description)
print(p2.description)
print(t1.description)
print(s1.description)
print(s2.description)
if p1 == p2{
    print("same people")
}
if p1 != p2{
    print("different people")
}

var persons = [p1,p2,t1,s1,s2]//初始化一个persons数组
var dict = ["Person": 0, "Teacher": 0, "Student": 0]//定义一个字典，用于统计每个类的对象个数
for p in persons{
    if p is Teacher{//是否是Teacher类
        dict["Teacher"]! += 1
    }else if p is Student{//是否是Student
        dict["Student"]! += 1
    }else{//Person类
        dict["Person"]! += 1
    }
}
for (key,value) in dict{
    print("\(key) has \(value) items")
}

for p in persons {
    print(p.description)
}

print("按年龄从小到大排序：")
persons.sort {  $0.age < $1.age}
for p in persons {
    print(p.description)
}

print("按名字排序：")
persons.sort {  $0.fullName < $1.fullName }
for p in persons {
    print(p.description)
}

print("按gender+age排序：")
persons.sort { return ($0.gender > $1.gender) && ($0.age > $1.age)  }
for p in persons {
    print(p.description)
}
