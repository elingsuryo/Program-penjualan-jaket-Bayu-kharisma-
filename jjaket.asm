.model small
.code
org 100h
start:
	jmp mulai
nama		db 13,10,'Nama Anda	: $'
nim		db 13,10,'NIM	: $'
lanjut		db 13,10,'LANJUT Tekan y untuk lanjut >>>>>>>>>>>>>>>>>>>>>>> $'
tampung_nama	db 30,?,30 dup(?)
tampung_nim	db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
j dw 15

daftar	db 13,10,'+-------------------------------------------------+'
	db 13,10,'| 		     DAFTAR HARGA JAKET		    |'
	db 13,10,'+--+----------------------------------------------+'
	db 13,10,'|NO|		  NAMA JAKET	 |SIZE |   HARGA    |'
	db 13,10,'+--+----------------------------------------------+'
	db 13,10,'|01| JAKET DENIM 		 | xxL | Rp.250,000 |'
	db 13,10,'+--+----------------------------------------------+'
	db 13,10,'|02| JAKET DENIM 		 | XL  | Rp.200,000 |'
	db 13,10,'+--+-----------------------------------+-----+----+'
        db 13,10,'|03| JAKET DENIM		 | L   | Rp.175,000 |'
        db 13,10,'+--+-----------------------------------+-----+----+'
	db 13,10,'|04| JAKET DENIM		 | M   | Rp.150,000 |'
    	db 13,10,'+--+-----------------------------------+-----+----+'
    	db 13,10,'|05| JAKET DENIM		 | S   | Rp.125,000 |'
    	db 13,10,'+--+-----------------------------------+-----+----+'
	db 13,10,'|06| JAKET DENIM		 | XS  | Rp.100,000 |'
    	db 13,10,'+--+-----------------------------------+-----+----+'

    
error		db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilih_jkt	db 13,10,'SILAHKAN MASUKKAN NO/KODE BARANG YANG ANDA PILIH: $'
success		db 13,10,'SELAMAT ANDA BERHASIL $'

	mulai:
	mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,nim
	int 21h
	mov ah,0ah
	lea dx,tampung_nim
	int 21h
	push dx

	mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	jmp proses
	jne error_msg

error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h
	int 20h

proses:
	mov ah,09h
	mov dx,offset pilih_jkt
	int 21h

	mov ah,1
	int 21h
	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bl,'1'
	je hasil1

	cmp bh,'0'
	cmp bl,'2'
	je hasil2

	cmp bh,'0'
	cmp bl,'3'
	je hasil3

	cmp bh,'0'
	cmp bl,'4'
	je hasil4

	cmp bh,'0'
	cmp bl,'5'
	je hasil5

	cmp bh,'0'
	cmp bl,'6'
	je hasil6
	
	jne error_msg

;-------------------------------------------------------------------------------------

hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h

hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h

hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h

hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h

hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h

hasil6:
	mov ah,09h
	lea dx,teks6
	int 21h
	int 20h


;--------------------------------------------------------------------------------------------------------

teks1	db 13,10,'ANDA MEMILIH JAKET DENIM'
    	db 13,10,'SIZE XXL'
    	db 13,10,'TOTAL HARGA YANG HARUD ANDA BAYAR ADALAH: Rp.250,000 '
    	db 13,10,'TERIMA KASIH TELAH BERBELANJA $'
    
teks2	db 13,10,'ANDA MEMILIH JAKET DENIM'
    	db 13,10,'SIZE XL'
    	db 13,10,'TOTAL HARGA YANG HARUD ANDA BAYAR ADALAH: Rp.200,000 '
    	db 13,10,'TERIMA KASIH TELAH BERBELANJA $'

teks3	db 13,10,'ANDA MEMILIH JAKET DENIM'
    	db 13,10,'SIZE L'
    	db 13,10,'TOTAL HARGA YANG HARUD ANDA BAYAR ADALAH: Rp.175,000 '
    	db 13,10,'TERIMA KASIH TELAH BERBELANJA $'

teks4	db 13,10,'ANDA MEMILIH JAKET DENIM'
    	db 13,10,'SIZE M'
    	db 13,10,'TOTAL HARGA YANG HARUD ANDA BAYAR ADALAH: Rp.150,000 '
    	db 13,10,'TERIMA KASIH TELAH BERBELANJA $'

teks5	db 13,10,'ANDA MEMILIH JAKET DENIM'
    	db 13,10,'SIZE S'
    	db 13,10,'TOTAL HARGA YANG HARUD ANDA BAYAR ADALAH: Rp.125,000 '
    	db 13,10,'TERIMA KASIH TELAH BERBELANJA $'

teks6	db 13,10,'ANDA MEMILIH JAKET DENIM'
    	db 13,10,'SIZE XS'
    	db 13,10,'TOTAL HARGA YANG HARUD ANDA BAYAR ADALAH: Rp.100,000 '
    	db 13,10,'TERIMA KASIH TELAH BERBELANJA $'
	int 20h

end start
					    