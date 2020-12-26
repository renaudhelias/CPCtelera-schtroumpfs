        ;Tests the AKG player, as well as the sound effects, for Amstrad CPC.
        ;Note that the sound effects work on every platform of course!
        
        ;This compiles with RASM. Please check the compatibility page on the website, you can convert these sources to ANY assembler!

	;Don't forget to set the PLY_AKG_MANAGE_SOUND_EFFECTS to 1 BEFORE the player is compiled (see at the bottom of the source).

        ;Use F1, F2, F3 to play the current sound effect on channel 1, 2, 3 respectively.
        ;Use F4, F5, F6 to stop a sound on channel 1, 2, 3 respectively (if there was any).
        ;Use F0/F. to decrease/increase the sound effect number.
		
	;Uncomment this to build a SNApshot, handy for testing (RASM feature).
        ;buildsna
        ;bankset 0
		
		
LAST_SOUND_EFFECT_INDEX: equ 2                 ;Index of the last sound effect.

        org #C000
		jp Start
		jp StartMusic
		;;jp StopMusic
		jp PlayOnChannel1
		jp PlayOnChannel2
		jp PlayOnChannel3
		jp StopChannel1
		jp StopChannel2
		jp StopChannel3
		

Start:  equ $

        di
        ld hl,#c9fb
        ld (#38),hl

        ;Initializes the music.
        ld hl,bc ;; bc : Music_Start (#7000)
        xor a                   ;Subsong 0.
        call PLY_AKG_Init

        ;Initializes the sound effects.
        ld hl,SoundEffects ;;de ;; de : SoundEffects
        call PLY_AKG_InitSoundEffects

        ei
		ret
        
StartMusic:
        call PLY_AKG_Play
		ret
     
PlayOnChannel1:
        ld c,0          ;Channel 1.
PlayOnChannelShared:
        ld a,(SelectedSoundEffect)
        ld b,0          ;Full volume.
        call PLY_AKG_PlaySoundEffect
        ret
PlayOnChannel2:
        ld c,1
        jr PlayOnChannelShared
PlayOnChannel3:
        ld c,2
        jr PlayOnChannelShared

StopChannel1:
        xor a
StopChannelShared:
        call PLY_AKG_StopSoundEffectFromChannel
        ret
StopChannel2:
        ld a,1
        jr StopChannelShared
StopChannel3:
        ld a,2
        jr StopChannelShared

SelectedSoundEffect: db 1                       ;The selected sound effect (>=1).

KeyboardMaskLine0: db 255
KeyboardMaskLine1: db 255
KeyboardMaskLine2: db 255

Main_Player_Start:
        ;IMPORTANT: enables the sound effects in the player. This must be declared BEFORE the player itself.
        PLY_AKG_MANAGE_SOUND_EFFECTS = 1
        
        ;Want a ROM player (a player without automodification)?
        ;PLY_AKG_Rom = 1                         ;Must be set BEFORE the player is included.
            
        ;Include here the Player Configuration source of the songs (you can generate them with AT2 while exporting the songs).
        ;If you don't have any, the player will use a default Configuration (full code used), which may not be optimal.
        ;If you have several songs, include all their configuration here, their flags will stack up!
        ;Warning, this must be included BEFORE the player is compiled.
        ;Warning, if you use player configuration, you must ALSO include the configuration file for the sound effects.
        ;include "../resources/Music_AHarmlessGrenade_playerconfig.asm"

        include "../PlayerAkg.asm"
        
        ;Declares the buffer for the ROM player, if you're using it. You can declare it anywhere of course.
        ;LIMITATION: the SIZE of the buffer (PLY_AKG_ROM_BufferSize) is only known *after* ther player is compiled.
        ;A bit annoying, but you can compile once, get the buffer size, and hardcode it to put the buffer wherever you want.
        ;Note that the size of the buffer shrinks when using the Player Configuration feature. Use the largest size and you'll be safe.
        IFDEF PLY_AKG_Rom
                PLY_AKG_ROM_Buffer = #c000
        ENDIF
        
Main_Player_End:

SoundEffects:
        include "../resources/SoundEffects.asm"