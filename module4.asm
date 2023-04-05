data	segment public
		extrn block:byte
data	ends

public smart_sort

procedures	segment public
smart_sort proc far
		assume cs:procedures, ds:data

outer:	mov dx,cx
		inc si
		mov di,si
inner:	inc di
		mov al,byte ptr[si]
		cmp al,byte ptr[di]
		jbe skip
		mov bl,al
		mov al,byte ptr[di]
		mov byte ptr[di],bl
		mov byte ptr[si],al
skip:	dec dx
		jnz inner
		dec cx
		jnz outer

		ret
smart_sort	endp
procedures	ends
end
