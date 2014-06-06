package com.w4rgo.snake.commands
{
import com.w4rgo.snake.events.SnakeMoveEvent;
import com.w4rgo.snake.models.SnakeDirections;
import com.w4rgo.snake.models.SnakeGameModel;
import com.w4rgo.snake.models.factories.IGameObjectFactory;

import flash.events.IEventDispatcher;


public class SnakeMoveCommand
{

	[Inject]
	public var event : SnakeMoveEvent;

	[Inject]
	public var gameObjectFactory : IGameObjectFactory;

	[Inject]
	public var snakeGameModel : SnakeGameModel;


	[Inject]
	public var eventDispatcher : IEventDispatcher;

	public function execute() : void
	{

		trace("SNAKE MOVE COMMAND");
		switch (event.direction) {

			case SnakeDirections.NORTH:
				snakeGameModel.snakeOne.moveSnakeUp();
				break;
			case SnakeDirections.SOUTH:
				snakeGameModel.snakeOne.moveSnakeDown();
				break;
			case SnakeDirections.WEST:
				snakeGameModel.snakeOne.moveSnakeLeft();
				break;
			case SnakeDirections.EAST:
				snakeGameModel.snakeOne.moveSnakeRight();
				break;

		}

		trace(snakeGameModel.snakeOne.snakeDir);

	}



}
}
