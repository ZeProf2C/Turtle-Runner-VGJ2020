scene_credits = {}

local pannel = mGui.CreatePannel(0,0 ,650,800,blanc, blanc)

  pannel.addTexte("titre",0,50,"CrEdiTs",titleFont,"center",pannel.L,bleu_kelo4)
  
  pannel.addTexte("Olivier"     ,pannel.L*0.05           ,pannel.H*0.2,"Olivier alias Monsieur 6/4",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("olivier_taf" ,pannel.L*0.05           ,pannel.H*0.2 + 30 ," * chef des opérations-mentor \n * développeur menu-crédits-règles-game over-win-changement de scène \n * sound design",textFont,"left",pannel.L,noir)
  
  pannel.addTexte("pa"     ,pannel.L*0.05                ,pannel.H*0.32 ,"Pierre-Angello en term 6 au Lycée de Bellepierre",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("pa_taf" ,pannel.L*0.05                ,pannel.H*0.32 + 30," * développeur_tortue",textFont,"left",pannel.L,noir)

  pannel.addTexte("norman" ,pannel.L*0.05                ,pannel.H*0.42 ,"Norman en term 5 au Lycée de Bellepierre",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("norman_taf" ,pannel.L*0.05            ,pannel.H*0.42 + 30 ," * développeur_background_énemis",textFont,"left",pannel.L,noir)
    
  pannel.addTexte("vallisy" ,pannel.L*0.05               ,pannel.H*0.52 ,"Vassily en term 6 au Lycée de Bellepierre",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("vassily_taf" ,pannel.L*0.05           ,pannel.H*0.52 + 30 ," * graphiste 2d \n * game design",textFont,"left",pannel.L,noir)
  
  pannel.addTexte("autre" ,pannel.L*0.05               ,pannel.H*0.62 ,"Remerciments",nameFont,"left",pannel.L,bleu_kelo5)
  pannel.addTexte("remerciments_taf" ,pannel.L*0.05    ,pannel.H*0.62 + 30 ," * Merci aux parents de Pierre-Angelo pour l'hébergement \n * Merci à Clémence de nous bénir de son existence \n * Merci à tous ceux qui nous ont nourrit ( Lasagne taboulet ) \n * Merci à notre proviseur M. LE GUILLOUZER",textFont,"left",pannel.L,noir)
  
  pannel.addButton("back" ,pannel.L/3  ,pannel.H*0.8,pannel.L/3,pannel.H/10,"ReTouR",buttonFont,noir,blanc,noir)
  
  pannel.addSkin(endScreen)
  pannel.elt["back"].addSkin(bouton)
  
scene_credits.load = function()
  
end


scene_credits.update = function(dt)

   pannel.update(dt,mouse.x,mouse.y)
end

scene_credits.draw = function()
  -- love.graphics.setColor(blanc)
   --love.graphics.draw(endScreen,0,0,0,1,0.5)
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
