import UIKit

enum Intcode {
    case Add(opcode: Int, int1: Int, int2: Int, output: Int)
    case Multiply(opcode: Int, int1: Int, int2: Int, output: Int)
    case Finished(opcode: Int)
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

let input: [Int] = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,5,19,23,1,23,5,27,1,27,13,31,1,31,5,35,1,9,35,39,2,13,39,43,1,43,10,47,1,47,13,51,2,10,51,55,1,55,5,59,1,59,5,63,1,63,13,67,1,13,67,71,1,71,10,75,1,6,75,79,1,6,79,83,2,10,83,87,1,87,5,91,1,5,91,95,2,95,10,99,1,9,99,103,1,103,13,107,2,10,107,111,2,13,111,115,1,6,115,119,1,119,10,123,2,9,123,127,2,127,9,131,1,131,10,135,1,135,2,139,1,10,139,0,99,2,0,14,0]

func breakupInputs(_ inputs: [Int]) {
    var output = inputs
    
    let programs = Array(input.split(separator: 99))
    for program in programs {
        
        let individualPrograms = Array(program).chunked(into: 4)
        for individualProgram in individualPrograms {
            if individualProgram.count != 4 { continue }
            print(individualProgram)
            let pos1 = individualProgram[1]
            let pos2 = individualProgram[2]
            let resultSpace = individualProgram[3]
            let int1 = input[pos1]
            let int2 = input[pos2]
            var result = 0
            if individualProgram[0] == 1 {
                result = int1 + int2
            } else if individualProgram[0] == 2 {
                result = int1 * int2
            }
            output[resultSpace] = result
        }

    }
    
    print(output)
}

breakupInputs(input)
