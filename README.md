# Knight Travails

This project is part of The Odin Project: [Knight Travails](https://www.theodinproject.com/lessons/ruby-knights-travails) in Ruby curriculum

## Assignment

Your task is to build a function `knight_moves` that shows the shortest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

* `knight_moves([0,0],[1,2]) == [[0,0],[1,2]]`

1. Think about the rules of the board and knight, make sure to follow them.
2. For every square there is a number of possible moves, choose a data structure that will allow you to work with them . Don’t allow any moves to go off the board.
3. Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
4. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:

```bash
  > knight_moves([3,3],[4,3])
  => You made it in 3 moves!  Here's your path:
    [3,3]
    [4,5]
    [2,4]
    [4,3]
```
