package com.w4rgo.snake.views
{
import flash.display.Sprite;
import flash.events.MouseEvent;

public interface ILobbyView
{
	function createText() : void;

	function createButton() : void;

	function onStartButtonClicked(event : MouseEvent) : void;
}
}
