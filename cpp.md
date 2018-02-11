# kompilacja za pomocą c++11
g++ -std=c++11 -o a.out file.cpp

# linkowanie bibliotek matematycznych
gcc -lm file.cpp

# inne opcje 
-c prekompilacja bibliotek
-Wall       wszystkie warningi
-pedantic   dodatkowe info
-O2         optymalizacja kodu (1..3)

# makefile
---- makefile ----
compile_file_c: file.cpp
  g++ file.cpp -o file.o
---- makefile ----

# bash
---- bashfiele.sh ----
#!/bin/bash
chmod +x *.sh
---- bashfiele.sh ----
