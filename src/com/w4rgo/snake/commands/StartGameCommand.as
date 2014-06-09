package com.w4rgo.snake.commands
{
import com.w4rgo.snake.configuration.Configuration;
import com.w4rgo.snake.events.GameEvent;
import com.w4rgo.snake.events.SnakeEvent;
import com.w4rgo.snake.events.ViewEvent;
import com.w4rgo.snake.models.IGameObject;
import com.w4rgo.snake.models.SnakeGameModel;
import com.w4rgo.snake.models.factories.GameObjectType;
import com.w4rgo.snake.models.factories.IGameObjectFactory;
import com.w4rgo.snake.views.Views;

import flash.events.IEventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Timer;


public class StartGameCommand
{

	[Inject]
	public var event : GameEvent;

	[Inject]
	public var gameObjectFactory : IGameObjectFactory;

	[Inject]
	public var snakeGameModel : SnakeGameModel;


	[Inject]
	public var eventDispatcher : IEventDispatcher;

	private var snakeTimer : Timer;

	public function execute() : void
	{
		trace("START GAME COMMAND");
		initGame();
		generateBoundaries();
		startTimer();
		eventDispatcher.dispatchEvent(new ViewEvent(ViewEvent.SHOW, Views.GAME));
		eventDispatcher.dispatchEvent(new GameEvent(GameEvent.GAME_STARTED));
	}

	private function initGame()
	{
		snakeGameModel.resetSnakeModel();
	}

	private function startTimer() : void
	{
		snakeTimer = new Timer(snakeGameModel.speed, 0);
		snakeTimer.start();
		snakeTimer.addEventListener(TimerEvent.TIMER, ticker);
	}

	private function ticker(event : TimerEvent) : void
	{
		if (!snakeGameModel.gameOver)
		{

			eventDispatcher.dispatchEvent(new SnakeEvent(SnakeEvent.SNAKE_ADVANCE));
		}
		else
		{
			snakeTimer.stop();
			snakeTimer.removeEventListener(TimerEvent.TIMER, ticker);
		}
	}


	private function generateBoundaries() : void
	{
		var lenght : int = Configuration.BOARD_SIZE_X;
		var height : int = Configuration.BOARD_SIZE_Y;

		for (var i : int = 0; i < lenght; i++)
		{


			var wall : IGameObject = gameObjectFactory.createGameObject(GameObjectType.WALL);
			wall.move(i, 0);// + Configuration.OFFSET_Y);
			snakeGameModel.boundaries.add(wall);

			wall = gameObjectFactory.createGameObject(GameObjectType.WALL);
			wall.move(i, height);// + Configuration.OFFSET_Y);
			snakeGameModel.boundaries.add(wall);

		}

		for (i = 0 /*+ Configuration.OFFSET_Y*/; i < height /*+ Configuration.OFFSET_Y*/; i++)
		{

			wall = gameObjectFactory.createGameObject(GameObjectType.WALL);
			wall.move(0, i);
			snakeGameModel.boundaries.add(wall);

			wall = gameObjectFactory.createGameObject(GameObjectType.WALL);
			wall.move(lenght, i);
			snakeGameModel.boundaries.add(wall);

		}
	}


}
}
