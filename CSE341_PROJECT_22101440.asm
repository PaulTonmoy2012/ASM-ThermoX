.MODEL SMALL

.STACK 100H

.DATA
string1 dw "Temperature in Fahrenheit is: $"
string2 dw "Temperature in Celsius is: $"
string3 dw "Temperature in Kelvin is: $"

first dw ?
secound dw ? 
third dw ?


final_num dw ?  

result_num dw ?

welcome_msg db "Welcome to Temperature Converter Calculator!$"
reset db "For calculate again press 1, Else: press0 :$?"
line1 db "Select an option$"
line2 db "1. Celsius to Fahrenheit$"
line3 db "2. Fahrenheit to Celsius$"
line4 db "3. Kelvin to Fahrenheit$"
line5 db "4. Enter Which converter you want to use:$"
invalid_msg db "Invalid Temperature Entry! Please with in the range and Try Again:$"
option db "Choose an Correct Option! $" 

statement1 db "Enter the Temperature in Celsius:(0-100) $ "
statement2 db "Enter the Temperature in Fahrenheit:(32-212) $ "
statement3 db "Enter the Temperature in Kelvin:(273-373) $ "
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX

error:
Start:
mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
    mov ah, 09h
    lea dx, welcome_msg
    int 21h

    ; Display instructions
mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
    lea dx, line1
    mov ah, 09h
    int 21h
mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
    lea dx, line2
    mov ah, 09h
    int 21h
mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h    
    lea dx, line3
    mov ah, 09h
    int 21h
mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
    lea dx, line4
    mov ah, 09h
    int 21h
mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
    lea dx, line5
    mov ah, 09h
    int 21h
mov ax,0
mov ah,1
int 21h
mov ah,0 
cmp al,"1"
je cel_to_far 
cmp al, '2'
je far_to_cel 
cmp al, '3'
je kel_to_far
mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
    mov ah, 09h
    lea dx, option
    int 21h
jmp error: 


; Celsius to Fahrenheit
cel_to_far:

mov ah,2
mov dl,0Ah
int 21h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah, 09h
lea dx, statement1
int 21h

mov ah,1
int 21h 
sub ax,30h 
mov ah,0
mov first,ax
mov bx, 100
mul bx
mov cx,ax

mov ah,1
int 21h 
sub ax,30h
mov ah,0
mov secound, ax
mov bx, 10
mul bx
add cx,ax 

mov ah,1
int 21h 
sub ax,30h
mov ah,0
mov third, ax
mov bx, 1
mul bx
add cx,ax 

mov final_num, cx

cmp final_num,100
jg invalid

;celcias to far
mov ax,final_num
mov bx,9
mul bx
mov bx, 5
div bx  

add ax,32
mov result_num,ax


mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

lea dx, string1
mov ah,9
int 21h
jmp Print_result
jmp exit



;Fahrenheit to Celsius
far_to_cel: 

mov ah,2
mov dl,0Ah
int 21h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah, 09h
lea dx, statement2
int 21h

mov ah,1
int 21h 
sub ax,30h 
mov ah,0
mov first,ax
mov bx, 100
mul bx
mov cx,ax

mov ah,1
int 21h 
sub ax,30h
mov ah,0
mov secound, ax
mov bx, 10
mul bx
add cx,ax 

mov ah,1
int 21h 
sub ax,30h
mov ah,0
mov third, ax
mov bx, 1
mul bx
add cx,ax 

mov final_num, cx

cmp final_num,032
jl invalid
cmp final_num,212
jg invalid

;far_to_cel
mov ax,final_num
sub ax,32
mov bx,5
mul bx
mov bx,9
div bx  

mov result_num,ax


mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

lea dx, string2
mov ah,9
int 21h
jmp Print_result
jmp exit



;Kelvin to Fahrenheit
kel_to_far:

mov ah,2
mov dl,0Ah
int 21h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah, 09h
lea dx, statement3
int 21h

mov ah,1
int 21h 
sub ax,30h 
mov ah,0
mov first,ax
mov bx, 100
mul bx
mov cx,ax

mov ah,1
int 21h 
sub ax,30h
mov ah,0
mov secound, ax
mov bx, 10
mul bx
add cx,ax 

mov ah,1
int 21h 
sub ax,30h
mov ah,0
mov third, ax
mov bx, 1
mul bx
add cx,ax 

mov final_num, cx   

cmp final_num,273
jl invalid
cmp final_num,373
jg invalid

;kalvine to farheneight
 
mov ax,final_num
sub ax,273
mov bx,9
mul bx
mov bx,5
div bx
add ax, 32  

mov result_num,ax



mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

lea dx, string1
mov ah,9
int 21h
jmp Print_result
jmp exit




 

;Next line
mov ah,2
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h



Print_result:
;print first digit
mov ax,result_num
mov bx,100
mov dx,0
div bx
mov cx, dx
mov dx,0

mov ah,2
mov dl,al
add dl,30h
int 21h



;print 2nd digit
mov ax,cx
mov bx,10
mov dx,0
div bx
mov cx, dx
mov dx,0

mov ah,2
mov dl,al
add dl,30h
int 21h

;print 3rd digit
mov ax,cx
mov bx,1
mov dx,0
div bx
mov cx, dx
mov dx,0

mov ah,2
mov dl,al
add dl,30h
int 21h
jmp exit

invalid:
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
        lea dx, invalid_msg
        mov ah, 09h
        int 21h
    jmp error

exit: 
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
        lea dx, reset
        mov ah, 09h
        int 21h
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    mov ah,1
    int 21h
    mov ah,0 
    cmp al,"1"
    je start
    





;exit to DOS

MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN


