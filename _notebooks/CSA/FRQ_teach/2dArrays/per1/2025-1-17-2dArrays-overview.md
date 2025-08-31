---
layout: post
comments: true
title: FRQ - 2D Arrays
categories: [AP CSA]
menu: nav/FRQ_teach/p1-2darrays.html
permalink: /csa/p1-frq-2darrays/overview
---
# MC Review

### Question 1: Which of the following is the correct way to declare and initialize a 2D array in Java?

A. int[2][3] array = new int[][];
B. int array[][] = new int[2, 3];
C. int[][] array = int[2][3];
D. int[][] array = new int[2][3];

**Answer: B**  - Correctly declares a 2D array with 2 rows and 3 columns.

### Question 2: Which code snippet correctly uses nested enhanced for loops to iterate through a 2D array in Java?

A. for (int row : array)  
    for (int value : row)  
        System.out.println(value);

B. for (int[] row : array) {  
    for (int value : row)  
        System.out.println(value);  
}

C. for (row[] : array) {  
    for (value : row)  
        System.out.println(value);  
}

D. for (int row[] : array) {  
    System.out.println(value);  
}

**Answer: B** - The outer loop iterates through each row (a 1D array). The inner loop iterates through each element of the current row.

### Question 3: Which of the following correctly retrieves an element from a 2D array?

A. int value = array.get[2].get[3];
B. int value = array.get(2).get(3);
C. int value = array[2][3];
D. int value = array.get(2, 3);

**Answer: C** - array[2][3] accesses the element in the 2nd row and 3rd column of the array.

### Question 4: How do you find the number of rows and columns in a 2D array in Java?

A. int rows = array.size();  
int cols = array[0].size();

B. int rows = array.length;  
int cols = array[0].length;

C. int rows = array.getLength();  
int cols = array[0].getLength();

D. int rows = array.size();  
int cols = array.get(0).size();

**Answer: B** - array.length gives the number of rows in the array. array[0].length gives the number of columns in the first row of the array.

### Question 5: How do you find the number of columns in a jagged 2D array in Java?

A. int cols = array[0].length;
B. int cols = array.length;
C. int cols = array[row].length;
D. int cols = array[row].getLength();

**Answer: C** - To find the number of columns in a specific row, use array[row].length.

# TRAPS!!!!

![image](https://media.tenor.com/sKhPR1FV7IAAAAAM/its-a-trap-trap.gif)

**“The CSA test throws lots of traps that will make you lose points on 2d arrays” -Mort I think sometime last tri**

- Index Out of Bound Exception: going over the bounds of array (e.g. you have a 5 element list called “array” but you use array[5] to access the last element)

- Misusing .get()/[]: .get() function is used to get a specific item in an ArrayList, while the square brackets “[]” are used to access specific elements in arrays 

- Jagged Arrays: not all 2d arrays in Java have the same column sizes, so assuming that all 2d arrays are congruent might lead to index out of bounds exceptions

- Not Initializing 2D Arrays Correctly: when initializing 2d arrays, make sure to follow this format: int[][] arr  = new int[a][b], where your a and b are your row and column size.

- Copying Arrays Incorrectly: using = to copy an array only creates a reference copy, not an actual copy. 

