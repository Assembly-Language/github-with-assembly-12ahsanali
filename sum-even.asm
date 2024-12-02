include irvine32.inc
.data
    array1 word 4,-1,2,-7,-9,4,-15,-45
    msg byte "Sum of Even values ",0
    msg1 byte "Total Even Numbers ",0
    sum dword 0
    count dword 0
.code
main proc
    mov eax,0
    mov esi,offset array1
    mov ecx,lengthof array1
EvenNo:
    mov ax,word ptr[esi]            ;Checking if number is odd
    test ax,1
    jnz skipEven
    movsx eax,word ptr [esi]                
    add sum,eax 
    add count,1   
skipEven:
    add esi,type myArray
    loop EvenNo
    mov edx,offset msgSum
    call writestring
    call crlf
    mov eax,sum      ;Displaying the sum
    call writeint
    call crlf 
mov edx,offset msgCount
    call writestring
    call crlf
    mov eax,count       ;Displaying the count
    call writeint
main endp
end main