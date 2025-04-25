  // 1 . variable declaration

  var name = 'alice';
  var age = 100;

  int myage= 100;

   final birthday=  2000;
   const pi= 34.14;

   // example 
    const String   name1  =" john doe" ;
    final int age1 = 100;

    // 2.  data type 
    // 2.1 number
    int a = 10;
    double b = 20.5;

    // 2.2 string
    String name2 = "Alice";

    String comment  =  """ this is my 
    comment 
    it is 
    too 
    long """;

    //2.3 boolean
    bool isTrue = true;

    //2.4 list
    List<int> ages = [10, 20, 30, 40];
    List<String> names = ["Alice", "Bob", "Charlie"];

    //2.5 map

    Map<String, int> scores = {
      "Alice": 90,
      "Bob": 85,
      "Charlie": 95
    };

    // 2.6 set
    Set<String> uniqueNames = {"Alice", "Bob", "Charlie"};

    // 2.7 dynamic
    dynamic variable = 100;
    // variable = "Hello";
    // 2.8  null
    String? nullableString ;
    // const API_KEY;

    // camelCase , PascalCase, snake_case,lowercase, UPPERCASE


//3  . conditional statement
// 3.1 if statement 
// 
/* if(condition){
   statement return when condition is true
} else if{
   statement returtn when condition1 is false but condition2 is true
} else{
   statement return when all conditions are false
} 
// 3.2 switch statement
switch (expression) {
  case value1:
    // code block
    break;
  case value2:
    // code block
    break;
  default:
    // code block
}

3.3 iterating system 

*/
// 4/ functions 
 /*
 syntax:

 returntype functionNmae( parameterType parameterName, ...) {
   // function body
   return value;

   int add (int a , int b){
     return a + b;
   }

   relust = add(2,3);

   void message (  String name){
     print("hello $name");
   }
   hey = message("alice");

 */