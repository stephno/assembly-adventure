; File: nihil.s
; Description: A very first SNES game.

; Assembler Directives
.p816       ; The 65816 code.
.i16        ; X and Y registers are 16 bit.
.a8         ; A register is 8 bit.


.segment "CODE"
.proc   ResetHandler        ; Program entry point.
        sei                 ; Disable interrupts.
        clc                 ; Clear the carry flag…
        xce                 ; … and switch to native mode.

        lda #$81            ; Enable…
        sta $4200           ; … non-maskable interrupt.

        jmp GameLoop        ; Initialization done, jump to game loop.
.endproc

.proc   GameLoop
        wai                 ; Wait for NMI interrupt.
        jmp GameLoop
.endproc

.proc   NMIHandler          ; NMIHandler, called every frame/V-blank.
        lda $4210           ; Read NMI status.
        rti                 ; Interrupt done, return to main game loop.
.endproc


; Interrupt and Reset vectors for the 65816 CPU
.segment "VECTOR"
; native mode       COP,        BRK,            ABT,
.addr               $0000,      $0000,          $0000
;                   NMI,        RST,            IRQ
.addr               NMIHandler, $0000,          $0000

.word               $0000,      $0000   ; Four unused bytes.

; emulationn m.     COP,        BRK,            ABT
.addr               $0000,      $0000,          $0000
;                   NMI,        RST,            IRQ
.addr               $0000,      ResetHandler,   $0000