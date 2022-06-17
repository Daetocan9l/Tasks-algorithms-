.model tiny
.code
org 100h

showANDcount MACRO str
    mov si, -1
    mov cx, 3
    showCycle:
        showString str
        cmp cx, 1
        je countString
        showString comma
        loop showCycle
    countString:
        inc si
        cmp str[si],'$'
        je end_countString
        inc sizeString
        jmp countString
    end_countString:
        mov ax, sizeString
        mov bx, 10
        xor cx, cx 
    save_number:
        xor dx, dx
        div bx
        push dx
        inc cx
        test ax, ax
        jnz save_number
        showString mess_size_string
        xor ax, ax
        mov ah, 02h
    show_number:
        pop dx
        add dl, 30h
        int 21h
        loop show_number

ENDM

showString MACRO str
   mov ah, 09h
   lea dx, str
   int 21h 
ENDM

exitProg MACRO 
    mov ax, 4C00h
    int 21h
ENDM

START:
    showANDcount string
    exitProg
exitProg
;Data block
    comma db ',', '$'
    mess_size_string db 0Dh,0Ah, "Size string = ", '$'
    string db "Human", '$'
    sizeString dw 0
end START