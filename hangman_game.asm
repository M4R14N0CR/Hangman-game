%include 'palabras.asm'

%macro imprime 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro recibe 2
mov eax,3
mov ebx,2
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro recibe2 2
mov eax,3
mov ebx,2
mov ecx,%1
mov edx,%2
int 80h
%endmacro
;--------------------------------------------------------------------------
section .data

lin db "---------------------------------------------------------",10,13
lenlin equ $-lin

;--------------------------------------------------------------------------
codigo db 0x1b,"[34;40m"
lencodigo equ $-codigo

codigo1 db 0x1b,"[35;40m"
lencodigo1 equ $-codigo1

codigo3 db 0x1b,"[36;40m"
lencodigo3 equ $-codigo3

codigo4 db 0x1b,"[33;40m"
lencodigo4 equ $-codigo4

codigo5 db 0x1b,"[32;40m"
lencodigo5 equ $-codigo5

codigo6 db 0x1b,"[37;40m"
lencodigo6 equ $-codigo6

codigo7 db 0x1b,"[31;40m"
lencodigo7 equ $-codigo7
;--------------------------------------------------------------------------
ms0 db "Bienvenido al juego de"
lenms0 equ $-ms0

ms db 10,13,"  ___   _   _ ___________  _____   ___ ______ _____",10,13
lenms equ $-ms

ms1 db " / _ \ | | | |  _  | ___ \/  __ \ / _ \|  _  \  _  |",10,13
lenms1 equ $-ms1

ms2 db "/ /_\ \| |_| | | | | |_/ /| /  \// /_\ \ | | | | | |",10,13
lenms2 equ $-ms2

ms3 db "|  _  ||  _  | | | |    / | |    |  _  | | | | | | |",10,13
lenms3 equ $-ms3

ms4 db "| | | || | | \ \_/ / |\ \ | \__/\| | | | |/ /\ \_/ /",10,13
lenms4 equ $-ms4

ms5 db "\_| |_/\_| |_/\___/\_| \_| \____/\_| |_/___/  \___/",10,13
lenms5 equ $-ms5


msg2 db 10,13,"Seleccione una opcion",10,13
len2 equ $-msg2

msg3 db "1. Inicio",10,13
len3 equ $-msg3

msg4 db "2. Salir",10,13
len4 equ $-msg4
;--------------------------------------------------------------------------
mg db  "            _________        ",10,13
lenmg equ $-mg
mg1 db "                 |  |        ",10,13
lenmg1 equ $-mg1
mg2 db "                _|  |        ",10,13
lenmg2 equ $-mg2
mg3 db "               |_|  |        ",10,13
lenmg3 equ $-mg3
mg4 db "               /|\  |        ",10,13
lenmg4 equ $-mg4
mg5 db "                |   |        ",10,13
lenmg5 equ $-mg5
mg6 db "               / \  |        ",10,13
lenmg6 equ $-mg6
mg7 db "                    |        ",10,13
lenmg7 equ $-mg7
mg8 db "             _______|______  ",10,13
lenmg8 equ $-mg8


;--------------------------------------------------------------------------
msgi1 db 10,13,"Seleccione la dificultad:",10,13
leni1 equ $-msgi1

msgi2 db "1. Bajo",10,13
leni2 equ $-msgi2

msgi3 db "2. Medio",10,13
leni3 equ $-msgi3

msgi4 db "3. Alto",10,13
leni4 equ $-msgi4

msgi5 db "4. Ir a Menu Anterior",10,13
leni5 equ $-msgi5
;--------------------------------------------------------------------------
msgd1 db 10,13,"Juego de Ahorcado - Dificultad BAJA",10,13
lend1 equ $-msgd1

msgd2 db "Juego de Ahorcado - Dificultad MEDIA",10,13
lend2 equ $-msgd2

msgd3 db 10,13,"Juego de Ahorcado - Dificultad ALTA",10,13
lend3 equ $-msgd3

msgd4 db 10,13,"Palabra a adivinar: "
lend4 equ $-msgd4

msgd5 db 10,13,10,13,"Palabra: "
lend5 equ $-msgd5

msgd6 db 10,13,10,13,"Letras Solicitadas: "
lend6 equ $-msgd6

msgd7 db 10,13,10,13,"Voy a tener suerte (teclee 3)",10,13
lend7 equ $-msgd7

msgd8 db 10,13,"Turnos Disponibles: "
lend8 equ $-msgd8

msgd9 db 10,13,10,13,"Presione Tecla [ESC] para salir",10,13
lend9 equ $-msgd9

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

gano db 10,10,"GANASTE EL JUEGO, Felicidades!!!",10,7,7
lengano equ $-gano

perdio db 10,10,"Perdiste el juego, vuelve a intentar :(",10,7,7
lenperdio equ $-perdio

;--------------------------------------------------------------------------
;---------------------------SECTION.BSS-----------------------------------
;--------------------------------------------------------------------------

section .bss
num resb 2
num2 resb 2
num3 resb 2
let resb 1
pala resb 5
pala6 resb 6
pala7 resb 7
pala8 resb 8
pala9 resb 9
pala10 resb 10
pala11 resb 11
pala12 resb 12
pala13 resb 13
pala14 resb 14
pala15 resb 15

;--------------------------------------------------------------------------
section .text
	global _start
_start:
;----------------------------------------------------------------------------------
;-------------------------------INICIO---------------------------------------------
;----------------------------------------------------------------------------------
inicio:
imprime codigo, lencodigo         ; pone los colores 
imprime ms0,lenms0
imprime codigo7, lencodigo7 
imprime ms,lenms
imprime ms1,lenms1
imprime ms2,lenms2
imprime ms3,lenms3
imprime ms4,lenms4
imprime ms5,lenms5
imprime codigo, lencodigo 
imprime msg2,len2                 ; seleccione una opcion
imprime msg3,len3                 ; inicio
imprime msg4,len4                 ; salir

recibe num,2                   ; recibe la opcion a ejecutar

mov ah,[num]                   ; mueve el numero ingresado al registro ah
sub ah,'0'                     ; Convierte el valor de ascii a decimal 

cmp ah, 1                      ; Compara lo que hay en ah con 1
je dificultad                  

cmp ah, 2                      ; Compara lo que hay en ah con 2
je salir                       ; si es igual se termina el programa

jmp inicio                     ;Si se pone cualquier otro numero salta a inicio
;----------------------------------------------------------------------------------
;---------------------------DIFICULTAD---------------------------------------------
;----------------------------------------------------------------------------------

dificultad:
imprime codigo1,lencodigo1           ; pone los colores 
imprime msgi1,leni1                  ;seleccione dificultad
imprime msgi2,leni2                  ;facil
imprime msgi3,leni3                  ;medio 
imprime msgi4,leni4                  ;alto
imprime msgi5,leni5                  ;ir al menu anterior
recibe num,2                         ; recibe la opcion a ejecutar 

mov bh,[num]                         ; mueve a bh el numero ingresado

sub bh,48                            ; Convierte el valor de ascii a decimal 

cmp bh, 1                            ; Compara lo que hay en bh con 1 
je random_bajo                      ; Si es igual salta a random_bajo

cmp bh, 2                            ; Compara lo que hay en bh con 2 
je random_medio                     ; Si es igual salta a random_medio

cmp bh, 3                            ; Compara lo que hay en bh con 3 
je random_alto                      ; Si es igual salta a random_alto

cmp bh, 4                            ; Compara lo que hay en bh con 4 
je inicio                            ; Si es igual salta a inicio

jmp dificultad                       ; Si se pone cualquier otro numero salta a dificultad

;----------------------------------------------------------------------------------
;----------------------------ALEATORIO------------------------------------
;----------------------------------------------------------------------------------

;-----------------------------------BAJO-------------------------------------------

random_bajo:

xor eax,eax
rdtsc
and eax,0x000F


cmp al,2                                   ;compara al con 2
je bajo5                                     ;si es igual salta a bajo5

cmp al,4                                   ;compara al con 4
je bajo6                                     ;si es igual salta a bajo6

cmp al,6                                   ;compara al con 6
je bajo7                                     ;si es igual salta a bajo7

cmp al, 8                                  ;compara al con 8
je bajo8                                     ;si es igual salta a bajo8

cmp al, 10                                 ;compara al con 10
je bajo9                                     ;si es igual salta a bajo9

jmp random_bajo                            ;Si no pasa nada de lo anterior se repite el proceso
;---------------------------------MEDIO-----------------------------------
;--------------------------------------------------------------------------

random_medio:

xor eax,eax
rdtsc
and eax,0x000F

cmp al,2                                 ;compara al con 2
je medio9                                    ;si es igual salta a medio9

cmp al,4                                 ;compara al con 4
je medio10                                   ;si es igual salta a medio10

cmp al,6                                 ;compara al con 6
je medio11                                   ;si es igual salta a medio11

cmp al,8                                 ;compara al con 8
je medio12                                   ;si es igual salta a medio12

cmp al,10                                ;compara al con 10
je medio13                                   ;si es igual salta a medio13

jmp random_medio                         ;Si no pasa nada de lo anterior se repite el proceso
;---------------------------------ALTO------------------------------------
;--------------------------------------------------------------------------

random_alto:

xor eax,eax
rdtsc
and eax,0x000F

cmp al,2                                 ;compara al con 2
je alto12                                    ;si es igual salta a alto12

cmp al,4                                 ;compara al con 4
je alto13                                    ;si es igual salta a alto13

cmp al,6                                 ;compara al con 6
je alto14                                    ;si es igual salta a alto14

cmp al,8                                  ;compara al con 8
je alto15                                    ;si es igual salta a alto15

cmp al,10                                 ;compara al con 10
je alto16                                    ;si es igual salta a alto16

jmp random_alto                           ;Si no pasa nada de lo anterior se repite el proceso
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;-----------------------------NIVEL BAJO----------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               BAJO-1
;--------------------------------------------------------------------------

bajo5:

mov ah,lenpal                                ; mueve a ah el tamaño de la palabra
mov ch,lenpal4                                ; mueve a ch el tamaño de la palabra
add ah,47                                    ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                                   ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah                                ; mueve lo que esta en ah a num2
mov [num3],ch                                ; mueve lo que esta en ch a num3

imprime codigo3, lencodigo3                  ; pone los colores 
imprime msgd1,lend1                          ; dificultad baja
imprime msgd4,lend4                          ; palabra a adivinar
imprime num2,2                               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5                          ; Palabra
imprime msli,lenmsli                         ; aqui tiene que ir los renglones
imprime msgd6,lend6                          ; letras solicitadas
imprime espa,lenespa                         ; aqui deberian ir las letras
imprime msgd7,lend7                          ; voy a tener suerte
imprime msgd8,lend8                          ; Turnos disponibles
imprime num3,2                               ; aqui tienen que ir los turnos 
imprime msgd9,lend9                          ; presion esc para salir
mov ebp,0                                    ; Coloca un 0 en ebp
mov esp,espa                                 ; Coloca espa en esp
;-------------------------------------------------------------------------

ciclo5:

recibe let,1                                 ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]                                 ; MUEVE A AH LA LETRA RECIBIDA 

cmp ah,27                                    ; COMPARA EL INPUT CON LA LETRA ESC
je aux                                       ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah                             ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, pal                                 ; MUEVE LA PALABRA A ESI
mov edi, msli                                ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin                           ; texto: para separar las impresiones (---)
imprime msgd1,lend1                          ; texto: dificultad baja
imprime msgd4,lend4                          ; texto: palabra a adivinar
imprime num2,2                               ; la cantidad de letras
imprime msgd5,lend5                          ; texto: Palabra

;--------------------------------------------------------------------------

leer5:
mov al, [let]                                ; MUEVE LA LETRA INGRESADA A AL

cmp al,"3"                                   ; COMPARA AL CON 3
je suerte5                                   ; SI ES IGUAL SALTA A SUERTE5

cmp byte[esi], al                            ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplace5                                 ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0                             ; COMPRUEBA SI YA LLEGO AL FINAL DE LA PALABRA
je ultimo5                                   ; SI ES IGUAL VA A ULTIMO5

inc esi                                      ; PASA A LA SIGUIENTE LETRA
add edi,3                                    ; PASA AL SIGUIENTE RENGLON


jmp leer5                                    ; PASA A LEER
;--------------------------------------------------------------------------

remplace5:
mov byte[edi], al                           ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."                           ; CAMBIA LA LETRA POR UN PUNTO(para que a la hora de comparar no se quede en un ciclo)
inc byte[num3]                              ; incrementa la cantidad de intentos (para que los intentos queden igual)
Inc ebp                                     ; incrementa ebp
jmp leer5                                   ; SE VA A LEER

;--------------------------------------------------------------------------

ultimo5:
imprime msli,lenmsli                        ; imprime el cambio de letra-renglon
imprime msgd6,lend6                         ; letras solicitadas
imprime espa,lenespa                        ; imprime espa (aqui se imprime el la letra en letras solicitadas)
add esp,2                                   ; pasa al siguiente espacio (donde se va a colocar la letra)
imprime msgd7,lend7                         ; imrime voy a tener suerte
imprime msgd8,lend8                         ; imprime Turnos disponibles

cmp ebp,5                                   ; compara ebp con 5, para ver si ya se completo la palabra
je salir5                                   ; Si es igual salta a salir5

mov ah, [num3]                              ; mueve a ah la cantidad de intentos
cmp ah,"1"                                  ; los compara con uno para saber cuando terminar
je salir5                                   ; si se acaban los intentos salta a salir5

dec byte[num3]                              ; quita un intento 

imprime num3,2                              ; aqui van los intentos  
imprime msgd9,lend9                         ; imprime presione esc para salir
jmp ignora5                                    ; salta a ignora5 para que ignore ese recibe y funcione el que esta en ciclo5

;--------------------------------------------------------------------------

; Este su utiliza ya que el por alguna razon que desconocemos el codigo ignora algunos "recibe", entonces saltamos 
; a este para que se lo ignore y de ahi si pase al que necesitamos y todo siga bien

ignora5:                 
recibe num,1 
jmp ciclo5

;--------------------------------------------------------------------------

suerte5:
recibe num,1                              ; Este es para que se ignore y funcione el siguiente           

recibe pala,5                             ; recibe la palabra que se cree que es correcta
mov ax,[pala]                             ; mueve esa palabra a ax
mov bx,[copal]                            ; mueve la palabra correcta a bx
cmp ax,bx                                 ; compara la palabra ingresada con la palabra correcta
je salir5g                                ; si es igual salta a salir5g
jne salir5                                ; si no es igual salta a salir5
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               BAJO-2
;--------------------------------------------------------------------------
bajo6:

mov ah,lenpal1    ; mueve a ah el tamaño de la palabra
mov ch,lenpal4    ; mueve a ch el tamaño de la palabra
add ah,47         ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47        ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah     ; mueve lo que esta en ah a num2
mov [num3],ch     ; mueve lo que esta en ch a num3

imprime codigo3, lencodigo3  ; pone los colores 
imprime msgd1,lend1 ; dificultad baja
imprime msgd4,lend4 ; palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra
imprime msli1,lenmsli1 ; aqui tiene que ir los renglones
imprime msgd6,lend6 ; letras solicitadas
                    ; aqui deberian ir las letras
imprime msgd7,lend7 ; voy a tener suerte
imprime msgd8,lend8 ; Turnos disponibles
imprime num3,2      ; aqui tienen que ir los turnos 
imprime msgd9,lend9 ; presion esc para salir
mov ebp,0           ; Coloca un 0 en ebp
mov esp,espa1       ; Coloca espa1 en esp

;--------------------------------------------------------------------------

ciclo6:

recibe let,1     ; RECIBE LA LETRA QUE SE VA A COMPARAR
mov ah,[let]     ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27        ; COMPARA EL INPUT CON LA LETRA ESC
je aux           ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, pal1     ;MUEVE LA PALABRA A ESI
mov edi, msli1    ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)
imprime msgd1,lend1 ; dificultad baja
imprime msgd4,lend4 ; palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra

;--------------------------------------------------------------------------

leer6:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerte6             ; SI ES IGUAL SALTA A SUERTE5

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplace6            ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimo6              ; SI ES IGUAL VA A ULTIMO6


inc esi                ;PASA A LA SIGUIENTE LETRA
add edi,3              ;PASA AL SIGUIENTE RENGLON
jmp leer6               ;PASA A LEER

;--------------------------------------------------------------------------

remplace6:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leer6               ; SE VA A LEER

;--------------------------------------------------------------------------

ultimo6:
imprime msli1,lenmsli1 ; imprime el cambio de letra-renglon
imprime msgd6,lend6 ; letras solicitadas
imprime espa1,lenespa1 ; imprime espa1 (aqui se imprime el la letra en letras solicitadas)
add esp,2           ; pasa al siguiente espacio (donde se va a colocar la letra)
imprime msgd7,lend7 ; voy a tener suerte
imprime msgd8,lend8 ; Turnos disponibles

cmp ebp,6           ; compara ebp con 6, para ver si ya se completo la palabra
je salir6           ; Si es igual sale a salir6

mov ah, [num3]      ; mueve a ah la cantidad de intentos
cmp ah,"1"          ; los compara con uno para saber cuando terminar
je salir6           ; si se acaban los intentos salta a salir5

dec byte[num3]      ; quita un intento

imprime num3,2      ; aqui tienen que ir los turnos 
imprime msgd9,lend9 ; presion esc para salir
jmp ignora6            ; salta a ignora6 para que ignore ese recibe y funcione el que esta en ciclo6

;--------------------------------------------------------------------------

ignora6:
recibe num,1
jmp ciclo6

;--------------------------------------------------------------------------

suerte6:
recibe num,1        ; Este es para que se ignore y funcione el siguiente
recibe pala6,6      ; recibe la palabra que se cree que es correcta
mov ebp,[pala6]     ; mueve esa palabra a ebp
mov edi,[copal1]    ; mueve la palabra correcta a edi
cmp ebp,edi         ; compara la palabra ingresada con la palabra correcta
je salir6g          ; si es igual salta a salir6g
jne salir6          ; si no es igual salta a salir6

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               BAJO-3
;-------------------------------------------------------------------------

bajo7:

mov ah,lenpal2      ; mueve a ah el tamaño de la palabra
mov ch,lenpal4      ; mueve a ch el tamaño de la palabra
add ah,47           ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47          ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah       ; mueve lo que esta en ah a num2
mov [num3],ch       ; mueve lo que esta en ch a num3

imprime codigo3, lencodigo3  ; pone los colores 
imprime msgd1,lend1 ; dificultad baja
imprime msgd4,lend4 ; palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra
imprime msli2,lenmsli2 ; aqui tiene que ir los renglones
imprime msgd6,lend6 ; letras solicitadas
                    ; aqui deberian ir las letras
imprime msgd7,lend7 ; voy a tener suerte
imprime msgd8,lend8 ; Turnos disponibles
imprime num3,2      ; aqui tienen que ir los turnos 
imprime msgd9,lend9 ; presion esc para salir
mov ebp,0           ; Coloca un 0 en ebp
mov esp,espa2       ; Coloca espa2 en esp

;--------------------------------------------------------------------------

ciclo7:

recibe let,1     ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]     ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27        ; COMPARA EL INPUT CON LA LETRA ESC
je aux           ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, pal2     ;MUEVE LA PALABRA A ESI
mov edi, msli2    ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)
imprime msgd1,lend1 ; dificultad baja
imprime msgd4,lend4 ; palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra

;--------------------------------------------------------------------------

leer7:
mov al, [let]          ;MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerte7             ; SI ES IGUAL SALTA A SUERTE7

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplace7            ; SI ES IGUAL SE VA A REMPLACE7

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimo7              ; SI ES IGUAL VA A ULTIMO7


inc esi                ;PASA A LA SIGUIENTE LETRA
add edi,3              ;PASA AL SIGUIENTE RENGLON
jmp leer7               ;PASA A LEER

;--------------------------------------------------------------------------

remplace7:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leer7              ; SE VA A LEER

;--------------------------------------------------------------------------

ultimo7:
imprime msli2,lenmsli2  ; imprime el cambio de letra-renglon
imprime msgd6,lend6 ; letras solicitadas
imprime espa2,lenespa2  ; imprime espa2
add esp,2               ; pasa al siguiente espacio
imprime msgd7,lend7 ; voy a tener suerte
imprime msgd8,lend8 ; Turnos disponibles

cmp ebp,7           ; compara ebp con 7, para ver si ya se completo la palabra
je salir7           ; Si es igual sale a salir7

mov ah, [num3]      ; mueve a ah la cantidad de intentos
cmp ah,"1"          ; los compara con uno para saber cuando terminar
je salir7           ; si se acaban los intentos salta a salir7

dec byte[num3]      ; quita un intento 

imprime num3,2      ; aqui tienen que ir los turnos 
imprime msgd9,lend9 ; presion esc para salir
jmp ignora7            ; salta a ignora7 para que ignore ese recibe y funcione el que esta en ciclo7

;--------------------------------------------------------------------------

ignora7:
recibe num,1
jmp ciclo7

;--------------------------------------------------------------------------

suerte7:
recibe num,1       ; Este es para que se ignore y funcione el siguiente
recibe pala7,7     ; recibe la palabra que se cree que es correcta
mov ebp,[pala7]    ; mueve esa palabra a edp
mov edi,[copal2]   ; mueve la palabra correcta a edi
cmp ebp,edi        ; compara la palabra ingresada con la palabra correcta
je salir7g         ; si es igual salta a salir7g
jne salir7         ; si no es igual salta a salir7

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               BAJO-4
;-------------------------------------------------------------------------

bajo8:

mov ah,lenpal3      ; mueve a ah el tamaño de la palabra
mov ch,lenpal4      ; mueve a ch el tamaño de la palabra
add ah,47           ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47          ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah       ; mueve lo que esta en ah a num2
mov [num3],ch       ; mueve lo que esta en ch a num3

imprime codigo3, lencodigo3  ; pone los colores 
imprime msgd1,lend1 ; dificultad baja
imprime msgd4,lend4 ; palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra
imprime msli3,lenmsli3 ; aqui tiene que ir los renglones
imprime msgd6,lend6 ; letras solicitadas
                    ; aqui deberian ir las letras
imprime msgd7,lend7 ; voy a tener suerte
imprime msgd8,lend8 ; Turnos disponibles
imprime num3,2      ; aqui tienen que ir los turnos 
imprime msgd9,lend9 ; presion esc para salir
mov ebp,0           ; Coloca un 0 en ebp
mov esp,espa3       ; Coloca espa3 en esp

;--------------------------------------------------------------------------

ciclo8:

recibe let,1        ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]        ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27           ; COMPARA EL INPUT CON LA LETRA ESC
je aux              ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah    ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, pal3       ;MUEVE LA PALABRA A ESI
mov edi, msli3      ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)
imprime msgd1,lend1 ; dificultad baja
imprime msgd4,lend4 ; palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra

;--------------------------------------------------------------------------

leer8:
mov al, [let]          ;MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerte8             ; SI ES IGUAL SALTA A SUERTE8

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplace8           ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimo8             ; SI ES IGUAL VA A ULTIMO8

inc esi                ;PASA A LA SIGUIENTE LETRA
add edi,3              ;PASA AL SIGUIENTE RENGLON
jmp leer8              ;PASA A LEER

;--------------------------------------------------------------------------

remplace8:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leer8              ; SE VA A LEER

;--------------------------------------------------------------------------

ultimo8:
imprime msli3,lenmsli3 ; imprime el cambio de letra-renglon
imprime msgd6,lend6 ; letras solicitadas
imprime espa3,lenespa3 ; imprime espa3
add esp,2           ; pasa al siguiente espacio
imprime msgd7,lend7 ; voy a tener suerte
imprime msgd8,lend8 ; Turnos disponibles

cmp ebp,8           ; compara ebp con 8, para ver si ya se completo la palabra
je salir8           ; Si es igual sale a salir8

mov ah, [num3]      ; mueve a ah la cantidad de intentos
cmp ah,"1"          ; los compara con uno para saber cuando terminar
je salir8           ; si se acaban los intentos salta a salir8

dec byte[num3]      ; quita un intento

imprime num3,2      ; aqui tienen que ir los turnos 
imprime msgd9,lend9 ; presion esc para salir
jmp ignora8            ; salta a ignora8 para que ignore ese recibe y funcione el que esta en ciclo8

;--------------------------------------------------------------------------

ignora8:
recibe num,1
jmp ciclo8

;--------------------------------------------------------------------------

suerte8:

recibe num,1        ; Este es para que se ignore y funcione el siguiente
recibe pala8,8      ; recibe la palabra que se cree que es correcta
mov ebp,[pala8]     ; mueve esa palabra a edp
mov edi,[copal3]    ; mueve la palabra correcta a edi
cmp ebp,edi         ; compara la palabra ingresada con la palabra correcta
je salir8g          ; si es igual salta a salir8g
jne salir8          ; si no es igual salta a salir8

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               BAJO-5
;--------------------------------------------------------------------------

bajo9:

mov ah,lenpal4      ; mueve a ah el tamaño de la palabra
mov ch,lenpal4      ; mueve a ch el tamaño de la palabra
add ah,47           ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47          ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah       ; mueve lo que esta en ah a num2
mov [num3],ch       ; mueve lo que esta en ch a num3

imprime codigo3, lencodigo3  ; pone los colores 
imprime msgd1,lend1 ; dificultad baja
imprime msgd4,lend4 ; palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra
imprime msli4,lenmsli4 ; aqui tiene que ir los renglones
imprime msgd6,lend6 ; letras solicitadas
                    ; aqui deberian ir las letras
imprime msgd7,lend7 ; voy a tener suerte
imprime msgd8,lend8 ; Turnos disponibles
imprime num3,2      ; aqui tienen que ir los turnos 
imprime msgd9,lend9 ; presion esc para salir
mov ebp,0           ; Coloca un 0 en ebp
mov esp,espa4       ; Coloca espa4 en esp

;--------------------------------------------------------------------------

ciclo9:

recibe let,1        ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]        ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27           ; COMPARA EL INPUT CON LA LETRA ESC
je aux              ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah    ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, pal4       ; MUEVE LA PALABRA A ESI
mov edi, msli4      ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)
imprime msgd1,lend1 ; dificultad baja
imprime msgd4,lend4 ; palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra

;--------------------------------------------------------------------------

leer9:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerte9             ; SI ES IGUAL SALTA A SUERTE9

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplace9           ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimo9             ; SI ES IGUAL VA A ULTIMO9

inc esi                ; PASA A LA SIGUIENTE LETRA
add edi,3              ; PASA AL SIGUIENTE RENGLON
jmp leer9              ; PASA A LEER

;--------------------------------------------------------------------------

remplace9:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leer9              ; SE VA A LEER

;--------------------------------------------------------------------------

ultimo9:
imprime msli4,lenmsli4   ; imprime el cambio de letra-renglon
imprime msgd6,lend6      ; letras solicitadas
imprime espa4,lenespa4   ; imprime espa4
add esp,2                ; pasa al siguiente espacio
imprime msgd7,lend7      ; voy a tener suerte
imprime msgd8,lend8      ; Turnos disponibles

cmp ebp,9                ; compara ebp con 9, para ver si ya se completo la palabra
je salir9                ; Si es igual sale a salir9

mov ah, [num3]           ; mueve a ah la cantidad de intentos
cmp ah,"1"               ; los compara con uno para saber cuando terminar
je salir9                ; si se acaban los intentos salta a salir5

dec byte[num3]           ; quita un intento

imprime num3,2           ; aqui tienen que ir los turnos 
imprime msgd9,lend9      ; presion esc para salir
jmp ignora9                 ; salta a ignora9 para que ignore ese recibe y funcione el que esta en ciclo9

;--------------------------------------------------------------------------

ignora9:
recibe num,1
jmp ciclo9

;--------------------------------------------------------------------------

suerte9:

recibe num,1             ; Este es para que se ignore y funcione el siguiente
recibe pala9,9           ; recibe la palabra que se cree que es correcta
mov ebp,[pala9]          ; mueve esa palabra a ebp
mov edi,[copal4]         ; mueve la palabra correcta a edi
cmp ebp,edi              ; compara la palabra ingresada con la palabra correcta
je salir9g               ; si es igual salta a salir5g
jne salir9               ; si no es igual salta a salir5

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               MEDIO-1
;-------------------------------------------------------------------------
medio9:

mov ah,lenpalM1         ; mueve a ah el tamaño de la palabra
mov ch,lenpalM4         ; mueve a ch el tamaño de la palabra
add ah,47               ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47              ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah           ; mueve lo que esta en ah a num2
mov [num3],ch           ; mueve lo que esta en ch a num3

imprime codigo6, lencodigo6  ; pone los colores 
imprime msgd2,lend2          ; dificultad media
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliM1,lenmsliM1     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaM1,lenespaM1     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaM1               ; Coloca espaM1 en esp
;--------------------------------------------------------------------------

cicloM9:

recibe let,1         ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]         ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27
je aux

mov byte[esp],ah

mov esi, palM1      ; MUEVE LA PALABRA A ESI
mov edi, msliM1     ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)

imprime msgd2,lend2 ; texto: dificultad media
imprime msgd4,lend4 ; texto: palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra


;--------------------------------------------------------------------------

leerM9:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteM9            ; SI ES IGUAL SALTA A SUERTE5

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceM9          ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoM9            ; SI ES IGUAL VA A ULTIMOM9

inc esi                ;PASA A LA SIGUIENTE LETRA
add edi,3              ;PASA AL SIGUIENTE RENGLON
jmp leerM9             ;PASA A LEER

;--------------------------------------------------------------------------

remplaceM9:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerM9             ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoM9:
imprime msliM1,lenmsliM1    ; imprime el cambio de letra-renglon
imprime msgd6,lend6         ; letras solicitadas
imprime espaM1,lenespaM1    ; imprime espaM1
add esp,2                   ; pasa al siguiente espacio
imprime msgd7,lend7         ; voy a tener suerte
imprime msgd8,lend8         ; Turnos disponibles
cmp ebp,9                   ; compara ebp con 9, para ver si ya se completo la palabra
je salir9m                  ; Si es igual sale a salir9m

mov ah, [num3]              ; mueve a ah la cantidad de intentos
cmp ah,"1"                  ; los compara con uno para saber cuando terminar
je salir9m                   ; si se acaban los intentos salta a salir9

dec byte[num3]              ; quita un intento

imprime num3,2              ; aqui tienen que ir los turnos 
imprime msgd9,lend9         ; presion esc para salir
jmp ignoraM9                   ; salta a ignoraM9 para que ignore ese recibe y funcione el que esta en cicloM9

;--------------------------------------------------------------------------

ignoraM9:
recibe num,1
jmp cicloM9
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------

suerteM9:
recibe num,1               ; Este es para que se ignore y funcione el siguiente
recibe pala9,9             ; recibe la palabra que se cree que es correcta
mov ebp,[pala9]            ; mueve esa palabra a ebp
mov edi,[copalM1]          ; mueve la palabra correcta a edi

cmp ebp,edi                ; compara la palabra ingresada con la palabra correcta
je salir9mg                 ; si es igual salta a salir9g
jne salir9m                 ; si no es igual salta a salir9

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               MEDIO-2
;-------------------------------------------------------------------------

medio10:

mov ah,lenpalM2            ; mueve a ah el tamaño de la palabra
mov ch,lenpalM4            ; mueve a ch el tamaño de la palabra
add ah,47                  ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                 ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah              ; mueve lo que esta en ah a num2
mov [num3],ch              ; mueve lo que esta en ch a num3

imprime codigo6, lencodigo6  ; pone los colores 
imprime msgd2,lend2          ; dificultad media
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliM2,lenmsliM2     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaM2,lenespaM2     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaM2               ; Coloca espaM2 en esp

;--------------------------------------------------------------------------

cicloM10:

recibe let,1         ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]         ; MUEVE A AH LA LETRA RECIBIDA 

cmp ah,27            ; COMPARA EL INPUT CON LA LETRA ESC
je aux               ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah     ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, palM2       ; MUEVE LA PALABRA A ESI
mov edi, msliM2      ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin   ; texto: para separar las impresiones (---)

imprime msgd2,lend2  ; texto: dificultad media
imprime msgd4,lend4  ; texto: palabra a adivinar
imprime num2,2       ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5  ; Palabra


;--------------------------------------------------------------------------

leerM10:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteM10           ; SI ES IGUAL SALTA A SUERTEM10

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceM10         ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoM10           ; SI ES IGUAL VA A ULTIMOM10

inc esi                ; PASA A LA SIGUIENTE LETRA
add edi,3              ; PASA AL SIGUIENTE RENGLON
jmp leerM10            ; PASA A LEER

;--------------------------------------------------------------------------

remplaceM10:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerM10            ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoM10:
imprime msliM2,lenmsliM2    ; imprime el cambio de letra-renglon
imprime msgd6,lend6         ; letras solicitadas
imprime espaM2,lenespaM2    ; imprime espaM2
add esp,2                   ; pasa al siguiente espacio
imprime msgd7,lend7         ; voy a tener suerte
imprime msgd8,lend8         ; Turnos disponibles
cmp ebp,10                  ; compara ebp con 10, para ver si ya se completo la palabra
je salir10                  ; Si es igual sale a salir10

mov ah, [num3]              ; mueve a ah la cantidad de intentos
cmp ah,"1"                  ; los compara con uno para saber cuando terminar
je salir10                  ; si se acaban los intentos salta a salir10

dec byte[num3]              ; quita un intento 

imprime num3,2              ; aqui tienen que ir los turnos 
imprime msgd9,lend9         ; presion esc para salir
jmp ignoraM10                  ; salta a ignoraM10 para que ignore ese recibe y funcione el que esta en cicloM10

;--------------------------------------------------------------------------

ignoraM10:
recibe num,1
jmp cicloM10

;--------------------------------------------------------------------------

suerteM10:
recibe num,1               ; Este es para que se ignore y funcione el siguiente
recibe pala10,10           ; recibe la palabra que se cree que es correcta
mov ebp,[pala10]           ; mueve esa palabra a edp
mov edi,[copalM2]          ; mueve la palabra correcta a edi

cmp ebp,edi                ; compara la palabra ingresada con la palabra correcta
je salir10g                ; si es igual salta a salir10g
jne salir10                ; si no es igual salta a salir10

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               MEDIO-3
;-------------------------------------------------------------------------

medio11:

mov ah,lenpalM3              ; mueve a ah el tamaño de la palabra
mov ch,lenpalM4              ; mueve a ch el tamaño de la palabra
add ah,47                    ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                   ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah                ; mueve lo que esta en ah a num2
mov [num3],ch                ; mueve lo que esta en ch a num3

imprime codigo6, lencodigo6  ; pone los colores 
imprime msgd2,lend2          ; dificultad media
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliM3,lenmsliM3     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaM3,lenespaM3     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaM3               ; Coloca espaM3 en esp

;--------------------------------------------------------------------------

cicloM11:

recibe let,1        ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]        ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27           ; COMPARA EL INPUT CON LA LETRA ESC
je aux              ; SI ES IGUAL SALTA A AUX
mov byte[esp],ah    ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, palM3      ; MUEVE LA PALABRA A ESI
mov edi, msliM3     ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)

imprime msgd2,lend2 ; texto: dificultad media
imprime msgd4,lend4 ; texto: palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra


;--------------------------------------------------------------------------

leerM11:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteM11           ; SI ES IGUAL SALTA A SUERTEM11

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceM11         ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoM11           ; SI ES IGUAL VA A ULTIMOM11

inc esi                ; PASA A LA SIGUIENTE LETRA
add edi,3              ; PASA AL SIGUIENTE RENGLON
jmp leerM11            ; PASA A LEER

;--------------------------------------------------------------------------

remplaceM11:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerM11            ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoM11:
imprime msliM3,lenmsliM3    ; imprime el cambio de letra-renglon
imprime msgd6,lend6         ; letras solicitadas
imprime espaM3,lenespaM3    ; imprime espaM3
add esp,2                   ; pasa al siguiente espacio
imprime msgd7,lend7         ; voy a tener suerte
imprime msgd8,lend8         ; Turnos disponibles
cmp ebp,11                  ; compara ebp con 11, para ver si ya se completo la palabra
je salir11                  ; Si es igual sale a salir5

mov ah, [num3]              ; mueve a ah la cantidad de intentos
cmp ah,"1"                  ; los compara con uno para saber cuando terminar
je salir11                  ; si se acaban los intentos salta a salir11

dec byte[num3]              ; quita un intento

imprime num3,2              ; aqui tienen que ir los turnos 
imprime msgd9,lend9         ; presion esc para salir
jmp ignoraM11                  ; salta a ignoraM11 para que ignore ese recibe y funcione el que esta en cicloM11

;--------------------------------------------------------------------------

ignoraM11:
recibe num,1
jmp cicloM11

;--------------------------------------------------------------------------

suerteM11:
recibe num,1                ; Este es para que se ignore y funcione el siguiente
recibe pala11,11            ; recibe la palabra que se cree que es correcta
mov ebp,[pala11]            ; mueve esa palabra a edp
mov edi,[copalM3]           ; mueve la palabra correcta a edi

cmp ebp,edi                 ; compara la palabra ingresada con la palabra correcta
je salir11g                 ; si es igual salta a salir11g
jne salir11                 ; si no es igual salta a salir11

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               MEDIO-4
;-------------------------------------------------------------------------

medio12:

mov ah,lenpalM4             ; mueve a ah el tamaño de la palabra
mov ch,lenpalM4             ; mueve a ch el tamaño de la palabra
add ah,47                   ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                  ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah               ; mueve lo que esta en ah a num2
mov [num3],ch               ; mueve lo que esta en ch a num3

imprime codigo6, lencodigo6  ; pone los colores 
imprime msgd2,lend2          ; dificultad media
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliM4,lenmsliM4     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaM4,lenespaM4     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaM4               ; Coloca espaM4 en esp

;--------------------------------------------------------------------------

cicloM12:

recibe let,1        ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]        ; MUEVE A AH LA LETRA RECIBIDA 

cmp ah,27           ; COMPARA EL INPUT CON LA LETRA ESC
je aux              ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah    ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, palM4      ; MUEVE LA PALABRA A ESI
mov edi, msliM4     ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)

imprime msgd2,lend2 ; texto: dificultad media
imprime msgd4,lend4 ; texto: palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra


;--------------------------------------------------------------------------

leerM12:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteM12           ; SI ES IGUAL SALTA A SUERTE5

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceM12         ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoM12           ; SI ES IGUAL VA A ULTIMOM12

inc esi                ; PASA A LA SIGUIENTE LETRA
add edi,3              ; PASA AL SIGUIENTE RENGLON
jmp leerM12            ; PASA A LEER

;--------------------------------------------------------------------------

remplaceM12:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerM12            ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoM12:
imprime msliM4,lenmsliM4     ; imprime el cambio de letra-renglon
imprime msgd6,lend6          ; letras solicitadas
imprime espaM4,lenespaM4     ; imprime espaM4
add esp,2                    ; pasa al siguiente espacio
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
cmp ebp,9                  ; compara ebp con 12, para ver si ya se completo la palabra
je salir12                   ; Si es igual sale a salir12

mov ah, [num3]               ; mueve a ah la cantidad de intentos
cmp ah,"1"                   ; los compara con uno para saber cuando terminar
je salir12                   ; si se acaban los intentos salta a salir12

dec byte[num3]               ; quita un intento

imprime num3,2               ; aqui tienen que ir los turnos 
imprime msgd9,lend9          ; presion esc para salir
jmp ignoraM12                   ; salta a ignoraM12 para que ignore ese recibe y funcione el que esta en cicloM12

;--------------------------------------------------------------------------

ignoraM12:
recibe num,1
jmp cicloM12

;--------------------------------------------------------------------------

suerteM12:
recibe num,1                 ; Este es para que se ignore y funcione el siguiente
recibe pala9,9             ; recibe la palabra que se cree que es correcta
mov ebp,[pala9]             ; mueve esa palabra a ebp
mov edi,[copalM4]            ; mueve la palabra correcta a edi

cmp ebp,edi                  ; compara la palabra ingresada con la palabra correcta
je salir12g                  ; si es igual salta a salir12g
jne salir12                  ; si no es igual salta a salir12

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               MEDIO-5
;-------------------------------------------------------------------------
medio13:

mov ah,lenpalM5        ; mueve a ah el tamaño de la palabra
mov ch,lenpalM4         ; mueve a ch el tamaño de la palabra
add ah,47               ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47              ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah           ; mueve lo que esta en ah a num2
mov [num3],ch           ; mueve lo que esta en ch a num3

imprime codigo6, lencodigo6  ; pone los colores 
imprime msgd2,lend2          ; dificultad media
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliM1,lenmsliM1     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaM1,lenespaM1     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaM5              ; Coloca espaM1 en esp
;--------------------------------------------------------------------------

cicloM13:

recibe let,1         ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]         ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27
je aux

mov byte[esp],ah

mov esi, palM5      ; MUEVE LA PALABRA A ESI
mov edi, msliM5     ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)

imprime msgd2,lend2 ; texto: dificultad media
imprime msgd4,lend4 ; texto: palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra


;--------------------------------------------------------------------------

leerM13:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteM13           ; SI ES IGUAL SALTA A SUERTE5

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceM13          ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoM13            ; SI ES IGUAL VA A ULTIMOM9

inc esi                ;PASA A LA SIGUIENTE LETRA
add edi,3              ;PASA AL SIGUIENTE RENGLON
jmp leerM13             ;PASA A LEER

;--------------------------------------------------------------------------

remplaceM13:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerM13             ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoM13:
imprime msliM5,lenmsliM5    ; imprime el cambio de letra-renglon
imprime msgd6,lend6         ; letras solicitadas
imprime espaM5,lenespaM5    ; imprime espaM1
add esp,2                   ; pasa al siguiente espacio
imprime msgd7,lend7         ; voy a tener suerte
imprime msgd8,lend8         ; Turnos disponibles
cmp ebp,10                   ; compara ebp con 10, para ver si ya se completo la palabra
je salir13m                   ; Si es igual sale a salir9

mov ah, [num3]              ; mueve a ah la cantidad de intentos
cmp ah,"1"                  ; los compara con uno para saber cuando terminar
je salir13m                   ; si se acaban los intentos salta a salir9

dec byte[num3]              ; quita un intento

imprime num3,2              ; aqui tienen que ir los turnos 
imprime msgd9,lend9         ; presion esc para salir
jmp ignoraM13                   ; salta a ignoraM9 para que ignore ese recibe y funcione el que esta en cicloM9

;--------------------------------------------------------------------------

ignoraM13:
recibe num,1
jmp cicloM13

;--------------------------------------------------------------------------

suerteM13:
recibe num,1               ; Este es para que se ignore y funcione el siguiente
recibe pala10,10             ; recibe la palabra que se cree que es correcta
mov ebp,[pala10]            ; mueve esa palabra a ebp
mov edi,[copalM5]          ; mueve la palabra correcta a edi

cmp ebp,edi                ; compara la palabra ingresada con la palabra correcta
je salir13mg                 ; si es igual salta a salir9g
jne salir13m                 ; si no es igual salta a salir9


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               ALTO-1
;-------------------------------------------------------------------------

alto12:

mov ah,lenpalA1             ; mueve a ah el tamaño de la palabra
mov ch,lenpalA1             ; mueve a ch el tamaño de la palabra
add ah,47                   ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                  ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah               ; mueve lo que esta en ah a num2
mov [num3],ch               ; mueve lo que esta en ch a num3

imprime codigo7, lencodigo7  ; pone los colores 
imprime msgd3,lend3          ; dificultad alta
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliA1,lenmsliA1     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaA1,lenespaA1     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaA1               ; Coloca espaA1 en esp

;--------------------------------------------------------------------------

cicloA12:

recibe let,1          ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]          ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27             ; COMPARA EL INPUT CON LA LETRA ESC
je aux                ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah      ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, palA1        ; MUEVE LA PALABRA A ESI
mov edi, msliA1       ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin    ; texto: para separar las impresiones (---)

imprime msgd3,lend3   ; texto: dificultad alta
imprime msgd4,lend4   ; texto: palabra a adivinar
imprime num2,2        ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5   ; Palabra


;--------------------------------------------------------------------------

leerA12:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteA12           ; SI ES IGUAL SALTA A SUERTEA12

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceA12         ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoA12           ; SI ES IGUAL VA A ULTIMOA12

inc esi                ; PASA A LA SIGUIENTE LETRA
add edi,3              ; PASA AL SIGUIENTE RENGLON
jmp leerA12            ; PASA A LEER

;--------------------------------------------------------------------------

remplaceA12:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerA12            ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoA12:
imprime msliA1,lenmsliA1      ; imprime el cambio de letra-renglon
imprime msgd6,lend6           ; letras solicitadas
imprime espaA1,lenespaA1      ; imprime espaA1
add esp,2                     ; pasa al siguiente espacio
imprime msgd7,lend7           ; voy a tener suerte
imprime msgd8,lend8           ; Turnos disponibles
cmp ebp,12                    ; compara ebp con 12, para ver si ya se completo la palabra
je salir12a                    ; Si es igual sale a salir12

mov ah, [num3]                ; mueve a ah la cantidad de intentos
cmp ah,"1"                    ; los compara con uno para saber cuando terminar
je salir12a                    ; si se acaban los intentos salta a salir12

dec byte[num3]                ; quita un intento

imprime num3,2                ; aqui tienen que ir los turnos 
imprime msgd9,lend9           ; presion esc para salir
jmp ignoraA12                    ; salta a ignoraA12 para que ignore ese recibe y funcione el que esta en cicloA12

;--------------------------------------------------------------------------

ignoraA12:
recibe num,1
jmp cicloA12

;--------------------------------------------------------------------------

suerteA12:
recibe num,1         ; Este es para que se ignore y funcione el siguiente
recibe pala12,12     ; recibe la palabra que se cree que es correcta
mov ebp,[pala12]     ; mueve esa palabra a edp
mov edi,[copalA1]    ; mueve la palabra correcta a edi

cmp ebp,edi          ; compara la palabra ingresada con la palabra correcta
je salir12ag          ; si es igual salta a salir12ag
jne salir12a          ; si no es igual salta a salir12a

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               ALTO-2
;-------------------------------------------------------------------------

alto13:

mov ah,lenpalA2              ; mueve a ah el tamaño de la palabra
mov ch,lenpalA2              ; mueve a ch el tamaño de la palabra
add ah,47                    ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                   ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah                ; mueve lo que esta en ah a num2
mov [num3],ch                ; mueve lo que esta en ch a num3

imprime codigo7, lencodigo7  ; pone los colores 
imprime msgd3,lend3          ; dificultad alta
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliA2,lenmsliA2     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaA2,lenespaA2     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaA2               ; Coloca espaA2 en esp
;--------------------------------------------------------------------------

cicloA13:

recibe let,1           ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]           ; MUEVE A AH LA LETRA RECIBIDA 

cmp ah,27              ; COMPARA EL INPUT CON LA LETRA ESC
je aux                 ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah       ; CAMBIA LO QUE HAY EN ESP CON AH
mov esi, palA2         ; MUEVE LA PALABRA A ESI
mov edi, msliA2        ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin     ; texto: para separar las impresiones (---)

imprime msgd3,lend3    ; texto: dificultad alta
imprime msgd4,lend4    ; texto: palabra a adivinar
imprime num2,2         ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5    ; Palabra


;--------------------------------------------------------------------------

leerA13:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteA13           ; SI ES IGUAL SALTA A SUERTEA13

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceA13         ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoA13           ; SI ES IGUAL VA A ULTIMOA13

inc esi                ; PASA A LA SIGUIENTE LETRA
add edi,3              ; PASA AL SIGUIENTE RENGLON
jmp leerA13            ; PASA A LEER

;--------------------------------------------------------------------------

remplaceA13:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerA13            ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoA13:
imprime msliA2,lenmsliA2    ; imprime el cambio de letra-renglon
imprime msgd6,lend6         ; letras solicitadas
imprime espaA2,lenespaA2    ; imprime espaA2
add esp,2                   ; pasa al siguiente espacio
imprime msgd7,lend7         ; voy a tener suerte
imprime msgd8,lend8         ; Turnos disponibles
cmp ebp,13                  ; compara ebp con 13, para ver si ya se completo la palabra
je salir13                  ; Si es igual sale a salir13

mov ah, [num3]              ; mueve a ah la cantidad de intentos
cmp ah,"1"                  ; los compara con uno para saber cuando terminar
je salir13                  ; si se acaban los intentos salta a salir13

dec byte[num3]              ; quita un intento

imprime num3,2              ; aqui tienen que ir los turnos 
imprime msgd9,lend9         ; presion esc para salir
jmp ignoraA13                  ; salta a ignora5 para que ignore ese recibe y funcione el que esta en ciclo5

;--------------------------------------------------------------------------

ignoraA13:
recibe num,1
jmp cicloA13

;--------------------------------------------------------------------------

suerteA13:
recibe num,1              ; Este es para que se ignore y funcione el siguiente 
recibe pala13,13          ; recibe la palabra que se cree que es correcta
mov ebp,[pala13]          ; mueve esa palabra a edp
mov edi,[copalA2]         ; mueve la palabra correcta a edi

cmp ebp,edi               ; compara la palabra ingresada con la palabra correcta
je salir13g               ; si es igual salta a salir13g
jne salir13               ; si no es igual salta a salir13

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               ALTO-3
;-------------------------------------------------------------------------

alto14:

mov ah,lenpalA3              ; mueve a ah el tamaño de la palabra
mov ch,lenpalA3              ; mueve a ch el tamaño de la palabra
add ah,47                    ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                   ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah                ; mueve lo que esta en ah a num2
mov [num3],ch                ; mueve lo que esta en ch a num3

imprime codigo7, lencodigo7  ; pone los colores 
imprime msgd3,lend3          ; dificultad alta
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliA3,lenmsliA3     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaA3,lenespaA3     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tienen que ir los turnos
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaA3               ; Coloca espaA3 en esp
;--------------------------------------------------------------------------

cicloA14:

recibe let,1        ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]        ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27           ; COMPARA EL INPUT CON LA LETRA ESC
je aux              ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah    ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, palA3      ; MUEVE LA PALABRA A ESI
mov edi, msliA3     ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)

imprime msgd3,lend3 ; texto: dificultad alta
imprime msgd4,lend4 ; texto: palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra


;--------------------------------------------------------------------------

leerA14:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteA14           ; SI ES IGUAL SALTA A SUERTEA14

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceA14         ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoA14           ; SI ES IGUAL VA A ULTIMOA14

inc esi                ;PASA A LA SIGUIENTE LETRA
add edi,3              ;PASA AL SIGUIENTE RENGLON
jmp leerA14            ;PASA A LEER

;--------------------------------------------------------------------------

remplaceA14:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa ebp
Inc ebp                ; incrementa ebp
jmp leerA14            ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoA14:
imprime msliA3,lenmsliA3     ; imprime el cambio de letra-renglon
imprime msgd6,lend6          ; letras solicitadas
imprime espaA3,lenespaA3     ; imprime espaA3
add esp,2                    ; pasa al siguiente espacio
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
cmp ebp,14                   ; compara ebp con 14, para ver si ya se completo la palabra
je salir14                   ; Si es igual sale a salir14

mov ah, [num3]               ; mueve a ah la cantidad de intentos
cmp ah,"1"                   ; los compara con uno para saber cuando terminar
je salir14                   ; si se acaban los intentos salta a salir14

dec byte[num3]               ; quita un intento

imprime num3,2               ; aqui tienen que ir los turnos 
imprime msgd9,lend9          ; presion esc para salir
jmp ignoraA14                   ; salta a ignoraA14 para que ignore ese recibe y funcione el que esta en cicloA14

;--------------------------------------------------------------------------

ignoraA14:
recibe num,1
jmp cicloA14

;--------------------------------------------------------------------------

suerteA14:
recibe num,1                ; Este es para que se ignore y funcione el siguiente
recibe pala14,14            ; recibe la palabra que se cree que es correcta
mov al,[pala14]             ; mueve esa palabra a al
cmp al,[copalA3]            ; compara la palabra ingresada con la palabra correcta

je salir14g                 ; si es igual salta a salir5g
jne salir14                 ; si no es igual salta a salir5

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               ALTO-4
;-------------------------------------------------------------------------

alto15:

mov ah,lenpalA4              ; mueve a ah el tamaño de la palabra
mov ch,lenpalA4              ; mueve a ch el tamaño de la palabra
add ah,47                    ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                   ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah                ; mueve lo que esta en ah a num2
mov [num3],ch                ; mueve lo que esta en ch a num3

imprime codigo7, lencodigo7  ; pone los colores 
imprime msgd3,lend3          ; dificultad alta
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliA4,lenmsliA4     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaA4,lenespaA4     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaA4               ; Coloca espaA4 en esp
;--------------------------------------------------------------------------

cicloA15:

recibe let,1        ; RECIBE LA LETRA QUE SE VA A COMPARAR
mov ah,[let]        ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27           ; COMPARA EL INPUT CON LA LETRA ESC
je aux              ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah    ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, palA4      ; MUEVE LA PALABRA A ESI
mov edi, msliA4     ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin  ; texto: para separar las impresiones (---)

imprime msgd3,lend3 ; texto: dificultad alta
imprime msgd4,lend4 ; texto: palabra a adivinar
imprime num2,2      ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5 ; Palabra


;--------------------------------------------------------------------------

leerA15:
mov al, [let]          ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"             ; COMPARA AL CON 3
je suerteA15           ; SI ES IGUAL SALTA A SUERTEA15

cmp byte[esi], al      ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceA15         ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0       ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoA15           ; SI ES IGUAL VA A ULTIMOA15

inc esi                ; PASA A LA SIGUIENTE LETRA
add edi,3              ; PASA AL SIGUIENTE RENGLON
jmp leerA15            ; PASA A LEER

;--------------------------------------------------------------------------

remplaceA15:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerA15            ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoA15:
imprime msliA4,lenmsliA4    ; imprime el cambio de letra-renglon
imprime msgd6,lend6         ; letras solicitadas
imprime espaA4,lenespaA4    ; imprime espaA4
add esp,2                   ; pasa al siguiente espacio
imprime msgd7,lend7         ; voy a tener suerte
imprime msgd8,lend8         ; Turnos disponibles
cmp ebp,15                  ; compara ebp con 15, para ver si ya se completo la palabra
je salir15                  ; Si es igual sale a salir15

mov ah, [num3]              ; mueve a ah la cantidad de intentos
cmp ah,"1"                  ; los compara con uno para saber cuando terminar
je salir15                  ; si se acaban los intentos salta a salir15

dec byte[num3]              ; quita un intento

imprime num3,2              ; aqui tienen que ir los turnos 
imprime msgd9,lend9         ; presion esc para salir
jmp ignoraA15                  ; salta a ignoraA15 para que ignore ese recibe y funcione el que esta en cicloA15

;--------------------------------------------------------------------------

ignoraA15:
recibe num,1
jmp cicloA15

;--------------------------------------------------------------------------

suerteA15:
recibe num,1                ; Este es para que se ignore y funcione el siguiente
recibe pala15,15            ; recibe la palabra que se cree que es correcta
mov al,[pala15]             ; mueve esa palabra a al
cmp al,[copalA4]            ; compara la palabra ingresada con la palabra correcta

je salir15g                 ; si es igual salta a salir15g
jne salir15                 ; si no es igual salta a salir15

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;                               ALTO-5
;-------------------------------------------------------------------------

alto16:

mov ah,lenpalA5              ; mueve a ah el tamaño de la palabra
mov ch,lenpalA5              ; mueve a ch el tamaño de la palabra
add ah,47                    ; le suma a ah 47 para que nos de su respectivo decimal
add ch, 47                   ; le suma a ch 47 para que nos de su respectivo decimal
mov [num2],ah                ; mueve lo que esta en ah a num2
mov [num3],ch                ; mueve lo que esta en ch a num3

imprime codigo7, lencodigo7  ; pone los colores 
imprime msgd3,lend3          ; dificultad alta
imprime msgd4,lend4          ; palabra a adivinar
imprime num2,2               ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5          ; Palabra
imprime msliA5,lenmsliA5     ; aqui tiene que ir los renglones
imprime msgd6,lend6          ; letras solicitadas
imprime espaA5,lenespaA5     ; aqui deberian ir las letras
imprime msgd7,lend7          ; voy a tener suerte
imprime msgd8,lend8          ; Turnos disponibles
imprime num3,2               ; aqui tiene que ir la cantidad de letras
imprime msgd9,lend9          ; presion esc para salir
mov ebp,0                    ; Coloca un 0 en ebp
mov esp,espaA5               ; Coloca espaA5 en esp
;--------------------------------------------------------------------------

cicloA16:

recibe let,1            ; RECIBE LA LETRA QUE SE VA A COMARAR
mov ah,[let]            ; MUEVE A AH LA LETRA RECIBIDA

cmp ah,27               ; COMPARA EL INPUT CON LA LETRA ESC
je aux                  ; SI ES IGUAL SALTA A AUX

mov byte[esp],ah        ; CAMBIA LO QUE HAY EN ESP CON AH

mov esi, palA5          ; MUEVE LA PALABRA A ESI
mov edi, msliA5         ; MUEVE LOS RENGLONES A EDI

imprime lin,lenlin      ; texto: para separar las impresiones (---)

imprime msgd3,lend3     ; texto: dificultad alta
imprime msgd4,lend4     ; texto: palabra a adivinar
imprime num2,2          ; aqui tiene que ir la cantidad de letras
imprime msgd5,lend5     ; Palabra


;--------------------------------------------------------------------------

leerA16:
mov al, [let]           ; MUEVE LA LETRA INGRESADA A AL
cmp al,"3"              ; COMPARA AL CON 3
je suerteA16            ; SI ES IGUAL SALTA A SUERTEA16

cmp byte[esi], al       ; COMPARA LA LETRA CON EL BYTE DE LA PALABRA
je remplaceA16          ; SI ES IGUAL SE VA A REMPLACE

cmp byte[esi], 0        ; COMPARA LA LETRA DE LA PALABRA CON 0
je ultimoA16            ; SI ES IGUAL VA A ULTIMOA16

inc esi                 ;PASA A LA SIGUIENTE LETRA
add edi,3               ;PASA AL SIGUIENTE RENGLON
jmp leerA16             ;PASA A LEER

;--------------------------------------------------------------------------

remplaceA16:
mov byte[edi], al      ; CAMBIA EL RENGLON POR LA LETRA
mov byte[esi],"."      ; CAMBIA LA LETRA POR UN PUNTO
inc byte[num3]         ; incrementa la cantidad de intentos
Inc ebp                ; incrementa ebp
jmp leerA16            ; SE VA A LEER

;--------------------------------------------------------------------------

ultimoA16:
imprime msliA5,lenmsliA5            ; imprime el cambio de letra-renglon
imprime msgd6,lend6                 ; letras solicitadas
imprime espaA5,lenespaA5            ; imprime espaA5
add esp,2                           ; pasa al siguiente espacio
imprime msgd7,lend7                 ; voy a tener suerte
imprime msgd8,lend8                 ; Turnos disponibles
cmp ebp,12                         ; compara ebp con 13, para ver si ya se completo la palabra
je salir16                          ; Si es igual sale a salir16

mov ah, [num3]                      ; mueve a ah la cantidad de intentos
cmp ah,"1"                          ; los compara con uno para saber cuando terminar
je salir16                          ; si se acaban los intentos salta a salir16

dec byte[num3]                      ; quita un intento

imprime num3,2                      ; aqui tienen que ir los turnos 
imprime msgd9,lend9                 ; presion esc para salir
jmp ignoraA16                       ; salta a ignoraA16 para que ignore ese recibe y funcione el que esta en cicloA16

;--------------------------------------------------------------------------

ignoraA16:
recibe num,1
jmp cicloA16

;--------------------------------------------------------------------------

suerteA16:
recibe num,1              ; Este es para que se ignore y funcione el siguiente
recibe pala12,12          ; recibe la palabra que se cree que es correcta
mov al,[pala12]           ; mueve esa palabra a al
cmp al,[copalA5]          ; compara la palabra ingresada con la palabra correcta

je salir16g               ; si es igual salta a salir16g
jne salir16               ; si no es igual salta a salir16

;--------------------------------------------------------------------------

; este tambien se usa para que se ignore este "recibe"
aux:
recibe num,1
jmp inicio


;--------------------------------------------------------------------------


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;-------------------------------SALIDAS-----------------------------------
;--------------------------------------------------------------------------


;------------------------------Salida normal--------------------------------------
salir:
mov eax,1
mov ebx,0
int 80h
;--------------------------------------------------------------------------
;-------------------------------SALIDA_BAJO_1-----------------------------------
salir5:
imprime codigo5,lencodigo5 
cmp ebp,lencopal
je salir5g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir5g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h

;-------------------------------------------------------------------------
;-------------------------------SALIDA_BAJO_2-----------------------------------
salir6:
imprime codigo5,lencodigo5 
cmp ebp,lencopal1
je salir6g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir6g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h

;--------------------------------------------------------------------------
;------------------------------SALIDA_BAJO_3-----------------------------------
salir7:
imprime codigo5,lencodigo5 
cmp ebp,lencopal2
je salir7g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir7g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h

;--------------------------------------------------------------------------
;-------------------------------SALIDA_BAJO_4-----------------------------------
salir8:
imprime codigo5,lencodigo5 
cmp ebp,lencopal3
je salir8g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir8g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h
;--------------------------------------------------------------------------
;-------------------------------SALIDA_BAJO_5-----------------------------------
salir9:
imprime codigo5,lencodigo5 
cmp ebp,lencopal4
je salir9g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir9g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h

;--------------------------------------------------------------------------
;-------------------------------SALIDA_MEDIO_1-----------------------------------
salir9m:
imprime codigo5,lencodigo5 
cmp ebp,lencopalM1
je salir9mg

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir9mg:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h

;--------------------------------------------------------------------------
;-------------------------------SALIDA_MEDIO_2-----------------------------------
salir13m:
imprime codigo5,lencodigo5 
cmp ebp,lencopalM5
je salir13mg

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir13mg:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h

;--------------------------------------------------------------------------
;----------------------------SALIDA_MEDIO_3--------------------------------- 
salir10:
imprime codigo5,lencodigo5 
cmp ebp,lencopalM2
je salir10g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir10g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h
;--------------------------------------------------------------------------
;-------------------------------SALIDA_MEDIO_4----------------------------------
salir11:
imprime codigo5,lencodigo5 
cmp ebp,lencopalM3
je salir11g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir11g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h
;--------------------------------------------------------------------------
;-------------------------------SALIDA_MEDIO_5----------------------------------
salir12:
imprime codigo5,lencodigo5 
cmp ebp,lencopalM4
je salir12g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir12g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h
;--------------------------------------------------------------------------
;-------------------------------SALIDA_ALTO_1----------------------------------
salir12a:
imprime codigo5,lencodigo5 
cmp ebp,lencopalA1
je salir12ag

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir12ag:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h

;--------------------------------------------------------------------------
;-------------------------------SALIDA_ALTO_2----------------------------------
salir13:
imprime codigo5,lencodigo5 
cmp ebp,lencopalA2
je salir13g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir13g:
imprime codigo5,lencodigo5 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h
;--------------------------------------------------------------------------
;-------------------------------SALIDA_ALTO_3------------------------------
salir14:
imprime codigo5,lencodigo5 
cmp ebp,lencopalA3
je salir14g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir14g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h
;--------------------------------------------------------------------------
;-------------------------------SALIDA_ALTO_4------------------------------
salir15:
imprime codigo5,lencodigo5 
cmp ebp,lencopalA4
je salir15g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir15g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h
;--------------------------------------------------------------------------
;------------------------------SALIDA_ALTO_5-------------------------------

salir16:
imprime codigo5,lencodigo5 
cmp ebp,lencopalA5
je salir16g

imprime perdio,lenperdio
imprime mg,lenmg
imprime mg1,lenmg1
imprime mg2,lenmg2
imprime mg3,lenmg3
imprime mg4,lenmg4
imprime mg5,lenmg5
imprime mg6,lenmg6
imprime mg7,lenmg7
imprime mg8,lenmg8
mov eax,1
mov ebx,0
int 80h

salir16g:
imprime codigo4,lencodigo4 
imprime gano,lengano
mov eax,1
mov ebx,0
int 80h
