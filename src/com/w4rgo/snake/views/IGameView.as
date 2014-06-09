package com.w4rgo.snake.views
{
import com.w4rgo.snake.models.IDrawableGameObject;

import org.as3commons.collections.LinkedList;

public interface IGameView
{
	function initScoreboard():void;

	function updateScoreboard(value : String) : void;

	function paintObject(object : IDrawableGameObject) : void;

	function paintLinkedList(array : LinkedList):void;

	function clear():void;

	function showRestartOrBackButtons():void;
}
}
