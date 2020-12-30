# Study Guide

- Closures and scope
    - How blocks work, and when we want to use them.
    - Blocks and variable scope
    - Write methods that use blocks and procs
    - Methods with an explicit block parameter
    - Arguments and return values with blocks
    - When can you pass a block to a method
    - &:symbol
- Testing With Minitest
    - Testing
    - Minitest vs. RSpec
    - SEAT approach
    - Assertions
- Core Tools/Packaging Code
    - Purpose of core tools
    - Gemfiles

- Regular Expressions

- budget 2h for the last problem
- be comfortable for working with test cases for your problem
- but you may not have to write them yourself - maybe provided
- make sure you're comfortable with medium/easy


# Closures

- Ryan: Block of code you can execute at any time in your program with a yield.

- pauline: closures are bits of code and lexical context (access to local variables, global variable, method calls) that can be excecuted later. they have access to the bindings which is scope encapsutated. closures in rubys are blocks, procs, and lambda (a type of proc) blocks are unnamed but procs can be pointed to from a variable.

- Joseph: a closure is a piece of code that can be executed at a later time. They bind its surronding artifacts. Closures are blocks, procs and lambdas

- clarissa: a closure is a piece of code that saves its local context (including variables and methods) so that it can be executed in some other context, retaining access to those variables and methods it had access to when defined. (ruby examples include blocks, procs, lambdas)

- Ezra: Closures are "blocks" of code that envelope their environment to retain access to the scope of the "block" at definition