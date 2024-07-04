.model small 
.stack 0E000h           
.data
  
;penggunaan frekuensi apabila semakin tinggi maka untuk suara nadanya menjadi rendah
;praktikan menggunakan tangga nada berupa do re mi fa sol la sii
;penggunaan tangga nada tersebut sebetulnya hampir-hampir mirip dengan tangga nada seperti C-G baik minor maupun mayor

  sii2 dw 4831
  sii dw 2415       ;nada si oktaf 1  (7)
  la2 dw 5423       ;nada la rendah
  la  dw 2711       ;nada la oktaf 1  (6)
  sol2 dw 6087      ;nada sol rendah
  sol dw 3043       ;nada sol oktaf 1 (5)
  fa2 dw 6833       ;nada fa rendah
  fa  dw 3416       ;nada fa oktaf 1 (4)
  mi2 dw 7239       ;nada mi rendah
  mi  dw 3619       ;nada mi oktaf 1 (3)
  re2 dw 8126       ;nada re rendah
  re  dw 4063       ;2
  do2 dw 9121       ;nada do rendah
  do  dw 4560       ;1 
  
    
  clock equ es:6Ch  ; clock pada es 
  tone dw ?         ; deklarasi variabel tone yang kosong
    
.code
  
  delay proc                  ; untuk memberikan delay pada lagu
    push ax               
    mov ax,40h                ; memberikan nilai input bit ke register ax apabila >40H atau <40H akan mengubah kecepatan delay
    mov es,ax                 
    mov ax,[clock]
    
    Ketukawal:
      cmp ax, [clock]
      mov cx, 2               
      je Ketukawal
    
    Loopdelay:
      mov ax, [clock]
      ketuk:
        cmp ax,[clock]
        je ketuk
        loop Loopdelay
        pop ax
      ret
  delay endp   

  ; untuk membunyikan suara oleh sound card  
  sounder proc
    push ax
    in al, 61h
    or al, 00000011b          ; mengakses soundcard
    out 61h, al 	            ; mengirim control word untuk ganti frekuensi
    mov al, 0B6h
    out 43h, al
    mov ax, [tone]            ; tone merupakan acuan untuk mengambil nada dari acuan
    out 42h, al               ; mengirim lower byte
    mov al, ah
    out 42h, al               ; mengirim upper  byte
    pop ax
    ret
  sounder endp

  ;agar suaranya mati
  matisuara proc             
      in al,61h
      and al, 11111100b       ; menutup soundcard (invers dari akses soundcard)
      out 61h, al
      ret
  matisuara endp 

  ;Tangga nada ----------------------------------------------------------------

  pencet macro p1
      push bx
      mov bx,[p1]             ; memasukkan parameter berupa not yang ditekan ke bx
      mov [tone],bx           ; memasukkan bx ke tone agar bisa dibunyikan
      pop bx
      call sounder            ; memanggil sounder agar hasil insertion ke bx dapat dibunyikan
  endm 

  part_1 macro
    pencet do
    call delay
    call delay
    call matisuara
    call delay

    pencet do
    call delay
    call delay
    call matisuara
    call delay
    
    pencet re
    call delay
    call delay
    call matisuara
    
    pencet mi
    call delay
    call delay
    call delay
    call matisuara
    call delay

    pencet do
    call delay
    call delay
    call matisuara
    call delay

    pencet mi
    call delay
    call delay
    call delay
    call matisuara
    
    pencet sol
    call delay 
    call delay 
    call delay 
    call matisuara

    pencet la
    call delay 
    call delay 
    call delay 
    call matisuara    

    pencet sol
    call delay 
    call delay 
    call delay 
    call matisuara

    pencet la
    call delay 
    call delay 
    call delay 
    call matisuara

    pencet do
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay
    call delay
    call delay

    ;------------------------------

    pencet do 
    call delay 
    call delay
    call matisuara  
    call delay

    pencet la
    call delay 
    call delay 
    call matisuara
    call delay

    pencet sol
    call delay 
    call delay
    call matisuara
    call delay

    pencet sol
    call delay 
    call delay 
    call matisuara
    call delay

    pencet re
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay
    call delay 

    pencet re
    call delay
    call matisuara
    call delay

    pencet re
    call delay
    call delay
    call matisuara  
    call delay
    call delay 

    pencet do
    call delay
    call delay
    call matisuara

    pencet re
    call delay
    call delay
    call delay
    call matisuara

    pencet mi
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay
    call delay

  endm

  part_2 macro
    pencet mi
    call delay
    call delay
    call matisuara
    call delay

    pencet mi
    call delay
    call delay
    call matisuara
    call delay

    pencet re
    call delay
    call delay
    call matisuara

    pencet mi
    call delay
    call delay
    call delay
    call matisuara
    call delay

    pencet re
    call delay
    call delay
    call matisuara
    call delay

    pencet do
    call delay
    call delay
    call matisuara
    call delay

    pencet re
    call delay
    call delay
    call matisuara
    call delay

    pencet do
    call delay
    call delay
    call delay
    call matisuara

    pencet sii2
    call delay
    call delay
    call delay
    call matisuara

    pencet la2
    call delay
    call delay
    call matisuara
    call delay
    
    pencet la2
    call delay
    call delay
    call matisuara
    call delay

    pencet fa
    call delay
    call delay 
    call matisuara
    call delay

    pencet fa
    call delay
    call delay 
    call matisuara
    call delay

    pencet mi
    call delay
    call delay
    call matisuara
    call delay

    pencet re
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay
    call delay
    call delay

    pencet do 
    call delay
    call delay
    call matisuara

    pencet sii2
    call delay
    call delay
    call delay
    call matisuara

    pencet do 
    call delay
    call delay
    call matisuara

    pencet re
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet sii2
    call delay
    call delay
    call delay
    call matisuara

    pencet do 
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay

  endm

  part_2end macro
    pencet do 
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet sii2
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet do 
    call delay
    call delay
    call matisuara

    pencet re
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet sii2
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet do 
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay

  endm

  part_3 macro
    pencet do
    call delay
    call delay
    call matisuara
    call delay

    pencet sii2
    call delay
    call delay
    call matisuara
    call delay

    pencet do
    call delay
    call delay
    call matisuara
    call delay

    pencet sol2
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay

    pencet fa2
    call delay
    call delay
    call matisuara
    call delay

    pencet mi2
    call delay
    call delay
    call matisuara
    call delay

    pencet fa2
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay

    pencet do2 
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay

    pencet re2
    call delay
    call delay 
    call matisuara
    call delay 

    pencet re2
    call delay
    call delay 
    call matisuara
    call delay 

    pencet do2
    call delay
    call delay
    call delay
    call matisuara

    pencet re2
    call delay
    call delay
    call delay 
    call matisuara
    call delay  

    pencet do2
    call delay 
    call delay
    call matisuara

    pencet re2
    call delay
    call delay 
    call delay 
    call delay
    call matisuara
    call delay

    pencet fa2
    call delay
    call delay 
    call matisuara
    call delay  
  
    pencet fa2
    call delay
    call delay
    call delay
    call matisuara
    call delay 

    pencet mi2
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay

  endm

  part_4 macro
    pencet mi2
    call delay
    call delay
    call matisuara
    call delay

    pencet mi2
    call delay
    call delay
    call matisuara
    call delay

    pencet la2
    call delay
    call delay
    call matisuara
    call delay
    
    pencet la2
    call delay
    call delay
    call matisuara
    call delay 

    pencet do
    call delay
    call delay
    call matisuara
    call delay  

    pencet re
    call delay
    call delay
    call matisuara
    call delay

    pencet mi
    call delay
    call delay  
    call matisuara
    call delay

    pencet mi
    call delay
    call delay
    call matisuara
    call delay

    pencet re
    call delay
    call delay
    call matisuara
    call delay

    pencet re
    call delay
    call delay
    call matisuara
    call delay

    pencet la2
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay 
    
  endm

  part_5a macro
    pencet fa
    call delay
    call delay
    call matisuara
    call delay

    pencet fa
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet mi
    call delay
    call delay
    call matisuara

    pencet re
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet do
    call delay
    call delay
    call matisuara

    pencet re
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay

  endm

  part_5b  macro
    pencet do
    call delay
    call delay
    call delay
    call matisuara

    pencet fa
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay

    pencet mi
    call delay
    call delay
    call matisuara

    pencet fa
    call delay
    call delay
    call delay
    call matisuara
    call delay

    pencet sol
    call delay
    call delay
    call delay
    call matisuara
    call delay
    
    pencet sol
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    
  endm


.startup 
 ; First part

;Wong ko ngene kok dibanding-bandingke
;Saing-saingke yo mesti kalah
;Tak oyak'o aku yo ora mampu
;Mung sak kuatku mencintaimu
  part_1
  call delay
  call delay
  call delay
  call delay
;Wong ko ngene kok dibanding-bandingke
;Saing-saingke yo mesti kalah
;Tak oyak'o aku yo ora mampu
;Mung sak kuatku mencintaimu
  part_1
  call delay
  call delay
  call delay
;Ku berharap engkau mengerti di hati ini
;Hanya ada kamu  
  part_2
  call delay
  call delay
  call delay

  ; Second part

;Jelas bedo yen dibandingke
;Ora ono sing tak pamerke 
  part_3
  call delay
  call delay
  call delay
;Aku ra iso yen kon gawe-gawe
  part_4
  call delay
  call delay
  call delay
;Jujur sak onone  
  part_5a
  call delay
  call delay
  call delay

;Sopo wonge sing ra loro ati
;Wis ngancani tekan semene  
  part_3
  call delay
  call delay
  call delay
;Nanging kabeh ora ono artine
  part_4
  call delay
  call delay
  call delay
;Ra ono ajine
  part_5b
  call delay
  call delay
  call delay

  ; Third part

;Wong ko ngene kok dibanding-bandingke
;Saing-saingke yo mesti kalah
;Tak oyak'o aku yo ora mampu
;Mung sak kuatku mencintaimu
  part_1
  call delay
  call delay
  call delay
  call delay
;Wong ko ngene kok dibanding-bandingke
;Saing-saingke yo mesti kalah
;Tak oyak'o aku yo ora mampu
;Mung sak kuatku mencintaimu
  part_1
  call delay
  call delay
  call delay
;Ku berharap engkau mengerti di hati ini
;Hanya ada kamu  
  part_2
  call delay
  call delay
  call delay
  
  
  ; Fourth part

;Hanya ada kamu   
  part_2end
.exit

end   