data 	segment word public
		block dw 0005h,5234h,4512h,1215h,0D213h,0AD2Fh
data	ends

more_data	segment word
			min dw ?
more_data	ends

my_stack 	segment stack
			dw 30 dup (0)
		tos label word
my_stack 	ends

public block

procedures	segment public
			extrn smart_min:far
procedures 	ends

code	segment word public
		assume cs:code,ds:data,ss:my_stack

start:	mov ax,data
		mov ds,ax
		mov ax,my_stack
		mov ss,ax
		mov sp,offset tos

		mov si,offset block
		mov cx,word ptr[si]
		add si,2
		mov ax,word ptr[si]

		call smart_min

		assume ds:more_data
		push ds
		mov bx,more_data
		mov ds,bx

		mov min,ax

		assume ds:data
		pop ds

		int 3
code  	ends
		end start
