## mygrep.sh

mygrep.sh is a mini version of the grep command-line tool, written in Bash, that allows users to search for strings within files with support for basic options like showing line numbers and inverting the match.

## 1- Features

- **Search for a string in a file (case-insensitive by default).** 

- **Show line numbers for each matching line using the -n option.**

- **Invert the match to display non-matching lines using the -v option.**

- **Supports combined options such as -vn or -nv.**

## 2- Usage

Basic Command Syntax
```bash
./mygrep.sh [options] pattern filename
````
**Options**
- **-n : Show line numbers for each matching line.**

- **-v : Invert the match (print lines that do not match the pattern).**

- **--help : Display usage information.**

**Examples**

- **Search for "hello" in testfile.txt:**
```bash
./mygrep.sh "hello" testfile.txt
```
- **Search for "hello" with line numbers:**
```bash
./mygrep.sh -n "hello" testfile.txt
```
- **Search for "hello" and show lines that do not match:**
```bash
./mygrep.sh -v "hello" testfile.txt
```
- **Search for "hello" with line numbers and invert match:**
```bash
./mygrep.sh -vn "hello" testfile.txt
```

## 3- How it works
**1.** The script takes a **search pattern** and a **filename** as input.

**2.** It accepts options like:

   - ```-n```  to display line numbers.

   - ```-v``` to invert the match and show non-matching lines.
   
   - ```-vn``` to display the lines that do not match the given pattern along with their corresponding line numbers.

**3.** The script then reads the file line by line, checking for the search pattern and applying the specified options.



## 4- Notes
   - The pattern search is **case-insensitive** by default.
   - Supports combined options like ```-vn``` or ```-nv```
