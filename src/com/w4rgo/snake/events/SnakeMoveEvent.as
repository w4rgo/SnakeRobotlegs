package com.w4rgo.snake.events {
import com.w4rgo.snake.models.GameObject;

import flash.events.Event;


public class SnakeMoveEvent extends Event{

	public static const MOVE : String = "SnakeMoveEvent/move";

	private var _direction : String;


    public function SnakeMoveEvent(type:String,direction:String,bubbles:Boolean=false,cancelable:Boolean=false) {
        super(type, bubbles , cancelable);
		trace("SNAKE MOVE EVENT: " + type);
	    _direction= direction;


    }


	public function get direction() : String
	{
		return _direction;
	}

	public function set direction(value : String) : void
	{
		_direction = value;
	}

	override public function clone():Event {
        return new SnakeMoveEvent(type,direction,bubbles,cancelable);
    }
}
}
