//: Playground - noun: a place where people can play

import UIKit


/// What's New in Swift 4 by Example

/// JSON Encoding and Decoding
class Tutorial: Codable
{
    let title: String
    let author: String
    let editor: String
    let type: String
    let publishDate: Date
    
    init(title: String, author: String, editor: String, type: String, publishDate: Date)
    {
        self.title = title
        self.author = author
        self.editor = editor
        self.type = type
        self.publishDate = publishDate
    }
}

let tutorial = Tutorial(title: "What's New in Swift 4?", author: "Foo", editor: "Bar", type: "Swift", publishDate: Date())
let encoder = JSONEncoder()
let data = try encoder.encode(tutorial)
let string = String(data: data, encoding: .utf8)

let decoder = JSONDecoder()
let article = try decoder.decode(Tutorial.self, from: data)


/// Smarter Key Paths
class Author
{
    let name: String
    let tutorial: Tutorial
    
    init(name: String, tutorial: Tutorial)
    {
        self.name = name
        self.tutorial = tutorial
    }
}

let author = Author(name: "Foo", tutorial: tutorial)

let authorNameKeyPath = \Author.name
let authorName = author[keyPath: authorNameKeyPath]

let authorTutorialTitleKeyPath = \Author.tutorial.title
let authorTutorialTitle = author[keyPath: authorTutorialTitleKeyPath]

let authorTutorialKeyPath = \Author.tutorial
let authorTutorialNameKeyPath = authorTutorialKeyPath.appending(path: \.title)
let authorTutorialName = author[keyPath: authorTutorialNameKeyPath]


class JukeBox
{
    var song: String
    
    init(song: String)
    {
        self.song = song
    }
}

let jukeBox = JukeBox(song: "Nothing else matters")
let jukeBoxSongKeyPath = \JukeBox.song
jukeBox[keyPath: jukeBoxSongKeyPath] = "Stairway to heaven"


/// Mixing Classes With Protocols
protocol Drawable {}
protocol Colourable {}

class Shape {}
class Line {}

let newCircle: Drawable & Colourable
let newRectangle: Drawable & Colourable
let newSquare: Drawable & Colourable

typealias DrawableColourable = Drawable & Colourable

let anotherCircle: DrawableColourable
let anotherRectangle: DrawableColourable
let anotherSquare: DrawableColourable


typealias DrawableColourableShape = Shape & Drawable & Colourable
typealias DrawableLine = Line & Drawable

let anotherNewCircle: DrawableColourableShape
let anotherNewRectangle: DrawableColourableShape
let anotherNewSqure: DrawableColourableShape

let anotherNewStraightLine: DrawableLine
let anotherNewDottedLine: DrawableLine


/// One Sided Ranges
let array = [1, 5, 2, 8, 4, 10]
let halfIndex = (array.count - 1) / 2
let nextIndex = halfIndex + 1

let openFirstSlice = array[..<halfIndex]
let closedFirstSlice = array[...halfIndex]
let closedSecondSlice = array[nextIndex...]

for (index, value) in zip(1..., array)
{
    print("\(index): \(value)")
}

let favouriteNumber = 10
switch favouriteNumber
{
case ..<0:
    print("Your favourite number is a negative one.")
case 0...:
    print("Your favourite number is a positive one.")
default:
    break
}


/// swap vs swapAt
var numbers = [1, 5, 2, 8, 4, 10]
numbers.swapAt(0, 1)

var a = 1
var b = 2
(b, a) = (a, b)


/// Improved Dictionaries and Sets
let tupleArray = [("Monday", 30), ("Tuesday", 25), ("Wednesday", 27), ("Thursday", 20), ("Friday", 24), ("Saturday", 22), ("Sunday", 26)]
let dictionary = Dictionary(uniqueKeysWithValues: tupleArray)

let keys = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let values = [30, 25, 27, 20, 24, 22, 26]
let newDictionary = Dictionary(uniqueKeysWithValues: zip(keys, values))

let anotherDictionary = Dictionary(uniqueKeysWithValues: zip(1..., values))

let duplicatesArray = [("Monday", 30), ("Tuesday", 25), ("Wednesday", 27), ("Thursday", 20), ("Friday", 24), ("Saturday", 22), ("Sunday", 26), ("Monday", 28)]
let noDuplicatesDictionary = Dictionary(duplicatesArray, uniquingKeysWith: min)


let duplicateTuples = [("Monday", 28), ("Tuesday", 27)]
var mutatingDictionay = Dictionary(uniqueKeysWithValues: duplicateTuples)
mutatingDictionay.merge(duplicateTuples, uniquingKeysWith: min)
let updatedDictionary = mutatingDictionay.merging(duplicateTuples, uniquingKeysWith: min)


var seasons = ["Spring": 20, "Summer": 30, "Autumn": 10]
let winterTemperature = seasons["Winter", default: 0]
seasons["Autumn", default: 0] += 5

let mappedArray = seasons.map{ season in (season.key, season.value * 2) }
mappedArray

let mappedArrayShorthandVersion = seasons.map{ ($0.0, $0.1 * 2) }
mappedArrayShorthandVersion

let mappedDictionary = seasons.mapValues{ $0 * 2 }
mappedDictionary

let filteredDictionary = seasons.filter{ $0.value > 15 }
filteredDictionary

let scores = [7, 20, 5, 30, 100, 40, 200]
let groupedDictionary = Dictionary(grouping: scores, by: { String($0).count })
groupedDictionary

var rating: [String: Int] = Dictionary(minimumCapacity: 10)
rating.capacity
rating.reserveCapacity(40)
rating.capacity


var categories: Set<String> = ["Swift", "iOS", "macOS", "watchOS", "tvOS"]
categories.capacity
categories.reserveCapacity(10)

let filteredCategories = categories.filter{ $0.hasSuffix("OS") }
filteredCategories


/// Private vs Fileprivate in Extensions
class Person
{
    private let name: String
    private let age: Int
    
    init(name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
}

extension Person
{
    func info() -> String
    {
        return "\(self.name) \(self.age)"
    }
}

let me = Person(name: "Foo", age: 27)
me.info()


/// NSNumber Improvements
let x = NSNumber(value: 1000)
let y = x as? UInt8


/// Unicode Scalars for Characters
let character: Character = "A"
let unicodeScalars = character.unicodeScalars
let asciiCode = unicodeScalars[unicodeScalars.startIndex].value


/// Improved Emoji Strings
let emojiString = "👨‍👩‍👧‍👦"
let characterCountSwift4 = emojiString.characters.count


/// Multiple Line Strings
let multiLineStringSwift4 = """
You can display strings
on multiple lines by placing a
\""" delimiter on a separate line
both right at the beginning
and exactly at the very
end of it
and don't have to "escape" double quotes
"" in Swift 4.
"""


/// Generic Subscripts
extension Array where Element: Comparable
{
    subscript<T: Sequence>(type: String, sequence: T) -> [T.Element] where T.Element: Equatable
    {
        var array: [T.Element] = []
        if let minimum = self.min(), let genericMinimum = minimum as? T.Element, sequence.contains(genericMinimum)
        {
            array.append(genericMinimum)
        }
        if let maximum = self.max(), let genericMaximum = maximum as? T.Element, sequence.contains(genericMaximum)
        {
            array.append(genericMaximum)
        }
        
        return array
    }
}

let primeNumbers = [3, 7, 5, 19, 11, 13]

let noMinOrMaxArray = [5, 11, 23]
let numberFirstArray = primeNumbers["array", noMinOrMaxArray]

let onlyMinNumberSet: Set<Int> = [3, 13, 2, 7]
let numberFirstSet = primeNumbers["set", onlyMinNumberSet]

let justMaxNumberArray = [7, 19, 29, 10]
let numberSecondArray = primeNumbers["array", justMaxNumberArray]

let bothMinAndMaxSet: Set<Int> = [3, 17, 19]
let numberSecondSet = primeNumbers["set", bothMinAndMaxSet]


let greetings = ["Hello", "Hey", "Hi", "Goodbye", "Bye"]

let noFirstOrLastArray = ["Hello", "Goodbye"]
let stringFirstArray = greetings["array", noFirstOrLastArray]

let onlyFirstSet: Set<String> = ["Bye", "Hey", "See you"]
let stringFirstSet = greetings["set", onlyFirstSet]

let onlyLastArray = ["Goodbye", "Hi", "What's up?"]
let stringSecondArray = greetings["array", onlyLastArray]

let bothFirstAndLastSet: Set<String> = ["Bye", "HI"]
let stringSecondSet = greetings["set", bothFirstAndLastSet]


/// Strings as Collections
let swift4String = "Swift 4"
let filteredSwift4String = swift4String.filter{ Int(String($0)) == nil }
filteredSwift4String

let swift4SpaceIndex = swift4String.index(of: " ")
let swift4Substring = swift4String[..<swift4SpaceIndex!]


/// Improved Objective-C Inference
class ObjectiveCClass: NSObject
{
    @objc let objectiveCProperty: NSObject
    @objc func objectiveCMethod() {}
    
    init(objectiveCProperty: NSObject)
    {
        self.objectiveCProperty = objectiveCProperty
    }
}

let selector = #selector(ObjectiveCClass.objectiveCMethod)
let keyPath = #keyPath(ObjectiveCClass.objectiveCProperty)


/// Tuple Destructuring in Closures
let players = [(name: "Cristiano Ronaldo", team: "Real Madrid"), (name: "Lionel Messi", team: "FC Barcelona")]

let tupleDestructuring = players.map{ player in (player.name.uppercased(), player.team.uppercased()) }
tupleDestructuring

let shorthandArguments = players.map{ ($0.0.uppercased(), $0.1.uppercased()) }


/// Constrained Associated Types in Protocols
protocol SequenceProtocol
{
    associatedtype SpecialSequence: Sequence where SpecialSequence.Element: Equatable
}

