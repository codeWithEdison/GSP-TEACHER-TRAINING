void main(List<String> args) {
  for(int i = 1; i<=12; i++){
    print("Multiplication Table of $i");
    
    for(int j = 1; j<=12; j++){
      print(" $i *  $j = ${ i * j}");
    }
    print("__________________________");
  }
}