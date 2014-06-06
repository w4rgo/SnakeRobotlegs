package com.w4rgo.snake.events
{
import flash.events.Event;

public class SnakeEvent extends Event
{


	public static const SNAKE_ADVANCE : String = "snakeAdvance";
	public static const SNAKE_MOVED : String = "snakeMoved";

	public function SnakeEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
	{
		super(type, bubbles, cancelable);
		//trace("SNAKE EVENT: " + this.type);
	}


	override public function clone() : Event
	{
		return new SnakeEvent(type, bubbles, cancelable);
	}

}
}
