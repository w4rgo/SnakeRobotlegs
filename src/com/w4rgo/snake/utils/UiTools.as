package com.w4rgo.snake.utils
{
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;

public class UiTools
{
	public static function createButton(context: Sprite,x: int , y: int,func:Function,text:String) : void
	{
		var btn = new SimpleButton();
		var bgRed : Shape = new Shape();
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
		txt.text = text;
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
		btn.x = x;
		btn.y = y;

		btn.addEventListener(MouseEvent.CLICK, func);
		context.addChild(btn);

	}


	public static function createText(context: Sprite,x:int , y : int , text: String) : void {
		var title = new TextField();
		title.autoSize = "left";
		title.background = true;
		title.border = true;
		title.x = x;
		title.y = y;
		title.text = text;
		context.addChild(title);
	}
}
}
