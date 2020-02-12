import Foundation
import Glibc

struct Array2DVC {
  init () {
    self.command = ""
    self.life = Colony(size: 1)
  }
  var command: String
  var life: Colony


  func getCommand() -> String { //this gets the data that the user inputed
  print("Command...", terminator: "")
  var input = readLine()!
  var commandLine = input.split(separator: " ").map(String.init)
   if input == "Credits" {
     print("\nDon't steal my code! :-D \nThis code is developed by Nicholas White\n")
   }
   while commandLine.count == 0 {
     print("An error took place: no input recognised")
     print("Command...", terminator: "")
     input = readLine()!
     commandLine = input.split(separator: " ").map(String.init)
   }
  return input
  }

  mutating func runLife() {
    print("Welcome to Game of Life!\n")
    protocolInit()
    prepareTheScene()
    command = getCommand()
    while command != "quit" {
      let commandLine = command.split(separator: " ").map(String.init)
      executeCode(commandLine)
      command = getCommand() //retreive the command the user entered
    }
  }


  mutating func prepareTheScene() {
    print("Set Initial Cells:")
    var data = readLine()!
    var sData = data.split(separator: " ").map(String.init)
    life.setCellAlive(row: Int(sData[0])!, col: Int(sData[sData.count - 1])!)
    while data != "" {      
      sData = data.split(separator: " ").map(String.init)
      life.setCellAlive(row: Int(sData[0])!, col: Int(sData[sData.count - 1])!)
      data = readLine()!
    }

  }

  mutating func protocolInit() {
    print("Colony Size", terminator: ": ")
    var size = readLine()!
    while Int(size) == nil {
      print("An error took place: entered a non-integer: \(size)")
      size = readLine()!
    }
    life.intnal = Array2DS(numberRows: Int(size)!, numberCols: Int(size)!)
  }
  mutating func executeCode(_ commandLine: [String]) {
    if Int(commandLine[0]) == nil {
      switch commandLine[0] {
      case "reinit":
        protocolInit()
      case "e":
        life.evolve()
        print(life)
      case "help": 
        print("Enter an int, followed by enter key to evolve that number of times.")  
      default: 
        print("An error took place: unknown command: \(commandLine[0])")
      }
    } else {
      for _ in 0..<Int(commandLine[0])! {
        life.evolve()
        print(life)
      }
    }
  }
}