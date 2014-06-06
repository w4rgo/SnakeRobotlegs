package com.w4rgo.snake.views
{
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
				_currentView = new GameView();
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
