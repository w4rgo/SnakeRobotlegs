package com.w4rgo.snake.views {
import com.w4rgo.snake.events.GameEvent;
import com.w4rgo.snake.events.ViewEvent;

import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;

public class LobbyView extends Sprite implements ILobbyView
{
    private var title:TextField;
    private var btn:SimpleButton;

    public function LobbyView() {


        createText();
        createButton();


    }

	public function createText() : void
	{
		title = new TextField();
		title.autoSize = "left";
		title.background = true;
		title.border = true;
		title.x = 50;
		title.y = 75;
		title.text = "SNAKE GAME!!";
		addChild(title);

	}

	public function createButton() : void
	{
		btn = new SimpleButton();
		var bgRed : Shape = new Shape()
		bgRed.graphics.beginFill(0xFF0000);
		bgRed.graphics.drawRect(0, 0, 200, 30);
		bgRed.graphics.endFill();

		var bgBlack : Sprite = new Sprite();
		bgBlack.graphics.beginFill(0x000000);
		bgBlack.graphics.drawRect(0, 0, 200, 30);
		bgBlack.graphics.endFill();
		// [Embed(source="/com/w4rgo/snake/assets/start_button.png")]
		// var buttonImage: Class;
		//var image : Bitmap = new buttonImage();

		var tf : TextFormat = new TextFormat();
		tf.color = 0xFFFFFF;
		tf.font = "Verdana";
		tf.size = 17;
		tf.align = "center";

		var txt : TextField = new TextField();
		txt.text = "Start game!";
		txt.x = 0;
		txt.y = 0;
		txt.width = bgRed.width;
		txt.height = bgRed.height;
		txt.setTextFormat(tf);

		var mc : MovieClip = new MovieClip();
		mc.addChild(bgRed);
		mc.addChild(txt);

		btn.upState = mc;
		btn.overState = bgBlack;
		btn.downState = btn.upState;
		btn.hitTestState = btn.upState;
		btn.x = 50;
		btn.y = 100;

		btn.addEventListener(MouseEvent.CLICK, onStartButtonClicked);
		addChild(btn);

	}

	public function onStartButtonClicked(event : MouseEvent) : void
	{
		trace("START BUTTON CLICKED");

		dispatchEvent(new GameEvent(GameEvent.START_GAME));
		//dispatchEvent(new ViewEvent(ViewEvent.SHOW, Views.GAME));
	}
}
}

