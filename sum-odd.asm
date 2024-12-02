include irvine32.inc
.data
    array1 word 4,-1,2,-7,-9,4,-15,-45
    msg byte "Total of odd values ",0
    msg1 byte "Total odd Numbers ",0
    sum dword 0
    count dword 0
.code
main proc
    mov eax,0
    mov esi,offset array1
    mov ecx,lengthof array1
oddnumber:
    mov ax,word ptr[esi]

    test ax,1               ;Checking if number is even
    jz skipodd
    movsx eax,word ptr [esi]
    add sum,eax 
    add count,1   
    skipodd:    
    add esi,type array1 
    loop oddnumber

    mov edx,offset msg          ;Loading the address of msg 1
    call writestring
    call crlf

    mov eax,sum                 ;Displaying the sum
    call writeint
    call crlf 

    mov edx,offset msg1         ;Loading the address of msg 2
    call writestring
    call crlf

    mov eax,count           ;Displaying the count
    call writeint
    exit
main endp
end main