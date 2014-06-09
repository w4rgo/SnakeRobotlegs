package com.w4rgo.snake.views {
import com.w4rgo.snake.configuration.Configuration;
import com.w4rgo.snake.configuration.Renderer;
import com.w4rgo.snake.events.GameEvent;
import com.w4rgo.snake.utils.UiTools;
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

public class LobbyView extends Sprite implements ILobbyView
{

    public function LobbyView() {


        createText();
       createButtons();

    }

	public function createText() : void
	{
		UiTools.createText(this, 50,75,"Snake Game!!");

	}

	public function createButtons() : void {
		UiTools.createButton(this,50,100,onStartDisplay,"Start (Display List)");
		UiTools.createButton(this,50,150,onStartGraphics,"Start (Graphics)");
		UiTools.createButton(this,50,200,onStartBitmapData,"Start (Bitmap Data)");
	}

	public function onStartDisplay(event : MouseEvent) : void
	{
		trace("START BUTTON CLICKED");
		Configuration.RENDERER= Renderer.DISPLAY_LIST;
		dispatchEvent(new GameEvent(GameEvent.START_GAME));
		//dispatchEvent(new ViewEvent(ViewEvent.SHOW, Views.GAME));
	}

	public function onStartBitmapData(event : MouseEvent) : void
	{
		trace("START BUTTON CLICKED");
		Configuration.RENDERER= Renderer.BITMAP_DATA;
		dispatchEvent(new GameEvent(GameEvent.START_GAME));
		//dispatchEvent(new ViewEvent(ViewEvent.SHOW, Views.GAME));
	}

	public function onStartGraphics(event : MouseEvent) : void
	{
		trace("START BUTTON CLICKED");
		Configuration.RENDERER= Renderer.GRAPHICS;
		dispatchEvent(new GameEvent(GameEvent.START_GAME));
		//dispatchEvent(new ViewEvent(ViewEvent.SHOW, Views.GAME));
	}


}
}

