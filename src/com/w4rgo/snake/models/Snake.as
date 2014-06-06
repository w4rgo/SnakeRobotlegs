package com.w4rgo.snake.models
{

import com.w4rgo.snake.models.factories.IGameObjectFactory;

import org.as3commons.collections.LinkedList;
import org.as3commons.collections.framework.IIterator;

public class Snake
{

	[Inject]
	public var gameObjectFactory : IGameObjectFactory;

	private var _snakeDir : String = SnakeDirections.SOUTH;
	private var _snakeY : int = 0;
	private var _snakeX : int = 0;
	private var _snakeTotalSize : int = 4;

	private var _snakeBody : LinkedList;
	private var _snakeScore : int = 0;


	public function Snake(startX : int, startY : int)
	{
		_snakeY = startY;
		_snakeX = startX;

		_snakeBody = new LinkedList();
	}


	public function set snakeDir(value : String) : void
	{
		_snakeDir = value;
	}

	public function set snakeY(value : int) : void
	{
		_snakeY = value;
	}

	public function set snakeX(value : int) : void
	{
		_snakeX = value;
	}

	public function get snakeDir() : String
	{
		return _snakeDir;
	}

	public function get snakeY() : int
	{
		return _snakeY;
	}

	public function get snakeX() : int
	{
		return _snakeX;
	}

	public function get snakeBody() : LinkedList
	{
		return _snakeBody;
	}

	public function get snakeTotalSize() : int
	{
		return _snakeTotalSize;
	}

	public function set snakeTotalSize(value : int) : void
	{
		_snakeTotalSize = value;
	}

	public function getHead() : IGameObject
	{
		return _snakeBody.last;
	}

	public function get snakeScore() : int
	{
		return _snakeScore;
	}

	public function set snakeScore(value : int) : void
	{
		_snakeScore = value;
	}


	public function checkCollisions() : Boolean
	{
		var result : Boolean = false;
		var iter : IIterator = _snakeBody.iterator();
		while (iter.hasNext())
		{
			var part : IGameObject = iter.next();

			var innerIter : IIterator = _snakeBody.iterator();
			while (innerIter.hasNext())
			{
				var part2 : IGameObject = innerIter.next();

				if (part.collides(part2))
				{

					result = true;
				}
			}
		}
		return result;
	}


	public function moveSnakeDown() : void
	{

		if (_snakeDir != SnakeDirections.NORTH && _snakeDir != SnakeDirections.SOUTH)
		{

			_snakeDir = SnakeDirections.SOUTH;
		}


	}

	public function moveSnakeLeft() : void
	{
		trace("MOVE SNAKE LEFT")
		if (_snakeDir != SnakeDirections.EAST && _snakeDir != SnakeDirections.WEST)
		{
			_snakeDir = SnakeDirections.WEST;
		}

	}

	public function moveSnakeRight() : void
	{
		if (_snakeDir != SnakeDirections.WEST && _snakeDir != SnakeDirections.EAST)
		{
			_snakeDir = SnakeDirections.EAST;
		}

	}

	public function moveSnakeUp() : void
	{

		if (_snakeDir != SnakeDirections.SOUTH && _snakeDir != SnakeDirections.NORTH)
		{
			_snakeDir = SnakeDirections.NORTH;
		}
	}


}
}
