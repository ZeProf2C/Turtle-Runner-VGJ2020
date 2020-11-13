--require ("utils/vecteur2")

function createClassicCursor( )
    local cursor ={}
        cursor.current = nil 
        cursor.cursors = {}
        cursor.cursors["hand"] = love.mouse.getSystemCursor("hand")

        cursor.addCursor = function(p_key, p_path)
            cursor.cursors[p_key] = love.mouse.newCursor(p_path, 0, 0)
        end

        cursor.setCursor=function(p_key)
            cursor.current = p_key
            love.mouse.setCursor(cursor.cursors[p_key])
        end

    return cursor
end

--============================================================================


function createSmoothyCursor(p_fillColor,p_strokeColor)

    local function newNode(p_x,p_y,p_r)
        local node = {}
  
            node.pos = newVector(p_x,p_y)
            
            node.R = p_r
            node.v = vector0
            node.a = vector0
    
            node.applyForce = function(pF)
                node.a = node.a + pF
            end
        
            node.move = function(dt)
                node.v = node.v + dt * node.a
                node.pos = node.pos + dt * node.v
                node.a = vector0
            end
    
            node.draw=function(p_rayon)
                love.graphics.circle("fill",node.pos.x,node.pos.y,p_rayon)
            end
    
            
        return node
    end

    
    local cursor = {}
        cursor.N = 10
        cursor.R = 8
        cursor.color = p_fillColor
        cursor.colorContour = p_strokeColor
        cursor.pos = newVector(love.mouse.getX(), love.mouse.getY() )
        cursor.list = {}
        table.insert(cursor.list,newNode(love.mouse.getX(), love.mouse.getY(),cursor.R ))
        for k = 2 , cursor.N do 
          table.insert(cursor.list,newNode(love.mouse.getX()+k, love.mouse.getY()+k,cursor.R*(cursor.N - k+1)/cursor.N ))
        end

        love.mouse.setVisible(false)

        cursor.changeColor=function(p_fillColor, p_strokeColor)
            cursor.color = p_fillColor
            cursor.colorContour = p_strokeColor
        end
        
        cursor.update=function(dt)
            cursor.pos = newVector(love.mouse.getX(), love.mouse.getY() )
            cursor.list[1].pos = cursor.pos
            for k = 2 , cursor.N do 
                local ecart = cursor.list[k-1].pos - cursor.list[k].pos 
                cursor.list[k].applyForce(1*ecart - 1*cursor.list[k].v)
                
                if ecart.norm() > 1.3*cursor.list[k-1].R then 
                    ecart.normalize()
                    cursor.list[k].pos = cursor.list[k-1].pos - ecart * 1.3*cursor.list[k-1].R
                else 
                    ecart.normalize()
                    cursor.list[k].pos = cursor.list[k-1].pos - ecart * cursor.list[k-1].R
                end
                cursor.list[k].move(dt)
            end
        end
        
        

        cursor.draw= function()
            love.graphics.setColor(cursor.colorContour)
            for k =1, cursor.N do 
                cursor.list[k].draw(cursor.list[k].R+3)
            end
            love.graphics.setColor(cursor.color)
            for k =1, cursor.N do 
                cursor.list[k].draw(cursor.list[k].R)
            end

        end


    return cursor
end
