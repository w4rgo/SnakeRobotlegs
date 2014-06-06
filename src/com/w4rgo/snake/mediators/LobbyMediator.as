package com.w4rgo.snake.mediators {
import com.w4rgo.snake.events.GameEvent;
import com.w4rgo.snake.views.ILobbyView;

import robotlegs.bender.bundles.mvcs.Mediator;


public class LobbyMediator extends Mediator
{
    [Inject]
    public var view:ILobbyView;

    override public function initialize():void
    {
        trace("LOBBY MEDIATOR: INIT")
        // Redispatch an event from the view to the framework
        addViewListener(GameEvent.START_GAME, dispatch);

    }
}
}
