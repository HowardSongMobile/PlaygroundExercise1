import UIKit
import PlaygroundSupport

enum Weekday: String, CaseIterable {
    case mon = "Mon"
    case tue = "Tue"
    case wed = "Wed"
    case thu = "Thu"
    case fri = "Fri"
    case sat = "Sat"
    case sun = "Sun"
    case unknown = "Unknown"
}

struct Node {
    var value: String
    var index: Int
}

struct Constant {
    static let maxK: Int = 500
    static let maxDays: Int = 7
}

//solution 1 - list
func linkedListSolution(s: String, k: Int) -> String {
    
    if k < 0 || k > Constant.maxK {return Weekday.unknown.rawValue}
    
    var nodes = [Node]()
    var i = 0
    
    for weekday in Weekday.allCases {
        i += 1
        let node = Node(value: weekday.rawValue, index: i)
        nodes.append(node)
    }
    
    let sourceNodes = nodes.filter{$0.value.lowercased() == s.lowercased()}
    guard let sourceNode = sourceNodes.first else {return Weekday.unknown.rawValue}
    let sourceIndex = sourceNode.index
    
    var targetIndex = k + sourceIndex
    if targetIndex > Weekday.allCases.count-1 {
        targetIndex = targetIndex % (Weekday.allCases.count-1)
    }
    
    let targetNodes = nodes.filter{$0.index == targetIndex}
    guard let targetNode = targetNodes.first else {return Weekday.unknown.rawValue}

    return targetNode.value
}

let test1 = linkedListSolution(s: "wed", k: 2)
let test2 = linkedListSolution(s: "Sat", k: 23)
print("test1 == \(test1) test2 == \(test2)")

func dictionarySolution(s: String, k: Int) -> String {

    if k < 0 || k > Constant.maxK {return Weekday.unknown.rawValue}
    
    var dic  = [Int : String]()
    var i = 0
    
    for weekday in Weekday.allCases {
        i += 1
        dic[i] = weekday.rawValue
    }
    
    let sourceDics = dic.filter{$0.value.lowercased() == s.lowercased()}
    guard let sourceDic = sourceDics.first else {return Weekday.unknown.rawValue}
    let sourceIndex = sourceDic.key
    
    var targetIndex = k + sourceIndex
    if targetIndex > Weekday.allCases.count-1 {
        targetIndex = targetIndex % (Weekday.allCases.count-1)
    }
    
    let targetDics = dic.filter{$0.key == targetIndex}
    guard let targetDic = targetDics.first else {return Weekday.unknown.rawValue}

    return targetDic.value
}
let test3 = dictionarySolution(s: "wed", k: 106)
let test4 = dictionarySolution(s: "Sat", k: 501)
print("test3 == \(test3) test4 == \(test4)")

//Solution3 - does not use any Swift built-in features like Enum, Sequence etc.
func SolutionWithoutBuiltFunc(s: String, k: Int) -> String {

    if k < 0 || k > Constant.maxK {return Weekday.unknown.rawValue}
    
    var sourceIndex = 0
    var targetIndex = 0
    var targetString = "Unknown"
    
    switch s.lowercased() {
    case "mon":
        sourceIndex = 1
        break
    case "tue":
        sourceIndex = 2
        break
    case "wed":
        sourceIndex = 3
        break
    case "thu":
        sourceIndex = 4
        break
    case "fri":
        sourceIndex = 5
        break
    case "sat":
        sourceIndex = 6
        break
    case "sun":
        sourceIndex = 7
        break
    default:
        sourceIndex = 8
    }
    
    targetIndex = k + sourceIndex
    if targetIndex > Constant.maxDays {
        targetIndex = targetIndex % Constant.maxDays
    }
    
    switch targetIndex {
    case 1:
        targetString = "Mon"
        break
    case 2:
        targetString = "Tue"
        break
    case 3:
        targetString = "Wed"
        break
    case 4:
        targetString = "Thu"
        break
    case 5:
        targetString = "Fri"
        break
    case 6:
        targetString = "Sat"
        break
    case 7:
        targetString = "Sun"
        break
    default:
        targetString = "Unknown"
    }
    
    return targetString
}
let test5 = SolutionWithoutBuiltFunc(s: "wed", k: 3)
let test6 = SolutionWithoutBuiltFunc(s: "Sat", k: 500)
print("test5 == \(test5) test6 == \(test6)")
