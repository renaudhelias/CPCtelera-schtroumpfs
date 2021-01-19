// from https://www.cpcwiki.eu/forum/programming/save-file-without-firmware/
void StoreDriveLetter(void)
{
  __asm


      ;;------------------------------------------------------------------------
      ;; store the drive number the loader was run from to InitializeAmsdos
      ld hl,(#0xbe7d)
      ld a,(hl)                 
      ld (_driveLoad+1),a                 
      ;ld (_driveSave+1),a
   
    ;;------------------------------------------------------------------------
    ;; store jump restore call to InitializeAmsdos
    ;ld hl,(#0xbD38)
      ld a,(#0xbD38)                 
      ld (_firmJump+1),a
   
   
   __endasm;
 
 }
 
  ////////////////////////////////////////////////////////////////////////
 
 void InitializeAmsdos(void) __naked
 {
  __asm
   
      ;; ** INITIALISE ALTERNATE REGISTER SET FOR FIRMWARE **
     
      exx
      ld bc,#0x7f88            ;initialise lower rom and select mode 0
      out (c),c               ;this routine must be located above &4000
      exx 
      ex af,AF
      xor a
      ex af,af
     
      ;; ** INITIALISE FIRMWARE **


      call #0x0044                ;initialise lower jumpblock (&0000-&0040)
                           ;and high kernal jumpblock (&b800-&bae4)
      _firmJump: call #0x08bd                ;initialise firmware jumpblock entries
    ;call #0xBD37
                           ;(&bb00- ...)
      call #0xbb00                ;initialise keyboard manager
      call #0xb909                ;disable lower rom


      ;;; ** INITIALISE DISK ROM FOR LOADING/SAVING **
    ;
      ld c,#7                      ;disk rom
      ld de,#0x8000                 ;lowest useable byte of memory
      ld hl,#0xb0ff                 ;highest useable byte of memory
      call #0xbcce           ;initialise disk rom
   
    ld c,#6                      ;disk rom
      ld de,#0x8000                 ;lowest useable byte of memory
      ld hl,#0xb0ff                 ;highest useable byte of memory
      call #0xbcce           ;initialise disk rom
   
    ld a,#0xc9
      ld (#0xbb5a),a           ;prevent printing of text characters
                           ;don t get error messages corrupting screen
   
    ;; ** INITIALISE ALL ROMS (FOR LOADING/SAVING) **


      ;ld c,#7                      ;disk rom
      ;ld de,#0x8000                 ;lowest useable byte of memory
      ;ld hl,#0xb0ff                 ;highest useable byte of memory
      ;call #0xbccB           ;initialise disk rom (KL ROM WALK)


     
   
      ;xor a                       ;select drive (A)
      ;ld (#0xac00),a


      ld a,#0xff
      ld (#0xbe78),a                ;turn of disc error messages


     
                           
      ;;------------------------------------------------------------------------
      ;; when AMSDOS is enabled, the drive reverts back to drive 0!
      ;; This will restore the drive number to the drive the loader was run from
      _driveLoad: ld a, #0x00
      ld hl,(#0xbe7d)
      ld (hl),a 
   
    ret
   
  __endasm;
 }


void cpct_loadBinaryFile(const char *fileName, void *loadAddr) {

  __asm

   ld   hl, #2     
   add  hl, sp     
   ld    e, (hl)	;; filename
   inc  hl          
   ld    d, (hl)
   inc  hl          
   ld    a, (hl)	;; load address    
   inc  hl          
   ld    h, (hl)    
   ld 	l,a
	push hl
	ex de,hl
	call get_str_length
	;;ld de,#0x0c000 ;; two k buffer (not used with cas in direct)
	ld de,#0x0 ;; two k buffer (not used with cas in direct)
	call cas_in_open
	pop hl
	jr nc,cpct_err
	call cas_in_direct
	jr nc,cpct_err
	call cas_in_close
	jr nc,cpct_err
	
	ld hl,#0
	jp fin
cpct_err:
	ld hl,#1
	jp fin
	
get_str_length:
	push hl
	ld b,#0
gsl::
	ld a,(hl)
	or a
	jr z,gsl2
	inc b
	inc hl
	jr gsl
gsl2::
	pop hl
	ret

;; Firmware
cas_in_open=0x0bc77
cas_in_direct=0x0bc83
cas_in_close=0x0bc7a

fin:

  __endasm;


}
