#!/bin/bash



greeting () {
  echo Hello $1
}

goodbye () {
  echo "Goodbye $1 and $2"

}

greeting "Andrew"
goodbye "David" "James" "Lily"