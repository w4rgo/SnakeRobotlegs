package com.w4rgo.snake.events
{
import flash.events.Event;

public class ViewEvent extends Event
{
	public static const SHOW : String = "show";

	private var _view : String;

	public function get view() : String
	{
		return _view;
	}

	public function ViewEvent(type : String, view : String)
	{
		trace("VIEW EVENT: " + type);
		super(type);

		_view = view;
	}

	override public function clone() : Event
	{
		return new ViewEvent(type, _view);
	}
}
}
