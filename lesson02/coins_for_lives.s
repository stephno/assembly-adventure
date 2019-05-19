; File: coins_and_lives.s
; Description: Check whether the player has 100 coins in exchange for 1 life.


; Load some values
lda #$00    ; Number of coins.
sta $0000   ; Store coins in memory at $00:0000.
lda #$03    ; Number of lifes.
sta $0001   ; Store coins in memory at $00:0001.

; Check the number of coins
lda $0000   ; Load the number of code.
cmp #100    ; Compare value at $00:0000 to 100.
bcc Done    ; If Player doesn’t have 100, we’re done. Else, we go on.
lda #$00
sta $0000   ; Reset the coin counter.
lda $0001   ; Load the number of lifes.
clc
adc #01     ; Add 1 life.
sta $0001

Done: