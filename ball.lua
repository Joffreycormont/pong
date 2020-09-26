function newBall(positionX, positionY, width, height)
  
  ball = {}
  ball.positionX = positionX
  ball.positionY =  positionY
  ball.width = width
  ball.height = height
  ball.moveSpeedX = 1.5
  ball.moveSpeedY = 1.5
  ball.acceleration = 0.0009
  
  ball.mouvement = function ()
    ball.positionX = ball.positionX + ball.moveSpeedX
    ball.positionY = ball.positionY + ball.moveSpeedY
  end
  
  ball.incrementSpeed = function ()       
      if ball.moveSpeedX < 0 then
        ball.moveSpeedX = ball.moveSpeedX - ball.acceleration
      elseif ball.moveSpeedX > 0 then
        ball.moveSpeedX = ball.moveSpeedX + ball.acceleration
      elseif ball.moveSpeedY < 0 then
        ball.moveSpeedY = ball.moveSpeedY - ball.acceleration
      elseif ball.moveSpeedY > 0 then
        ball.moveSpeedY = ball.moveSpeedY + ball.acceleration
      end
      
  end
  
  
  ball.colisionWithMap = function ()
    -- if the ball hit bottom
    if ball.positionY > (love.graphics.getHeight() - ball.height) then
      ball.moveSpeedY = ball.moveSpeedY * -1
    end
    -- if the ball hit top side
    if ball.positionY < 0 then
      ball.moveSpeedY = ball.moveSpeedY * -1
    end
    -- if the ball hit right side
    if ball.positionX > (love.graphics.getWidth() - ball.width) then
      print("hit right")
      player1.score =  player1.score + 1
      restartRound()
    end
    -- if the ball hit left side
    if ball.positionX < 0 then
      print("hit left")
      player2.score =  player2.score + 1
      restartRound()
    end
  end
  
  ball.colisionWithPlayer = function (player)
    
    if player.id == 1 then
      --player 1 (left side)
      if ball.positionX <= (player.positionX + player.width) then
        if ((ball.positionY + ball.height) < player.positionY) == false  and (ball.positionY > (player.positionY + player.height) == false) then
          ball.positionX = player.positionX + player.width
          ball.moveSpeedX = ball.moveSpeedX * -1
        end
      end
      
    elseif player.id == 2 then
      -- player 2 (right side)
      if (ball.positionX + ball.width) >= player.positionX then
        if ((ball.positionY + ball.height) < player.positionY) == false  and (ball.positionY > (player.positionY + player.height) == false) then
          ball.positionX = player.positionX - ball.width
          ball.moveSpeedX = ball.moveSpeedX * -1
        end
      end      
    end
    
  end
  
  
  return ball
end
