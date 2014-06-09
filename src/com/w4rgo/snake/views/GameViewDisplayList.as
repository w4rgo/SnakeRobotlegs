package com.w4rgo.snake.views
{

import com.w4rgo.snake.models.IDrawableGameObject;

import flash.display.Shape;

import org.as3commons.collections.LinkedList;
import org.as3commons.collections.framework.IIterator;

public class GameViewDisplayList extends BaseGameView implements IGameView
{
	private var currentShapes : LinkedList;

	public function GameViewDisplayList()
	{
		super();
		currentShapes = new LinkedList();
	}


	public function paintObject(object : IDrawableGameObject) : void
	{
		var shape : Shape = new Shape();


		shape.graphics.lineStyle(1, 0x000000);
		shape.graphics.beginFill(object.color);
		shape.graphics.drawRect(object.x, object.y, object.size, object.size);
		shape.graphics.endFill();

		currentShapes.add(shape);
		addChild(shape);
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

		var iterator : IIterator = currentShapes.iterator();
		while (iterator.hasNext())
		{
			var shape : Shape =iterator.next();


			//removeChild(shape);

			currentShapes.remove(shape);
			removeChild(shape);
			shape = null;


		}

	}
}
}
