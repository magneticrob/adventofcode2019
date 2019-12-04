import UIKit

var str = "Hello, playground"

let cols = 75
let rows = 75
var grid : [[Int]] = [[]]

func initGrid() {
    for i in 0...cols {
        var column: [Int] = []
        grid.append(column)
        for j in 0...rows {
            column.append(0)
        }
        grid[i] = column
    }
}

func printGrid() {
    print("================")
    
    for i in 0...grid.count {
        var string = ""
        for j in 0...rows {
            string.append("\(grid[i][j])")
        }
        print(grid[i])
    }
    
    print("================")
}

initGrid()
printGrid()
