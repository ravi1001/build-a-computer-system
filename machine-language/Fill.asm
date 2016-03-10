// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

@8192
D=A   // screen memory map size is 8K

@total_word_count
M=D

@counter
M=0   // counter initialized to 0

(LOOP)   // infinite loop listening to the keyboard input
    @KBD
    D=M   // read the keyboard input

    @BLACK
    D;JNE   // if key is pressed blacken the screen

    @counter   // key is not pressed, whiten the screen
    M=0

    (WHITE_LOOP)
        @counter
        D=M   // read counter

        @total_word_count
        D=D-M   // check if all words in screen memory map have been reset

        @LOOP
        D;JGE   // if all pixels have been written to screen, exit the loop

        @counter
        D=M   // read counter

        @SCREEN
        A=A+D   // add screen base address and counter to get current word
        M=0   // make pixels white for this memory word

        @counter
        M=M+1   // increment counter

        @WHITE_LOOP
        0;JMP   // repeat the loop


    (BLACK)   // a key has been pressed
        @counter
        M=0

        (BLACK_LOOP)
            @counter
            D=M   // read counter

            @total_word_count
            D=D-M   // check if all words in screen memory map have been set

            @LOOP
            D;JGE   // if all pixels have been written to screen, exit the loop

            @counter
            D=M   // read counter

            @SCREEN
            A=A+D   // add screen base address and counter to get current word
            M=-1   // make pixels black for this memory word

            @counter
            M=M+1   // increment counter

            @BLACK_LOOP
            0;JMP   // repeat the loop




