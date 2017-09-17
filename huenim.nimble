# Package

version       = "0.1.0"
author        = "David J. Kordsmeier"
description   = "The TalkingLights Kit"
license       = "MIT"

srcDir = "src"
bin = @["huenim"]

# Dependencies

requires "nim >= 0.17.0"
requires "docopt >= 0.6.5"

task test, "Run the huenim tester-er":
  withDir "tests":
    exec "nim c -r runTests"

