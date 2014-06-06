package com.w4rgo.snake.models
{
import com.w4rgo.snake.configuration.Configuration;

import org.as3commons.collections.LinkedList;

public class SnakeGameModel
{
	private var _boundaries : LinkedList;
	private var _fruits : LinkedList;
	private var _snakeOne : Snake;
	private var _gameOver:Boolean;
	private var _speed : int;


	public function SnakeGameModel()
	{

		_boundaries = new LinkedList();
		_fruits = new LinkedList();
		_snakeOne = new Snake( Configuration.START_X, Configuration.START_Y);
		_speed = Configuration.START_SPEED;
	}

	public function set gameOver(value : Boolean) : void
	{
		_gameOver = value;
	}

	public function get gameOver() : Boolean
	{
		return _gameOver;
	}

	public function incrementSpeed(value: int ) {
		_speed = _speed + value;
	}
	public function decrementSpeed(value: int ) {
		_speed = _speed - value;
	}
	public function get speed() : int
	{
		return _speed;
	}


	public function get boundaries() : LinkedList
	{
		return _boundaries;
	}

	public function get fruits() : LinkedList
	{
		return _fruits;
	}

	public function get snakeOne() : Snake
	{
		return _snakeOne;
	}
}
}
