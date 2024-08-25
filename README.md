# Simple Compiler

This project is a basic compiler developed for an undergraduate course in Program Translation.

## Getting Started

### 1. Build the Compiler

To compile the project, simply run:

```bash
make

2. Create a Program File
Create a program file, for example, myprogram.txt, with the following content:

! myprogram.txt !
program
var num
start
  let num = 42 ,
  print num ,
end

$ comp myprogram.txt

$ asmb myprogram.asm

program
var num
start
  let num = 42 ,
  print num ,
end

42

program
var i
start
  let i = 0 ,
  iter (i < 3)
    start
      print i ,
      let i = (i + 1) ,
    end ,
  ,
end
Output:
0
1
2
