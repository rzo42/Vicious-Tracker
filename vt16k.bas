!-TITLE SCREEN-----------------------------------------------
0poke36879,8:print"{clear}    {white}{161}{161}{reverse on}{187}{reverse off}{190}{reverse on}{172}{reverse off}{190}{reverse on}{187}{reverse off}{190}{reverse on}{172}{reverse off}{161}{161}{161}{reverse on}{172}{reverse off}{190}":print"    {161}{161}{reverse on}{161}{reverse off} {161} {reverse on}{161}{reverse off} {161}{161}{161}{161}{reverse on}{162}{reverse off}{161}"
1print"    {188} {reverse on}{162}{reverse off}{190}{reverse on}{162}{reverse off}{190}{reverse on}{162}{reverse off}{190}{reverse on}{162}{reverse off}{190}{reverse on}{162}{reverse off}{190}{reverse on}{162}{reverse off}{190}":print"    {reverse on}{187}{reverse off}{190}{reverse on}{172}{reverse off}{161}{reverse on}{172}{reverse off}{161}{reverse on}{172}{reverse off}{190}{161}{161}{reverse on}{172}{reverse off}{190}{reverse on}{172}{reverse off}{161}"
2print"    {reverse on}{161}{reverse off} {reverse on}{172}{reverse off}{187}{reverse on}{172}{reverse off}{161}{161} {reverse on}{172}{reverse off}{187}{reverse on}{172}{reverse off} {reverse on}{172}{reverse off}{187}":print"    {188} {190}{190}{190}{190}{reverse on}{162}{reverse off}{190}{190}{190}{reverse on}{162}{reverse off}{190}{190}{190}"
3print"    version  b.3.1":print"{down}   ryan liston 2020{home}"
4poke55,0:poke56,64:clr:goto14
!-GOSUB ROUTINES-------------------------------------------
!-page handler
5pa=0:ifa$=chr$(133)then:p=1
6ifa$=chr$(137)thenp=2
7ifa$=chr$(134)thenp=3
8ifa$=chr$(138)thenp=4
9ifa$=chr$(135)thenp=5
10ifa$=chr$(139)thenp=5
11onpgoto27,99,127,179,220
!-file loader
12sys57809(f$),8:poke780,0:poke781,sb-(int(sb/256)*256):poke782,int(sb/256)
13sys65493:return
!-VARIABLE DECLARATION-----------------------------
14sb=speed:ss=4096:sc=37888:ar=arl:la=arl:ma=arm
15ha=arh:na=arn:vr=arv:pl=patlv:pm=patmv:ph=pathv:pn=patnv
16pv=patv:sd=pmod:vd=amod:p=1:cs=0:cb=0:ct=1:cc=5:cr=0:pa=0:f$="blank"
17pb=buff4:xo=cntrl:se=notbl:sf=mscrn
!-Arrays----------------------------------------
18dimhx$(16):fort=.to15:reada$:hx$(t)=a$:nextt:dimac(16):fort=.to15:reada
19ac(t)=a:nextt:dimpk(16):fort=.to15:reada:pk(t)=a+128:next
20dimcv(8):fort=0to7:reada:cv(t)=a:nextt:restore
21data"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"
22data48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70
23data48,49,50,51,52,53,54,55,56,57,1,2,3,4,5,6
24data144,5,28,159,156,30,31,158
!-load assembly routines and tables
25sys57809("f16"),8,1:poke780,0:sys65493:sysinit:goto27
!----------------------------------------------------
26gosub12
!-SETTING SCREEN---------------------------------------
27print"{reverse off}{clear}{white}song file:"
28print"                      ";
29printf$
30print"                      ";
31print"{reverse on}l{reverse off}oad  {reverse on}s{reverse off}ave  {reverse on}n{reverse off}ew  {reverse on}x{reverse off}port";
32print"                      ";
33print"  {reverse on}  {reverse off} song speed"
34print"  {reverse on} {reverse off}  sound length     ";
35print"  {reverse on} {reverse off}  pattern length   ";
36print"  {reverse on}  {reverse off} song length      ";
37print"  {reverse on} {reverse off}  volume           ";
38print"  {reverse on} {reverse off}  repeat           ";
39print"  {reverse on} {reverse off}  low voice        ";
40print"  {reverse on} {reverse off}  mid voice        ";
41print"  {reverse on} {reverse off}  high voice       ";
42print"  {reverse on} {reverse off}  noise            {home}";
43sysmscrn:x1=2:y1=6:pokesc+x1+(y1*22),cc
!-Control
44x2=0:y2=0:geta$:ifa$=""then44
45ifa$="s"then71
46ifa$="l"then79
47ifa$="n"then85
48ifa$="x"then90
49ifasc(a$)=140orasc(a$)=136then:gosub251:goto27
50ifasc(a$)>132andasc(a$)<140thengoto5
51ifa$=chr$(17)theny2=1:goto58
52ifa$=chr$(145)theny2=-1:goto58
53ifa$=chr$(29)thenx2=1:goto58
54ifa$=chr$(157)thenx2=-1:goto58
55ifasc(a$)>47andasc(a$)<58then60
56ifasc(a$)>64andasc(a$)<91then60
57goto44
!-cursor
58ifpeek(ss+x1+x2+((y1+y2)*22))<128then44
59pokesc+x1+(y1*22),ct:x1=x1+x2:y1=y1+y2:pokesc+x1+(y1*22),cc:goto44
!-Data input controls
60ifasc(a$)<48orasc(a$)>70then44
61fort=.to15:ifhx$(t)=a$thenx=t
62nextt
63ify1>10andx<2thenpokess+x1+(y1*22),pk(x):pokesb+y1-6,x:goto44
64ify1>10then44
65ify1>9or(y1<9andy1>6)thenpokess+x1+(y1*22),pk(x):pokesb+y1-6,x:goto44
!-sets arrangment lenght and speed
!-sets data to screen and ram
!-jumps to controls
66ifx1+(y1*22)=200andx>7thenx=peek(ss+x1+(y1*22))-48-128
67pokess+x1+(y1*22),pk(x):fort=.to15
68ifpeek(ss+2+(y1*22))=pk(t)thenx=t
69ifpeek(ss+3+(y1*22))=pk(t)theny=t
70nextt:pokesb+y1-6,(x*16)+y:goto44
!-save
71print"{clear}save?   y or n"
72geta$:ifa$="y"then75
73ifa$="n"then27
74goto72
75input"{down*2}enter filename{left*14}{down}";f$
76print"{down}saving...":printf$:open15,8,15,"s0:"+f$:close15
77sys57809(f$),8,1:poke193,sb-(int(sb/256)*256):poke194,int(sb/256):poke780,193
78poke781,se-(int(se/256)*256):poke782,int(se/256):sys65496:goto27
!-load
79print"{clear}load?   y or n"
80geta$:ifa$="y"then83
81ifa$="n"then27
82goto80
83input"{down*2}enter filename{left*14}{down}";f$
84print"{down}loading...":printf$:goto26
!-new
85print"{clear}new?   y or n"
86geta$:ifa$="y"then89
87ifa$="n"then27
88goto86
89f$="blank":print"{down}loading new":print"song file...":gosub12:goto27
!-export
90print"{clear}export?   y or n"
91geta$:ifa$="y"then94
92ifa$="n"then27
93goto91
94input"{down*2}enter filename{left*14}{down}";f$
95print"{down}exporting...":printf$:open15,8,15,"s0:"+f$:close15
96sys57809(f$),8,1:poke193,sf-(int(sf/256)*256):poke194,int(sf/256)
97poke780,193:poke781,(xo+1)-(int((xo+1)/256)*256)
98poke782,int((xo+1)/256):sys65496:goto27
!-------------------------------------------------------------------------------
!-ARRANGEMENT EDITOR
99print"{reverse off}{clear}{white}arranger            p0";
100print"                      ";
101print"low   {reverse on}                ";
102print"{reverse off}mid   {reverse on}                ";
103print"{reverse off}high  {reverse on}                ";
104print"{reverse off}nois  {reverse on}                ";
105print"{reverse off}vol   {reverse on}                {home}";
106pokess+21,pk(pa):pokepb,pa*16:sysastart:x1=6:y1=2:pokesc+x1+(y1*22),cc
107x2=0:y2=0:geta$:ifa$=""then107
108ifasc(a$)=140orasc(a$)=136then:gosub251:goto99
109ifasc(a$)>132andasc(a$)<140thengoto5
110ifa$=chr$(17)theny2=1:goto125
111ifa$=chr$(145)theny2=-1:goto125
112ifa$=chr$(29)thenx2=1:goto125
113ifa$=chr$(157)thenx2=-1:goto125
114ifa$="+"andpa<7thenpa=pa+1:pokesc+x1+(y1*22),1:goto106
115ifa$="-"andpa>0thenpa=pa-1:pokesc+x1+(y1*22),1:goto106
116ifasc(a$)>47andasc(a$)<58thenx=asc(a$)-48:goto119
117ifasc(a$)>64andasc(a$)<71thenx=asc(a$)-55:goto119
!-loops to controls
118goto107
!-screen data input
119pokess+x1+(y1*22),pk(x)
120ify1=6thenpokevr+(pa*16)+x1-6+((y1-6)*16),x*16:goto107
121ify1=5thenpokena+(pa*16)+x1-6+((y1-5)*16),x*16:goto107
122ify1=4thenpokeha+(pa*16)+x1-6+((y1-4)*16),x*16:goto107
123ify1=3thenpokema+(pa*16)+x1-6+((y1-3)*16),x*16:goto107
124pokela+(pa*16)+x1-6+((y1-2)*16),x*16:goto107
!-Cursor controls
125ifpeek(ss+x1+x2+((y1+y2)*22))<128then107
126pokesc+x1+(y1*22),ct:x1=x1+x2:y1=y1+y2:pokesc+x1+(y1*22),cc:goto107
!-------------------------------------------------------------------------------
!-PATTERN EDITOR
127print"{clear}{reverse off}{white}patterns            p0";
128print"                      ";
129print"low  t{reverse on}                ";
130print"{reverse off}p0   n{reverse on}                ";
131print"{reverse off}     o{reverse on}                ";
132print"{reverse off}     s{reverse on}                ";
133print"{reverse off}mid  t{reverse on}                ";
134print"{reverse off}p0   n{reverse on}                ";
135print"{reverse off}     o{reverse on}                ";
136print"{reverse off}     s{reverse on}                ";
137print"{reverse off}high t{reverse on}                ";
138print"{reverse off}p0   n{reverse on}                ";
139print"{reverse off}     o{reverse on}                ";
140print"{reverse off}     s{reverse on}                ";
141print"{reverse off}nois t{reverse on}                ";
142print"{reverse off}p0   n{reverse on}                ";
143print"{reverse off}     o{reverse on}                ";
144print"{reverse off}     s{reverse on}                ";
145print"{reverse off}vol  v{reverse on}                ";
146print"{reverse off}p0                    {home}";
147pokess+21,pk(pa):pokepb,pa*16:syspstart:x1=6:y1=2:pokesc+x1+(y1*22),cc
148fort=0to4:pokess+67+(t*88),pk(pa):nextt
!-Controls
!-gets user imput
!-f1-f8 jumps to page control
!-arrows jumps to cursor control
!-"+" and "-" jumps to sub page controls
!-"0"-"f" converts to 0-15 and jumps to data input controls
149x2=0:y2=0:geta$:ifa$=""then149
150ifasc(a$)=140orasc(a$)=136then:gosub251:goto147
151ifasc(a$)>132andasc(a$)<140thengoto5
152ifa$=chr$(17)theny2=1:goto161
153ifa$=chr$(145)theny2=-1:goto161
154ifa$=chr$(29)thenx2=1:goto161
155ifa$=chr$(157)thenx2=-1:goto161
156ifa$="+"andpa<15thenpa=pa+1:pokesc+x1+(y1*22),1:goto147
157ifa$="-"andpa>0thenpa=pa-1:pokesc+x1+(y1*22),1:goto147
158ifasc(a$)>47andasc(a$)<58thenx=asc(a$)-48:goto163
159ifasc(a$)>64andasc(a$)<71thenx=asc(a$)-55:goto163
!-loops to controls
160goto149
!-Cursor controls
161ifpeek(ss+x1+x2+((y1+y2)*22))<128then149
162pokesc+x1+(y1*22),ct:x1=x1+x2:y1=y1+y2:pokesc+x1+(y1*22),cc:goto149
!-Input controls
!-sets y3 for note hadling
!-note value = {tone}+{note*2}+{octave*24}
!-for silent tone set oct to 0
!-checks y1 for tone,note,oct,sound and volume fields
!-if input is valid for field then jump to data controls
!-else jump to controls
163y3=int((y1-2)/4)
164if((y1=2ory1=6)or(y1=10ory1=14))andx<2then170
165if((y1=3ory1=7)or(y1=11ory1=15))andx<12then170
166if((y1=4ory1=8)or(y1=12ory1=16))andx<4then170
167if((y1=5ory1=9)or(y1=13ory1=17))andx<16then170
168ify1=18andx<16then170
169goto149
!-Data controls
!-sets volume (amp) pattern data
170pokess+x1+(y1*22),pk(x):ify1=18thenpokepv+(x1-6)+(pa*16),x*16:goto149
!-If sound line jump to sound line control
171if((y1=5ory1=9)or(y1=13ory1=17))then178
!-sets ram and screen fiels for note values
!-jumps to controls
172y=(y1-2)-(y3*4):z=peek(ss+x1+(((y3*4)+2)*22))
173a=peek(ss+x1+(((y3*4)+3)*22)):b=peek(ss+x1+(((y3*4)+4)*22))
174fort=.to15:ifz=pk(t)thenc=t
175ifa=pk(t)thend=t
176ifb=pk(t)thene=t
!-c=simtn d=note e=oct
177nextt:pokepl+x1-6+(y3*512)+(pa*16),e+(c*8)+(d*16):goto149
!-sets sound data and screen fields and jumps to controls
178pokepl+256+x1-6+(y3*512)+(pa*16),x*16:goto149
!---------------------------------------------------------------------------
!-PITCH MOD
179print"{clear}{reverse off}{white}pitch mod           p0";
180print"{down}s0   t{reverse on}                ";
181print"{reverse off}     n{reverse on}                ";
182print"{reverse off}     o{reverse on}                ";
183print"{reverse off}s1   t{reverse on}                ";
184print"{reverse off}     n{reverse on}                ";
185print"{reverse off}     o{reverse on}                ";
186print"{reverse off}s2   t{reverse on}                ";
187print"{reverse off}     n{reverse on}                ";
188print"{reverse off}     o{reverse on}                ";
189print"{reverse off}s3   t{reverse on}                ";
190print"{reverse off}     n{reverse on}                ";
191print"{reverse off}     o{reverse on}                {home}";
192pokess+21,pk(pa):pokepb,pa*64:syspmstart:x1=6:y1=2:pokesc+x1+(y1*22),cc
193fort=0to3:pokess+45+(t*66),pk(pa*4+t):nextt
!-Controls
!-gets user imput
!-f1-f8 jumps to page control
!-arrows jumps to cursor control
!-"+" and "-" jumps to sub page controls
!-"0"-"f" converts to 0-15 and jumps to data input controls
194x2=0:y2=0:geta$:ifa$=""then194
195ifasc(a$)=140orasc(a$)=136then:gosub251:goto179
196ifasc(a$)>132andasc(a$)<140thengoto5
197ifa$=chr$(17)theny2=1:goto206
198ifa$=chr$(145)theny2=-1:goto206
199ifa$=chr$(29)thenx2=1:goto206
200ifa$=chr$(157)thenx2=-1:goto206
201ifa$="+"andpa<3thenpa=pa+1:pokesc+x1+(y1*22),1:goto192
202ifa$="-"andpa>0thenpa=pa-1:pokesc+x1+(y1*22),1:goto192
203ifasc(a$)>47andasc(a$)<58thenx=asc(a$)-48:goto208
204ifasc(a$)>64andasc(a$)<71thenx=asc(a$)-55:goto208
!-loop to control
205goto194
!-Cursor control
206ifpeek(ss+x1+x2+((y1+y2)*22))<128then194
207pokesc+x1+(y1*22),ct:x1=x1+x2:y1=y1+y2:pokesc+x1+(y1*22),cc:goto194
!-Input controls
!-sets y3 for note hadling
!-sound (pitch mod) value = {tone}+{note*2}+{octave*24}
!-final note value={sound value}+{note value}
!-checks y1 for tone,note and oct fields
!-for silent tone set oct to 4
!-if input is valid for field then jump to data controls
!-else jump to controls
208y3=int((y1-2)/3)
209if((y1=2ory1=5)or(y1=8ory1=11))andx<2then213
210if((y1=3ory1=6)or(y1=9ory1=12))andx<12then213
211if((y1=4ory1=7)or(y1=10ory1=13))andx<5then213
212goto194
!-Data controls
!-sets data to screen and ram
!-jumps to controls
213pokess+x1+(y1*22),pk(x)
214y=(y1-2)-(y3*3):z=peek(ss+x1+(((y3*3)+2)*22))
215a=peek(ss+x1+(((y3*3)+3)*22)):b=peek(ss+x1+(((y3*3)+4)*22))
216fort=.to15:ifz=pk(t)thenc=t
217ifa=pk(t)thend=t
218ifb=pk(t)thene=t
219nextt:pokesd+x1-6+(y3*16)+(pa*64),e+(c*8)+(d*16):goto194
!---------------------------------------------------------------------------
!-amp mod
220print"{clear}{reverse off}{white}amp mod"
221print"{down}v0    {reverse on}                ";
222print"{reverse off}v1    {reverse on}                ";
223print"{reverse off}v2    {reverse on}                ";
224print"{reverse off}v3    {reverse on}                ";
225print"{reverse off}v4    {reverse on}                ";
226print"{reverse off}v5    {reverse on}                ";
227print"{reverse off}v6    {reverse on}                ";
228print"{reverse off}v7    {reverse on}                ";
229print"{reverse off}v8    {reverse on}                ";
230print"{reverse off}v9    {reverse on}                ";
231print"{reverse off}va    {reverse on}                ";
232print"{reverse off}vb    {reverse on}                ";
233print"{reverse off}vc    {reverse on}                ";
234print"{reverse off}vd    {reverse on}                ";
235print"{reverse off}ve    {reverse on}                ";
236print"{reverse off}vf    {reverse on}                {home}";
237sysamstart:x1=6:y1=2:pokesc+x1+(y1*22),cc
!-Controls
!-gets user imput
!-f1-f8 jumps to page control
!-arrows jumps to cursor control
!-"+" and "-" jumps to sub page controls
!-"0"-"f" converts to 0-15 and jumps to data input controls
238x2=0:y2=0:geta$:ifa$=""then238
239ifasc(a$)=140orasc(a$)=136then:gosub251:goto220
240ifasc(a$)>132andasc(a$)<140thengoto5
241ifa$=chr$(17)theny2=1:goto248
242ifa$=chr$(145)theny2=-1:goto248
243ifa$=chr$(29)thenx2=1:goto248
244ifa$=chr$(157)thenx2=-1:goto248
245ifasc(a$)>47andasc(a$)<58thenx=asc(a$)-48:goto250
246ifasc(a$)>64andasc(a$)<71thenx=asc(a$)-55:goto250
!-jumps to controls
247goto238
!-Cursor controls
248ifpeek(ss+x1+x2+((y1+y2)*22))<128then238
249pokesc+x1+(y1*22),ct:x1=x1+x2:y1=y1+y2:pokesc+x1+(y1*22),cc:goto238
!-Input controls
!-sets amp mod data to screen and ram
!-jumps to controls
250pokess+x1+(y1*22),pk(x):pokevd+x1-6+((y1-2)*16),x:goto238
!-PLAYER------------------------------------------------------------------------
251pokecntrl,2:poke36878,peek(volxo)
252print"{clear}{white}{reverse on}vicious tracker "
253print"{down}"f$
254geta$
255ifa$=""then257
256pokecntrl,0:fort=0to3:poke36874+t,0:nextt:return
257print"{home}{down*4}arranger"peek(alenc)"{left}   "
258print"pattern "peek(plenc)"{left}   "
259print"sound   "peek(slenc)"{left}   "
260print"timer   "peek(spdc)"{left}   "
261print"low     "peek(36874)"{left}   "
262print"mid     "peek(36875)"{left}   "
263print"high    "peek(36876)"{left}   "
264print"noise   "peek(36877)"{left}   "
265print"volume  "peek(36878)"{left}   "
266goto254