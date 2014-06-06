package com.w4rgo.snake.mediators {
import com.w4rgo.snake.events.ViewEvent;
import com.w4rgo.snake.views.IMainView;
import com.w4rgo.snake.views.Views;

import robotlegs.bender.bundles.mvcs.Mediator;

import robotlegs.bender.extensions.contextView.ContextView;

public class MainMediator extends Mediator{

    [Inject]
    public var contextView:ContextView;

    [Inject]
    public var view:IMainView;

    override public function initialize():void
    {
        trace("MAIN MEDIATOR: INIT");
        // Redispatch an event from the view to the framework

	    addContextListener(ViewEvent.SHOW, onShowView, ViewEvent);

	    eventDispatcher.dispatchEvent(new ViewEvent(ViewEvent.SHOW, Views.LOBBY));

    }

	private function onShowView(event : ViewEvent) : void
	{
		trace("MAIN MEDIATOR: VIEW EVENT SHOW");
		view.show(event.view);
	}
}
}
