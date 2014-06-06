package com.w4rgo.snake.mediators {
import com.w4rgo.snake.events.GameEvent;
import com.w4rgo.snake.events.InputEvent;
import com.w4rgo.snake.events.SnakeEvent;
import com.w4rgo.snake.events.SnakeMoveEvent;
import com.w4rgo.snake.models.SnakeDirections;
import com.w4rgo.snake.models.SnakeGameModel;
import com.w4rgo.snake.views.IGameView;

import robotlegs.bender.bundles.mvcs.Mediator;


public class GameMediator extends Mediator
{
    [Inject]
    public var view:IGameView;

    [Inject]
    public var snakeGameModel:SnakeGameModel;

    override public function initialize():void
    {
        trace("GAME MEDIATOR: INIT");
        // Redispatch an event from the view to the framework
        addContextListener(GameEvent.GAME_STARTED,onGameStarted,GameEvent);
	    addContextListener(SnakeEvent.SNAKE_MOVED,onSnakeMoved,SnakeEvent);


	   // addViewListener(GameEvent.START_GAME, dispatch);
	    addViewListener(InputEvent.MOVE_UP,onMoveUp,InputEvent);
	    addViewListener(InputEvent.MOVE_DOWN,onMoveDown,InputEvent);
	    addViewListener(InputEvent.MOVE_LEFT,onMoveLeft,InputEvent);
	    addViewListener(InputEvent.MOVE_RIGHT,onMoveRight,InputEvent);
    }

	private function onMoveUp(event:InputEvent) : void
	{
		trace("GAME MEDIATOR: MOVE UP")
		dispatch(new SnakeMoveEvent(SnakeMoveEvent.MOVE,SnakeDirections.NORTH));
	}
	private function onMoveRight(event:InputEvent) : void
	{
		dispatch(new SnakeMoveEvent(SnakeMoveEvent.MOVE,SnakeDirections.EAST));
	}
	private function onMoveLeft(event:InputEvent) : void
	{
		dispatch(new SnakeMoveEvent(SnakeMoveEvent.MOVE,SnakeDirections.WEST));
	}
	private function onMoveDown(event:InputEvent) : void
	{
		dispatch(new SnakeMoveEvent(SnakeMoveEvent.MOVE,SnakeDirections.SOUTH));
	}
    private function onGameStarted(event : GameEvent):void {
        trace("GAME MEDIATOR ON STARTED");

        view.clear();
        view.paintLinkedList(snakeGameModel.boundaries);
        //contextView
    }

	private function onSnakeMoved(event: SnakeEvent):void {


		view.clear();
		view.paintLinkedList(snakeGameModel.boundaries);
		view.paintLinkedList(snakeGameModel.snakeOne.snakeBody);
		view.paintLinkedList(snakeGameModel.fruits);
		var gameover: String = "";
		if (snakeGameModel.gameOver) {
			gameover= "GAME OVER: ";
		}
		view.updateScoreboard(gameover+snakeGameModel.snakeOne.snakeScore.toString());
	}
}
}
