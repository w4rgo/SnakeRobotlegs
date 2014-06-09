package com.w4rgo.snake.views
{
import com.w4rgo.snake.models.IDrawableGameObject;

import org.as3commons.collections.LinkedList;
import org.as3commons.collections.framework.IIterator;


public class GameViewGraphics extends BaseGameView implements IGameView
{


	public function GameViewGraphics()
	{
		super();
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




}
}
