//Java Examples
import java.util.Scanner;

class ReportJava {
  public static int addTwoInts(int x, int y){
    return x + y;
  }
  public static int increment(int x){
    return x + 1;
  }  

  public static String patternMatch(int x){
    switch (x) {
      case 1: 
        return "Option 1";
      case 2: 
        return "Option 2";
      default: 
        return "Every other option";
    }
  }

  public static int factorial(int x){
    if (x == 0) {
      return 1;
    }
    else {
      return x * factorial(x-1);
    }
  }
  public static double strictEvaluation(double x, double y){
    return x+1;
  }


  public static int function(int x){
    return x;
  }

  
  public static void main(String[] argv){
    System.out.println(addTwoInts(1,2));
    System.out.println(increment(1));
    System.out.println(patternMatch(1));
    System.out.println(function(1));

  }
}

