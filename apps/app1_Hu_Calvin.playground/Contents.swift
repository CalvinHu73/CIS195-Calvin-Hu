/*
 Name: Calvin Hu
 PennKey: calvinhu
 App Number: 1
 Looking forward to being able to build nice iOS apps
 */

// Exercise 1
let foo: Int = 42
var fooStr: String? = String(foo)
print("My number is \(fooStr!)")
if let foooStr = fooStr {
    print("My number is \(foooStr)")
}
print("My number is \(fooStr ?? "nil")")

// Exercise 2
var cisArray: [Character] = [Character]("cis195 is fun")
var cisString: String = String(cisArray)
cisString.append("!")
print(cisString)
var peopleDict = ["Calvin": 19, "Elon": 49, "Ben": 314]
dump(peopleDict)
var myInfo = ("Calvin Hu", 2023)
print(myInfo)

// Exercise 3
for entry in peopleDict {
    if entry.value < 21 {
        print("My friend \(entry.key) is under 21")
    } else {
        print("My friend \(entry.key) is not under 21")
    }
}
for i in 1...10 {
    print(i)
}
for char in "cis195" {
    print(char)
}

// Exercise 4
func sumAndDiff(_ first: Int, _ second: Int) -> (Int, Int) {
    return (first + second, first - second)
}
typealias Course = String
typealias PennId = Int
func enroll(in course: Course, using pennId: PennId) -> () {
    print("Enrolled \(pennId) in \(course)")
}
let newCourse = "cis240"
let myPennId = 80922421
enroll(in: newCourse, using: myPennId)

// Exercise 5 and 6
struct Rectangle {
    var length: Double, width: Double
    var area: Double {
        get {
            return length * width
        }
    }
    var description: String? {
        didSet {
            print(description!)
        }
    }
    
}
var myRect = Rectangle(length: 5, width: 6)
myRect.description = "This is my rectangle."
print(myRect.area)
class Student {
    typealias School = String
    typealias Major = String
    var name: String, school: School?, major: Major
    init(name: String, school: School?, major: Major) {
        self.name = name
        self.school = school
        self.major = major
    }
    convenience init(name: String) {
        self.init(name: name, school: nil, major: "undeclared")
    }
}
var me = Student(name: "Calvin Hu", school: "UPenn", major: "Computer Science")
var babyQuaker = Student(name: "Class of 2024")
babyQuaker.major = ["Computer Science", "Math", "Econ", "undeclared", "Biology", "Physics", "Criminology", "Fine Arts", "Philosophy", "History", "Sociology"].randomElement()!
