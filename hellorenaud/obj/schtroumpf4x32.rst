                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module schtroumpf4x32
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_tile_schtroumpf4x32_7
                             12 	.globl _g_tile_schtroumpf4x32_6
                             13 	.globl _g_tile_schtroumpf4x32_5
                             14 	.globl _g_tile_schtroumpf4x32_4
                             15 	.globl _g_tile_schtroumpf4x32_3
                             16 	.globl _g_tile_schtroumpf4x32_2
                             17 	.globl _g_tile_schtroumpf4x32_1
                             18 	.globl _g_tile_schtroumpf4x32_0
                             19 	.globl _g_tile_schtroumpf4x32_tileset
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _INITIALIZED
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 	.area _CODE
   0138                      52 _g_tile_schtroumpf4x32_tileset:
   0138 48 01                53 	.dw _g_tile_schtroumpf4x32_0
   013A 88 01                54 	.dw _g_tile_schtroumpf4x32_1
   013C C8 01                55 	.dw _g_tile_schtroumpf4x32_2
   013E 08 02                56 	.dw _g_tile_schtroumpf4x32_3
   0140 48 02                57 	.dw _g_tile_schtroumpf4x32_4
   0142 88 02                58 	.dw _g_tile_schtroumpf4x32_5
   0144 C8 02                59 	.dw _g_tile_schtroumpf4x32_6
   0146 08 03                60 	.dw _g_tile_schtroumpf4x32_7
   0148                      61 _g_tile_schtroumpf4x32_0:
   0148 00                   62 	.db #0x00	; 0
   0149 00                   63 	.db #0x00	; 0
   014A 00                   64 	.db #0x00	; 0
   014B 00                   65 	.db #0x00	; 0
   014C 00                   66 	.db #0x00	; 0
   014D 00                   67 	.db #0x00	; 0
   014E 00                   68 	.db #0x00	; 0
   014F 00                   69 	.db #0x00	; 0
   0150 00                   70 	.db #0x00	; 0
   0151 00                   71 	.db #0x00	; 0
   0152 00                   72 	.db #0x00	; 0
   0153 00                   73 	.db #0x00	; 0
   0154 00                   74 	.db #0x00	; 0
   0155 00                   75 	.db #0x00	; 0
   0156 00                   76 	.db #0x00	; 0
   0157 00                   77 	.db #0x00	; 0
   0158 00                   78 	.db #0x00	; 0
   0159 00                   79 	.db #0x00	; 0
   015A 00                   80 	.db #0x00	; 0
   015B 00                   81 	.db #0x00	; 0
   015C 00                   82 	.db #0x00	; 0
   015D 00                   83 	.db #0x00	; 0
   015E 00                   84 	.db #0x00	; 0
   015F 00                   85 	.db #0x00	; 0
   0160 00                   86 	.db #0x00	; 0
   0161 00                   87 	.db #0x00	; 0
   0162 00                   88 	.db #0x00	; 0
   0163 00                   89 	.db #0x00	; 0
   0164 00                   90 	.db #0x00	; 0
   0165 00                   91 	.db #0x00	; 0
   0166 00                   92 	.db #0x00	; 0
   0167 00                   93 	.db #0x00	; 0
   0168 00                   94 	.db #0x00	; 0
   0169 00                   95 	.db #0x00	; 0
   016A 00                   96 	.db #0x00	; 0
   016B 00                   97 	.db #0x00	; 0
   016C 00                   98 	.db #0x00	; 0
   016D 00                   99 	.db #0x00	; 0
   016E 00                  100 	.db #0x00	; 0
   016F 00                  101 	.db #0x00	; 0
   0170 00                  102 	.db #0x00	; 0
   0171 00                  103 	.db #0x00	; 0
   0172 00                  104 	.db #0x00	; 0
   0173 00                  105 	.db #0x00	; 0
   0174 00                  106 	.db #0x00	; 0
   0175 00                  107 	.db #0x00	; 0
   0176 00                  108 	.db #0x00	; 0
   0177 00                  109 	.db #0x00	; 0
   0178 00                  110 	.db #0x00	; 0
   0179 00                  111 	.db #0x00	; 0
   017A 00                  112 	.db #0x00	; 0
   017B 00                  113 	.db #0x00	; 0
   017C 00                  114 	.db #0x00	; 0
   017D 00                  115 	.db #0x00	; 0
   017E 00                  116 	.db #0x00	; 0
   017F 00                  117 	.db #0x00	; 0
   0180 00                  118 	.db #0x00	; 0
   0181 00                  119 	.db #0x00	; 0
   0182 00                  120 	.db #0x00	; 0
   0183 00                  121 	.db #0x00	; 0
   0184 00                  122 	.db #0x00	; 0
   0185 00                  123 	.db #0x00	; 0
   0186 00                  124 	.db #0x00	; 0
   0187 00                  125 	.db #0x00	; 0
   0188                     126 _g_tile_schtroumpf4x32_1:
   0188 00                  127 	.db #0x00	; 0
   0189 00                  128 	.db #0x00	; 0
   018A 00                  129 	.db #0x00	; 0
   018B 00                  130 	.db #0x00	; 0
   018C 00                  131 	.db #0x00	; 0
   018D 00                  132 	.db #0x00	; 0
   018E 00                  133 	.db #0x00	; 0
   018F 00                  134 	.db #0x00	; 0
   0190 00                  135 	.db #0x00	; 0
   0191 00                  136 	.db #0x00	; 0
   0192 00                  137 	.db #0x00	; 0
   0193 44                  138 	.db #0x44	; 68	'D'
   0194 00                  139 	.db #0x00	; 0
   0195 44                  140 	.db #0x44	; 68	'D'
   0196 00                  141 	.db #0x00	; 0
   0197 44                  142 	.db #0x44	; 68	'D'
   0198 00                  143 	.db #0x00	; 0
   0199 88                  144 	.db #0x88	; 136
   019A 00                  145 	.db #0x00	; 0
   019B 88                  146 	.db #0x88	; 136
   019C 00                  147 	.db #0x00	; 0
   019D 88                  148 	.db #0x88	; 136
   019E 00                  149 	.db #0x00	; 0
   019F CC                  150 	.db #0xcc	; 204
   01A0 00                  151 	.db #0x00	; 0
   01A1 44                  152 	.db #0x44	; 68	'D'
   01A2 00                  153 	.db #0x00	; 0
   01A3 44                  154 	.db #0x44	; 68	'D'
   01A4 00                  155 	.db #0x00	; 0
   01A5 00                  156 	.db #0x00	; 0
   01A6 00                  157 	.db #0x00	; 0
   01A7 00                  158 	.db #0x00	; 0
   01A8 00                  159 	.db #0x00	; 0
   01A9 00                  160 	.db #0x00	; 0
   01AA 00                  161 	.db #0x00	; 0
   01AB 00                  162 	.db #0x00	; 0
   01AC 00                  163 	.db #0x00	; 0
   01AD 00                  164 	.db #0x00	; 0
   01AE 10                  165 	.db #0x10	; 16
   01AF 30                  166 	.db #0x30	; 48	'0'
   01B0 00                  167 	.db #0x00	; 0
   01B1 30                  168 	.db #0x30	; 48	'0'
   01B2 00                  169 	.db #0x00	; 0
   01B3 30                  170 	.db #0x30	; 48	'0'
   01B4 00                  171 	.db #0x00	; 0
   01B5 30                  172 	.db #0x30	; 48	'0'
   01B6 10                  173 	.db #0x10	; 16
   01B7 30                  174 	.db #0x30	; 48	'0'
   01B8 10                  175 	.db #0x10	; 16
   01B9 30                  176 	.db #0x30	; 48	'0'
   01BA 10                  177 	.db #0x10	; 16
   01BB 30                  178 	.db #0x30	; 48	'0'
   01BC 00                  179 	.db #0x00	; 0
   01BD 30                  180 	.db #0x30	; 48	'0'
   01BE 00                  181 	.db #0x00	; 0
   01BF 00                  182 	.db #0x00	; 0
   01C0 00                  183 	.db #0x00	; 0
   01C1 CC                  184 	.db #0xcc	; 204
   01C2 00                  185 	.db #0x00	; 0
   01C3 44                  186 	.db #0x44	; 68	'D'
   01C4 00                  187 	.db #0x00	; 0
   01C5 00                  188 	.db #0x00	; 0
   01C6 00                  189 	.db #0x00	; 0
   01C7 00                  190 	.db #0x00	; 0
   01C8                     191 _g_tile_schtroumpf4x32_2:
   01C8 00                  192 	.db #0x00	; 0
   01C9 00                  193 	.db #0x00	; 0
   01CA 00                  194 	.db #0x00	; 0
   01CB 44                  195 	.db #0x44	; 68	'D'
   01CC 44                  196 	.db #0x44	; 68	'D'
   01CD 88                  197 	.db #0x88	; 136
   01CE 44                  198 	.db #0x44	; 68	'D'
   01CF 00                  199 	.db #0x00	; 0
   01D0 88                  200 	.db #0x88	; 136
   01D1 00                  201 	.db #0x00	; 0
   01D2 00                  202 	.db #0x00	; 0
   01D3 44                  203 	.db #0x44	; 68	'D'
   01D4 00                  204 	.db #0x00	; 0
   01D5 00                  205 	.db #0x00	; 0
   01D6 00                  206 	.db #0x00	; 0
   01D7 00                  207 	.db #0x00	; 0
   01D8 00                  208 	.db #0x00	; 0
   01D9 44                  209 	.db #0x44	; 68	'D'
   01DA 00                  210 	.db #0x00	; 0
   01DB 10                  211 	.db #0x10	; 16
   01DC 00                  212 	.db #0x00	; 0
   01DD 98                  213 	.db #0x98	; 152
   01DE 00                  214 	.db #0x00	; 0
   01DF 30                  215 	.db #0x30	; 48	'0'
   01E0 30                  216 	.db #0x30	; 48	'0'
   01E1 30                  217 	.db #0x30	; 48	'0'
   01E2 30                  218 	.db #0x30	; 48	'0'
   01E3 30                  219 	.db #0x30	; 48	'0'
   01E4 30                  220 	.db #0x30	; 48	'0'
   01E5 90                  221 	.db #0x90	; 144
   01E6 10                  222 	.db #0x10	; 16
   01E7 30                  223 	.db #0x30	; 48	'0'
   01E8 00                  224 	.db #0x00	; 0
   01E9 00                  225 	.db #0x00	; 0
   01EA 00                  226 	.db #0x00	; 0
   01EB 10                  227 	.db #0x10	; 16
   01EC 10                  228 	.db #0x10	; 16
   01ED 30                  229 	.db #0x30	; 48	'0'
   01EE 30                  230 	.db #0x30	; 48	'0'
   01EF 30                  231 	.db #0x30	; 48	'0'
   01F0 30                  232 	.db #0x30	; 48	'0'
   01F1 20                  233 	.db #0x20	; 32
   01F2 30                  234 	.db #0x30	; 48	'0'
   01F3 10                  235 	.db #0x10	; 16
   01F4 30                  236 	.db #0x30	; 48	'0'
   01F5 10                  237 	.db #0x10	; 16
   01F6 20                  238 	.db #0x20	; 32
   01F7 44                  239 	.db #0x44	; 68	'D'
   01F8 20                  240 	.db #0x20	; 32
   01F9 00                  241 	.db #0x00	; 0
   01FA 44                  242 	.db #0x44	; 68	'D'
   01FB CC                  243 	.db #0xcc	; 204
   01FC 88                  244 	.db #0x88	; 136
   01FD 44                  245 	.db #0x44	; 68	'D'
   01FE 88                  246 	.db #0x88	; 136
   01FF 00                  247 	.db #0x00	; 0
   0200 88                  248 	.db #0x88	; 136
   0201 00                  249 	.db #0x00	; 0
   0202 88                  250 	.db #0x88	; 136
   0203 00                  251 	.db #0x00	; 0
   0204 CC                  252 	.db #0xcc	; 204
   0205 88                  253 	.db #0x88	; 136
   0206 00                  254 	.db #0x00	; 0
   0207 44                  255 	.db #0x44	; 68	'D'
   0208                     256 _g_tile_schtroumpf4x32_3:
   0208 CC                  257 	.db #0xcc	; 204
   0209 CC                  258 	.db #0xcc	; 204
   020A 00                  259 	.db #0x00	; 0
   020B 00                  260 	.db #0x00	; 0
   020C 00                  261 	.db #0x00	; 0
   020D 00                  262 	.db #0x00	; 0
   020E 00                  263 	.db #0x00	; 0
   020F 00                  264 	.db #0x00	; 0
   0210 00                  265 	.db #0x00	; 0
   0211 CC                  266 	.db #0xcc	; 204
   0212 CC                  267 	.db #0xcc	; 204
   0213 88                  268 	.db #0x88	; 136
   0214 CC                  269 	.db #0xcc	; 204
   0215 44                  270 	.db #0x44	; 68	'D'
   0216 30                  271 	.db #0x30	; 48	'0'
   0217 30                  272 	.db #0x30	; 48	'0'
   0218 20                  273 	.db #0x20	; 32
   0219 00                  274 	.db #0x00	; 0
   021A 20                  275 	.db #0x20	; 32
   021B 00                  276 	.db #0x00	; 0
   021C 64                  277 	.db #0x64	; 100	'd'
   021D 00                  278 	.db #0x00	; 0
   021E 30                  279 	.db #0x30	; 48	'0'
   021F 30                  280 	.db #0x30	; 48	'0'
   0220 30                  281 	.db #0x30	; 48	'0'
   0221 30                  282 	.db #0x30	; 48	'0'
   0222 30                  283 	.db #0x30	; 48	'0'
   0223 90                  284 	.db #0x90	; 144
   0224 30                  285 	.db #0x30	; 48	'0'
   0225 F0                  286 	.db #0xf0	; 240
   0226 90                  287 	.db #0x90	; 144
   0227 30                  288 	.db #0x30	; 48	'0'
   0228 30                  289 	.db #0x30	; 48	'0'
   0229 30                  290 	.db #0x30	; 48	'0'
   022A 30                  291 	.db #0x30	; 48	'0'
   022B 30                  292 	.db #0x30	; 48	'0'
   022C 30                  293 	.db #0x30	; 48	'0'
   022D 30                  294 	.db #0x30	; 48	'0'
   022E 30                  295 	.db #0x30	; 48	'0'
   022F 30                  296 	.db #0x30	; 48	'0'
   0230 30                  297 	.db #0x30	; 48	'0'
   0231 30                  298 	.db #0x30	; 48	'0'
   0232 10                  299 	.db #0x10	; 16
   0233 30                  300 	.db #0x30	; 48	'0'
   0234 00                  301 	.db #0x00	; 0
   0235 CC                  302 	.db #0xcc	; 204
   0236 00                  303 	.db #0x00	; 0
   0237 00                  304 	.db #0x00	; 0
   0238 88                  305 	.db #0x88	; 136
   0239 44                  306 	.db #0x44	; 68	'D'
   023A 88                  307 	.db #0x88	; 136
   023B 44                  308 	.db #0x44	; 68	'D'
   023C 00                  309 	.db #0x00	; 0
   023D 44                  310 	.db #0x44	; 68	'D'
   023E 00                  311 	.db #0x00	; 0
   023F CC                  312 	.db #0xcc	; 204
   0240 00                  313 	.db #0x00	; 0
   0241 00                  314 	.db #0x00	; 0
   0242 00                  315 	.db #0x00	; 0
   0243 00                  316 	.db #0x00	; 0
   0244 00                  317 	.db #0x00	; 0
   0245 00                  318 	.db #0x00	; 0
   0246 CC                  319 	.db #0xcc	; 204
   0247 CC                  320 	.db #0xcc	; 204
   0248                     321 _g_tile_schtroumpf4x32_4:
   0248 CC                  322 	.db #0xcc	; 204
   0249 00                  323 	.db #0x00	; 0
   024A 00                  324 	.db #0x00	; 0
   024B CC                  325 	.db #0xcc	; 204
   024C 00                  326 	.db #0x00	; 0
   024D 44                  327 	.db #0x44	; 68	'D'
   024E 00                  328 	.db #0x00	; 0
   024F 00                  329 	.db #0x00	; 0
   0250 88                  330 	.db #0x88	; 136
   0251 CC                  331 	.db #0xcc	; 204
   0252 CC                  332 	.db #0xcc	; 204
   0253 00                  333 	.db #0x00	; 0
   0254 CC                  334 	.db #0xcc	; 204
   0255 88                  335 	.db #0x88	; 136
   0256 00                  336 	.db #0x00	; 0
   0257 CC                  337 	.db #0xcc	; 204
   0258 10                  338 	.db #0x10	; 16
   0259 44                  339 	.db #0x44	; 68	'D'
   025A 10                  340 	.db #0x10	; 16
   025B 30                  341 	.db #0x30	; 48	'0'
   025C 30                  342 	.db #0x30	; 48	'0'
   025D 30                  343 	.db #0x30	; 48	'0'
   025E 30                  344 	.db #0x30	; 48	'0'
   025F 60                  345 	.db #0x60	; 96
   0260 30                  346 	.db #0x30	; 48	'0'
   0261 30                  347 	.db #0x30	; 48	'0'
   0262 30                  348 	.db #0x30	; 48	'0'
   0263 20                  349 	.db #0x20	; 32
   0264 30                  350 	.db #0x30	; 48	'0'
   0265 30                  351 	.db #0x30	; 48	'0'
   0266 30                  352 	.db #0x30	; 48	'0'
   0267 30                  353 	.db #0x30	; 48	'0'
   0268 30                  354 	.db #0x30	; 48	'0'
   0269 30                  355 	.db #0x30	; 48	'0'
   026A 20                  356 	.db #0x20	; 32
   026B 00                  357 	.db #0x00	; 0
   026C 30                  358 	.db #0x30	; 48	'0'
   026D 00                  359 	.db #0x00	; 0
   026E 30                  360 	.db #0x30	; 48	'0'
   026F 00                  361 	.db #0x00	; 0
   0270 30                  362 	.db #0x30	; 48	'0'
   0271 20                  363 	.db #0x20	; 32
   0272 30                  364 	.db #0x30	; 48	'0'
   0273 CC                  365 	.db #0xcc	; 204
   0274 88                  366 	.db #0x88	; 136
   0275 44                  367 	.db #0x44	; 68	'D'
   0276 00                  368 	.db #0x00	; 0
   0277 CC                  369 	.db #0xcc	; 204
   0278 CC                  370 	.db #0xcc	; 204
   0279 CC                  371 	.db #0xcc	; 204
   027A CC                  372 	.db #0xcc	; 204
   027B 44                  373 	.db #0x44	; 68	'D'
   027C 44                  374 	.db #0x44	; 68	'D'
   027D CC                  375 	.db #0xcc	; 204
   027E 00                  376 	.db #0x00	; 0
   027F 00                  377 	.db #0x00	; 0
   0280 44                  378 	.db #0x44	; 68	'D'
   0281 00                  379 	.db #0x00	; 0
   0282 44                  380 	.db #0x44	; 68	'D'
   0283 88                  381 	.db #0x88	; 136
   0284 44                  382 	.db #0x44	; 68	'D'
   0285 CC                  383 	.db #0xcc	; 204
   0286 88                  384 	.db #0x88	; 136
   0287 00                  385 	.db #0x00	; 0
   0288                     386 _g_tile_schtroumpf4x32_5:
   0288 00                  387 	.db #0x00	; 0
   0289 00                  388 	.db #0x00	; 0
   028A 00                  389 	.db #0x00	; 0
   028B 00                  390 	.db #0x00	; 0
   028C 88                  391 	.db #0x88	; 136
   028D 00                  392 	.db #0x00	; 0
   028E 88                  393 	.db #0x88	; 136
   028F 00                  394 	.db #0x00	; 0
   0290 88                  395 	.db #0x88	; 136
   0291 00                  396 	.db #0x00	; 0
   0292 00                  397 	.db #0x00	; 0
   0293 00                  398 	.db #0x00	; 0
   0294 00                  399 	.db #0x00	; 0
   0295 00                  400 	.db #0x00	; 0
   0296 00                  401 	.db #0x00	; 0
   0297 00                  402 	.db #0x00	; 0
   0298 00                  403 	.db #0x00	; 0
   0299 00                  404 	.db #0x00	; 0
   029A 00                  405 	.db #0x00	; 0
   029B 00                  406 	.db #0x00	; 0
   029C 00                  407 	.db #0x00	; 0
   029D 30                  408 	.db #0x30	; 48	'0'
   029E 00                  409 	.db #0x00	; 0
   029F 10                  410 	.db #0x10	; 16
   02A0 10                  411 	.db #0x10	; 16
   02A1 30                  412 	.db #0x30	; 48	'0'
   02A2 10                  413 	.db #0x10	; 16
   02A3 30                  414 	.db #0x30	; 48	'0'
   02A4 30                  415 	.db #0x30	; 48	'0'
   02A5 30                  416 	.db #0x30	; 48	'0'
   02A6 30                  417 	.db #0x30	; 48	'0'
   02A7 30                  418 	.db #0x30	; 48	'0'
   02A8 00                  419 	.db #0x00	; 0
   02A9 30                  420 	.db #0x30	; 48	'0'
   02AA 00                  421 	.db #0x00	; 0
   02AB 00                  422 	.db #0x00	; 0
   02AC 00                  423 	.db #0x00	; 0
   02AD 00                  424 	.db #0x00	; 0
   02AE 00                  425 	.db #0x00	; 0
   02AF 00                  426 	.db #0x00	; 0
   02B0 00                  427 	.db #0x00	; 0
   02B1 00                  428 	.db #0x00	; 0
   02B2 00                  429 	.db #0x00	; 0
   02B3 00                  430 	.db #0x00	; 0
   02B4 00                  431 	.db #0x00	; 0
   02B5 00                  432 	.db #0x00	; 0
   02B6 00                  433 	.db #0x00	; 0
   02B7 00                  434 	.db #0x00	; 0
   02B8 00                  435 	.db #0x00	; 0
   02B9 00                  436 	.db #0x00	; 0
   02BA 88                  437 	.db #0x88	; 136
   02BB 00                  438 	.db #0x00	; 0
   02BC 44                  439 	.db #0x44	; 68	'D'
   02BD 00                  440 	.db #0x00	; 0
   02BE 00                  441 	.db #0x00	; 0
   02BF 88                  442 	.db #0x88	; 136
   02C0 00                  443 	.db #0x00	; 0
   02C1 88                  444 	.db #0x88	; 136
   02C2 44                  445 	.db #0x44	; 68	'D'
   02C3 88                  446 	.db #0x88	; 136
   02C4 CC                  447 	.db #0xcc	; 204
   02C5 00                  448 	.db #0x00	; 0
   02C6 00                  449 	.db #0x00	; 0
   02C7 00                  450 	.db #0x00	; 0
   02C8                     451 _g_tile_schtroumpf4x32_6:
   02C8 00                  452 	.db #0x00	; 0
   02C9 00                  453 	.db #0x00	; 0
   02CA 00                  454 	.db #0x00	; 0
   02CB 00                  455 	.db #0x00	; 0
   02CC 00                  456 	.db #0x00	; 0
   02CD 00                  457 	.db #0x00	; 0
   02CE 00                  458 	.db #0x00	; 0
   02CF 00                  459 	.db #0x00	; 0
   02D0 00                  460 	.db #0x00	; 0
   02D1 00                  461 	.db #0x00	; 0
   02D2 00                  462 	.db #0x00	; 0
   02D3 00                  463 	.db #0x00	; 0
   02D4 00                  464 	.db #0x00	; 0
   02D5 00                  465 	.db #0x00	; 0
   02D6 00                  466 	.db #0x00	; 0
   02D7 00                  467 	.db #0x00	; 0
   02D8 00                  468 	.db #0x00	; 0
   02D9 00                  469 	.db #0x00	; 0
   02DA 00                  470 	.db #0x00	; 0
   02DB 00                  471 	.db #0x00	; 0
   02DC 00                  472 	.db #0x00	; 0
   02DD 00                  473 	.db #0x00	; 0
   02DE 00                  474 	.db #0x00	; 0
   02DF 00                  475 	.db #0x00	; 0
   02E0 00                  476 	.db #0x00	; 0
   02E1 00                  477 	.db #0x00	; 0
   02E2 00                  478 	.db #0x00	; 0
   02E3 00                  479 	.db #0x00	; 0
   02E4 20                  480 	.db #0x20	; 32
   02E5 00                  481 	.db #0x00	; 0
   02E6 30                  482 	.db #0x30	; 48	'0'
   02E7 00                  483 	.db #0x00	; 0
   02E8 30                  484 	.db #0x30	; 48	'0'
   02E9 00                  485 	.db #0x00	; 0
   02EA 30                  486 	.db #0x30	; 48	'0'
   02EB 00                  487 	.db #0x00	; 0
   02EC 00                  488 	.db #0x00	; 0
   02ED 00                  489 	.db #0x00	; 0
   02EE 00                  490 	.db #0x00	; 0
   02EF 00                  491 	.db #0x00	; 0
   02F0 00                  492 	.db #0x00	; 0
   02F1 00                  493 	.db #0x00	; 0
   02F2 00                  494 	.db #0x00	; 0
   02F3 00                  495 	.db #0x00	; 0
   02F4 00                  496 	.db #0x00	; 0
   02F5 00                  497 	.db #0x00	; 0
   02F6 00                  498 	.db #0x00	; 0
   02F7 00                  499 	.db #0x00	; 0
   02F8 00                  500 	.db #0x00	; 0
   02F9 00                  501 	.db #0x00	; 0
   02FA 00                  502 	.db #0x00	; 0
   02FB 00                  503 	.db #0x00	; 0
   02FC 00                  504 	.db #0x00	; 0
   02FD 00                  505 	.db #0x00	; 0
   02FE 00                  506 	.db #0x00	; 0
   02FF 00                  507 	.db #0x00	; 0
   0300 00                  508 	.db #0x00	; 0
   0301 00                  509 	.db #0x00	; 0
   0302 00                  510 	.db #0x00	; 0
   0303 00                  511 	.db #0x00	; 0
   0304 00                  512 	.db #0x00	; 0
   0305 00                  513 	.db #0x00	; 0
   0306 00                  514 	.db #0x00	; 0
   0307 00                  515 	.db #0x00	; 0
   0308                     516 _g_tile_schtroumpf4x32_7:
   0308 00                  517 	.db #0x00	; 0
   0309 00                  518 	.db #0x00	; 0
   030A 00                  519 	.db #0x00	; 0
   030B 00                  520 	.db #0x00	; 0
   030C 00                  521 	.db #0x00	; 0
   030D 00                  522 	.db #0x00	; 0
   030E 00                  523 	.db #0x00	; 0
   030F 00                  524 	.db #0x00	; 0
   0310 00                  525 	.db #0x00	; 0
   0311 00                  526 	.db #0x00	; 0
   0312 00                  527 	.db #0x00	; 0
   0313 00                  528 	.db #0x00	; 0
   0314 00                  529 	.db #0x00	; 0
   0315 00                  530 	.db #0x00	; 0
   0316 00                  531 	.db #0x00	; 0
   0317 00                  532 	.db #0x00	; 0
   0318 00                  533 	.db #0x00	; 0
   0319 00                  534 	.db #0x00	; 0
   031A 00                  535 	.db #0x00	; 0
   031B 00                  536 	.db #0x00	; 0
   031C 00                  537 	.db #0x00	; 0
   031D 00                  538 	.db #0x00	; 0
   031E 00                  539 	.db #0x00	; 0
   031F 00                  540 	.db #0x00	; 0
   0320 00                  541 	.db #0x00	; 0
   0321 00                  542 	.db #0x00	; 0
   0322 00                  543 	.db #0x00	; 0
   0323 00                  544 	.db #0x00	; 0
   0324 00                  545 	.db #0x00	; 0
   0325 00                  546 	.db #0x00	; 0
   0326 00                  547 	.db #0x00	; 0
   0327 00                  548 	.db #0x00	; 0
   0328 00                  549 	.db #0x00	; 0
   0329 00                  550 	.db #0x00	; 0
   032A 00                  551 	.db #0x00	; 0
   032B 00                  552 	.db #0x00	; 0
   032C 00                  553 	.db #0x00	; 0
   032D 00                  554 	.db #0x00	; 0
   032E 00                  555 	.db #0x00	; 0
   032F 00                  556 	.db #0x00	; 0
   0330 00                  557 	.db #0x00	; 0
   0331 00                  558 	.db #0x00	; 0
   0332 00                  559 	.db #0x00	; 0
   0333 00                  560 	.db #0x00	; 0
   0334 00                  561 	.db #0x00	; 0
   0335 00                  562 	.db #0x00	; 0
   0336 00                  563 	.db #0x00	; 0
   0337 00                  564 	.db #0x00	; 0
   0338 00                  565 	.db #0x00	; 0
   0339 00                  566 	.db #0x00	; 0
   033A 00                  567 	.db #0x00	; 0
   033B 00                  568 	.db #0x00	; 0
   033C 00                  569 	.db #0x00	; 0
   033D 00                  570 	.db #0x00	; 0
   033E 00                  571 	.db #0x00	; 0
   033F 00                  572 	.db #0x00	; 0
   0340 00                  573 	.db #0x00	; 0
   0341 00                  574 	.db #0x00	; 0
   0342 00                  575 	.db #0x00	; 0
   0343 00                  576 	.db #0x00	; 0
   0344 00                  577 	.db #0x00	; 0
   0345 00                  578 	.db #0x00	; 0
   0346 00                  579 	.db #0x00	; 0
   0347 00                  580 	.db #0x00	; 0
                            581 	.area _INITIALIZER
                            582 	.area _CABS (ABS)
