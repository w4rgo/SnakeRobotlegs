package com.w4rgo.snake.views
{
import com.w4rgo.snake.configuration.Configuration;
import com.w4rgo.snake.events.InputEvent;
import com.w4rgo.snake.models.IDrawableGameObject;
import com.w4rgo.snake.utils.KeyboardListener;

import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;

import org.as3commons.collections.LinkedList;
import org.as3commons.collections.framework.IIterator;


public class GameView extends Sprite implements IGameView
{
	private var _scoreBoard : TextField;
	private var keyboardListener : KeyboardListener;

	public function GameView()
	{

		initScoreboard();
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
		_scoreBoard.text=value;
	}
	public function paint(array : Vector.<IDrawableGameObject>) : void
	{

		for each (var object : IDrawableGameObject in array)
		{
			paintObject(object);
		}
	}

	public function paintObject(object : IDrawableGameObject) : void
	{
		this.graphics.lineStyle(1, 0x000000);
		this.graphics.beginFill(object.color);
		this.graphics.drawRect(object.x, object.y, object.size, object.size);
		this.graphics.endFill();
	}

	public function paintLinkedList(array : LinkedList) : void
	{

		var iterator : IIterator = array.iterator();
		while (iterator.hasNext())
		{
			var object : IDrawableGameObject = iterator.next();
			paintObject(object);
		}
	}

	public function clear() : void
	{
		graphics.clear();
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



}
}
