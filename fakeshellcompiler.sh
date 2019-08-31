#!/bin/sh -e
#licensed under the MIT licence
#see README file

if test ! -n "$1" ; then
	echo 'Please supply command argument for file to '\"compile\" > /dev/stderr.
	exit
fi

if test $1 = '-h' || test "$1" = '--help' ; then
	echo 'usage: ./fakeshellcompiler <shellscript>'
	echo 'creates a binary file named <shellscript>.out'
	exit
fi

if test ! -f $1 ; then
	echo "File '$1' does not exist or is not a regular file" > /dev/stderr
	exit
fi

#quote the source to make it valid for inserting
#into C source
quotedShellFile=`sed 's/\\\\/\\\\\\\\/g' < $1 | #escape backslashes
   	sed 's/"/\\\\"/g' | #escape double quotes
   	sed 's/^/"/g' | # a double quote at the beginning
   	sed 's/$/\\\\n"/g'` # a backslash, n and double quote at the end

#choose a temporary file
tmpname=/tmp/fake_shell_build_file_`date +%N`.c 

#create a C source file that calls a system command
#which runs the shell interpreter and 
#interprets the constant string.

cat > $tmpname <<END
#include <unistd.h>
int main( int argc, char *argv[] ) {
	
	char *file = 
$quotedShellFile;

	char* memory[argc+4];

	memory[0] = "sh";
	memory[1] = "-c";
	memory[2] = file;

	for (int i = 0; i < argc; ++i) {
		memory[i+3] = argv[i];
	}

	memory[argc+3] = (char *) NULL;

	execv("/bin/sh", memory);
}
END

#compile the c source down into a binary
cc -o $1.out $tmpname

#clean up the tmpfile
rm $tmpname
