When compiling use:
link helloWorld.obj /subsystem:console /entry:main /out:helloWorld.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib

with those specific libraries as for some reason it will not compile otherwise maybe a pathing issue idrk

Download nasm and Visual Studio Code 2016 for the compiler and linker***