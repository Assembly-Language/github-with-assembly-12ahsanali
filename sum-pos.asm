include irvine32.inc
.data
array1 word 4,-1,2,-7,-9,4,-15,-45
msg byte "Sum of Positive Numbers ",0
msg1 byte "Total Positive Numbers ",0
sum dword 0
count dword 0
.code
main proc

    mov eax,0
    mov esi,offset array1
    mov ecx,lengthof array1
posino:

    mov ax,word ptr[esi]
    test ax,8000h           ;test with 8000h to check the positive value 
    jnz skippos
    movsx eax,word ptr [esi]
    add sum,eax 
    add count,1   

skippos:

    add esi,type array1
    loop posino
    mov edx,offset msg
    call writestring
    call crlf

    mov eax,sum         ;display the values
    call writeint
    call crlf 

    mov edx,offset msg1 `       ;displays the value
    call writestring
    call crlf
    
    mov eax,count   
    call writeint
exit
main endp
end main