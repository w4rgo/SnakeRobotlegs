package com.w4rgo.snake.views
{
import com.w4rgo.snake.configuration.Configuration;
import com.w4rgo.snake.configuration.Renderer;

import flash.display.Sprite;


public class MainView extends Sprite implements IMainView
{

	private var _currentView : Sprite;

	public function show(view : String) : void
	{

		removeCurrentView();

		switch (view)
		{
			case Views.LOBBY:
				_currentView = new LobbyView();
				break;
			case Views.GAME:

				switch(Configuration.RENDERER) {
					case Renderer.BITMAP_DATA:
						_currentView =new GameViewBitmapData();
						break;
					case Renderer.DISPLAY_LIST:
						_currentView =new GameViewDisplayList();
						break;
					case Renderer.GRAPHICS:
						_currentView =new GameViewGraphics();
						break;
				}
				break;
		}

		addChild(_currentView);

	}

	public function changeEnabled(enabled : Boolean) : void
	{

	}

	public function removeCurrentView() : void
	{
		if (_currentView)
		{
			removeChild(_currentView);
		}

	}

}
}
