; Example of a subroutine

; Switch to emulation mode, set X and Y to 16-bit
clc         ; clear the carry flag…
xce         ; … and exchange with emulation flag.
rep #$10    ; clear the Index Register select flag.
sep #$20    ; set the Memory/Accumulator select flag.
; Set the stack pointer to $1fff
ldx #$1fff
txs         ; copy X to the SP.

; Load values into X and Y
ldx #$1212
ldy #$cccc
jsr AddXtoY ; jump to subroutine.
; Y = $1212 + $cccc = $dede
brk         ; stop execution.

; Subroutine AddXtoY
AddXtoY:
    rep #$20    ; set A to 16-bit.
    phx         ; save X on stack.
    tya         ; transfer the value of Y to A.
    clc         ; clear carry flag for addition.
    adc $01,S   ; add X to A, X is stored on Stack.
    tay         ; copy A into Y, result now in Y.
    plx         ; clean up SP.
    rts         ; return from subroutine.