---
layout: post
comments: true
title: FRQ - 2D Arrays
description: Free Response Question - 2018 2D Arrays
menu: nav/CSA_Units/frqs/per3-2Darrays.html
permalink: /csa/p3-2darrays4
---
# Explanation of the 2018 AP CSA FRQ - Question 4 (Part B)

## Prior Knowledge 

1.	Helper Methods in the Problem

	•	getColumn(int[][] arr2D, int c): Returns an array containing all elements in column c of a 2D array.

	•	containsDuplicates(int[] arr): Returns true if the array contains duplicate values.

	•	hasAllValues(int[] arr1, int[] arr2): Returns true if all elements in arr1 are present in arr2.

2.	Latin Square Definition

	•	The first row has no duplicate values.

	•	All values in the first row appear in every row of the square.

	•	All values in the first row appear in every column of the square.

3. 	Preconditions

	•	The input array is guaranteed to be square (equal number of rows and columns).
	
	•	At least one row exists in the array.

## Solution 

```java

public static boolean isLatin(int[][] square)
{
    if (containsDuplicates(square[0]))
    {
      return false;
    }
    for (int r = 1; r < square.length; r++)
    {
      if (!hasAllValues(square[0], square[r]))
      {
        return false;
      }
    }   
    for (int c = 0; c < square[0].length; c++)
    {
        if (!hasAllValues(square[0], getColumn(square, c)))
        {
            return false;
        }

    }
    return true;

}

## Explanation of the Solution

1.	Checking the First Row for Duplicates

	•	The method starts by using containsDuplicates(square[0]) to ensure that the first row contains no duplicate values. If duplicates are found, the square cannot be a Latin square.
2.	Validating Rows and Columns Against the First Row

	•	The method checks that all the values in the first row appear in every other row and column. It uses hasAllValues(square[0], square[i]) for rows and hasAllValues(square[0], getColumn(square, i)) for columns to verify this.
3.  Returning the Final Result

	•	If all checks pass, the method returns true, meaning the input is a Latin square. If any check fails, it returns false.

## Meets the Latin Square Requirement

	•	No duplicates in the first row.

	•	All rows contain the same values as the first row.
    
	•	All columns contain the same values as the first row.

[Scoring Guidelines](https://github.com/user-attachments/assets/f360a2cd-605d-47f4-868f-a1aacf71f375)
