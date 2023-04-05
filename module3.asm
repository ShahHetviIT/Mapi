data	segment byte public
		block db 05h,23h,0A2h,66h,12h,70h
data	ends

my_stack	segment byte
			dw 30 dup(0)
		tos	label word
my_stack	ends

public block

procedures 	segment public
			extrn smart_sort:far
procedures	ends

code	segment byte public
		assume cs:code,ds:data,ss:my_stack

start:	mov ax,data
		mov ds,ax
		mov ax,my_stack
		mov ss,ax
		mov sp,offset tos

		lea si,block
		mov cx,0
		mov cl,byte ptr[si]
		dec cx

		call smart_sort

		lea si,block
		inc si
		mov al,byte ptr[si]
		inc si
		inc si
		inc si
		inc si
		mov bl,byte ptr[si]

		int 3

code 	ends
		end start
    
