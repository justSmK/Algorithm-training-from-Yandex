/*:
 # A. Interactor
 */

func interactor(str1: String, str2: String, str3: String) -> Int {
    
    guard let codeEndTask = Int(str1),
          let interactorResult = Int(str2),
          let checkerResult = Int(str3) else {
        return -1
    }
    
    switch (interactorResult) {
    case 0:
        if (codeEndTask != 0) {
            return 3
        } else {
            return checkerResult
        }
        
    case 1:
        return checkerResult
        
    case 4:
        if (codeEndTask != 0) {
            return 3
        } else {
            return 4
        }
        
    case 6:
        return 0
        
    case 7:
        return 1
        
    default:
        return interactorResult
    }
}

let str1_A = "42"
let str2_A = "1"
let str3_A = "6"

interactor(str1: str1_A, str2: str2_A, str3: str3_A)

/*:
 # B. Circle line of the subway
 */

func circleLineOfTheSubway(N: Int, i: Int, j: Int) -> Int {
    let greater = max(i, j)
    let smaller = min(i, j)
    return min(greater - smaller - 1, N - greater + smaller - 1)
}

let N = 100
let i = 5
let j = 6

circleLineOfTheSubway(N: N, i: i, j: j)

/*:
 # C. Dates
 */

func dates() {
    
}

let str_C = "1 2 2003"
