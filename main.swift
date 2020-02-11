import Foundation


var vc = Array2DVC()

vc.runLife()

var colony = Colony(size: 10)
colony.setCellAlive(row: 5, col: 3)
colony.setCellAlive(row: 5, col: 4)
colony.setCellAlive(row: 5, col: 5)
colony.setCellAlive(row: 4, col: 5)
colony.setCellAlive(row: 3, col: 4)
print(colony)
for _ in 0..<12 {
  colony.evolve()
  print(colony)
}