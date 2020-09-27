function newPlayer(id, name, positionX, positionY, width, height)
  
  local player = {}
  player.id = id
  player.name = name
  player.positionX = positionX
  player.positionY =  positionY
  player.width = width
  player.height = height
  player.score = 0
  return player
end