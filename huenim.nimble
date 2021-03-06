# Package

version       = "0.1.1"
author        = "David J. Kordsmeier"
description   = "Huenim"
license       = "MIT"

srcDir = "src"
bin = @["huenim"]

# Dependencies

requires "nim >= 0.17.0"
requires "docopt >= 0.6.5"

task test, "Run the huenim tester-er":
  withDir "tests":
    exec "nim c -r runTests"

