
Here’s the README.md file for the provided content:

Simple Compiler
This project is a basic compiler developed for an undergraduate course in Program Translation.

Getting Started
1. Build the Compiler
To compile the project, simply run:

make

2. Create a Program File
Create a program file, for example, myprogram.txt, with the following content:

plaintext
Copy code
! myprogram.txt !
program
var num
start
  let num = 42 ,
  print num ,
end
3. Compile the Program
Compile the program into assembly code by running:

bash
Copy code
$ comp myprogram.txt
4. Run the Assembly Code
Use the interpreter to execute the compiled assembly code:

bash
Copy code
$ asmb myprogram.asm
Language Features and Sample Programs
Variables
plaintext
Copy code
program
var num
start
  let num = 42 ,
  print num ,
end
Output:

plaintext
Copy code
42
Loops
plaintext
Copy code
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

plaintext
Copy code
0
1
2
Conditionals
plaintext
Copy code
program
start
  if (10 > 5)
    print 1 ,
  ,
end
Output:

plaintext
Copy code
1
Supported Operators
> - Greater than
< - Less than
: - Equals
Arithmetic and Expressions
plaintext
Copy code
program
start
  print #(((2 + 2) * 3) / 4) ,
end
Output:

plaintext
Copy code
-3
Note: The # operator denotes negation.

Input Handling
plaintext
Copy code
program
start
  var num
  read num ,
  print num ,
end
This program will print the user’s input.

Comments
plaintext
Copy code
program
start
  ! This is a comment !
  print 1 ,
end