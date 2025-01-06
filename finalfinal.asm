;-------------------------------SUDOKO GAME ON 9*9 GRID
;-------------------------------FINAL PROJECT BY ZAINAB KHALIL
;-------------------------------ROLL NO # L230942
;-------------------------------BSCS-3F
[org 0x100]

jmp gamestart 
;--------------------------------------
;--------------------------------------PROMPTS
;--------------------------------------
board: 
        dw 5,6,8,9,1,3,4,7,2
        dw 3,4,2,6,8,7,9,5,1
        dw 1,9,7,2,5,4,6,3,8
        dw 6,8,5,4,7,9,1,2,3
        dw 7,3,4,1,6,2,5,8,9
        dw 2,1,9,5,3,8,7,4,6
        dw 9,2,6,3,4,5,8,1,7
        dw 8,5,1,7,2,6,3,9,4
        dw 4,7,3,8,9,1,2,6,5
       easy_board: ;FOR EASY WIN CONDITION TO CHECK WIN
        dw 5,0,8,9,1,3,4,7,2
        dw 3,4,2,6,8,7,9,5,1
        dw 1,9,7,2,5,4,6,3,8
        dw 6,8,5,4,7,9,1,2,3
        dw 7,3,4,1,6,2,5,8,9
        dw 2,1,9,5,3,8,7,4,6
        dw 9,2,6,3,4,5,8,1,7
        dw 8,5,1,7,2,6,3,9,4
        dw 4,7,3,8,9,1,2,6,5
; easy_board: 
;             dw 0,0,8,0,1,0,0,0,2
;             dw 3,0,2,6,8,0,9,5,0
;             dw 1,9,0,0,0,4,0,0,8
;             dw 6,8,0,4,0,9,0,2,3
;             dw 0,0,0,0,6,2,5,8,0
;             dw 0,0,9,5,3,0,7,0,0
;             dw 0,2,6,3,0,5,8,0,0
;             dw 0,0,0,7,2,0,0,0,4
;             dw 4,0,3,0,0,0,2,0,0

medium_board: 
            dw 0,0,8,0,1,0,0,0,2
            dw 3,0,2,0,8,0,9,5,0
            dw 1,9,0,0,0,4,0,0,8
            dw 6,8,0,4,0,9,0,2,3
            dw 0,0,0,0,6,2,0,8,0
            dw 0,0,9,0,3,0,7,0,0
            dw 0,2,6,3,0,5,8,0,0
            dw 0,0,0,0,2,0,0,0,4
            dw 4,0,3,0,0,0,2,0,0
hard_board: 
            dw 0,0,8,0,1,0,0,0,0
            dw 3,0,2,0,8,0,0,5,0
            dw 1,9,0,0,0,4,0,0,8
            dw 6,0,0,4,0,9,0,2,3
            dw 0,0,0,0,6,2,0,8,0
            dw 0,0,9,0,3,0,7,0,0
            dw 0,2,6,3,0,0,8,0,0
            dw 0,0,0,0,2,0,0,0,4
            dw 4,0,3,0,0,0,2,0,0


notes_1: times 9*9 dw 0
notes_2: times 9*9 dw 0
notes_3: times 9*9 dw 0
notes_4: times 9*9 dw 0
notes_5: times 9*9 dw 0
notes_6: times 9*9 dw 0
notes_7: times 9*9 dw 0
notes_9: times 9*9 dw 0
notes_8: times 9*9 dw 0
SQUARE1 : db 254
win_condition: dw 1 ; 0 if lost, 1 if won
congrats : db "CONGRATULATIONS !"
youwon: db "YOU WON"
better: db "BETTER LUCK NEXT TIME :("
youlost: db "YOU LOST"
gameover: db "GAME OVER !"
f1: dw 0
f2 : dw 0
f3 : dw 0
f4 : dw 0
f5 : dw 0
f6 : dw 0
levelinput : dw 1
square : db 219
chooselevels: db "CHOOSE YOUR LEVEL"
easy_Lprint: db "EASY (E)"
medium_Lprint: db "MEDIUM (M)"
hard_Lprint: db "HARD (H)"
msg1: db "SUDOKO"
msg2: db "LEVEL : " 
easy_print: db "EASY"
hard_print: db "HARD"
medium_print: db "MEDIUM"
msg3: db "MISTAKES : "
msg4: db "SCORE : "
msg5: db "TIMER : "
msg6 : db " / 3"
msg7: db "NOTES : " 
msg8: db "ON"
msg9: db " / "
msg10: db "OFF"
msg11: db "ERASE (E) "
inst_str1 : db 'GAME INSTRUCTIONS'
inst_str2 : db '1- Use left click mouse and keyboard keys for input'
inst_str3 : db '2- Use up arrow key to scroll up'
inst_str4 : db '3- Use down arrow key to scroll down'
inst_str5 : db '4- Press E to turn on Erase and E again to turn it off '
inst_str6 : db '5- Press O to turn on Notes.'
inst_str7 : db '6- Press F to turn off Notes'
inst_str8 : db '8- Press any key to Continue'
inst_str10: DB '7- Press U to undo the previous move'
inst_str9 : db 'ENJOY!'
notescheck: dw 0 ; 0 for off , 1 for on
erasecheck: dw 0 ;0 for no erase 1 for erase
mis : db 0
score : dw 0
misascii: db 0
temptimer: db ":"
tempnumbers: db "1 2 3 4 5 6 7 8 9 "
tickcount: dw 0
minutes: dw 0
minutes_1: dw 0
tickcount_1: dw 0
seconds: dw 0
screennumber : dw 1 ; 1 for main 2 for scrolled
gameinputcheck: dw 0 ; 1 for input in game, 0 for external input
game_end_check: dw 0 ;0 for not end , 1 for end


music_length: dw 7800
music_data: incbin "sound1.imf"
music_data1: incbin "sound2.imf"
music_length1: dw 15644
music_data2: incbin "sound3.imf"	
            ;score,mistakes,boardindex,number
undo_data: dw 0,0,0,0
rn1:db 218, 196,196,196,196,196,191 
rn2:db 179,32,32,32,32,32,179
rn3:db 179,32,32,32,32,32,179
rn4:db 179,32,32,32,32,32,179
rn5:db 192,196,196,196,196,196,217

t1: db 196,196,196,196,196
t2: db 218
t3: db 194
t4: db 191

m1: db 195
m2: db 197
m3: db 180 

ll: db 179

b1: db 192
b2: db 193
b3 : db 217
counter : db 0
temp : dw 0

d11: db 32,32,32
d12: db 32,32,124
d13: db 32,32,124

d21: db 32,95,32
d22: db 32,95,124
d23: db 124,95,32

d31: db 32,95,32
d32: db 32,95,124
d33: db 32,95,124

d41: db 32,32,32
d42: db 124,95,124
d43: db 32,32,124

d51: db 32,95,32
d52: db 124,95,32
d53: db 32,95,124

d61: db 32,95,32
d62: db 124,95,32
d63: db 124,95,124

d71: db 32,95,32
d72: db 32,32,124
d73: db 32,32,124

d81: db 32,95,32
d82: db 124,95,124
d83: db 124,95,124

d91: db 32,95,32
d92: db 124,95,124
d93: db 32,95,124
x_coordinate: dw 0
y_coordinate: dw 0
input_number: dw 0
check_1: dw 0
check_2: dw 0
number_counter: dw 0
;--------------------------------------
;--------------------------------------CLEAR SCREEN
;--------------------------------------
clearscreen : 
mov ax, 0xb800 
 mov es, ax 
 mov di, 0 
nextchar: mov word [es:di], 0x5F20 
 add di, 2 
 cmp di, 4000 
 jne nextchar 
 ret
;--------------------------------------
;--------------------------------------PRINT BIOS FUNCTION
;--------------------------------------
printbios: ;push string,attributes, row and column, length
                push bp
                mov bp,sp
                push cx
                push bx
                push ax
                push dx
                
                mov ah,0x13 
                mov al,0
                mov bh,0
                mov bl,[bp+8] 
                mov dx,[bp+6]
                mov cx,[bp+4]
                push cs
                pop es
                mov bp,[bp+10]
                int 0x10
                
                pop dx
                pop ax
                pop bx
                pop cx
                pop bp

                ret 8
;--------------------------------------
;--------------------------------------DELAY
;--------------------------------------
delay_1 :

        push bx
        push si

		mov bx,3
		mov si,3
	d_1:
		dec bx
		jnz d_1
		dec si
		cmp si,0    
		jnz d_1
	
        pop si
        pop bx 

    	ret
;--------------------------------------
;--------------------------------------START SCREEN SUDOKO
;--------------------------------------
print_sudoko:
; the ascii of the square sign is FE
    push bp
    mov bp,sp
    push ax
    push bx
    push cx
    
;push string,attributes, row and column, length
    mov bx,0x0317
    mov cx,4

print_S1: 
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    sub bx,1
    loop print_S1

mov cx,3
print_S2:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0100
    loop print_S2

mov cx,4
print_S3:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0001
    loop print_S3

mov cx,3
print_S4:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0100
    loop print_S4

mov cx,5
print_S5:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    sub bx,0x0001
    loop print_S5

mov bx,0x031A
mov cx,6
print_S6:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0100
    loop print_S6

mov cx,4
print_S7:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0001
    loop print_S7

mov cx,7
print_S8:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    sub bx,0x0100
    loop print_S8


add bx,0x0103
mov cx,6
print_S9:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0100
    loop print_S9

mov cx,4
print_S10:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0001
    loop print_S10

sub bx,0x0100
add bx,0x001
mov cx,5
print_S11:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    sub bx,0x0100
    loop print_S11

sub bx,0x0002
mov cx,4
print_S12:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    sub bx,0x0001
    loop print_S12

add bx,0x0009
mov cx,6
print_S13:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0100
    loop print_S13

mov cx,4
print_S14:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0001
    loop print_S14

mov cx,6
print_S15:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    sub bx,0x0100
    loop print_S15

mov cx,4
print_S16:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    sub bx,0x0001
    loop print_S16  

add bx,0x0007
mov cx,7
print_S17:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0100
    loop print_S17

sub bx,0x0400
add bx,0x0001
mov cx,4
mov si,bx
print_S18:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,si
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0001
    sub bx,0x0100
    add si,0x0101
    loop print_S18


add bx,0x0102
mov cx,6
print_S19:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0100
    loop print_S19

mov cx,4
print_S20:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    add bx,0x0001
    loop print_S20

mov cx,7
print_S21:
    mov ax,square
    push ax
    mov ax,0x5F
    push ax
    mov ax,bx
    push ax
    mov ax,1
    push ax
    call printbios
    call delay_1 
    sub bx,0x0100
    loop print_S21
    pop cx
    pop bx
    pop ax
    pop bp

    ret
;--------------------------------------
;--------------------------------------PRINT LEVELS
;--------------------------------------
print_levels :
push bp
mov bp,sp

;push string,attributes, row and column, length

push word chooselevels
push word 0x5F
push word 0x0E1F
push word 17
call printbios

call delay_1

push word easy_Lprint
push word 0x5F
push word 0x1116
push word 8
call printbios
push word medium_Lprint
push word 0x5F
push word 0x1122
push word 10
call printbios
push word hard_Lprint
push word 0x5F
push word 0x1130
push word 8
call printbios

pop bp
ret
;--------------------------------------
;--------------------------------------GET LEVEL INPUT
;--------------------------------------
get_level_input:
    mov ah,0x00
    int 0x16

    cmp al,'E'
    jne next_level_input_cmp
    mov word[levelinput],1
    jmp get_level_input_end

next_level_input_cmp:
    cmp al,'M'
     jne next_level_input_cmp_1
    mov word[levelinput],2
    jmp get_level_input_end

    next_level_input_cmp_1:
    mov word[levelinput],3


    get_level_input_end:
    ret 
;--------------------------------------
;--------------------------------------MAIN BOARD
;--------------------------------------
mainboard: 
    mov ax,0xb800
        mov es,ax
        mov di,0
    brdr:
        mov word[es:di],0x5F20 ; purple background white text
        add di,2
        cmp di,320
        jne brdr

        push msg1
        push 0x5F
        push 0x0025
        push 6
        call printbios

        push msg2
        push 0x5F
        push 0x0122
        push 8
        call printbios

        cmp word[levelinput],1
        jne next_level_print_title_1
        push easy_print
        push 0x5F
        push 0x012A
        push 4
        call printbios
        jmp rest_game_upper_timeline 
 next_level_print_title_1:
           cmp word[levelinput],2
        jne next_level_print_title_2
        push medium_print
        push 0x5F
        push 0x012A
        push 6
        call printbios
        jmp rest_game_upper_timeline 

next_level_print_title_2:
    push hard_print
        push 0x5F
        push 0x012A
        push 4
        call printbios
rest_game_upper_timeline :
        call timeline 

        call start4board

        ret
;--------------------------------------
;--------------------------------------TIMELINE
;--------------------------------------        
timeline : 
        mov ax,0xb800
        mov es,ax
        mov di,320
    brdr1:
        mov word[es:di],0x3F20 ; cyan background white text
        add di,2
        cmp di,640
        jne brdr1  

        push msg3
        push 0x3F
        push 0x0305
        push 10
        call printbios

        mov bx,[mis]
        add bx,0x30
        mov [misascii],bx
        push misascii
        push 0x3F
        push 0x0310
        push 1
        call printbios

        push msg6
        push 0x3F
        push 0x0311
        push 4
        call printbios

        push msg4
        push 0x3F
        push 0x0323
        push 8
        call printbios

        push word [score]
        push 0x003F ; attributes
        push 0x03 ; position x
        push 0x2B ; position y
        call printscore

        push msg5
        push 0x3F
        push 0x033C
        push 8
        call printbios

ret 
;--------------------------------------
;--------------------------------------PRint score
;--------------------------------------
printscore:
        push bp
        mov bp,sp
        push es
        push ax
        push bx
        push cx
        push dx
        push di

        mov ax,0xb800
        mov es,ax
        mov ax,[bp+10]
        mov bx,10
        mov cx,0

        nextdigit:
                    mov dx, 0 
                    div bx 
                    add dl, 0x30 
                    push dx 
                    inc cx 
                    cmp ax, 0 
                    jnz nextdigit

                    mov ax,0
                    mov al,80
                    mul byte[bp+6]
                    add ax,[bp+4]
                    shl ax,1
                    mov di,ax
        nextpos: 
                pop dx 
                mov dh,[bp+8]
                mov [es:di], dx 
                add di, 2 
                loop nextpos 
                pop di
                pop dx
                pop cx
                pop bx
                pop ax
                pop es
                pop bp
 

         ret 8
;--------------------------------------
;--------------------------------------TOP ROW
;--------------------------------------
toprow:
    push bp
    mov bp,sp
    push cx
    push bx

    push t2
    push 0x5B
    push word[bp+4]
    push 1
    call printbios

mov cx,8

 iterations:   
    add word[bp+4],1
    push t1
    push 0x5B
    push word[bp+4]
    push 5
    call printbios

    add word[bp+4],5
    push t3
    push 0x5B
    push word[bp+4]
    push 1
    call printbios

    loop iterations

    add word[bp+4],1
    push t1
    push 0x5B
    push word[bp+4]
    push 5
    call printbios
    add word[bp+4],5

    push t4
    push 0x5B
    push word[bp+4]
    push 1
    call printbios

    pop bx
    pop cx
    pop bp
ret 2
;--------------------------------------
;--------------------------------------MIDDLE ROW
;--------------------------------------
middlerow: 
 push bp
    mov bp,sp
    push cx
    push bx

    push m1
    push word[bp+6]
    push word[bp+4]
    push 1
    call printbios

mov cx,8

 iterations1:   
    add word[bp+4],1
    push t1
    push word[bp+6]
    push word[bp+4]
    push 5
    call printbios

    add word[bp+4],5
    push m2
    push word[bp+6]
    push word[bp+4]
    push 1
    call printbios

    loop iterations1

    add word[bp+4],1
    push t1
    push word[bp+6]
    push word[bp+4]
    push 5
    call printbios
    add word[bp+4],5

    push m3
    push word[bp+6]
    push word[bp+4]
    push 1
    call printbios

    pop bx
    pop cx
    pop bp
ret 4
;--------------------------------------
;--------------------------------------LEFT LINE
;--------------------------------------
leftline:
    push bp
    mov bp,sp
    push cx
    push bx

mov bx,[bp+4]
mov cx,3

ll1: 
    push ll
    push 0x5B
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll1

    add bx,0x6
    mov word[bp+4],bx
mov cx,3    
    ll2: 
    push ll
    push 0x5F
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll2
    
    add bx,0x6
    mov word[bp+4],bx
mov cx,3    
    ll3: 
    push ll
    push 0x5F
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll3

    add bx,0x6
    mov word[bp+4],bx
mov cx,3    
    ll4: 
    push ll
    push 0x5B
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll4

    add bx,0x6
    mov word[bp+4],bx
    mov cx,3    
    ll5: 
    push ll
    push 0x5F
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll5

    add bx,0x6
    mov word[bp+4],bx
    mov cx,3    
    ll6: 
    push ll
    push 0x5F
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll6

 add bx,0x6
    mov word[bp+4],bx
    mov cx,3    
    ll7: 
    push ll
    push 0x5B
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll7

     add bx,0x6
    mov word[bp+4],bx
    mov cx,3    
    ll8: 
    push ll
    push 0x5F
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll8

     add bx,0x6
    mov word[bp+4],bx
    mov cx,3    
    ll9: 
    push ll
    push 0x5F
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll9

add bx,0x6
    mov word[bp+4],bx
    mov cx,3    
    ll10: 
    push ll
    push 0x5B
    push word[bp+4]
    push 1
    call printbios
    add word[bp+4],0x0100
    loop ll10

    pop bx
    pop cx
    pop bp
    ret 2
;--------------------------------------
;--------------------------------------GRID OUTLINE
;--------------------------------------    
    start4board:
        mov ax,0xb800
        mov es,ax
        mov di,640
    stbdr:
        mov word[es:di],0x5F20 
        add di,2
        cmp di,4000
        jne stbdr  

        mov bx,0x050B
        push bx
        call toprow ;1
            
        mov bx,0x090B
        push 0x5F
        push bx
        call middlerow ;2
          
        mov bx,0x0D0B
        push 0x5F
        push bx
        call middlerow ;3

        mov bx,0x110B
        push 0x5B
        push bx
        call middlerow ;4
        
        mov bx,0x150B
        push 0x5F
        push bx
        call middlerow ;5

       mov bx,0x060B
       push bx
       call leftline

       mov bx,0x0A0B
       push bx
       call leftline

        mov bx,0x0E0B
        push bx
        call leftline

        mov bx,0x120B
        push bx
        call leftline

    ret
;--------------------------------------
;--------------------------------------SCROLL UP
;--------------------------------------
scrollup: ; push number of lines 
push bp
 mov bp,sp
 push ax
 push cx
 push si
 push di
 push es
 push ds

 mov ax, 80 ; load chars per row in ax
 mul byte [bp+4] ; calculate source position
 mov si, ax ; load source position in si
 push si ; save position for later use
 shl si, 1 ; convert to byte offset
 mov cx, 2000 ; number of screen locations
 sub cx, ax ; count of words to move
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov ds, ax ; point ds to video base
 xor di, di ; point di to top left column
 cld ; set auto increment mode
 rep movsw ; scroll up
 mov ax, 0x5F20 ; space in normal attribute
 pop cx ; count of positions to clear
 rep stosw ; clear the scrolled space
 pop ds
 pop es
 pop di
 pop si
 pop cx
 pop ax
 pop bp
 ret 2
;--------------------------------------
;--------------------------------------SCROLL DOWN 
;--------------------------------------
scrolldown: ;push number of lines
push bp
 mov bp,sp
 push ax
 push cx
 push si
 push di
 push es
 push ds

 mov ax, 80 ; load chars per row in ax
 mul byte [bp+4] ; calculate source position
 push ax ; save position for later use
 shl ax, 1 ; convert to byte offset
 mov si, 3998 ; last location on the screen
 sub si, ax ; load source position in si
 mov cx, 2000 ; number of screen locations
 sub cx, ax ; count of words to move
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov ds, ax ; point ds to video base
 mov di, 3998 ; point di to lower right column
 std ; set auto decrement mode
 rep movsw ; scroll up
 mov ax, 0x5F20 ; space in normal attribute
 pop cx ; count of positions to clear
 rep stosw ; clear the scrolled space
 pop ds
 pop es
 pop di
 pop si
 pop cx
 pop ax
 pop bp
 ret 2 

;--------------------------------------
;--------------------------------------PRINT SPACE
;--------------------------------------
printspace:
    push bp
    mov bp,sp
    mov ah,0x13 ;write string 
    mov al,0
    mov bh,0
    mov bl,0x5F ;purple background white text
    mov dx,[bp+4] ; row = 0, column = 5
    mov cx,1
    push cs
    pop es
    mov bp,32
    int 0x10 ;text display
    pop bp
    ret 2 
;--------------------------------------
;--------------------------------------BCD PRINTING 
;--------------------------------------
printbcd:
;push string1, string2, string 3, row+col

push bp
mov bp,sp

push word[bp+10]
push 0x5F
push word[bp+4]
push 3
call printbios

add word[bp+4],0x0100

push word[bp+8]
push 0x5F
push word[bp+4]
push 3
call printbios

add word[bp+4],0x0100

push word[bp+6]
push 0x5F
push word[bp+4]
push 3
call printbios

pop bp

ret 8
;--------------------------------------
;--------------------------------------PRINT 1
;---------------------------------------  
print1:
       ;push row and col
push bp
mov bp,sp

push d11
push d12
push d13
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------PRINT 2
;--------------------------------------
print2:
       ;push row and col
push bp
mov bp,sp

push d21
push d22
push d23
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------PRINT 3
;-------------------------------------- 
print3:
    ; push row and col
push bp
mov bp,sp

push d31
push d32
push d33
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------PRINT 4
;-------------------------------------- 
print4:
       ;push row and col
push bp
mov bp,sp

push d41
push d42
push d43
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------PRINT 5
;--------------------------------------
print5:
       ;push row and col
push bp
mov bp,sp

push d51
push d52
push d53
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------PRINT 6
;--------------------------------------  
print6:
       ;push row and col
push bp
mov bp,sp

push d61
push d62
push d63
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------PRINT 7
;--------------------------------------
print7:
       ;push row and col
push bp
mov bp,sp

push d71
push d72
push d73
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------PRINT 8
;-------------------------------------- 
print8:
  ;push row and col, 
push bp
mov bp,sp

push d81
push d82
push d83
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------PRINT 9
;--------------------------------------
print9:
       ;push row and col
push bp
mov bp,sp

push d91
push d92
push d93
push word[bp+4]
call printbcd

pop bp

ret 2
;--------------------------------------
;--------------------------------------UP BOARD INITIALISE
;--------------------------------------
initialiseupboard:
    push bp
    mov bp,sp
    push ax
    
    mov ax,0
    mov ax,[levelinput]
    cmp ax,1
    jne next_1
    push word easy_board 
    jmp funccall_1

    next_1:
    cmp ax,2
    jne next_2
    push word medium_board 
    jmp funccall_1
    next_2:
    push word hard_board
    funccall_1:
    call initialiseupboard_1
    
    pop ax
    pop bp
    ret
;--------------------------------------
;--------------------------------------UP BOARD INITIALISE 1
;--------------------------------------
initialiseupboard_1:
    push bp
    mov bp,sp
    ; start row 1 col 1 = 0x060D
    ; row 1 col 2 = 0x0613
    ; row 2 col 1 = 0x0A19
    mov cx,0
    mov dx,0x060D
    mov si,0
    mov bx,[bp+4]
    ini_1:
        mov ax,[bx+si]
        ;cmp ax,0
        ;je print_0 
        cmp ax,1
        je print_1
        cmp ax,2
        je print_2
        cmp ax,3 
        je print_3
        cmp ax,4
        je print_4
        cmp ax,5
        je print_5
        cmp ax,6
        je print_6
        cmp ax,7
        je print_7
        cmp ax,8
        je print_8
        cmp ax,9
        je print_9
    ini_2:
        add dx,0x06
        add si,2
        add cx,1
        cmp cx,9
        je n1
        cmp cx,18
        je n2
        cmp cx,27
        je n3
        cmp cx,36
        jl ini_1
        jmp iniend

    n1: 
        mov dx,0x0A0D
        jmp ini_1
    n2:
        mov dx,0x0E0D
        jmp ini_1
    n3:
        mov dx,0x120D
        jmp ini_1

    print_1 :
    push dx
    call print1
    jmp ini_2

    print_2 :
     push dx
    call print2
    jmp ini_2

    print_3 :
     push dx
    call print3
    jmp ini_2

   print_4 :
    push dx
    call print4
    jmp ini_2

    print_5 :
     push dx
    call print5
    jmp ini_2

    print_6 :
     push dx
    call print6
    jmp ini_2

   print_7 :
    push dx
    call print7
    jmp ini_2

    print_8 :
     push dx
    call print8
    jmp ini_2

    print_9 :
     push dx
    call print9
    jmp ini_2
    
    
   iniend: 
    pop bp
    ret 2
;--------------------------------------
;--------------------------------------BOTTOM ROW
;--------------------------------------
bottomrow:
    push bp
    mov bp,sp
    push cx
    push bx

    push b1
    push 0x5B
    push word[bp+4]
    push 1
    call printbios

mov cx,8

 brloop1:   
    add word[bp+4],1
    push t1
    push 0x5B
    push word[bp+4]
    push 5
    call printbios

    add word[bp+4],5
    push b2
    push 0x5B
    push word[bp+4]
    push 1
    call printbios

    loop brloop1

    add word[bp+4],1
    push t1
    push 0x5B
    push word[bp+4]
    push 5
    call printbios
    add word[bp+4],5

    push b3
    push 0x5B
    push word[bp+4]
    push 1
    call printbios

    pop bx
    pop cx
    pop bp
ret 2
;--------------------------------------
;--------------------------------------START SCREEN 2
;--------------------------------------
start5board:

    mov bx,0x020B
    push bx
    call leftline

    mov bx,0x060B
    push bx
    call leftline
            
     mov bx,0x0A0B
    push bx
    call leftline   

    mov bx,0x0E0B
    push bx
    call leftline  

    mov bx,0x120B
    push bx
    call leftline  

        mov bx,0x050B
        push 0x5F
        push bx
        call middlerow ;2
          
        mov bx,0x090B
        push 0x5B
        push bx
        call middlerow ;3

        mov bx,0x0D0B
        push 0x5F
        push bx
        call middlerow ;4
        
        mov bx,0x110B
        push 0x5F
        push bx
        call middlerow ;
        
        mov bx,0x150B
        push bx
        call bottomrow ;
    ret
;--------------------------------------
;--------------------------------------LOWER BOARD
;--------------------------------------
lowerboard: 
    mov ax,0xb800
        mov es,ax
        mov di,3520
     brdr2:
        mov word[es:di],0x3F20 ; cyan background white text
        add di,2
        cmp di,4000
        jne brdr2

    cmp word[erasecheck],1
    je printdifferase
    push msg11
    push 0x3F
    push 0x1707
    push 9
    call printbios
    jmp restlowerboard
    printdifferase:
        push msg11
    push 0x5F
    push 0x1707
    push 9
    call printbios
restlowerboard:
    push msg7
    push 0x3F
    push 0x1717
    push 8
    call printbios

    cmp word[notescheck],1
    je notes_on_printing
push msg8
    push 0x3F
    push 0x171F
    push 2
    call printbios

    push msg9
    push 0x3F
    push 0x1721
    push 3
    call printbios
    push msg10
    push 0x5F
    push 0x1724
    push 3
    call printbios
    jmp rest_lower_printing
    notes_on_printing:
    push msg8
    push 0x5F
    push 0x171F
    push 2
    call printbios

    push msg9
    push 0x3F
    push 0x1721
    push 3
    call printbios
    push msg10
    push 0x3F
    push 0x1724
    push 3
    call printbios
   rest_lower_printing:
    push tempnumbers
    push 0x3F
    push 0x1631
    push 18
    call printbios

    ;number counting 
    mov cx,1
    mov ax, 0x31

    loop_print_counter:

        push cx
        call counter_board ; return value in counter                     
        push word [number_counter]
        push 0x0035
        push 0x17
        push ax
        call printscore
        add ax,2
        add cx,1
        cmp cx,9
        jle loop_print_counter


ret 
;--------------------------------------
;--------------------------------------NUMBER COUNTER
;--------------------------------------
counter_board:
    
    push bp
    mov bp,sp
    push si
    push ax
    push bx
    push dx
    push cx
    
xor dx,dx
mov dx,[bp+4]; contains value i need to check
mov ax,[levelinput]
    cmp ax,1
    jne counter_add_1
    mov bx, easy_board 
    jmp counter_loop_1


    counter_add_1:
    cmp ax,2
    jne counter_add_2

    mov bx,medium_board 
    jmp counter_loop_1
    counter_add_2:
    mov bx, hard_board
    
    counter_loop_1:
        mov word[number_counter],0
        mov si,0
        mov cx,81
        counter_loop_11:

        cmp [bx+si],dx
        jne loopcounter
        add word[number_counter],1
    loopcounter:    
        add si,2
        loop counter_loop_11

    pop cx
    pop dx
    pop bx
    pop ax
    pop si
    pop bp
    ret 2
;--------------------------------------
;--------------------------------------DOWN BOARD INITIALISE 
;--------------------------------------
initialisedownboard:
    push bp
    mov bp,sp
    mov ax,[levelinput]
    cmp ax,1
    jne next_3
    push word easy_board 
    jmp funccall_2

    next_3:
    cmp ax,2
    jne next_4
    push word medium_board 
    jmp funccall_2
    next_4:
    push word hard_board
    
    funccall_2:
        call initialisedownboard_1
    pop bp
    ret
;--------------------------------------
;--------------------------------------DOWN BOARD INITIALISE 1
;--------------------------------------
initialisedownboard_1:
    push bp
    mov bp,sp
    ; start row 1 col 1 = 0x060D
    ; row 1 col 2 = 0x0613
    ; row 2 col 1 = 0x0A19
    mov cx,0
    mov dx,0x020D
    mov bx,72
    mov si,[bp+4]
    ini_3:
        mov ax,[si+bx]
        cmp ax,1
        je print_11
        cmp ax,2
        je print_22
        cmp ax,3 
        je print_33
        cmp ax,4
        je print_44
        cmp ax,5
        je print_55
        cmp ax,6
        je print_66
        cmp ax,7
        je print_77
        cmp ax,8
        je print_88
        cmp ax,9
        je print_99
    ini_4:
        add dx,0x06
        add bx,2
        add cx,1
        cmp cx,9
        je n4
        cmp cx,18
        je n5
        cmp cx,27
        je n6
        cmp cx,36
        je n7
        cmp cx,45
        jle ini_3
        jmp downend
    n4: 
        mov dx,0x060D
        jmp ini_3
    n5:
        mov dx,0x0A0D
        jmp ini_3
    n6:
        mov dx,0x0E0D
        jmp ini_3
    n7:
        mov dx,0x120D
        jmp ini_3


    print_11 :
    push dx
    call print1
    jmp ini_4

    print_22 :
    push dx
    call print2
    jmp ini_4

    print_33 :
    push dx
    call print3
    jmp ini_4

   print_44 :
   push dx
    call print4
    jmp ini_4

    print_55 :
    push dx
    call print5
    jmp ini_4

    print_66 :
    push dx
    call print6
    jmp ini_4

   print_77 :
   push dx
    call print7
    jmp ini_4

    print_88 :
    push dx
    call print8
    jmp ini_4

    print_99 :
    push dx
    call print9
    jmp ini_4
    
    
   downend: 
    pop bp
    ret 2

;--------------------------------------
;--------------------------------------PRINT NOTES UP
;--------------------------------------
print_notes_up:
    ; 1 row in notes is 1 box 
    ; so 81 rows in total 81 boxes
    push bp
    mov bp,sp
    pusha

    ; 1 row of sudoko grid
    mov ax,0
    mov cx,9
    mov bx,0
    mov dx,0x060D
    notes_row_1_grid:
        push ax
        push bx
        push dx
        push notes_1
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_1_grid

    mov cx,9
    mov bx,0
    mov dx,0x0A0D
    notes_row_2_grid:
        push ax
        push bx
        push dx
        push notes_2
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_2_grid

    mov cx,9
    mov bx,0
    mov dx,0x0E0D
    notes_row_3_grid:
        push ax
        push bx
        push dx
        push notes_3
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_3_grid

    
mov cx,9
    mov bx,0
    mov dx,0x120D
    notes_row_4_grid:
        push ax
        push bx
        push dx
        push notes_4
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_4_grid


    
    popa
    pop bp
    ret
;--------------------------------------
;--------------------------------------PRINT NOTES 1 BOX
;--------------------------------------
print_notes_1: ; push starting index, push starting location of box and push the notes you wanna print
   push bp
    mov bp,sp
    push bx
    push dx
    push cx
    push ax
    push di
    ; start row 1 col 1 = 0x060D
    ; row 1 col 2 = 0x0613
    ; row 2 col 1 = 0x0A19
    mov di,[bp+10]
    mov cx,0
    mov dx,[bp+6]
    mov si,[bp+8] ; start
    mov bx,[bp+4] ; the notes i wanna print
    cmp word[levelinput],1
    jne next_level_notes
    mov bp,easy_board
    jmp get_value_before_notes
    next_level_notes :
    cmp word[levelinput],2
    jne next_level_notes_2
    mov bp,medium_board
    jmp get_value_before_notes
next_level_notes_2:
    mov bp,hard_board

    get_value_before_notes:
        cmp word[bp+di],0
        jne nu_1end
    nu_1:
        mov ax,[bx+si]
        cmp ax,0
        jmp print_nu1

    nu_2:
        add dx,0x01
        add si,2
        add cx,1

        cmp cx,3
        je nu_11
        cmp cx,6
        je nu_11
        cmp cx,9
        jl nu_1
        
        jmp nu_1end

    nu_11: 
        sub dx,0x03
        add dx,0x0100
        jmp nu_1


    print_nu1 :
    mov ax,0
    mov al,dh
    push word[bx+si]
    push word 0x5F
    push ax
    mov al,dl
    push ax
    call printscore

    jmp nu_2

    
   nu_1end: 
    pop di
    pop ax
    pop cx
    pop dx
    pop bx
    pop bp
    ret 8 ; push starting location of the box and then the notes you want to print and the starting number of array
;--------------------------------------
;--------------------------------------PRINT NOTES DOWN
;--------------------------------------
print_notes_down:
    ; 1 row in notes is 1 box 
    ; so 81 rows in total 81 boxes
    push bp
    mov bp,sp
    pusha
    ; 1 row of sudoko grid
    mov ax,72
    mov cx,9
    mov bx,0
    mov dx,0x020D
    notes_row_5_grid:
        push ax
        push bx
        push dx
        push  notes_5
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_5_grid

    mov cx,9
    mov bx,0
    mov dx,0x060D
    notes_row_6_grid:
         push ax
        push bx
        push dx
        push  notes_6
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_6_grid

    mov cx,9
    mov bx,0
    mov dx,0x0A0D
    notes_row_7_grid:
         push ax
        push bx
        push dx
        push  notes_7
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_7_grid

    
mov cx,9
    mov bx,0
    mov dx,0x0E0D
    notes_row_8_grid:
         push ax
        push bx
        push dx
        push  notes_8
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_8_grid

    mov cx,9
    mov bx,0
    mov dx,0x120D
    notes_row_9_grid:
         push ax
        push bx
        push dx
        push  notes_9
        call print_notes_1
        add ax,2
        add bx,20
        add dx,0x06
        loop notes_row_9_grid

    
    popa
    pop bp
    ret
;--------------------------------------
;--------------------------------------PRINT UP
;--------------------------------------
print_up:
  
mov word[screennumber],1
call mainboard
call start4board
call initialiseupboard
call print_notes_up

ret
;--------------------------------------
;--------------------------------------PRINT DOWN
;--------------------------------------
print_down:

mov word[screennumber],2
call start5board
call lowerboard
call initialisedownboard
call print_notes_down
ret
;--------------------------------------
;--------------------------------------ADD IN NOTES SCREEN 2
;--------------------------------------
add_in_notes_2:
    pusha

    mov ax,[x_coordinate] ; dx
    shl ax,8
    add ax,[y_coordinate] ; cx

    
    ;loop for 1st row
    mov cx,9
    mov bp,0
    mov bx,0x040F
    mov dx,0x020D
    mov si,notes_5
    loop_notes_find_5:
        cmp al,dl
        jge next_notes_find_5
        iter_notes_55:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_5
        jmp notes_find_6
        next_notes_find_5:
           cmp ah,dh
            jge next_notes_find_55
            jmp iter_notes_55
            next_notes_find_55:
            cmp al,bl
            jle next_notes_find_555
             jmp iter_notes_55
             next_notes_find_555:
                cmp ah,bh
            jle notes_in_bound_2 
            jmp iter_notes_55

    notes_find_6:

    mov cx,9
    mov bp,0
    mov bx,0x080F
    mov dx,0x060D
    mov si,notes_6
    loop_notes_find_6:
        cmp al,dl
        jge next_notes_find_6
        iter_notes_66:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_6
        jmp notes_find_7
        next_notes_find_6:
           cmp ah,dh
            jge next_notes_find_66
            jmp iter_notes_66
            next_notes_find_66:
            cmp al,bl
            jle next_notes_find_666
             jmp iter_notes_66
             next_notes_find_666:
                cmp ah,bh
            jle notes_in_bound_2 
            jmp iter_notes_66
    
    notes_find_7:
    mov cx,9
    mov bp,0
    mov bx,0x0C0F
    mov dx,0x0A0D
    mov si,notes_7
    loop_notes_find_7:
        cmp al,dl
        jge next_notes_find_7
        iter_notes_77:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_7
        jmp notes_find_8
        next_notes_find_7:
            cmp ah,dh
            jge next_notes_find_77
            jmp iter_notes_77
            next_notes_find_77:
            cmp al,bl
            jle next_notes_find_777
             jmp iter_notes_77
             next_notes_find_777:
                cmp ah,bh
            jle notes_in_bound_2 
            jmp iter_notes_77

    notes_find_8:
    mov cx,9
    mov bp,0
    mov bx,0x100F
    mov dx,0x0E0D
    mov si,notes_8
    loop_notes_find_8:
        cmp al,dl
        jge next_notes_find_8
        iter_notes_88:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_8
        jmp notes_find_9
        next_notes_find_8:
           cmp ah,dh
            jge next_notes_find_88
            jmp iter_notes_88
            next_notes_find_88:
            cmp al,bl
            jle next_notes_find_888
             jmp iter_notes_88
             next_notes_find_888:
                cmp ah,bh
            jle notes_in_bound_2 
            jmp iter_notes_88

    notes_find_9:
    mov cx,9
    mov bp,0
    mov bx,0x140F
    mov dx,0x120D
    mov si,notes_9
    loop_notes_find_9:
        cmp al,dl
        jge next_notes_find_9
        iter_notes_99:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_9
        jmp add_in_notes_2_end

        next_notes_find_9:
           cmp ah,dh
            jge next_notes_find_99
            jmp iter_notes_99
            next_notes_find_99:
            cmp al,bl
            jle next_notes_find_999
             jmp iter_notes_99
             next_notes_find_999:
                cmp ah,bh
            jle notes_in_bound_2 
            jmp iter_notes_99

notes_in_bound_2:
    ;sub bx,2
    mov cx,0
      check_exact_notes_2:
        cmp ax,dx
        je add_in_notes_array_2
        add dx,0x0001
        add bp,2
        add cx,1
        cmp cx,3
        je notes_add_22
        cmp cx,6
        je notes_add_22
        cmp cx,9
        jle check_exact_notes_2

notes_add_22:
    sub dx,0x03
        add dx,0x0100
        jmp check_exact_notes_2
add_in_notes_array_2:
    mov ax,[input_number]
    mov [si+bp],ax

add_in_notes_2_end:
    popa
    ret
 ;--------------------------------------
;--------------------------------------ADD IN NOTES Screen 1
;--------------------------------------
;--------------------------------------

add_in_notes_1:
    pusha

    mov ax,[x_coordinate] ; dx
    shl ax,8
    add ax,[y_coordinate] ; cx

    
    ;loop for 1st row
    mov cx,9
    mov bp,0
    mov bx,0x080F
    mov dx,0x060D
    mov si,notes_1
    loop_notes_find_1:
        cmp al,dl
        jge next_notes_find_1
        iter_notes_11:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_1
        jmp notes_find_2
        next_notes_find_1:
            cmp ah,dh
            jge next_notes_find_11
            jmp iter_notes_11
            next_notes_find_11:
            cmp al,bl
            jle next_notes_find_111
             jmp iter_notes_11
             next_notes_find_111:
                cmp ah,bh
            jle notes_in_bound_1 
            jmp iter_notes_11
    
    notes_find_2:
    mov cx,9
    mov bp,0
    mov bx,0x0C0F
    mov dx,0x0A0D
    mov si,notes_2
    loop_notes_find_2:
        cmp al,dl
        jge next_notes_find_2
        iter_notes_12:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_2
        jmp notes_find_3
        next_notes_find_2:
            cmp ah,dh
            jge next_notes_find_22
            jmp iter_notes_12
            next_notes_find_22:
            cmp al,bl
            jle next_notes_find_222
             jmp iter_notes_12
             next_notes_find_222:
                cmp ah,bh
            jle notes_in_bound_1 
            jmp iter_notes_12

    notes_find_3:
    mov cx,9
    mov bp,0
    mov bx,0x100F
    mov dx,0x0E0D
    mov si,notes_3
    loop_notes_find_3:
        cmp al,dl
        jge next_notes_find_3
        iter_notes_13:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_3
        jmp notes_find_4
        next_notes_find_3:
             cmp ah,dh
            jge next_notes_find_33
            jmp iter_notes_13
            next_notes_find_33:
            cmp al,bl
            jle next_notes_find_333
             jmp iter_notes_13
             next_notes_find_333:
                cmp ah,bh
            jle notes_in_bound_1 
            jmp iter_notes_13

    notes_find_4:
    mov cx,9
    mov bp,0
    mov bx,0x140F
    mov dx,0x120D
    mov si,notes_4
    loop_notes_find_4:
        cmp al,dl
        jge next_notes_find_4
        iter_notes_14:
        add dx,0x06
        add bx,0x06
        add bp,20
        loop loop_notes_find_4
        jmp add_in_notes_1_end

        next_notes_find_4:
            cmp ah,dh
            jge next_notes_find_44
            jmp iter_notes_14
            next_notes_find_44:
            cmp al,bl
            jle next_notes_find_444
             jmp iter_notes_14
             next_notes_find_444:
                cmp ah,bh
            jle notes_in_bound_1 
            jmp iter_notes_14

notes_in_bound_1:
    mov cx,0
      check_exact_notes_1:
        cmp ax,dx
        je add_in_notes_array_1
        add dx,0x0001
        add bp,2
        add cx,1
        cmp cx,3
        je notes_add_11
        cmp cx,6
        je notes_add_11
        cmp cx,9
        jle check_exact_notes_1

notes_add_11:
    sub dx,0x03
        add dx,0x0100
        jmp check_exact_notes_1
add_in_notes_array_1:
    mov ax,[input_number]
    mov [si+bp],ax

add_in_notes_1_end:
   popa
    ret
;--------------------------------------
;--------------------------------------
;--------------------------------------ADD IN NOTES
;--------------------------------------
    add_in_notes:
       pusha
        mov bp,sp
        cmp word[screennumber],1
        je notes_add_1
        call add_in_notes_2
        jmp add_in_notes_end
        notes_add_1:
            call add_in_notes_1
            add_in_notes_end:
        popa
        ret
;--------------------------------------
;--------------------------------------MOVES
;--------------------------------------
moves:
    popa
 mov ax,0001h
 int 33h
check_input:

    call game_win_condition_check

    cmp word[game_end_check],1
    je gameend

    xor bh,bh            ; page 0, cursor position 0,0
    xor dx,dx
    xor cx,cx
    mov ax, 0003h            ; Function 3: Get mouse position and button status
    int 33h                  ; Call mouse interrupt
    
    cmp bx,1
    jne check_input
    shr cx,3
    shr dx,3
    mov word[y_coordinate],cx
    mov word[x_coordinate],dx

   
    call keyboard_hook
    cmp word[gameinputcheck],0
    je printcall
    
    cmp word[erasecheck],1
    je eraseon1
    cmp word[notescheck],0
    je notesoff
    jmp noteson
    jmp check_input

eraseon1:
    
    mov word[input_number],0
    jmp printtemp

    jmp printcall
notesoff:

 
    ;mov ah, 00h   ; Function 0: Wait for key press
   ; int 16h  
    ;sub al,48
    ;mov ah,0
    ;mov word[input_number],ax    ; Call BIOS keyboard interrupt
    jmp printtemp

noteson:
  
    ;mov ah,00h 
    ;int 16h
    ;sub al,48
    ;mov ah,0
    ;mov word[input_number],ax 
    call add_in_notes
    jmp printcall


printtemp:
 
    ; loop for first row
    mov ax,[x_coordinate] ; dx
    shl ax,8
    add ax,[y_coordinate] ; cx
    mov bx,0
    cmp word[levelinput],1
    je moveasy
    cmp word[levelinput],2
    je movmedium
    mov si,hard_board
    jmp aftermoving
    movmedium:
        mov si,medium_board
        jmp aftermoving
    
    moveasy:
    mov si,easy_board
    aftermoving:

    cmp word[screennumber],1 
    je page1
    mov dx,0x020C
    mov bx,0x0410
    mov bp,72
    mov cx,0
    jmp second_row

    page1:
        mov bp,0
        mov dx,0x060C
        mov bx,0x0810
        mov cx,0
        first_row:
            cmp cx, 36
            jg printcall
            cmp al,dl
            jge next_check
            iter_1:
                add dx,0x06
                add bx,0x06
                add bp,2
                 add cx,1
        cmp cx,9
        je moves_1
        cmp cx,18
        je moves_2
        cmp cx,27
        je moves_3
        cmp cx,36
        jle first_row
        jmp printcall

    moves_1: 
        mov dx,0x0A0C
        mov bx,0x0C10
        jmp first_row
    moves_2:
        mov dx,0x0E0C
        mov bx,0x1010
        jmp first_row
    moves_3:
        mov dx,0x120C
        mov bx,0x1410
        jmp first_row
               
 next_check:

                cmp ah,dh
                jge next_check1
                jmp iter_1
                next_check1:
                next_check1:
                cmp al, bl
                jle next_check11
                jmp iter_1

                next_check11:
                cmp ah,bh
                jle addin_1
                jmp iter_1

second_row:
     cmp al,dl
            jge next_check2
            iter_2:
                add dx,0x06
                add bx,0x06
                add bp,2
                 add cx,1
        cmp cx,9
        je moves_4
        cmp cx,18
        je moves_5
        cmp cx,27
        je moves_6
        cmp cx,36
        je moves_7
        cmp cx,45
        jle second_row
        jmp printcall
    moves_4: 
        mov bx,0x0810
        mov dx,0x060C
        jmp second_row
    moves_5:
        mov bx,0x0C10
        mov dx,0x0A0C
        jmp second_row
    moves_6:
        mov bx,0x1010
        mov dx,0x0E0C
        jmp second_row
    moves_7:
        mov bx,0x1410
        mov dx,0x120C
        jmp second_row 


next_check2:
                cmp ah,dh
                jge next_check22
                jmp iter_2
               
                next_check22:
                cmp al, bl
                jle next_check222
                jmp iter_2

                next_check222:
                cmp ah,bh
                jle addin_1
                jmp iter_2
                

        addin_1:
            cmp word[erasecheck],1
            je erasemoving
             push bp
            call store_undo
            mov ax,word[input_number]
            cmp ax,word[board+bp]
            je matched
            add word[mis],1
            call lostmusic
            jmp printcall
          matched: 
            add word[score],25
            mov word[si+bp],ax
            call winmusic
            jmp printcall

          erasemoving:
            mov word[si+bp],0  



printcall:
            cmp word[screennumber],1
            jne pagedown
            call print_up
            jmp check_input
            pagedown:
            call print_down
            jmp check_input        

    jmp check_input

movesend:
    pusha
ret
;--------------------------------------
;--------------------------------------TIMER
;--------------------------------------
timer: ; timer
push ax
push bx
push si
pushf
add word [cs:tickcount],1
cmp word[cs:tickcount],960
jl func
mov word[cs:tickcount],0
add word[cs:minutes],1
func:
cmp word[screennumber],1 
jne end_timer
 call printtimer
end_timer:
mov al, 0x20
out 0x20,al
popf
pop si
pop bx
pop ax
iret
;--------------------------------------
;--------------------------------------PRINT TIMER
;--------------------------------------
printtimer: 
push bp
 mov bp, sp
 push es
 push ax
 push bx
 push cx
 push dx
 push di
 
 mov ax,[minutes]
 mov [minutes_1],ax
;shr word[minutes_1],4
 mov ax,[tickcount]
 mov [tickcount_1],ax
 shr word[tickcount_1],4

 mov ax, 0xb800
 mov es, ax 
minutes1 :
mov ax,[minutes_1]
mov bx, 10 ; use base 10 for division
 mov cx, 0 ; initialize count of digits
nextdigit1: 
    mov dx, 0 ; zero upper half of dividend
 div bx ; divide by 10
 add dl, 0x30 ; convert digit into ascii value
 push dx ; save ascii value on stack
 inc cx ; increment count of values
 cmp ax, 0 ; is the quotient zero
 jnz nextdigit1 ; if no divide it again
 mov di, 618 
nextpos1: pop dx ; remove a digit from the stack
 mov dh, 0x3F ; use normal attribute
 mov [es:di], dx ; print char on screen
 add di, 2 ; move to next screen location
 loop nextpos1 ; repeat for all digits on stack

mov di,624
mov word[es:di],0x3F3A
seconds1 : 
mov ax,[tickcount_1]
 mov bx, 10 
 mov cx, 0 
nextdigit2: 
    mov dx, 0 
 div bx 
 add dl, 0x30 
 push dx 
 inc cx 
 cmp ax, 0 
 jnz nextdigit2 
 mov di, 628 
nextpos2: pop dx 
 mov dh, 0x3F 
 mov [es:di], dx 
 add di, 2 
 loop nextpos2 

cmp word[tickcount],10
jge timer_print_end

mov word[es:di],0x3F20
timer_print_end:

 pop di
 pop dx
 pop cx
 pop bx
 pop ax 
 pop es
 pop bp
 ret 
;--------------------------------------
;--------------------------------------KEYBOARD HOOK
;--------------------------------------
keyboard_hook:
pusha
pushf

  mov ah, 00h   ; Function 0: Wait for key press
    int 16h 
 checkkey:
    mov word[gameinputcheck],0
mov word[input_number],0
cmp al,1Bh
je gameend

cmp ah,48h
je down

cmp ah, 50h
je up

cmp al,45h
je eraseon

cmp al,4Fh
je noteson_1

cmp al,46h
je notesoff_1

cmp al,55h
je undo_set
mov ah,0

mov word[gameinputcheck],1
mov [input_number],ax
sub word[input_number],48

jmp keyboard_end

up: 
mov ax,20
push ax
call scrollup

call print_down
jmp keyboard_end

down :

call print_up
jmp keyboard_end

eraseon:
    cmp word[erasecheck],1
    je toggleeraseto0
mov word[erasecheck],1
jmp keyboard_end

toggleeraseto0:
    mov word[erasecheck],0
    jmp keyboard_end

noteson_1:
mov word[notescheck],1
jmp keyboard_end

notesoff_1:
mov word[notescheck],0
jmp keyboard_end

undo_set:
    call undo_undo
keyboard_end:
    
 popf
popa
  ret 
;--------------------------------------
;--------------------------------------GAME WIN CONDITION CHECK
;--------------------------------------
game_win_condition_check :
pusha
cmp byte[mis],3
jge game_end_check_1
mov si,0
cmp word[levelinput],1
jne next_level_game_check_1
mov bx,easy_board
jmp loop_game_win_check

next_level_game_check_1:
cmp word[levelinput],2
jne next_level_game_check_2
mov bx,medium_board
jmp loop_game_win_check
next_level_game_check_2:
mov bx,hard_board
loop_game_win_check:
mov cx,81
loop_game_win:
    cmp word[bx+si],0
    je game_end_check_0
    add si,2
    loop loop_game_win

game_end_check_1:
    mov word[game_end_check],1
    jmp game_end_check_end
    game_end_check_0:
     mov word[game_end_check],0 ; game not end
    jmp game_end_check_end
    
game_end_check_end:
popa
ret

;--------------------------------------
;--------------------------------------INSTRUCTION PAGE 
;--------------------------------------
instruction_page:
push 0
push 0
push 25
push 80
push 0x5Fd7
call textrect

 

push inst_str1
push 0x5F
push 0x0222
push 17
call printbios


push inst_str2; address of String
push 0x5F
push 0x0405
push 51
call printbios


push inst_str3; address of String
push 0x5F
push 0x0605
push 32
call printbios


push inst_str4; address of String
push 0x5F
push 0x0805
push 36
call printbios


push inst_str5; address of String
push 0x5F
push 0x0A05
push 54
call printbios


push inst_str6; address of String
push 0x5F
push 0x0C05
push 27
call printbios


push inst_str7; address of String
push 0x5F
push 0x0E05
push 28
call printbios

push inst_str10; address of String
push 0x5F
push 0x1005
push 36
call printbios

push inst_str8; address of String
push 0x5F
push 0x1205
push 28
call printbios


push inst_str9; address of String
push 0x5F
push 0x1426
push 6
call printbios

mov ah,0x00
int 0x16

ret
;--------------------------------------
;--------------------------------------INSTRUCTION BOUNDARY
;--------------------------------------
textrect :

push bp
mov bp, sp
push ax
push cx
push es
push di
push dx

mov al, 80
mul byte[bp + 12]
add ax, [bp + 10]
shl ax, 1
mov di, ax

mov ax, 0xb800
mov es, ax


mov cx, 0
mov ax, [bp + 4]
lr1:
mov[es:di], ax
add di, 2
inc cx
cmp cx, [bp + 6]
jne lr1

mov cx, 0
sub di, 2

lr2:
mov[es:di], ax
add di, 160
inc cx
cmp cx, [bp + 8]
jne lr2

mov cx, 0
sub di, 160
lr3:
mov[es:di], ax
sub di, 2
inc cx
cmp cx, [bp + 6]
jne lr3

mov cx, 0
add di, 2

lr4:
mov[es:di], ax
sub di, 160
inc cx
cmp cx, [bp + 8]
jne lr4

pop dx
pop di
pop es
pop cx
pop ax
pop bp
ret 10
startpage:
    push 0
push 0
push 25
push 80
push 0x5Fd7
call textrect
call print_sudoko
call print_levels
call get_level_input

ret
;--------------------------------------
;--------------------------------------UNDO
;--------------------------------------
;score,mistakes,boardindex,number
; undo_data: dw 0,0,0,0
store_undo: ;push boardindex
    push bp
    mov bp,sp
    pusha

    mov ax,[score]
    mov word[undo_data],ax

    mov ax,[mis]
    mov word[undo_data+2],ax

    mov ax,[bp+4]
    mov word[undo_data+4],ax

    mov ax,[input_number]
    mov word[undo_data+6],ax
    popa
    pop bp
    ret 2
;-----------------------------------------------
undo_undo:
    push bp
    mov bp,sp
    pusha

     cmp word[levelinput],1
    jne undo_medium
     mov si,easy_board
     jmp undo_undo_1
    undo_medium:
        cmp word[levelinput],2
    jne undo_hard
     mov si,medium_board
    jmp undo_undo_1
   undo_hard:
     mov si,hard_board
 
 undo_undo_1:

    mov ax,[undo_data]
    mov [score],ax

    mov ax,[undo_data+2]
    mov [mis],ax

    mov bx,[undo_data+4]
    mov word[si+bx],0


    popa
    pop bp
    ret
;--------------------------------------
;--------------------------------------END SCREEN
;--------------------------------------
print_fireworks:
push bp
mov bp,sp
; start from 0x051F and 0x0620 and 0x0420
; start from 0x0532 and 0x0631 and 0x0431
mov cx,0 
mov word[f1],0x0B20
mov word[f2], 0x081C
mov word[f3],0x061C
mov word[f4],0x0B2F
mov word[f5],0x0834
mov word[f6], 0x0634

; 4 increase 
print_f_1: 
    push word SQUARE1
    push word 0x5F
    push word[f1]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f2]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f3]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f4]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f5]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f6]
    push 1 
    call printbios
    call delay_1
    sub word[f1],0x0101 
    sub word[f2],0x0101 
    sub word[f3],0x0101 
    add word[f4],0x0001
    sub word[f4],0x0100
    add word[f5],0x0001
    sub word[f5],0x0100
    add word[f6],0x0001
    sub word[f6],0x0100
    inc cx
    cmp cx,3
    jl print_f_1

    print_f_3:
push word SQUARE1
    push word 0x5F
    push word[f1]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f2]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f3]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f4]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f5]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f6]
    push 1 
    call printbios
    call delay_1
     add word[f4],0x001
    add word[f5],0x001
    add word[f6],0x001
 sub word[f1],0x001 
    sub word[f2],0x001 
    sub word[f3],0x001 
    inc cx
    cmp cx,5
    jl print_f_3
   

    print_f_2: 
         push word SQUARE1
    push word 0x5F
    push word[f1]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F 
    push word[f2]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F 
    push word[f3]
    push 1 
    call printbios
      push word SQUARE1
    push word 0x5F
    push word[f4]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f5]
    push 1 
    call printbios
     push word SQUARE1
    push word 0x5F
    push word[f6]
    push 1 
    call printbios
    call delay_1
    add word[f1],0x0100 
    sub word[f1],0x01
    add word[f2],0x0100 
    sub word[f2],0x01
    add word[f3],0x0100 
    sub word[f3],0x01
    add word[f4],0x0101
    add word[f5],0x0101
    add word[f6],0x0101
    inc cx
    cmp cx,12
    jl print_f_2
    call delay_1

    push SQUARE1
    push word 0x5E
    push word[f1]
    push 1 
    call printbios

    add word[f1],0x0100
    sub word[f1],0x0001
    push SQUARE1
    push word 0x5E
    push word[f1]
    push 1 
    call printbios

    add word[f1],0x02
     push SQUARE1
    push word 0x5E
    push word[f1]
    push 1 
    call printbios

    add word[f1],0x0100
    sub word[f1],0x0001
     push SQUARE1
    push word 0x5E
    push word[f1]
    push 1 
    call printbios


    

    push SQUARE1
    push word 0x5E
    push word[f2]
    push 1 
    call printbios

    add word[f2],0x0100
    sub word[f2],0x0001
    push SQUARE1
    push word 0x5E
    push word[f2]
    push 1 
    call printbios

    add word[f2],0x02
     push SQUARE1
    push word 0x5E
    push word[f2]
    push 1 
    call printbios

    add word[f2],0x0100
    sub word[f2],0x0001
     push SQUARE1
    push word 0x5E
    push word[f2]
    push 1 
    call printbios


    push SQUARE1
    push word 0x5E
    push word[f3]
    push 1 
    call printbios

    add word[f3],0x0100
    sub word[f3],0x0001
    push SQUARE1
    push word 0x5E
    push word[f3]
    push 1 
    call printbios

    add word[f3],0x02
     push SQUARE1
    push word 0x5E
    push word[f3]
    push 1 
    call printbios

    add word[f3],0x0100
    sub word[f3],0x0001
     push SQUARE1
    push word 0x5E
    push word[f3]
    push 1 
    call printbios


    push SQUARE1
    push word 0x5E
    push word[f4]
    push 1 
    call printbios

    add word[f4],0x0100
    sub word[f4],0x0001
    push SQUARE1
    push word 0x5E
    push word[f4]
    push 1 
    call printbios

    add word[f4],0x02
     push SQUARE1
    push word 0x5E
    push word[f4]
    push 1 
    call printbios

    add word[f4],0x0100
    sub word[f4],0x0001
     push SQUARE1
    push word 0x5E
    push word[f4]
    push 1 
    call printbios


    push SQUARE1
    push word 0x5E
    push word[f5]
    push 1 
    call printbios

    add word[f5],0x0100
    sub word[f5],0x0001
    push SQUARE1
    push word 0x5E
    push word[f5]
    push 1 
    call printbios

    add word[f5],0x02
     push SQUARE1
    push word 0x5E
    push word[f5]
    push 1 
    call printbios

    add word[f5],0x0100
    sub word[f5],0x0001
     push SQUARE1
    push word 0x5E
    push word[f5]
    push 1 
    call printbios

    push SQUARE1
    push word 0x5E
    push word[f6]
    push 1 
    call printbios

    add word[f6],0x0100
    sub word[f6],0x0001
    push SQUARE1
    push word 0x5E
    push word[f6]
    push 1 
    call printbios

    add word[f6],0x02
     push SQUARE1
    push word 0x5E
    push word[f6]
    push 1 
    call printbios

    add word[f6],0x0100
    sub word[f6],0x0001
     push SQUARE1
    push word 0x5E
    push word[f6]
    push 1 
    call printbios


pop bp 
    ret
;---------------------------------------------------------------
    won_printing:
        push bp
        mov bp,sp
        ;push string,attributes, row and column, length
        push  congrats
        push word 0x5F 
        push word 0x0720
        push 17
        call printbios

        push youwon
        push word 0x5F
        push word 0x0924
        push 7
        call printbios
        call print_fireworks
        pop bp
        ret
;---------------------------------------------------------------
lost_printing:
    push bp
    mov bp,sp
        push  better
        push word 0x5F 
        push word 0x071D
        push 24
        call printbios

        push youlost
        push word 0x5F
        push word 0x0924
        push 8
        call printbios
    pop bp
    ret
;---------------------------------------------------------------
end_timeline:

push msg5
push 0x5F
push 0x1120
push 8
call printbios

 mov ax, 0xb800
 mov es, ax 
mov di,2804
mov word[es:di],0x5F3A


push word [minutes_1]
        push 0x005F ; attributes
        push 0x11 ; position x
        push 0x28 ; position y
        call printscore

        push word [tickcount_1]
        push 0x005F ; attributes
        push 0x11 ; position x
        push 0x2C ; position y
        call printscore


     push word [score]
        push 0x005F ; attributes
        push 0x0F ; position x
        push 0x28 ; position y
        call printscore

         push msg3
        push 0x5F
        push 0x0D20
        push 10
        call printbios

        push msg4
        push 0x5F
        push 0x0F20
        push 8
        call printbios

        mov bx,[mis]
        add bx,0x30
        mov [misascii],bx
        push misascii
        push 0x5F
        push 0x0D2B
        push 1
        call printbios
    ret
;---------------------------------------------------------------
endscreen:

call clearscreen
push 0
push 0
push 25
push 80
push 0x5Fd7
call textrect
push gameover
push 0xDF
push 0x0524
push 11
call printbios
mov word[screennumber],2
cmp byte[mis],3
jne won_print
call lost_printing
jmp end_screen_end
won_print: 
    call won_printing

end_screen_end:
    call end_timeline
    call gameovermusic
    mov ah,0
    int 0x16
    ret

;--------------------------------------
;--------------------------------------MUSIC MEDIA
;--------------------------------------
winmusic:
		push si
		push dx
		push ax
		push bx
		push cx
		mov si, 200
	.next_note:
		mov dx, 388h
		mov al, [si + music_data + 0]
		out dx, al
		mov dx, 389h
		mov al, [si + music_data + 1]
		out dx, al
		mov bx, [si + music_data + 2]
		add si, 4
	.repeat_delay:
		mov cx, 60
	.delay:
		loop .delay
		dec bx
		jg .repeat_delay
		cmp si, [music_length]
		jb .next_note
	st:
		mov dx, 388h
		mov al, 0xff
		out dx, al
		mov dx, 389h
		mov al, 0xff
		out dx, al
		mov bx, 0
		pop cx
		pop bx
		pop ax
		pop dx
		pop si
ret
;---------------------------------------------------------------
lostmusic:
		push si
		push dx
		push ax
		push bx
		push cx
		mov si, 200
	.next_note:
		mov dx, 388h
		mov al, [si + music_data1 + 0]
		out dx, al
		mov dx, 389h
		mov al, [si + music_data1 + 1]
		out dx, al
		mov bx, [si + music_data1 + 2]
		add si, 4
	.repeat_delay:
		mov cx, 60
	.delay:
		loop .delay
		dec bx
		jg .repeat_delay
		cmp si, [music_length]
		jb .next_note
	st_1:
		mov dx, 388h
		mov al, 0xff
		out dx, al
		mov dx, 389h
		mov al, 0xff
		out dx, al
		mov bx, 0
		pop cx
		pop bx
		pop ax
		pop dx
		pop si
ret
;---------------------------------------------------------------
gameovermusic:
		push si
		push dx
		push ax
		push bx
		push cx
		mov si, 200
	.next_note:
		mov dx, 388h
		mov al, [si + music_data2 + 0]
		out dx, al
		mov dx, 389h
		mov al, [si + music_data2 + 1]
		out dx, al
		mov bx, [si + music_data2 + 2]
		add si, 4
	.repeat_delay:
		mov cx, 610
	.delay:
		mov ah, 1
		int 16h
		jnz st_2
		loop .delay
		dec bx
		jg .repeat_delay
		cmp si, [music_length1]
		jb .next_note
	st_2:
		mov dx, 388h
		mov al, 0xff
		out dx, al
		mov dx, 389h
		mov al, 0xff
		out dx, al
		mov bx, 0
		pop cx
		pop bx
		pop ax
		pop dx
		pop si
ret

;--------------------------------------
;--------------------------------------GAME MAIN START
;--------------------------------------
gamestart :


call clearscreen
call startpage
call clearscreen
call instruction_page
call print_up
xor ax, ax
 mov es, ax ; point es to IVT base
 cli
 mov word [es:8*4], timer
 mov [es:8*4+2], cs ; hook timer interrupt

 sti 

call moves

gameend:
mov ax,2
int 33h

call clearscreen

call endscreen

mov ax, 0x4c00 
 int 0x21 


;--------------------------------------
;--------------------------------------FINISH
;--------------------------------------

