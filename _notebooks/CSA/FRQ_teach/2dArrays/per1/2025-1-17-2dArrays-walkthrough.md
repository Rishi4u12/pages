---
layout: post
comments: true
title: FRQ - 2D Arrays Walkthrough
menu: nav/FRQ_teach/p1-2darrays.html
permalink: /csa/p1-frq-2darrays/walkthrough
---
# Walkthrough 2024 FRQ #4

## Take 3 mins to think about how to solve this (answer in pseudocode)

## Part A:

### Section 1:


```python
public Location getNextLoc(row, col)
{
    if (row = grid.length - 1)
{

```

### SECTION 2:


```python
else if (grid(row + 1)(col) < grid(row)(col + 1)) // Should be square brackets [ ] for row/columns
{ 
return new Location(row + 1, col); 
} 
```

### LOTS OF ERRORS FIND THEM:


```python
public Location getNextLoc(int row, int col)
{
    int rows = 0;
    if (row == grid.length)
    {
        return new Location(row, col + 1);
    }
    else if (col == grid[0].length)
    {
        System.out.println(“Check last column”);
        return new Location(row + 1, col);
    }
    else if (grid[row + 1][col] < grid[row][col + 1])
    {
        return new Location(row + 1, col);
    }
    else
    {
        return; 
    }
}
```

### CORRECT ANSWER:


```python
public Location getNextLoc(int row, int col)
{
 if (row == grid.length – 1)
 {
 return new Location(row, col + 1);
 }
 else if (col == grid[0].length – 1)
 {
 return new Location(row + 1, col);
 }
 else if (grid[row + 1][col] < grid[row][col + 1])
 {
 return new Location(row + 1, col);
 }
 else
 {
 return new Location(row, col + 1);
 }
}
```

## Part B

### SECTION 1:


```python
public int sumPath(int row, int col) { 
    int sum = 0; 
    while (row < grid.length || col < grid[0].length) { 
    } 
}
```

### SECTION 2:


```python
public int sumPath(int row, int col) { 
    int sum = 0; 
    while (row < grid.length – 1 || col < grid[0].length - 1) { 
    sum += grid[row][col]; 
    location loc = getNextLoc(row, col); 
    row = loc.getRow(); 
    col = loc.getCol(); 
    } 
}
```

### SECTION 3:


```python
public void sumPath(int row, int col) { 
    int sum = 0; 
    int maxSum = 0;
    while (row < grid.length – 1 || col < grid[0].length - 1) { 
    sum += grid.get(row).get(col); 
    Location loc = getNextLoc(row, col); 
    row = loc.getRow(); 
    col = loc.getCol();
    } 
    return sum + grid.get(row).get(col); 
}
```

### CORRECT ANSWER:


```python
public int sumPath(int row, int col)
{
 int sum = 0;
 while (row < grid.length – 1 || col < grid[0].length - 1)
 {
 sum += grid[row][col];

 Location loc = getNextLoc(row, col);
 row = loc.getRow();
 col = loc.getCol();
 }
 return sum + grid[row][col];
}
```
