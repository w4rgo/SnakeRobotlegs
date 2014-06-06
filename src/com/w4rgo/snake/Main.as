package com.w4rgo.snake {
import com.w4rgo.snake.configuration.SnakeConfig;
import com.w4rgo.snake.events.ViewEvent;
import com.w4rgo.snake.views.MainView;
import com.w4rgo.snake.views.Views;

import flash.display.Sprite;

import robotlegs.bender.bundles.mvcs.MVCSBundle;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.impl.Context;


public class Main extends Sprite {

    private var _context:Context;

	private var _mainView : MainView;

    public function Main() {
        _context = new Context();
        _context.install(MVCSBundle)
            .configure(new ContextView(this),
                SnakeConfig);

	    initView();

    }

	private function initView() : void
	{
		_mainView = new MainView();
		//_mainView.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		addChild(_mainView);



	}
}
}
