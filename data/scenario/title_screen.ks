[_tb_system_call storage=system/_title_screen.ks]

[hidemenubutton]

[tb_keyconfig  flag="0"  ]
[tb_hide_message_window  ]
[bg  storage="FGKW05nd.jpg"  ]
*title

[glink  text="Start"  x="103"  y="382"  target="*start"  width=""  height=""  _clickable_img=""  ]
[glink  text="Continue"  x="101"  y="495"  target="*load"  width=""  height=""  _clickable_img=""  ]
[s  ]
*start

[showmenubutton]

[cm  ]
[tb_keyconfig  flag="1"  ]
[jump  storage="scene1.ks"  target=""  ]
[s  ]
*load

[cm  ]
[showload]

[jump  target="*title"  storage=""  ]
[s  ]
