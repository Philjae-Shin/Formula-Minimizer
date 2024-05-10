# Formula Minimizer

## Introduction
The Formula Minimizer is a Haskell-based tool designed to efficiently reduce symbolic arithmetic expressions. It handles operations involving addition, multiplication, and integer exponentiation. This project leverages functional programming paradigms to ensure concise and correct implementations.

## Features
- **Simplification of Expressions:** Reduces complex arithmetic expressions by eliminating unnecessary elements, such as multiplication by one or addition of zero.
- **Support for Polynomial and Non-Polynomial Expressions:** Handles both basic arithmetic and polynomial expressions.
- **Interactive Evaluation:** Utilizes a command-line interface for direct interaction and testing of simplification algorithms.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/henry3361/Formula-Minimizer.git

## Useful cabal commands

- Update package list: `cabal update`
- Compile Simplify.hs and tests: `cabal build`
- Run tests: `cabal test`
- Open Simplify.hs in GHCi: `cabal repl`

## Compiling and running tests
-  Run cabal update (this will update your package list for Haskell libraries)
-  Run cabal build (this will build your project and the tests, which may take a little while the first time)
-  Run cabal test (this will run the tests)

## Update cabal

      cabal update


## Build the project (requires Haskell and Cabal):

      cabal build


## Usage

After building the project, you can run the simplifier using:
     
      cabal run


To perform simplifications, input expressions in the format specified by the application's guidelines. The tool supports both direct command-line inputs and file-based expression processing.

## Contributing

Contributions to the Formula Minimizer are welcome. Please feel free to fork the repository, make improvements, and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.
