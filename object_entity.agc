// File: object_entity.agc
// Created: 24-04-13

#include "collision_utils.agc"

type Entity
	position as Vector2
	size as Vector2
	spriteID as integer
	rCollider as RectangleCollider
endtype

function MoveEntity(ent ref as Entity, direction as Vector2)
	ent.position.x = ent.position.x + direction.x
	ent.position.y = ent.position.y + direction.y
endfunction

// Syncs the sprite with the object
function UpdateEntity(ent ref as Entity)
	if(ent.spriteID <> 0)
		SetSpriteSize(ent.spriteID, ent.size.x, ent.size.y)
		SetSpritePosition(ent.spriteID, ent.position.x, ent.position.y)
		DrawBox(ent.position.x, ent.position.y, ent.position.x + ent.size.x, ent.position.y + ent.size.y, MakeColor(255, 255, 255), MakeColor(255, 255, 255), MakeColor(255, 255, 255), MakeColor(255, 255, 255), false)
	endif
endfunction

function DestroyEntity(ent ref as Entity)
	DeleteSprite(ent.spriteID)
	ent.spriteID = 0
endfunction

function CreateEntity(posX as float, posY as float, width as float, height as float, imageID as integer)
	ent as Entity
	ent.position.x = posX
	ent.position.y = posY
	ent.size.x = width
	ent.size.y = height
	ent.spriteID = CreateSprite(imageID)
	ent.rCollider.offset.x = 0.0
	ent.rCollider.offset.y = 0.0
	ent.rCollider.size.x = ent.size.x
	ent.rCollider.size.y = ent.size.y
endfunction ent