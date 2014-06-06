package com.w4rgo.snake.views
{
public interface IMainView
{
	function show(view : String) : void;

	function changeEnabled(enabled : Boolean) : void;

	function removeCurrentView() : void;
}
}
