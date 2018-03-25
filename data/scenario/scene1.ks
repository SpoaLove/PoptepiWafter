[_tb_system_call storage=system/_scene1.ks]

[cm  ]
*Start

[playbgm  volume="100"  time="1000"  loop="true"  storage="游戏原声-Breath_of_Stars.ogg"  ]
[bg  storage="螢幕快照_2018-03-24_下午9.38.08.png"  time="1000"  ]
[tb_show_message_window  ]
[tb_start_text mode=1 ]
#
心里小鹿乱撞。[p]
身体仿佛不是自己的一样，在过渡的紧张...[p]
但是，紧张的一定不只是我一个人，一定...[p]
#库特
「那、那么...那么，请、请进」[p]
[_tb_end_text]

[bg  time="1000"  method="crossfade"  storage="BG004N.jpg"  ]
[tb_start_text mode=1 ]
#
库特打开屋门招待我进去。[p]
是晚上的原因吗，我觉得屋子里特别地安静。[p]
[_tb_end_text]

[chara_show  name="库特"  time="0"  wait="true"  ]
[chara_mod  name="库特"  time="0"  cross="false"  storage="chara/1/CGKD21b.png"  ]
[tb_start_text mode=1 ]
#
关上门之后，两个人都感觉到了，对，屋子变得越发安静了。[p]
这里只有我们两个人。[p]
咕嘟...咽下唾液的瞬间 — —[p]
[_tb_end_text]

[chara_hide  name="库特"  time="1000"  wait="true"  pos_mode="true"  ]
[bg  time="1000"  method="crossfade"  storage="螢幕快照_2018-03-24_下午9.38.08.png"  ]
[tb_start_text mode=1 ]
#库特
「哇呼！」[p]
#
屋子里的灯灭了。[p]

[_tb_end_text]

[bg  time="1000"  method="crossfade"  storage="BG004N2.jpg"  ]
[chara_show  name="库特"  time="1000"  wait="true"  ]
[chara_mod  name="库特"  time="600"  cross="true"  storage="chara/1/CGKD16bh.png"  ]
[tb_start_text mode=1 ]
#库特
「哇、哇呼，理树，这样突然的话...我...」[p]

[_tb_end_text]

[chara_mod  name="库特"  time="600"  cross="true"  storage="chara/1/CGKD18BH2.png"  ]
[tb_start_text mode=1 ]
「要在同一间屋子里生活的话，当然这种还去也已经意识到了，但、但是，绝不是在期待着这种事情的说...」[p]
[_tb_end_text]

[chara_mod  name="库特"  time="600"  cross="true"  storage="chara/1/CGKD20bh.png"  ]
[tb_start_text mode=1 ]
「我已经做好了觉悟的说，理树有这种心情我也很高兴的说，但是果然还是有点害怕...」[p]
[_tb_end_text]

[chara_mod  name="库特"  time="600"  cross="true"  storage="chara/1/CGKD18bh.png"  ]
[tb_start_text mode=1 ]
「理、理树也是男孩子的说，对诶、诶、诶...」[p]
[_tb_end_text]

[chara_mod  name="库特"  time="600"  cross="true"  storage="chara/1/CGKD32BH.png"  ]
[tb_start_text mode=1 ]
「对H的事情当然也因该是兴趣满满的说！能被理树选中，小女子感到光荣之至的说！」[p]
[_tb_end_text]

[chara_mod  name="库特"  time="600"  cross="true"  storage="chara/1/CGKD30BH.png"  ]
[tb_start_text mode=1 ]
「第、第一次做这种事情，所以不知道能在上面程度上回应理树的期待，但是我会全心全意努力的...」[p]
[_tb_end_text]

[chara_hide  name="库特"  time="1000"  wait="true"  pos_mode="true"  ]
[bg  time="1000"  method="crossfade"  storage="BG901N.jpg"  ]
[tb_start_text mode=1 ]
#
这个暑假...和库特在同一个屋子里度过的第一个夜晚...[p]
为什么会变成这个状况呢...[p]
这只是因为不幸的事故偶然连在一起发生了...。[p]
在加上一点努力和温柔的结果。[p]
[_tb_end_text]

[bg  time="1000"  method="crossfade"  storage="螢幕快照_2018-03-24_下午9.38.08.png"  ]
[tb_start_text mode=1 ]
是的，这是我和库特共同度过的夏天的故事 — —...。[p]
[_tb_end_text]

[playbgm  volume="100"  time="1000"  loop="true"  storage="上坂すみれ_(上坂堇)-POP_TEAM_EPIC.ogg"  ]
[quake  time="300"  count="3"  hmax="10"  wait="true"  ]
[bg  time="1000"  method="crossfade"  storage="timg-6.jpg"  ]
[quake  time="300"  count="3"  hmax="10"  wait="true"  ]
[tb_start_text mode=1 ]
# POP子
「垃圾游戏呢」[p]

[_tb_end_text]

[quake  time="300"  count="3"  hmax="10"  wait="true"  ]
[tb_start_text mode=1 ]
# PIPI美
「垃圾游戏呢」[p]
[_tb_end_text]

[jump  storage="scene1.ks"  target="*Start"  ]
