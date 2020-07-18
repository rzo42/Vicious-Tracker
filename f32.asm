export speed
export sndlen
export patlen
export ends
export volxo
export rpt
export lowxo
export midxo
export hixo
export nsxo
export pmod
export amod
export patlv
export arh
export arl
export arm
export arn
export arv
export paths
export pathv
export patls
export patms
export patmv
export patns
export patnv
export patv
export alenc
export buff0
export buff1
export buff2
export buff3
export buff4
export cntrl
export plenc
export slenc
export spdc
export vlshfl
export hext
export init
export mscrn
export astart
export pstart
export pmstart
export amstart
export notbl
export init


*=$abb0

;-constants


vocl=$900a
vocm=$900b
voch=$900c
vocn=$900d
vol=$900e
irqx=$eabf

pmod1=speed+$1a
pmod2=pmod1+$10
pmod3=pmod1+$20
amod0=pmod1+$f0
amod1=amod0+$10     
amod2=amod1+$10
amod3=amod2+$10
amod4=amod3+$10
amod5=amod4+$10
amod6=amod5+$10
amod7=amod6+$10
amod8=amod7+$10
amod9=amod8+$10
amoda=amod9+$10
amodb=amoda+$10
amodc=amodb+$10
amodd=amodc+$10
amode=amodd+$10
amodf=amode+$10


;===============================================================================

; MAIN SCREEN

;-------------------------------------------------------------------------



mscrn   ldy     #$00
right   lda     speed
        cpy     #$00
        beq     left2
        
        clc             ;clears carry bit
        asl
        asl
        asl
        asl
        

left2   clc
        lsr             ;shifts byte right 4 times
        lsr             ;to clear low bits     
        lsr
        lsr
        tax
        lda     hext,x
        sta     $1086,y
        cpy     #$01
        beq     next1
        iny
        jmp     right

next1   lda     sndlen
        tax
        lda     hext,x
        sta     $109c
        lda     patlen
        tax
        lda     hext,x
        sta     $10b2
        

start1  ldy     #$00
right1  lda     ends
        cpy     #$00
        beq     left1
        
        clc             ;clears carry bit
        asl
        asl
        asl
        asl
        

left1   clc
        lsr             ;shifts byte right 4 times
        lsr             ;to clear low bits     
        lsr
        lsr
        tax
        lda     hext,x
        sta     $10c8,y
        cpy     #$01
        beq     next2
        iny
        jmp     right1
                
next2   lda     volxo
        tax
        lda     hext,x
        sta     $10de

        lda     rpt
        tax
        lda     hext,x
        sta     $10f4

        lda     lowxo
        tax
        lda     hext,x
        sta     $110a
        
        lda     midxo
        tax
        lda     hext,x
        sta     $1120

        lda     hixo
        tax
        lda     hext,x
        sta     $1136
        
        lda     nsxo
        tax
        lda     hext,x
        sta     $114c
        rts

                                

hext    byte    $b0,$b1,$b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9,$81,$82,$83,$84,$85,$86

;=====================================================================

; ARRANGER

;----------------------------------------------------------------------



;4096=1000



astart  ldy     #$00
s1      lda     buff4
s2      tax     

        lda     arl,x
        ;stx     buff4
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1032,y
        
        ldx     buff4
        lda     arm,x
        ;stx     buff4
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1048,y
        
        ldx     buff4
        lda     arh,x
        ;stx     buff4
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $105e,y
        ldx     buff4
        lda     arn,x
        ;stx     buff4
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1074,y
        
        ldx     buff4
        lda     arv,x
        ;stx     buff4
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $108a,y

        jmp     s4

s3      jmp     s1        
s4      inc     buff4
        iny
        cpy     #$10
        bne     s3
        rts
        
        
        
        
        
        
        
        
        
        
;============================================================================

; PATTERN

;-----------------------------------------------------------------------


pstart  ldy     #$00
ps1     ldx     buff4
ps2     lda     patlv,x
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1032,y

        ldx     buff4
        lda     patlv,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1048,y
        
        ldx     buff4
        lda     patlv,x
        asl
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $105e,y

        ldx     buff4
        lda     patls,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1074,y

        
;-------------------------------                

        ldx     buff4
        lda     patmv,x
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $108a,y

        ldx     buff4
        lda     patmv,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10a0,y
        
        ldx     buff4
        lda     patmv,x
        asl
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10b6,y

        ldx     buff4
        lda     patms,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10cc,y
;--------------------------------------


        ldx     buff4
        lda     pathv,x
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10e2,y

        ldx     buff4
        lda     pathv,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10f8,y
        
        ldx     buff4
        lda     pathv,x
        asl
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $110e,y

        ldx     buff4
        lda     paths,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1124,y
        jmp     ps4

ps3     jmp     ps1
;----------------------------------

ps4     ldx     buff4
        lda     patnv,x
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $113a,y

        ldx     buff4
        lda     patnv,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1150,y
        
        ldx     buff4
        lda     patnv,x
        asl
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1166,y


        ldx     buff4
        lda     patns,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $117c,y
        jmp     ps7

ps6     jmp     ps3  
;-----------------------------------------



ps7     ldx     buff4
        lda     patv,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1192,y

        iny
        inc     buff4
        cpy     #$10    
        bne     ps6
        rts        

;========================================================================

; PITCH MOD

;-----------------------------------------------------------------------



pmstart ldy     #$00
pms1    ldx     buff4
pms2    lda     pmod,x
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1032,y

        ldx     buff4
        lda     pmod,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1048,y
        
        ldx     buff4
        lda     pmod,x
        asl
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $105e,y

;---------------------------
        ldx     buff4
        lda     pmod1,x
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1074,y

        ldx     buff4
        lda     pmod1,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $108a,y
        
        ldx     buff4
        lda     pmod1,x
        asl
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10a0,y
              
;----------------------------


        ldx     buff4
        lda     pmod2,x
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10b6,y

        ldx     buff4
        lda     pmod2,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10cc,y
        
        ldx     buff4
        lda     pmod2,x
        asl
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10e2,y
        jmp     pms4

pms3    jmp     pms1
----------------------------

pms4    ldx     buff4
        lda     pmod3,x
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $10f8,y

        ldx     buff4
        lda     pmod3,x
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $110e,y
        
        ldx     buff4
        lda     pmod3,x
        asl
        asl
        asl
        asl
        asl
        clc
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        tax
        lda     hext,x
        sta     $1124,y

;-------------------------------

        iny
        inc     buff4
        cpy     #$10    
        bne     pms3
        rts         

;===================================================================

; AMP MOD

;-----------------------------------------------------------






amstart ldy     #$00
as1     lda     amod0,y
        tax
        lda     hext,x
        sta     $1032,y

        lda     amod1,y
        tax
        lda     hext,x
        sta     $1048,y

        lda     amod2,y
        tax
        lda     hext,x
        sta     $105e,y

        lda     amod3,y
        tax
        lda     hext,x
        sta     $1074,y

        lda     amod4,y
        tax
        lda     hext,x
        sta     $108a,y

        lda     amod5,y
        tax
        lda     hext,x
        sta     $10a0,y

        lda     amod6,y
        tax
        lda     hext,x
        sta     $10b6,y

        lda     amod7,y
        tax
        lda     hext,x
        sta     $10cc,y
        jmp     as3
as2     jmp     as1
        
as3     lda     amod8,y
        tax
        lda     hext,x
        sta     $10e2,y

        lda     amod9,y
        tax
        lda     hext,x
        sta     $10f8,y
   
        lda     amoda,y
        tax
        lda     hext,x
        sta     $110e,y
        lda     amodb,y
        tax
        lda     hext,x
        sta     $1124,y
        lda     amodc,y
        tax
        lda     hext,x
        sta     $113a,y
   
        lda     amodd,y
        tax
        lda     hext,x
        sta     $1150,y

        lda     amode,y
        tax
        lda     hext,x
        sta     $1166,y
        jmp     as5
as4     jmp     as2
as5     lda     amodf,y
        tax
        lda     hext,x
        sta     $117c,y
        
        iny
        cpy     #$10
        bne     as4
        rts
;======================================================================

;  SONG FILE

;-----------------------------------------------------------
;-settings

speed   byte    $02
sndlen  byte    $0f
patlen  byte    $0f
ends    byte    $7f

volxo   byte    $0f
rpt     byte    $01
lowxo   byte    $01
midxo   byte    $01
hixo    byte    $01 
nsxo    byte    $01

    

;-sounds
pmod    byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
amod    byte    $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-patterns:tune+(note*2)+(0ct*24) low voice
patlv   byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-patterns-sounds low voice
patls   byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-patterns:tune+(note*2)+(0ct*24) mid voice        
patmv   byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-patterns-sounds mid voice
patms   byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-patterns:tune+(note*2)+(0ct*24) high voice
pathv   byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-patterns-sounds high voice        
paths   byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-patterns:tune+(note*2)+(0ct*32) noise
patnv   byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-patterns-sounds noise
patns   byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
                
;-pattern-volume  
patv    byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        
;-arrangment
arl     byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
       
arm     byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
       
arh     byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

arn     byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
       
arv     byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00


;==========================================================================

; NOTE TABLE

;-tru int note table

;-tru int note table

;{note index}={oct}+({simitone}*8)+({note}*16
;       oct     semitone  note
;       000     0         0000
;       0-7     0-1       0-11

       ;oct     0,1  ,2  ,3  ,4,5,6,7
notbl   byte    0,255,191,223,0,0,0,0   ;c  
        byte    0,131,193,224,0,0,0,0   ;c+
        byte    0,134,195,225,0,0,0,0   ;c#
        byte    0,137,197,225,0,0,0,0   ;c#+
        byte    0,141,198,226,0,0,0,0   ;d
        byte    0,144,199,227,0,0,0,0   ;d+
        byte    0,147,201,228,0,0,0,0   ;d#
        byte    0,150,203,229,0,0,0,0   ;d#+
        byte    0,153,204,228,0,0,0,0   ;e
        byte    0,156,206,230,0,0,0,0   ;e+
        byte    0,159,207,231,0,0,0,0   ;f
        byte    0,162,208,231,0,0,0,0   ;f+
        byte    0,164,210,232,0,0,0,0   ;f#
        byte    0,167,211,233,0,0,0,0   ;f#+
        byte    0,170,212,234,0,0,0,0   ;g
        byte    0,172,213,234,0,0,0,0   ;g+
        byte    0,174,215,235,0,0,0,0   ;g#
        byte    0,176,216,235,0,0,0,0   ;g#+
        byte    0,179,217,236,0,0,0,0   ;a
        byte    0,181,218,236,0,0,0,0   ;a+
        byte    0,183,219,237,0,0,0,0   ;a#
        byte    0,185,220,238,0,0,0,0   ;a#+
        byte    0,187,221,239,0,0,0,0   ;b
        byte    0,189,222,238,0,0,0,0   ;b+
;===========================================================================

; INITIALIZER

;----------------------------------------------------------------



;-irq initializer
init    sei
        lda     #$be
        sta     $0315
        lda     #$76
        sta     $0314
        cli
        rts

;======================================================================

; PLAYER

;-------------------------------------------------------------------------

;-player controls
;-loops if stop  
start   lda     cntrl
        cmp     #$01
        beq     player
        cmp     #$02
        beq     rstart
        jmp     irqx

;-resets song settings and goes to play
rstart  lda     #$00
        ldx     #$00
rsloop  sta     spdc,x
        inx
        cpx     #$09
        bne     rsloop
        lda     #$01   
        sta     cntrl


;-player

;-gets arrangement data and store in buffer

player  ldx     alenc   ;loads value in arrangment counter
        lda     arl,x  ;loads val in arrangement voice 0 at x
        sta     buff0  ;stores v0 av  in buffer
        lda     arm,x  ;v1""
        sta     buff1  
        lda     arh,x  ;v2""
        sta     buff2
        lda     arn,x  ;v3""
        sta     buff3
        lda     arv,x    ;vol""
        sta     buff4
        


;-voice 0
vox_0   lda     lowxo
        cmp     #$00
        beq     vox_1
        lda     buff0  ;gets v0 av from buffer     
        
        clc

        adc     plenc   ;inc by pattern counter
        tax             ;transfers to x
        lda     patlv,x  ;gets note val from pattern
        sta     vlshfl  ;stores in left shift registor
        lda     patls,x ;loads sound val from pattern
        
        clc

        adc     slenc   ;increments by sound counter
        tax             ;transfers to x
        lda     pmod,x;loads pitch mod val    
       
        clc

        adc     vlshfl  ;adds to note val to pitch mod valt
        tay
        lda     notbl,y
        sta     buff0  ;stores in buffer
       

;-voice 1
vox_1   lda     midxo
        cmp     #$00
        beq     vox_21
        lda     buff1  ;gets v1 av from buffer     
        
        clc

        adc     plenc   ;inc by pattern counter
        tax             ;transfers to x
        lda     patmv,x  ;gets note val from pattern
        sta     vlshfl  ;stores in left shift registor
        jmp     v22
vox_21  jmp     vox_2
v22     lda     patms,x ;loads sound val from pattern
        
        clc

        adc     slenc   ;increments by sound counter
        tax             ;transfers to x
        lda     pmod,x;loads pitch mod val    
        clc

        adc     vlshfl  ;adds to note val to pitch mod val
        tay
        lda     notbl,y
        sta     buff1  ;stores in buffer
        
        
;-voice 2
vox_2   lda     hixo
        
        cmp     #$00
        beq     v2

       

        lda     buff2  ;gets v1 av from buffer     
        clc
        adc     plenc   ;inc by pattern counter
        tax             ;transfers to x
        jmp     v3
v2      jmp     vox_3
 
v3      lda     pathv,x  ;gets note val from pattern
        sta     vlshfl  ;stores in left shift registor
        lda     paths,x ;loads sound val from pattern
        clc
        adc     slenc   ;increments by sound counter
        tax             ;transfers to x
        lda     pmod,x;loads pitch mod val    
        clc
        adc     vlshfl  ;adds to note val to pitch mod val
        tay
        lda     notbl,y
        sta     buff2  ;stores in buffer
        
;-voice 3
vox_3   lda     nsxo
        cmp     #$00
        beq     vol_0
        lda     buff3  ;gets v0 av from buffer     
        
        clc

        adc     plenc   ;inc by pattern counter
        tax             ;transfers to x
        lda     patnv,x  ;gets note val from pattern
        sta     vlshfl  ;stores in left shift registor
        lda     patns,x ;loads sound val from pattern
        
        clc

        adc     slenc   ;increments by sound counter
        tax             ;transfers to x
        lda     pmod,x;loads pitch mod val    

        clc

        adc     vlshfl  ;adds to note val to pitch mod val
        tay
        lda     notbl,y        
        sta     buff3  ;stores in buffer
        
vol_0   lda     volxo  ;loads a with volume control
        cmp     #$00    ;compares to 0
        bne     drop    ;if not then drop
        lda     buff4   ;gets pattern count
        
        clc

        adc     plenc  ;ads arrangemnt count in buffer
        tax             ;transfers to x
        lda     patv,x ;loads volume pattern value indexed by x(arr+patt)
        
        clc
        adc     slenc
        tax             ;transfers to x
        lda     amod,x;loads volume value indexed by x (patt val)
        sta     buff4  ;stores volume in buffer
        lda     vol     ;loads current volume 
        
        
left    lsr             ;shifts byte right 4 times
        lsr             ;to clear low bits     
        lsr
        lsr
        
        clc             ;clears carry bit
        asl             ;shifts byte left 4 times   
        asl             ;to shift aux color back to    
        asl             ;high bits
        asl
        
        clc
        adc     buff4  ;adds new volume  
        sta     buff4  ;stores sum in buffer

;play notes
drop    ldx     #$00    ;sets x to 0

drop4   cpx     #$04
        beq     dropl
        lda     lowxo,x
        cmp     #$00
        beq     drop3


dropl   lda     buff0,x;gets value from buffer indexed by x
        
        cpx     #$04    ;compares x to 4 for (volume)
        bne     drop2   ;if not then drop 2
        
        ldy     volxo  ;loads y with volume control register
        cpy     #$00    ;compares to 0
        bne     drop3   ;if not then drop 3    
        

drop2   sta     vocl,x  ;stores new value in vics audio registers
drop3   inx             ;increments x
        cpx     #$05    ;and loops                
        bne     drop4   ;for 4 voices+volume
        
;------------------
timers  ldx     #$00
timer   lda     spdc,x
        cmp     speed,x
        beq     trset
        inc     spdc,x
        jmp     irqx
trset   lda     #$00
        sta     spdc,x
        inx     
        cpx     #$04
        bne     timer
    





endtst  lda     rpt  ;gets repeat value
        cmp     #$00    ;if 0
        beq     end     ;then go to end song
                        

restrt  lda     #$02    ;loads accumulater with 2
        sta     cntrl  ;sets song play controls to restart
        jmp     irqx

end     lda     #$00             ;ends song
        sta     cntrl
        jmp     irqx


;-counters
spdc    byte    $00
slenc   byte    $00
plenc   byte    $00
alenc   byte    $00



;-registers
vlshfl  byte    $00

;-buffer
buff0   byte    $00
buff1   byte    $00
buff2   byte    $00
buff3   byte    $00
buff4   byte    $00    

;-play control
;0=stop:1=play:2=restart
cntrl   byte    $00
