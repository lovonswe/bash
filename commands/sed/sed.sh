#!/bin/bash

# flags
    ## p = print line two times
    ## g = global means a whole line
        ### -i = Edit the file in place without printing to the console (overwrite the file).
        ### -n = Suppress automatic printing of lines
            #    using it along with p flag only print the line single time instead of two times
            #    using it without p flag nothing will be printed
        ### -e = Allows multiple commands to be executed.
        ### -f = Reads sed commands from a file instead of the command line.
        ### -r = Enable extended regular expression

# sed first use : Replacing or substituting string/substring -> Sed command is mostly used to replace the text in a file. The below simple sed command replace the word "unix" with "linux" in the file.
# sed 's/pattern/new_word' filepath
sed 's/unix/linux/' geekfile.txt

# sed second use : Replacing the nth occcurence of a pattern in a file
sed 's/unix/linux/2' geekfile.txt   

# sed 3rd use : Replacing to nth occurence to all occurence in a line
sed 's/unix/linux/3g' geekfile.txt

sed '4 s/unix/linux/p' geekfile.txt

sed -n 's/unix/linux/p' geekfile.txt

sed '1,3 s/unix/linux/' geekfile.txt

sed '1, 3 s/unix/linux/g' geekfile.txt

# $ means last line
sed '3,$ s/unix/linux/' geekfile.txt

# delte 5th line
sed '5d' geekfile.txt

# delete line from 1 to 3
sed '1,3d' geekfile.txt

# delete line from  2 to last
sed '2,$d' geekfile.txt

# delete lines having pattern "unix"
sed '/unix/d' geekfile.txt

# for inserting a new line after full stop 
sed '/./a\This is new line.' geekfile.txt



# additional : 
# can we use regular expression here to replace multiple words having a common pattern?

