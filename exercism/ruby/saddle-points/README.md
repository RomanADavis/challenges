# Saddle Points

Detect saddle points in a matrix.

So say you have a matrix like so:

```plain
    0  1  2
  |---------
0 | 9  8  7
1 | 5  3  2     <--- saddle point at (1,0)
2 | 6  6  7
```

It has a saddle point at (1, 0).

It's called a "saddle point" because it is greater than or equal to
every element in its row and the less than or equal to every element in
its column.

A matrix may have zero or more saddle points.

Your code should be able to provide the (possibly empty) list of all the
saddle points for any given matrix.

Note that you may find other definitions of matrix saddle points online,
but the tests for this exercise follow the above unambiguous definition.

* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called
`hello_world_test.rb`, you can run the following command:

    ruby hello_world_test.rb

To include color from the command line:

    ruby -r minitest/pride hello_world_test.rb

The test files may have the execution bit set so you may also be able to
run it like this:

    ./hello_world_test.rb

## Source

J Dalbey's Programming Practice problems [http://users.csc.calpoly.edu/~jdalbey/103/Projects/ProgrammingPractice.html](http://users.csc.calpoly.edu/~jdalbey/103/Projects/ProgrammingPractice.html)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

