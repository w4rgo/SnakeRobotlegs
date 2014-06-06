package com.w4rgo.snake.commands
{
import com.w4rgo.snake.configuration.Configuration;
import com.w4rgo.snake.configuration.Configuration;
import com.w4rgo.snake.events.SnakeEvent;
import com.w4rgo.snake.models.IGameObject;
import com.w4rgo.snake.models.Snake;
import com.w4rgo.snake.models.SnakeDirections;
import com.w4rgo.snake.models.SnakeGameModel;
import com.w4rgo.snake.models.factories.GameObjectType;
import com.w4rgo.snake.models.factories.IGameObjectFactory;

import flash.events.IEventDispatcher;

import org.as3commons.collections.framework.IIterator;


public class SnakeAdvanceCommand
{

	[Inject]
	public var event : SnakeEvent;

	[Inject]
	public var gameObjectFactory : IGameObjectFactory;

	[Inject]
	public var snakeGameModel : SnakeGameModel;


	[Inject]
	public var eventDispatcher : IEventDispatcher;

	public function execute() : void
	{
		//trace("SNAKE ADVANCE COMMAND");


		advanceSnake();
		generateFruits();
		checkObjectCollisions();

		eventDispatcher.dispatchEvent(new SnakeEvent(SnakeEvent.SNAKE_MOVED));
	}

	private function advanceSnake() : void
	{

		var snake : Snake = snakeGameModel.snakeOne;
		switch (snake.snakeDir)
		{
			case SnakeDirections.SOUTH :

				snake.snakeY = snake.snakeY + Configuration.SQUARE_SIZE;
				break;
			case SnakeDirections.NORTH:
				snake.snakeY = snake.snakeY - Configuration.SQUARE_SIZE;
				break;
			case SnakeDirections.WEST:
				snake.snakeX = snake.snakeX - Configuration.SQUARE_SIZE;
				break;
			case SnakeDirections.EAST:
				snake.snakeX = snake.snakeX + Configuration.SQUARE_SIZE;
				break;
		}

		var part : IGameObject;
		if (snake.snakeBody.size > snake.snakeTotalSize)
		{
			part = snake.snakeBody.first;
			snake.snakeBody.removeFirst();
			part.move(snake.snakeX, snake.snakeY);
			snake.snakeBody.add(part);

		}
		else
		{

			part = gameObjectFactory.createGameObject(GameObjectType.SNAKE_PART);
			part.move(snake.snakeX, snake.snakeY);
			snake.snakeBody.add(part);
		}
	}

	private function randomizeCoordX() : int
	{

		var max : int = Configuration.BOARD_SIZE_X + Configuration.OFFSET_X - (Configuration.SQUARE_SIZE);
		var min : int = Configuration.OFFSET_X + (Configuration.SQUARE_SIZE);
		var num : int = (Math.floor((Math.random() * (max - min) / Configuration.SQUARE_SIZE))) * Configuration.SQUARE_SIZE + min;
		return num;

	}


	private function randomizeCoordY() : int
	{

		var max : int = Configuration.BOARD_SIZE_Y + Configuration.OFFSET_Y - (Configuration.SQUARE_SIZE);
		var min : int = Configuration.OFFSET_Y + (Configuration.SQUARE_SIZE);
		var num : int = (Math.floor((Math.random() * (max - min) / Configuration.SQUARE_SIZE))) * Configuration.SQUARE_SIZE + min;
		return num;

	}

	private function generateFruits() : void
	{
		//  var fruit:Fruit = new Fruit(squareSize,randomizeCoordX(),randomizeCoordY());

		if (snakeGameModel.fruits.size == 0)
		{
			var gameObject : IGameObject = gameObjectFactory.createGameObject(GameObjectType.FRUIT);
			gameObject.move(randomizeCoordX(), randomizeCoordY());

			snakeGameModel.fruits.add(gameObject);
		}


	}

	private function checkObjectCollisions():void {
		//Check collision with itself
		if (snakeGameModel.snakeOne.checkCollisions()) {
			//playerOneScore.text = "GAME OVER, Points: " + snakeGameModel.snakeOne.snakeScore;
			snakeGameModel.gameOver = true;
		}
		//checking collisions with the fruits
		var iter:IIterator = snakeGameModel.fruits.iterator();
		while (iter.hasNext()) {


			var object:IGameObject = iter.next();
			if (object.collides(snakeGameModel.snakeOne.getHead())) {
				// dispatchEvent(new ObjectEatenEvent(ObjectEatenEvent.OBJECT_EATEN, object));
				objectEaten(object);
			}
		}
		//check collisions with the boundaries
		var iter:IIterator = snakeGameModel.boundaries.iterator();
		while (iter.hasNext()) {
			var object:IGameObject = iter.next();
			if (object.collides(snakeGameModel.snakeOne.getHead())) {
				//  dispatchEvent(new Event(SnakeEvents.WALL_COLLISION));
				wallCollision();
			}
		}

	}

	private function wallCollision():void {
		//playerOneScore.text = "GAME OVER, Points: " + snakeGameModel.snakeOne.snakeScore;
		//snakeOne.getHead().setHitColor();
		snakeGameModel.gameOver = true;

	}
	private function  objectEaten(object :IGameObject) : void {



		//  var object:GameObject = object;

		snakeGameModel.snakeOne.snakeScore = snakeGameModel.snakeOne.snakeScore + object.scoreValue();

		//playerOneScore.text = snakeOne.snakeScore.toString();
		snakeGameModel.snakeOne.snakeTotalSize += 1;
		//generateFruits();
		if (snakeGameModel.speed > 30) {
			snakeGameModel.decrementSpeed(Configuration.SPEED_DECREMENT);
		}

		snakeGameModel.fruits.remove(object);
	}


}
}
