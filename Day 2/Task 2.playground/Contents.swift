import UIKit

var input: [Int] = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,5,19,23,1,23,5,27,1,27,13,31,1,31,5,35,1,9,35,39,2,13,39,43,1,43,10,47,1,47,13,51,2,10,51,55,1,55,5,59,1,59,5,63,1,63,13,67,1,13,67,71,1,71,10,75,1,6,75,79,1,6,79,83,2,10,83,87,1,87,5,91,1,5,91,95,2,95,10,99,1,9,99,103,1,103,13,107,2,10,107,111,2,13,111,115,1,6,115,119,1,119,10,123,2,9,123,127,2,127,9,131,1,131,10,135,1,135,2,139,1,10,139,0,99,2,0,14,0]

var found = false

func breakupInputs(_ inputs: [Int], index: Int) {
    
    var output = inputs
    print("=============")
    if index == inputs.count - 1 {
        print("DONE: ")
        print(output)
        print("=============")
        return
    }
    
//    print("Input is: \(inputs), index is: \(index)")
    
    var index = index
    let element = inputs[index]
    if element == 99 {
//        print("element is 99, ending program and restarting pc")
        index += 1
        breakupInputs(output, index: index)
        return
    }
    
    let int1Position = output[index + 1]
    let int2Position = output[index + 2]
    let int1 = output[int1Position]
    let int2 = output[int2Position]
    let resultPosition = output[index + 3]
    let nextIndex = index + 4
    var result = -1
    
//    print("Int1: \(int1)")
//    print("Int2: \(int2)")
    
    if element == 1 {
        result = int1 + int2
//        print("Result is \(result)")
    } else if element == 2 {
        result = int1 * int2
//        print("Result is \(result)")
    }
    
//    print("Replacing item at \(resultPosition) (\(output[resultPosition])) with \(result)")
    output[resultPosition] = result
    
    if result == 19690720, resultPosition == 0 {
        print("=====")
        print("DONE!")
        print("Noun: \(input[1])")
        print("Verb: \(input[2])")
        print("=====")
        found = true
    }
    
    breakupInputs(output, index: nextIndex)
}

for i in 70...99 {
    for j in 0...99 {
        input[1] = i
        input[2] = j
        //        print("Trying noun: \(i) and verb: \(j)")
        if !found {
            breakupInputs(input, index: 0)
        }
    }
}
