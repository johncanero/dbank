
import Debug  "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

// 1. Create an actor class named "DBank" to create a network
// 1.1 Create a stable at variable to retain the number
actor DBank {
  stable var currentValue: Float= 300;
  currentValue := 300;

  // 6. Create a const called startTime. Debug print the current time in nanoseconds into the console. 
  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));


 // 2. Create a id which serves or equal to const
 let id = 23892381345;
 Debug.print(debug_show(id));
 //Debug.print(debug_show(currentValue));

 

// 3. Create a public (func)function named topUp 
 public func topUp(amount: Float) {
 currentValue += amount;
 Debug.print(debug_show(currentValue));
   
 };




// 4. Create a public (func)function named withdraw that allow users to withdraw an amount from the current Value
// Decrease the currentValue by the amount
public func withdrwal(amount : Float) {
let tempValue: Float = currentValue - amount;
  if(tempValue >= 0) {
  currentValue -= amount;
  Debug.print(debug_show(currentValue));
  }
  else {
    Debug.print("Amount is large, currentValue is less than Zero.");
  }
};

// 5. Add a Query Call for Valididy Check of Speed
public query func checkBalance(): async Float {
return currentValue;
};


// 7. Create a funtion that tracks how much time has elapsed
// ** = exponent
public func compound() {
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsedS = timeElapsedNS / 1000000000;
currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
startTime := currentTime;


};
 //topUp();
}







