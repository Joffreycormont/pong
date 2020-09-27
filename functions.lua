function newGame()
  player1.positionY = 0
  player1.score = 0
  player2.positionY = 0
  player2.score = 0
  currentScreen = "game"
  restartRound()
end

function restartRound ()
  ball.positionX = love.graphics.getWidth() /2 + (ball.width/2)
  ball.positionY = love.graphics.getHeight() / 2
  
  ball.moveSpeedX = 1.5
  ball.moveSpeedY = 1.5
end


function checkPlayerCollision (player)
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

function checkPlayerScore(player)
  if player.score == 2 then
    currentScreen = "gameover"
    winner = player.name
  end
end
