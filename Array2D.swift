
import Foundation 
struct Array2D: CustomStringConvertible{
  var intnal:[Int]
  var rows: Int, cols: Int
  init(numberRows:Int, numberCols: Int){
    rows = numberRows
    cols = numberCols
    intnal = Array(repeating: 0, count: rows*cols)
  }
  func isValid(row:Int,col:Int) -> Bool{
    return(0 <= row && row < rows && 0 <= col && col < cols)
  }
  func index(row:Int,col:Int)->Int{
    if(!isValid(row:row,col:col)){
      print("Array out of bounds error: (\(row),\(col)) in (\(rows),\(cols)).")
      exit(100)
    }
    return(row * cols + col)
  }

  mutating func set(row:Int,col:Int,value:Int){
    intnal[index(row:row,col:col)]=value
  }
  func get(row:Int,col:Int) -> Int{
    return(intnal[index(row:row,col:col)])
  }
  subscript(row:Int,col:Int)->Int{
    get {
      return(get(row:row,col:col))
    }
    set(val) {
      set(row:row,col:col,value:val)
    }
  }
  var numberRows: Int {
    return(rows)
  }
  var numberCols: Int {
    return(cols)
  }
  var description: String{
    var ret="+"
    for _ in 0..<cols{
      ret+="--";
    }
    ret+="+\n"
    for row in 0..<rows{
      ret+="|"
      for col in 0..<cols{
        
        ret+="\(intnal[index(row:row,col:col)]>0 ? "  " : "██")"
      }
      ret+="|\n"
    }
    ret+="+"
    for _ in 0..<cols{
      ret+="--";
    }
    ret+="+\n"
    return(ret)
  }
}