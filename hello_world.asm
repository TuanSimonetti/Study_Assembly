; -----------------------------------
; Hello World
; -----------------------------------
; Instalar o nasm no linux
; $ sudo apt install nasm
;
; Converte o arquivo .asm para binário do tipo .o
; $ nasm -f elf64 hello.asm
;
; Converte o arquivo .o para arquivo executável
; $ ld -s -o hello hello.o
;
; Executa o arquivo
; $ ./hello
; -----------------------------------
segment .data
; define uma variavel, do tipo binario, onde está na posição 0xA
	msg db 'Hello, world!', 0xA, 0xD
; é definido o tamanho para que seja impresso em Assembly
	len equ $- msg
	
segment .text

; esse é um método em Assembly
global _start

_start:
	; manda a informação para o sistema
	mov eax, 4
	; mostra na tela a mensagem
	mov ebx, 1
	; escreve a mensagem
	mov ecx, msg
	;tamanho da mensagem
	mov edx, len
	; esse é o endereço do kernel
	int 0x80
	
; saida
	; retorna o eax para a posição original
	mov eax, 1
	; retorna o ebx para a posição original
	mov ebx, 0
	; informa para o kernel
	int 0x80
