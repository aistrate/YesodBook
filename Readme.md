To generate compile output into directory 'bin', add this line to ~/.bashrc:

    alias ghb='ghc -outputdir ./bin -o ./bin/Main '

Afterwards, call the compiler like this:

    ghb helloworld.hs
