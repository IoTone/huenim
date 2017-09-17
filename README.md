# Overview

Control Philips HUE lighting using nimlang.  This is a first cut at a simple API that covers lighting on/off, brightness, XY color gamut, and color temp.

No group control yet, and lots more to do.  Will eventually add a nimble package.

## Prerequisites

- nim 0.17.x

## Setup

- Run ./setup-deps.sh

## Build

- nim c -d:ssl src/huenim.nim 
- nim c -d:ssl tests/runTests.nim
