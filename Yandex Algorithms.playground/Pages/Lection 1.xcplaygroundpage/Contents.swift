/*:
 ### Дана строка в кодировке UTF-8
 ### A string in UTF-8 encoding is given
 
 ### Найти самый часто встречающийся в ней символ. Если несколько символов встречаются одинаково часто, то можно вывести любой
 ### Find the most frequent character in it. If several characters are equally frequent, any character can be printed
 */

/*:
 ### Решение 1
 ### Solution 1
 
 Переберём все позиции и для каждой позиции в строке ещё раз переберём все позиции и в случае совпадения прибавим к счётчику единицу. Найдём максимальное значение счётчика
 
 Go through all the positions and for each position in the string go through all the positions again and if they match, add one to the counter. Find the maximal value of the counter
 
 O(N^2)
 */

func mostCommonSymbol1(string: String) {
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
    
    print(result)
}

let stringTask1 = "abababb"
mostCommonSymbol1(string: stringTask1)


/*:
 ### Решение 2
 ### Solution 2

 
 O(N)
 */

