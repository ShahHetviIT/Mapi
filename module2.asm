data 	segment public
		extrn block:word
data	ends

public smart_min

procedures	segment public
smart_min 	proc far
		assume cs:procedures, ds:data

next:	add si,2
		dec cx
		jz over
		cmp ax,word ptr[si]
		jc skip
		mov ax,word ptr[si]
skip:	jmp next
over:	ret
smart_min	endp
procedures	ends
end
