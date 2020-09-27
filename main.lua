require("player")
require("ball")
require("functions")

-- global variables
currentScreen = "menu"
player1 = newPlayer(1,"Joueur 1",0,0,20,80)
moveSpeed = 4
winner = ""
restartButton = {}
restartButton.X = love.graphics.getWidth()/2 - 250/2
restartButton.Y = love.graphics.getHeight() - 300
restartButton.width = 250
restartButton.height = 100

function love.load()  
  -- variables who needs love functions
  player2 = newPlayer(2, "Joueur 2",(love.graphics.getWidth() -20),0,20,80)
  ball = newBall((love.graphics.getWidth() / 2), (love.graphics.getHeight() / 2),15,15)
  love.graphics.setNewFont(32)
end

function love.update()
  if currentScreen == "menu" then

    if love.keyboard.isDown("f2") then
      currentScreen = "game"
    end

  elseif currentScreen == "game" then
    -- PLAYERS
    checkPlayerCollision(player1)
    checkPlayerCollision(player2)
    -- handle keypress for player 1
    handleKeypressPlayer(player1, "z", "s")
    -- handle keypress for player 2
    handleKeypressPlayer(player2, "up", "down")

    checkPlayerScore(player1)
    checkPlayerScore(player2)
    -- BALL
    -- ball mouvement
    ball.mouvement()
      -- ball collision :
    -- we want to change the direction of the ball compared to which side it hitted
    ball.collisionWithMap()
    --increment ballSpeed compared to time past
    ball.incrementSpeed()
    ball.collisionWithPlayer(player1)
    ball.collisionWithPlayer(player2)
  elseif currentScreen == "gameover" then

    if love.mouse.getX() > restartButton.X and love.mouse.getX() < restartButton.X + restartButton.width then
      if love.mouse.getY() > restartButton.Y and love.mouse.getY() < restartButton.Y + restartButton.height then
        if love.mouse.isDown("1") then
          print("okok")
          newGame()
        end
      end
    end

  end

end

function love.draw()
  
  if currentScreen == "menu" then
    love.graphics.print("Pong Game - f2 to enter game", 20, 30)

  elseif currentScreen == "game" then
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
  elseif currentScreen == "gameover" then

    love.graphics.print(winner.." won the game", 20, 30)

    love.graphics.rectangle("line",restartButton.X , restartButton.Y, restartButton.width, restartButton.height)
    love.graphics.print("new game", love.graphics.getWidth()/2 - 250/2 + 40 , love.graphics.getHeight() - 270)

  end

end
