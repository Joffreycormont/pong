function restartRound ()
  ball.positionX = love.graphics.getWidth() /2 + (ball.width/2)
  ball.positionY = love.graphics.getHeight() / 2
  
  ball.moveSpeedX = 1.5
  ball.moveSpeedY = 1.5
end


function checkPlayerColision (player)
  if player.positionY < 0 then
    player.positionY = 1
  elseif player.positionY > (love.graphics.getHeight() - player.height) then
    player.positionY = love.graphics.getHeight() - player.height
  end
end

function handleKeypressPlayer(player, keyUp, KeyDown)
  if love.keyboard.isDown(keyUp) then
    player.positionY = player.positionY - moveSpeed
  elseif love.keyboard.isDown(KeyDown) then
    player.positionY = player.positionY + moveSpeed
  end
end