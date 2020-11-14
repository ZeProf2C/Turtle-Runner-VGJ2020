function distance( x1, y1, x2, y2 )
	return math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
end

function collide(rect, pt)
	return pt.x > rect[1].x and pt.x < rect[2].x and pt.y > rect[1].y and pt.y < rect[3].y
end

function normalize(V)
	local n = math.sqrt(V.x^2 + V.y^2)
	V.x = V.x /n 
	V.y = V.y /n

end