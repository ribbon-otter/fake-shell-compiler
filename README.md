# Fake Shell Compiler
Shell scripts can be useful for cheap automation at the possible cost of safety. However, Shell scripts are interpreted and thus are too slow for heavy computation. If only there was some way of compiling down shell scripts into a blazing fast binary.

**Fake Shell Compiler** is not that. While at first glance it may appear to compile shell scripts by creating executable binaries, it actually does nothing of the sort. Fake Shell Compiler embeds the source into a binary with a single call `/bin/sh` to execute that string.

Fake Shell Compiler is even more a fake compiler than the utilities like [py2exe](http://py2exe.org/) which bundle the interpreter into the binary, as Fake Shell Compiler outputs files with all the dependencies of the original files. It is effectively the binary equivalent of a shebang.

I do not know of a single advantage this "compiler" has over a shebang. Thus, I recommend against using Fake Shell Compiler for any purpose besides personal amusement.

## Usage

    ./fakeshellcompiler.sh example.sh

Outputs a file named `example.sh.out`. Execute that file.

	./example.sh.out

Arguments can be passed to the binary file

    ./example.sh.out 'hello world'

Run `strings` on the binary to see your shell script sitting inside the binary.

    strings example.sh.out

# License

MIT License

Copyright (c) 2019 ribbon-otter

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice (including the next paragraph) shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

