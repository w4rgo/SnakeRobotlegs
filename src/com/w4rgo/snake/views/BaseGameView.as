package com.w4rgo.snake.views
{
import com.w4rgo.snake.configuration.Configuration;
import com.w4rgo.snake.events.GameEvent;
import com.w4rgo.snake.events.InputEvent;
import com.w4rgo.snake.utils.KeyboardListener;
import com.w4rgo.snake.utils.UiTools;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class BaseGameView extends Sprite
{
	private var keyboardListener : KeyboardListener;
	private var _scoreBoard : TextField;

	public function initScoreboard() : void
	{
		_scoreBoard = new TextField();
		_scoreBoard.autoSize = "left";
		_scoreBoard.background = true;
		_scoreBoard.border = true;
		_scoreBoard.x = Configuration.BOARD_SIZE_X + 10;
		_scoreBoard.y = Configuration.OFFSET_Y + 10;
		_scoreBoard.text = "0";
		addChild(_scoreBoard);
	}

	public function updateScoreboard(value : String) : void
	{
		_scoreBoard.text = value;
	}

	public function BaseGameView()
	{
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
	}

	private function onRemovedFromStage(event : Event) : void
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		keyboardListener.unload();
	}

	private function onAddedToStage(event : Event) : void
	{
		keyboardListener = new KeyboardListener(stage);
		keyboardListener.mapKey(37, moveLeft);
		keyboardListener.mapKey(38, moveUp);
		keyboardListener.mapKey(39, moveRight);
		keyboardListener.mapKey(40, moveDown);
	}

	private function moveUp() : void
	{
		dispatchEvent(new InputEvent(InputEvent.MOVE_UP));
	}

	private function moveDown() : void
	{
		dispatchEvent(new InputEvent(InputEvent.MOVE_DOWN));
	}

	private function moveLeft() : void
	{
		dispatchEvent(new InputEvent(InputEvent.MOVE_LEFT));
	}

	private function moveRight() : void
	{
		dispatchEvent(new InputEvent(InputEvent.MOVE_RIGHT));
	}

	public function showRestartOrBackButtons() : void
	{

		UiTools.createButton(this, Configuration.BOARD_SIZE_X + 10, Configuration.BOARD_SIZE_Y-Configuration.SQUARE_SIZE*6, restartGame, "Restart");

	}

	private function restartGame(event : MouseEvent) : void
	{

		dispatchEvent(new GameEvent(GameEvent.START_GAME));
	}

}
}
