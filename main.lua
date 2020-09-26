require("player")
require("ball")
require("functions")

-- global variables
player1 = newPlayer(1,0,0,20,80)
moveSpeed = 4

function love.load()  
  -- variables who needs love functions
  player2 = newPlayer(2,(love.graphics.getWidth() -20),0,20,80)
  ball = newBall((love.graphics.getWidth() / 2), (love.graphics.getHeight() / 2),15,15)
  love.graphics.setNewFont(32)
end

function love.update()
  -- PLAYERS
  -- check collision for players (top/bottom of the map)
  checkPlayerColision(player1)
  checkPlayerColision(player2)
  -- handle keypress for player 1
  handleKeypressPlayer(player1, "z", "s")
  -- handle keypress for player 2
  handleKeypressPlayer(player2, "up", "down")
  -- BALL
  -- ball mouvement
  ball.mouvement()
    -- ball colision :
  -- we want to change the direction of the ball compared to which side it hitted
  ball.colisionWithMap()
  --increment ballSpeed compared to time past
  ball.incrementSpeed()
  ball.colisionWithPlayer(player1)
  ball.colisionWithPlayer(player2)
end

function love.draw()
  -- draw player 1 (left)
  love.graphics.rectangle("fill", player1.positionX, player1.positionY, player1.width, player1.height)
  -- draw player 2 (right)
  love.graphics.rectangle("fill", player2.positionX, player2.positionY, player2.width, player2.height)
  -- separation
  love.graphics.rectangle("fill", ((love.graphics.getWidth() / 2) - 2.5), 1, 5, love.graphics.getHeight())
  -- draw ball
  love.graphics.rectangle("fill", ball.positionX, (ball.positionY - (ball.height / 2) ), ball.width, ball.height)
  
  --score player 1
  love.graphics.print(player1.score, ((love.graphics.getWidth() / 2)/2), 30)
  --score player 2
  love.graphics.print(player2.score, (love.graphics.getWidth() - (love.graphics.getWidth()/4) ), 30)
end
