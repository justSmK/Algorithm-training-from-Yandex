/*:
 ### Дана строка в кодировке UTF-8
 ### A string in UTF-8 encoding is given
 
 ### Найти самый часто встречающийся в ней символ. Если несколько символов встречаются одинаково часто, то можно вывести любой
 ### Find the most frequent character in it. If several characters are equally frequent, any character can be printed
 */

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
    
    for (key, value) in dictionary {
        if value > resCount {
            resCount = value
            result = key
        }
    }
    
    return result
}

mostCommonSymbol3(string: stringTask1)
