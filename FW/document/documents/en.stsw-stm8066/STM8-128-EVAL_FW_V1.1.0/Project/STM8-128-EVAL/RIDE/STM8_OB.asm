;This file contains the values to program in the option bytes.
;You can change the values below according to the device datasheet.
;Be careful to respect the complement bytes,
; or the default values of the option bytes will be used.

;See the device datasheet for more information on the meaning of each bit.

cseg at 04800h

db 000h ;LOCKBYTE

db 000h ;OPT1
db 0FFh ;NOPT1

db 080h ;OPT2
db 07Fh ;NOPT2

db 008h ;OPT3
db 0F7h ;NOPT3

db 000h ;OPT4
db 0FFh ;NOPT4

db 000h ;OPT5
db 0FFh ;NOPT5

db 000h ;OPT6
db 0FFh ;NOPT6

db 001h ;OPT7
db 0FEh ;NOPT7

end

