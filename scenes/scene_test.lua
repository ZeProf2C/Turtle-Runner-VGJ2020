scene_test = {}

scene_test.name = "menu"



local pannel_flat = mGui.CreatePannel(0,0 ,screen.L*0.5,screen.H*0.5,bleu_elec, noir,0)
pannel_flat.addTexte("titre",0,pannel_flat.H*0.01,"ceci est un pannel sans skin",textFont,"center",pannel_flat.L,noir)


local pannel_skin = mGui.CreatePannel(0,screen.H*0.5 ,screen.L*0.5,screen.H*0.5,blanc, blanc,0)
pannel_skin.addTexte("titre",0,pannel_skin.H*0.01,"ceci est un pannel avec skin",textFont,"center",pannel_skin.L,noir)

pannel_skin.addSkin(cadre)

local pannel_droit = mGui.CreatePannel(screen.L*0.5,0 ,screen.L*0.5,screen.H,orange_elec, blanc,50)
pannel_droit.addTexte("titre",0,pannel_droit.H*0.01,"dans un pannel on peut inserer :",textFont,"center",pannel_droit.L,noir)

-- bouton flat
pannel_droit.addButton("btflat",pannel_droit.L*0.1 ,pannel_droit.H*0.1,pannel_droit.L*0.2,50,"bouton flat",buttonFont,ambre,noir,noir,10)

-- bouton skin
pannel_droit.addButton("btskin",pannel_droit.L*0.1 ,pannel_droit.H*0.2,pannel_droit.L*0.2,50,"bouton skin",buttonFont,ambre,noir,noir,0)
pannel_droit.elt["btskin"].addSkin(bouton)

-- une input
pannel_droit.addInput("inputTexte",pannel_droit.L*0.1,pannel_droit.H*0.3,pannel_droit.L*0.25,textFont:getHeight()+5,textFont,vert_pale)

-- un switch
pannel_droit.addSwitch("switch",pannel_droit.L*0.1,pannel_droit.H*0.4,58,60)
pannel_droit.elt["switch"].addSkin(switch)

-- un slide
pannel_droit.addSlider("slider",pannel_droit.L*0.1,pannel_droit.H*0.5,pannel_droit.L*0.25,textFont,1,5, 3,bleu_elec)

--une jauge
pannel_droit.addJauge("jauge",pannel_droit.L*0.1,pannel_droit.H*0.6,pannel_droit.L*0.2,50,100,bleu_elec,rouge)
   
scene_test.load = function()
  
end


scene_test.update = function(dt)
   pannel_flat.update(dt,mouse.x,mouse.y)
   pannel_skin.update(dt,mouse.x,mouse.y)
   pannel_droit.update(dt,mouse.x,mouse.y)
   -- quand on clic dans un bouton la souris change de couleur
   for _,elt in pairs(pannel_droit.elt) do
      if elt.type == "button" and elt.isIn(mouse.x,mouse.y) and love.mouse.isDown(1) then
         myCursor.setCursor("close")
      end
   end
   
   
   -- la jauge se rempli indefiniment
   pannel_droit.elt["jauge"].valeur = pannel_droit.elt["jauge"].valeur + 5*dt
   if pannel_droit.elt["jauge"].valeur >= pannel_droit.elt["jauge"].max then
      pannel_droit.elt["jauge"].valeur = 0
   end
end

scene_test.draw = function()
  pannel_flat.draw()
  pannel_skin.draw()
  pannel_droit.draw()
end

scene_test.mousepressed = function(px,py,pbutton)
   -- active l'input quand on clique dedans 
  if pannel_droit.elt["inputTexte"].isIn(px,py) and pbutton == 1 then
   pannel_droit.elt["inputTexte"].isActive = true
  end
  -- et la desactive quand on clique dehors
   if not(pannel_droit.elt["inputTexte"].isIn(px,py))  then
    pannel_droit.elt["inputTexte"].isActive = false
   end
end

scene_test.mousereleased = function(px,py,pbutton)
   -- clic dans le switch
  if pannel_droit.elt["switch"].isIn(px,py) then
   pannel_droit.elt["switch"].switch ()
   snd_clic_menu_1:play()
  end
  
  --clic dans le bouton flat declenche la musique menu
  if pannel_droit.elt["btflat"].isIn(px,py) then
      --music_man.stop()  
      -- le music manager permet de faire des transitions entre deux musiques
      -- si ambiance 1 est en cours d'écoute , il va s'estomper pour laisser place a la musique menu
      music_man.play("menu",0)
  end
   --clic dans le bouton skin declenche la musique ambiance1
  if pannel_droit.elt["btskin"].isIn(px,py) then
      music_man.stop()
      music_man.play("ambiance_1",0)
  end
end

scene_test.mousemoved = function(px,py,pdx,pdy)
 
end

function scene_test.keypressed(key)
   pannel_droit.elt["inputTexte"].updateKey(key)
   if key == "space" then
      camera.shake = true  
   end
end
function scene_test.focus(focus)
  
end
function scene_test.textinput(lettre)
  if pannel_droit.elt["inputTexte"].isActive then
    if pannel_droit.elt["inputTexte"].font:getWidth(pannel_droit.elt["inputTexte"].valeur ) < pannel_droit.elt["inputTexte"].L - pannel_droit.elt["inputTexte"].font:getWidth("A")  then
     pannel_droit.elt["inputTexte"].valeur = pannel_droit.elt["inputTexte"].valeur..lettre
    end
  end
end
function scene_test.quit()


end
return scene_test
