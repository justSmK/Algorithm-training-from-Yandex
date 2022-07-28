/*:
 # Лекция 1: «Сложность, тестирование, особые случаи»
 # Lecture 1: "Complexity, Testing, Special Cases"
 */

/*:
 ### Дана строка в кодировке UTF-8
 ### A string in UTF-8 encoding is given
 
 ### Найти самый часто встречающийся в ней символ. Если несколько символов встречаются одинаково часто, то можно вывести любой
 ### Find the most frequent character in it. If several characters are equally frequent, any character can be printed
 */

import Darwin

let stringTask1 = "ababa"

/*:
 ### Решение 1
 ### Solution 1
 
 Переберём все позиции и для каждой позиции в строке ещё раз переберём все позиции и в случае совпадения прибавим к счётчику единицу. Найдём максимальное значение счётчика
 
 Go through all the positions and for each position in the string go through all the positions again and if they match, add one to the counter. Find the maximal value of the counter
 
 Time: O(N^2)
 Memory: O(N)
 */

func mostCommonSymbol1(string: String) -> Character {
    var result: Character = "0"
    var resCount = 0
    
    for i in string {
        var nowCount = 0
        for j in string {
            if i == j {
                nowCount += 1
            }
        }
        if nowCount > resCount {
            result = i
            resCount = nowCount
        }
        
    }
    
    return result
}

mostCommonSymbol1(string: stringTask1)


/*:
 ### Решение 2
 ### Solution 2

 Переберём все символы, встречающиеся в строке, а затем переберём все позиции и в случае совпадения прибавим к счётчику единицу. Найдём максимальное значение счётчика
 
 Let's go through all the characters that occur in the string, and then go through all the positions and if they coincide, add one to the counter. Find the maximal value of the counter
 
 Time: O(Nk)
 Memory: O(N + k) = O(N)
 
 */

func mostCommonSymbol2(string: String) -> Character {
    var result: Character = "0"
    var resCount = 0
    
    for now in Set(string) {
        var nowCount = 0
        for j in string {
            if now == j {
                nowCount += 1
            }
        }
        if nowCount > resCount {
            result = now
            resCount = nowCount
        }
        
    }
    
    return result
}

mostCommonSymbol2(string: stringTask1)

/*:
 ### Решение 3
 ### Solution 3

 Заведём словарь, где ключом является символ, а значением - сколько раз он встретился. Если символ встретился впервые - создаем элемент словаря с ключом, совпадающем с этим символом и значением ноль. Прибавляем к элементу словаря с ключом, совпадающем с этим символом, единицу
 
 Create a dictionary, where the key is a symbol, and the value is how many times it has been encountered. If the symbol is first encountered, create a dictionary item with the key that matches this symbol and the value zero. Add one to the dictionary entry with the key, which coincides with this symbol
 
 Time: O(N)
 Memory: O(k)
 */

func mostCommonSymbol3(string: String) -> Character {
    var result: Character = "0"
    var resCount = 0
    var dictionary = [Character: Int]()
    
    for now in string {
        if !dictionary.contains(where: { $0.key == now }) {
            dictionary[now] = 0
        }
        dictionary[now]! += 1
    }
    
//    for now in string {
//        if !dictionary.contains(where: { element in
//            element.key == now
//        }){
//            dictionary[now] = 0
//        }
//        dictionary[now]! += 1
//    }
    
    for (key, value) in dictionary {
        if value > resCount {
            resCount = value
            result = key
        }
    }
    
    return result
}

mostCommonSymbol3(string: stringTask1)

/*:
 ### Сумма последовательности
 ### Sum of the sequence
 */

func sumOfSeq(string: String) -> Int {
    let sequence = string.split(separator: " ").map { element -> Int in
        var result = Int()
        if (Int(element) != nil) {
            result = Int(element)!
        }
        return result
    }
    
    var sumSeq = 0
    
    for i in sequence {
        sumSeq += i
    }
    
    return sumSeq
}

let stringSumSeq = "1 2 3 4 5"
sumOfSeq(string: stringSumSeq)

/*:
 ### Максимум последовательности
 ### Max of the sequence
 */

func maxOfSeq(string: String) -> Int? {
    let sequence = string.split(separator: " ").map { element -> Int in
        var result = Int()
        if (Int(element) != nil) {
            result = Int(element)!
        }
        return result
    }
    
    if sequence.count == 0 {
        return nil
    }
    
    var seqMax: Int = sequence.first!
    
    for i in sequence {
        if i > seqMax {
            seqMax = i
        }
    }
    
    return seqMax
}

let stringMaxSeq = "-1 2 -3 4 -5"
maxOfSeq(string: stringMaxSeq)

/*:
 ### Квадаратное уравнение
 ### Quadratic equation
 
 Задача: даны три целых числа a, b, c.
 Найдите все корни уравнения ax^2 + bx + c = 0 и выделите их в порядке возрастания
 
 Problem: There are three integers a, b, c.
 Find all roots of the equation ax^2 + bx + c = 0 and select them in ascending order
 
 D = b^2 - 4ac
 x1,2 = (-b +- sqr(D)) / 2a
 D = 0
 */

/*:
 ### Решение
 ### Solution
 */

func quadraticEquation(a: Double, b: Double, c: Double) -> (Double?, Double?) {
    if a == 0 {
        if b != 0 {
            let x = -c / b
            return (x, nil)
        }
        if b == 0 && c == 0 {
            return (Double.infinity, nil)
        }
    } else {
        let d = b * b - 4 * a * c
        if d == 0 {
            let x1 = -b / (2 * a)
            return (x1, nil)
        } else if (d > 0) {
            let x1 = (-b - sqrt(d)) / (2 * a)
            let x2 = (-b + sqrt(d)) / (2 * a)
            var result = (x1, x2)
            if x1 < x2 {
                return result
            } else {
                result = (x2, x1)
            }
            return result
        }
    }
    return (nil, nil)
}

let a = -5
let b = 4
let c = 1
quadraticEquation(a: Double(a), b: Double(b), c: Double(c))

import XCTest
class Tests: XCTestCase {
    
    func test1() {
        let expectedResult: (Double?, Double?) = (0.0, 2.0)
        let a = 1
        let b = -2
        let c = 0
        let result = quadraticEquation(a: Double(a), b: Double(b), c: Double(c))
        XCTAssertTrue(result == expectedResult, "Failed. Result = \(result)")
    }
    
    func test2() {
        let expectedResult: (Double?, Double?) = (-1.0, nil)
        let a = 1
        let b = 2
        let c = 1
        let result = quadraticEquation(a: Double(a), b: Double(b), c: Double(c))
        XCTAssertTrue(result == expectedResult, "Failed. Result = \(result)")
    }
    
    func test3() {
        let expectedResult: (Double?, Double?) = (nil, nil)
        let a = 1
        let b = 1
        let c = 1
        let result = quadraticEquation(a: Double(a), b: Double(b), c: Double(c))
        XCTAssertTrue(result == expectedResult, "Failed. Result = \(result)")
    }
    
    func test4() {
        let expectedResult: (Double?, Double?) = (-1.0, nil)
        let a = 0
        let b = 1
        let c = 1
        let result = quadraticEquation(a: Double(a), b: Double(b), c: Double(c))
        XCTAssertTrue(result == expectedResult, "Failed. Result = \(result)")
    }
    
    func test5() {
        let expectedResult: (Double?, Double?) = (nil, nil)
        let a = 0
        let b = 0
        let c = 1
        let result = quadraticEquation(a: Double(a), b: Double(b), c: Double(c))
        XCTAssertTrue(result == expectedResult, "Failed. Result = \(result)")
    }
    
    func test6() {
        let expectedResult: (Double?, Double?) = (Double.infinity, nil)
        let a = 0
        let b = 0
        let c = 0
        let result = quadraticEquation(a: Double(a), b: Double(b), c: Double(c))
        XCTAssertTrue(result == expectedResult, "Failed. Result = \(result)")
    }
    
    func test7() {
        let expectedResult: (Double?, Double?) = (-0.2, 1.0)
        let a = -5
        let b = 4
        let c = 1
        let result = quadraticEquation(a: Double(a), b: Double(b), c: Double(c))
        XCTAssertTrue(result == expectedResult, "Failed. Result = \(result)")
    }
    
}

Tests.defaultTestSuite.run()
