; Assembly Language Lab: Integer Division + Console Text Colors
; Part 2: Repair the Color Loop
; Name:
; Course / Section:
; Date:
;
; IMPORTANT: This program is intentionally disorganized and incorrect.
; Move, add, or remove lines to meet the requirements in README.md.
; It is not expected to build or run correctly until you repair it.
; Use the course's configured 32-bit MASM / Irvine32 environment.
; Build this file separately from Part1_Division.asm.

INCLUDE Irvine32.inc

.code

main PROC

.data

str1 BYTE "This line is displayed in color",0

mov ecx,4

 mov eax, black + (white * 16)

L1:          call         SetTextColor

             mov     edx,OFFSET str1

             add     eax,2

             exit

END main

       loop      L1

call          WriteString

main ENDP

call          Crlf
