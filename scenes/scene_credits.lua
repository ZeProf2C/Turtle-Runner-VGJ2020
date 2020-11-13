scene_credits = {}

local pannel = mGui.CreatePannel(0,50 ,600,800,transparent, transparent)

  pannel.addTexte("titre",0,0,"CrEdiTs",titleFont,"center",pannel.L,ambre)
  
  pannel.addTexte("Olivier"     ,pannel.L*0.05           ,pannel.H*0.1,"Olivier alias M. 6/4",nameFont,"left",pannel.L,ambre)
  pannel.addTexte("olivier_taf" ,pannel.L*0.05           ,pannel.H*0.1 + 30 ," * chef des opérations-mentor \n * développeur",textFont,"left",pannel.L,blanc)
  
  pannel.addTexte("pa"     ,pannel.L*0.05                ,pannel.H*0.22 ,"Pierre-Angello",nameFont,"left",pannel.L,ambre)
  pannel.addTexte("pa_taf" ,pannel.L*0.05                ,pannel.H*0.22 + 30," * développeur",textFont,"left",pannel.L,blanc)

  pannel.addTexte("norman" ,pannel.L*0.05                ,pannel.H*0.32 ,"Norman",nameFont,"left",pannel.L,ambre)
  pannel.addTexte("norman_taf" ,pannel.L*0.05            ,pannel.H*0.32 + 30 ," * développeur",textFont,"left",pannel.L,blanc)
    
  pannel.addTexte("vallisy" ,pannel.L*0.05               ,pannel.H*0.42 ,"Vassily",nameFont,"left",pannel.L,ambre)
  pannel.addTexte("vassily_taf" ,pannel.L*0.05           ,pannel.H*0.42 + 30 ," * graphiste 2d",textFont,"left",pannel.L,blanc)
  
  pannel.addTexte("autre" ,pannel.L*0.05               ,pannel.H*0.52 ,"Remerciments",nameFont,"left",pannel.L,ambre)
  pannel.addTexte("remerciments_taf" ,pannel.L*0.05    ,pannel.H*0.52 + 30 ," * Merci aux parents de Pierre-Angelo pour l'hébergement \n * Merci à Clémence de nous bénir de son existence \n * Merci à tous ceux qui nous ont nourrit ( Lasagne taboulet ) \n * Merci à M. LE GUILLOUZER pour avoir accepté notre participation à la VGJ",textFont,"left",pannel.L,blanc)
  
  pannel.addButton("back" ,pannel.L/3  ,pannel.H*0.8,pannel.L/3,pannel.H/10,"ReTouR",buttonFont,noir,noir,noir)
  
  pannel.elt["back"].addSkin(bouton)
  
scene_credits.load = function()
  
end


scene_credits.update = function(dt)
pannel.update(dt,mouse.x,mouse.y)
end

scene_credits.draw = function()
pannel.draw()
end

scene_credits.mousepressed = function(px,py,pbutton)
  
end

scene_credits.mousereleased = function(px,py,pbutton)
   if pannel.elt["back"].isIn(px,py) and pbutton==1 then
    scene_man.next_scene = scene_man.list["menu"]
    snd_clic_menu_2:play()
  end
end

scene_credits.mousemoved = function(px,py,pdx,pdy)

end

function scene_credits.keypressed(key)
 
    
end
function scene_credits.focus(focus)
  
end
function scene_credits.textinput(txt)

end
function scene_credits.quit()
  
end
return scene_credits
