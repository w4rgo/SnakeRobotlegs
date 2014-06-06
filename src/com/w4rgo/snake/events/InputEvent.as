package com.w4rgo.snake.events
{

import flash.events.Event;


public class InputEvent extends Event
{

	public static const MOVE_UP : String = "InputEvent/moveUp";
	public static const MOVE_DOWN : String = "InputEvent/moveDown";
	public static const MOVE_LEFT : String = "InputEvent/moveLeft";
	public static const MOVE_RIGHT : String = "InputEvent/moveRight";


	public function InputEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
	{
		super(type, bubbles, cancelable);
		trace("MOVE EVENT: " + this.type);
	}


	override public function clone() : Event
	{
		return new InputEvent(type, bubbles, cancelable);
	}
}
}
