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
            elemFound += 1
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
