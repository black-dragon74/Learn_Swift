//
// Created by Nick
//

// Aim is to implement all C style programs in Swift as a learning process
// Note: Semicolons are optional in Swift, no worries if you forgot or added it

// An array that contains N elements of type Integer
// However, data type declaration is not compulsary in Swift
let myArray: [Int] = [10, 9, 8, 7, 6, 5, 4, 3, 2]

// Above can be also declared like:
// let myArray = [10, 9, 8, 7, 6, 5, 4, 3, 2]

// Start custom extension
// Do not pay attention to the extension part, you may still read comments to understand the code if you are of the curious kind ;)
// As swift doesn't support unary increment (i++) and unary decrement (i--), I decided to write an extension block for it
// Take a note of how flexible Swift is.
extension Int {
    // Mutating function means it will update the value of Integer
    // _ before 'by' means you need not provide i.inc(by: value), you can just call i.inc(value), much like C functions
    // '?' after 'Int' means it is optional and we have assigned it the default value 'nil' which is equivalent to NULL
    mutating func inc(_ by: Int? = nil) {
        if let times = by { // If optional value 'by' has some value set (other than nil, of course),
            self += times // Add that to the 'retVal' which holds 'self' (The current number)
        }
        else {
            self += 1 // If 'inc' is called without a parameter, just increment by one
        }
    }
    
    // Opposite of Increment, functionality is exactly reversed, comments above will apply to this too
    mutating func dec(_ by: Int? = nil) {
        if let times = by {
            self -= times
        }
        else {
            self -= 1
        }
    }
    
    // Checks if integer being iterated upon is even or not, returns 'Bool' as it will mostly be used in IF ELSE conditionals
    func isEven() -> Bool {
        return self % 2 == 0
    }
}
// End custom extension

// Function to search an item in the array, we'll also see how powerful Swift is, allowing us to return multiple values at the same time
/*
 *  Function description:
 *  Function named linearSearch, takes parameters: 'num2Search' of type 'Int' and 'array' of type '[Int]' (Integer Array)
 *  It returns named variables: 'elementFound' of type 'Bool' and 'foundAtIndex' of type 'Int'
 */
func linearSearch (num2Search: Int, array: [Int]) -> (elemFound: Bool, foundAtIndex: Int) {
    let arraySize = array.count - 1
    var elemFound: Int = 0
    var elemIndex: Int = 0
    print("Starting linear search on sorted array of size: \(arraySize)")
    for i in 0...arraySize  {   // Same as for (i = 0; i <= (sizeof(array) / sizeof(array[0])); i++) in C; Triple dots means, including 0 and arraySize
        if array[i] == num2Search {
            elemFound.inc() // We have called our extension here
            elemIndex = i
            break
        }
    }
    return (elemFound > 0, elemIndex)
}

// Let's call the function now and store the result(s) in a variable
let search = linearSearch(num2Search: 2, array: myArray)

if (search.elemFound) {
    print("Element found at Index: \(search.foundAtIndex)")
}

// Function to perform a Binary search on an array
/*
 *  Function description:
 *  Function named linearSearch, takes parameters: 'num2Search' of type 'Int' and 'array' of type '[Int]' (Integer Array)
 *  It returns named variables: 'elementFound' of type 'Bool' and 'foundAtIndex' of type 'Int'
 */
func binarySearch(num2Search: Int, array: [Int]) -> (elemFound: Bool, foundAtIndex: Int) {
    let arraySize = array.count - 1
    var elemFound = 0
    var elemIndex = 0
    
    // Sort the array (in ascending order) and store the result in a new variable called newArray
    // To sort the array in descending order use: array.sorted(by: >)
    var newArray = array.sorted()
    
    // Let's start iterating upon the array
    var lowerBound = 0
    var upperBound = arraySize
    var midIndex = (lowerBound + upperBound) / 2
    
    print("Starting binary search on sorted array of size \(arraySize)")
    while (lowerBound <= upperBound){
        if num2Search > newArray[midIndex] {
            // Shift the lower bound to mid + 1
            lowerBound = midIndex + 1
        }
        else if num2Search < newArray[midIndex] {
            // Shift the upper bound to mid - 1
            upperBound = midIndex - 1
            
        }
        else {
            // Number is found
            elemFound = 1
            elemIndex = midIndex
            break
        }
        // Update the midIndex
        midIndex = (lowerBound + upperBound) / 2
    }
    
    return (elemFound > 0, elemIndex)
}

// Now let's call the function and see if it works
let binSearch = binarySearch(num2Search: 10, array: myArray)

if (binSearch.elemFound){
    print("Elemnent found in the sorted array with index: \(binSearch.foundAtIndex)")
}

/// Function to print prime numbers in a range
// Take a note that we do not need to specify void return type if the function doesn't return anything
// To define void return type we would write as: func primeInRange (start: Int, end: Int) -> Void { ... }
func primeInRange (start: Int, end: Int) {
    for i in start...end {
        var composite: Int = 0
        for j in 1...i {
            if (i % j == 0){
                composite.inc() // Coz Swift hates C style Increment, we have called our own implementation of the same
            }
        }
        
        if composite == 2 {
            // Number is a prime number
            print("Prime: \(i)")
        }
    }
}


// Call and print the prime numbers
primeInRange(start: 2, end: 60) // Will print all prime numbers starting from 2 upto 60

// Function to reverse a number
// Note that I have not specified variable type for 'iterate', 'remainder' and 'reversed' variables
// Swift is smart enough to know the data type of the variable (I had stated this earlier, repeating it here to make you recall)
// However, you must initialize variable with a value when you are not defining the data type of the variable.
func reverseNumber (_ numToReverse: Int) -> Int { // If you recall, I have used '_' before the argument name so that you don't have to add the label when calling the function
    var iterate = numToReverse // Can also be declared as: var iterate: Int = numToReverse
    var remainder = 0 // Can also be decalred as: var remainder: Int = 0
    var reversed = 0 // Can also be declared as: var reversed: Int = 0
    while iterate != 0 {
        remainder = iterate % 10
        reversed = reversed * 10 + remainder
        iterate /= 10
    }
    return reversed
}

let test = reverseNumber(1234) // As I have used '_' at line #150; I called function like aforehand stead of: reverseNumber(numToReverse: 1234)

// Function to check if a number is a palindrome, calls our custom 'reverseNumber' function
func isPalindrome (_ number: Int) -> Bool {
    return number == reverseNumber(number) // Confusing? Well try to understand it yourself
}

isPalindrome(111) ? print("Number is a palindrome") : print("Number is not a palindrome")

// Now let's have a look at the generic functions but first, what are generics?
// Suppose we want to add two numbers of type 'Int' using a function,
// You might know that a function can take parameters of a definite type only, like:
// func sum (a: Int, b: Int) -> Int { ... }
// You can still pass it the 'Double' values but it will truncate them like: 2.55 will just be read as 2
// What if you wanted to add 2 + 5.5? You would say you will write a function like: func sum(a: Int, b: Double) -> Double { ... }
// But then again, it requires one 'Int' and one 'Double'. Suppose you wanna add 2.3 + 5.5, what now? You can't be writing new functions everytime, right?
// What if we could have a universal function that can accept any data type (as long as it's a arithmetic literal) and return us the sum?
// If you know a little bit of 'Swift' you might know there is a data type called 'Any' which literally accepts any data type
// So, you could write a function like: func sum (a: Any, b: Any) -> Any { ... } but then what if someone passes the value 'a' as a 'String' literal
// Our program will then crash, which is obvioulsy you, as a good developer would want to circumvent.
// Some of (geniuses) you would say we could implement the 'Numeric' 'protocol' on 'Any' data type but we can't do that as 'Any' is not a valid identifier
// So what now? Enough blabbering let's jump straight to the implementation

/**
 *  Function description:
 *  Function Sum, of generic type 'T' conforming to the 'Numeric' protocol (so that we only accept arithmetic literals)
 *  Accepts two args: 'a' and 'b' of type 'T' (generic) and return the generic type 'T'
 *  I won't explain why I have used a '_' before 'a' and 'b' as I have done that in the lines above more than once
 **/
func sum<T: Numeric> (_ a: T, _ b: T) -> T {
    return a + b
}

// Implementation: All vars use the same function 'sum' declared at line #190
var s = sum(1, 2.5) // Args as 'Int' and 'Double'
var u = sum(1.5, 2.5) // Args as 'Double' and 'Double'
var m = sum(2, 2) // Args as 'Int' and 'Int'

// Uncomment the line below and take a note at the error
//var ss = sum (1, "Dafaq")
// Will print error that a 'Numeric' type is expected and 'String' is passed instead. Love 'Swift' yet?

// START ARRAY RELATED STUFFS
// Now we will see how to print elements of an array one by one
let myItems = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7"]

for item in myItems { print(item) } // Done! In single line, no need of any loops, array size.

// Let's create a numeric array
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

// This wil contain the sum of numeric array
var numSum = 0

// Let's calculate the sum
for number in numbers { numSum += number } // Easy, right? In C: for (i = 0; i < sizeof(array) / sizeof(array[0]); i++) { sum += 1; }

// Print the sum
print(numSum)

// We will see how to find the largest element in an array by two methods
// Method one, more like C language
func arrayLargestMethodOne(array: [Int]) -> Int {
    var largest = 0
    for i in 0...array.count-1 {
        if (array[i] > largest) {
            largest = array [i]
        }
    }
    return largest
}

// Method two more 'Swift'-ish/er :D
func arrayLargestMethodTwo(array: [Int]) -> Int {
    var largest = array[0]
    for item in array {
        if item > largest { largest = item }
    }
    return largest
}

// Both will have the same value
let large1 = arrayLargestMethodOne(array: myArray)
let large2 = arrayLargestMethodTwo(array: myArray)


// Likewise, smallest element in an array using Swift like approach
func smallestInArray(array: [Int]) -> Int {
    var smallest = array[0]
    for arr in array { if arr < smallest { smallest = arr } }
    return smallest
}

let smArray = smallestInArray(array: myArray)

func sumOddTermsArray(array: [Int]) -> Int {
    var idx = 0
    var sum = 0
    for item in array {
        if (!idx.isEven()) { // Is even is our custom extension to integer data type
            sum += item
        }
        idx.inc() // '.inc()' also is my custom extension
    }
    return sum
}

// Above function in C style would be extremely complicated like: (denoted just for comparison)
//int sumOddTermsArray (int *array) {
//    int idx = 0;
//    int sum = 0;
//    for (int i = 0; i < sizeof(array) / sizeof (array[0]); i++) {
//        if (idx % 2 != 0) {
//            sum += array[idx];
//        }
//        idx++;
//    }
//    return sum;
//}

let oddSum = sumOddTermsArray(array: myArray)
// END ARRAY RELATED STUFF
