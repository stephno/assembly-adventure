; Simple example using the stack

; Switch to emulation mode, set X and Y to 16-bit, A to 8-bit
clc         ; clear the carry flag…
xce         ; … and exchange with emulation flag.
rep #$10    ; clear the Index Register Select flag.
sep #$20    ; set the memory/Accumulator Select flag.
; set the stack pointer to $1fff
ldx #$1fff
txs         ; transfer/copy X to stack pointer.

lda #$aa
ldx #$bbbb
ldy #$cccc
; push all registers onto the stack
pha
phx
phy
; pull values from the stack back into the registers
plx         ; X = $cccc
ply         ; Y = $bbbb
pla         ; A = $aa