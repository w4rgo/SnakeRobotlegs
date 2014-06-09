package com.w4rgo.snake.views
{
import com.w4rgo.snake.configuration.Configuration;
import com.w4rgo.snake.models.IDrawableGameObject;
import flash.display.Bitmap;

import flash.display.BitmapData;
import flash.geom.Rectangle;

import org.as3commons.collections.LinkedList;
import org.as3commons.collections.framework.IIterator;

public class GameViewBitmapData extends BaseGameView implements IGameView
{

	private var canvas: BitmapData;
	private var canvasBitmap : Bitmap;

	public function GameViewBitmapData()
	{
		super();
		canvas = new BitmapData(Configuration.BOARD_SIZE_X+Configuration.SQUARE_SIZE,Configuration.BOARD_SIZE_Y+Configuration.SQUARE_SIZE,false,Configuration.CANVAS_COLOR);
		canvasBitmap = new Bitmap();
		canvasBitmap.bitmapData=canvas;
		canvasBitmap.x=0;
		canvasBitmap.y=0;
		addChild(canvasBitmap);

	}


	public function paintObject(object : IDrawableGameObject) : void
	{
		//canvas.draw()
		//canvas.setPixel(object.x,object.y,object.color);
		var rect: Rectangle = new Rectangle(object.x,object.y,object.size,object.size);
		canvas.fillRect(rect,object.color);

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
		var rect: Rectangle = new Rectangle(0,0,Configuration.BOARD_SIZE_Y+Configuration.SQUARE_SIZE,Configuration.BOARD_SIZE_X+Configuration.SQUARE_SIZE);
		//canvas.fillRect(rect,object.color);
		canvas.fillRect(rect,Configuration.CANVAS_COLOR);
		canvasBitmap.bitmapData=canvas;
	}

}
}
