function newPannelEscape()
  
local pannelEscape = mGui.CreatePannel(screen.L/4,screen.H*0.2 ,screen.L/2,screen.H*0.5,{0,0,0,0.5},noir,10) 
pannelEscape.addButton("game"   ,20,8                   ,pannelEscape.L-40,pannelEscape.H*0.2,"RepPrEndrE",buttonFont,ambre,ambre,noir)
pannelEscape.addButton("restart",20,pannelEscape.H*0.25+8   ,pannelEscape.L-40,pannelEscape.H*0.2,"ReComMeNceR",buttonFont,orange_elec,orange_elec,noir)
pannelEscape.addButton("menu"   ,20,pannelEscape.H*0.50+8  ,pannelEscape.L-40,pannelEscape.H*0.2,"MenU",buttonFont,bleu_elec,bleu_elec,noir)
pannelEscape.addButton("exit"   ,20,pannelEscape.H*0.75+8  ,pannelEscape.L-40,pannelEscape.H*0.2,"QuiTteR",buttonFont,vert_pale,vert_pale,noir)
---pannelEscape.elt["restart"].addSkin(bouton)
---pannelEscape.elt["game"].addSkin(bouton)
---pannelEscape.elt["menu"].addSkin(bouton)
---pannelEscape.elt["exit"].addSkin(bouton)

pannelEscape.on = false

return pannelEscape
end
