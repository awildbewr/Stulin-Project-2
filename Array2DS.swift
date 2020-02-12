
struct Array2DS: CustomStringConvertible{
  var intnal: Array2D
  init(numberRows: Int, numberCols: Int){
    intnal = Array2D(numberRows:numberRows,numberCols:numberCols)
  }
  mutating func set(row: Int, col: Int, value: Int){
    if(intnal.isValid(row: row, col: col)){
      intnal.set(row: row, col: col, value: value)
    }
  }
  func get(row: Int, col: Int) -> Int{
    if(intnal.isValid(row: row, col: col)){
      return(intnal.get(row: row, col: col))
    }else{
      return(0)
    }
  }
  subscript(row: Int, col: Int)->Int{
    get {
      return(get(row:row,col:col))
    }
    set(val) {
      set(row:row,col:col,value:val)
    }
  }
  var numberRows: Int {
    return(intnal.numberRows)
  }
  var numberCols: Int {
    return(intnal.numberCols)
  }
  var description: String{
    return(intnal.description)
  }
}