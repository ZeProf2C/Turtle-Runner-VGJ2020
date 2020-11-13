scene_credits = {}

local pannel = mGui.CreatePannel(50,50 ,550,700,transparent, blanc)

  pannel.addTexte("titre",0,50,"CrEdiTs",titleFont,"center",pannel.L,bleu_kelo5)
  
  pannel.addTexte("Olivier"     ,pannel.L*0.05           ,pannel.H*0.2,"Olivier alias Monsieur 6/4",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("olivier_taf" ,pannel.L*0.05           ,pannel.H*0.2 + 30 ," * chef des opérations-mentor \n * développeur de secours",textFont,"left",pannel.L,blanc)
  
  pannel.addTexte("pa"     ,pannel.L*0.05                ,pannel.H*0.32 ,"Pierre-Angello",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("pa_taf" ,pannel.L*0.05                ,pannel.H*0.32 + 30," * développeur_tortue",textFont,"left",pannel.L,blanc)

  pannel.addTexte("norman" ,pannel.L*0.05                ,pannel.H*0.42 ,"Norman",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("norman_taf" ,pannel.L*0.05            ,pannel.H*0.42 + 30 ," * développeur_background_énemis",textFont,"left",pannel.L,blanc)
    
  pannel.addTexte("vallisy" ,pannel.L*0.05               ,pannel.H*0.52 ,"Vassily",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("vassily_taf" ,pannel.L*0.05           ,pannel.H*0.52 + 30 ," * graphiste 2d",textFont,"left",pannel.L,blanc)
  
  pannel.addTexte("autre" ,pannel.L*0.05               ,pannel.H*0.62 ,"Remerciments",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("remerciments_taf" ,pannel.L*0.05    ,pannel.H*0.62 + 30 ," * Merci aux parents de Pierre-Angelo pour l'hébergement \n * Merci à Clémence de nous bénir de son existence \n * Merci à tous ceux qui nous ont nourrit ( Lasagne taboulet ) \n * Merci à notre proviseur M. LE GUILLOUZER",textFont,"left",pannel.L,blanc)
  
  pannel.addButton("back" ,pannel.L/3  ,pannel.H*0.95,pannel.L/3,pannel.H/10,"ReTouR",buttonFont,noir,bleu_kelo1,noir)
  
  pannel.addSkin(cadre)
  pannel.elt["back"].addSkin(bouton)
  
scene_credits.load = function()
  
end


scene_credits.update = function(dt)

   pannel.update(dt,mouse.x,mouse.y)
end

scene_credits.draw = function()
   love.graphics.setColor(blanc)
   love.graphics.draw(endScreen,0,0,0,1,0.5)
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
