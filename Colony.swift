
struct Colony: CustomStringConvertible{
  var intnal: Array2DS
  var size: Int
  init(size: Int){
    self.size = size
    self.intnal = Array2DS(numberRows: size,numberCols: size)
  }
  
  mutating func setCellAlive(row: Int, col: Int) {
    intnal.set(row: row, col: col, value: 1)
  }

  mutating func evolve() {   
    intnal = step(life: intnal)
  }

  func step(life:Array2DS) -> Array2DS{
    var next = Array2DS(numberRows:life.numberRows,numberCols:life.numberCols)
    for x in 0..<life.numberCols{
      for y in 0..<life.numberRows{
        var neigh=0;
        for xd in -1...1{
          for yd in -1...1{
            if(xd==0&&yd==0){continue;}
            neigh+=life[y+yd,x+xd];
          }
        }
        var alive=life[y,x]>0;
        if(alive&&2<=neigh&&neigh<=3){

        }else if(neigh==3){
          alive=true;
        }else{
          alive=false;
        }

        next[y,x]=alive ? 1 : 0;
      }
    }
    return(next);
  }
  var description: String{
    return(intnal.description)
  }
}