package com.w4rgo.snake.configuration
{
import com.w4rgo.snake.commands.SnakeAdvanceCommand;
import com.w4rgo.snake.commands.SnakeMoveCommand;
import com.w4rgo.snake.commands.StartGameCommand;
import com.w4rgo.snake.events.GameEvent;
import com.w4rgo.snake.events.SnakeEvent;
import com.w4rgo.snake.events.SnakeMoveEvent;
import com.w4rgo.snake.mediators.GameMediator;

import com.w4rgo.snake.mediators.LobbyMediator;
import com.w4rgo.snake.mediators.MainMediator;
import com.w4rgo.snake.models.Snake;
import com.w4rgo.snake.models.SnakeGameModel;
import com.w4rgo.snake.models.factories.GameObjectFactory;
import com.w4rgo.snake.models.factories.IGameObjectFactory;
import com.w4rgo.snake.utils.Renderer;
import com.w4rgo.snake.views.IGameView;
import com.w4rgo.snake.views.ILobbyView;
import com.w4rgo.snake.views.IMainView;


import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IInjector;

public class SnakeConfig //implements IConfig
{
	[Inject]
	public var injector : IInjector;

	[Inject]
	public var mediatorMap : IMediatorMap;

	[Inject]
	public var commandMap : IEventCommandMap;

	[Inject]
	public var contextView : ContextView;

	[PostConstruct]
	public function initialize() : void//configure():void
	{
		// Map UserModel as a context enforced singleton
		injector.map(SnakeGameModel).asSingleton();
		injector.map(Renderer).asSingleton();
		injector.map(Snake).asSingleton();


		injector.map(IGameObjectFactory).toSingleton(GameObjectFactory);

		// Create a UserProfileMediator for each UserProfileView
		// that lands inside of the Context View
		mediatorMap.map(IMainView).toMediator(MainMediator);
		mediatorMap.map(ILobbyView).toMediator(LobbyMediator);
		mediatorMap.map(IGameView).toMediator(GameMediator);

		// Execute UserSignInCommand when UserEvent.SIGN_IN
		// is dispatched on the context's Event Dispatcher
		commandMap
				.map(GameEvent.START_GAME, GameEvent)
				.toCommand(StartGameCommand);
		commandMap.map(SnakeEvent.SNAKE_ADVANCE,SnakeEvent).toCommand(SnakeAdvanceCommand);
		commandMap.map(SnakeMoveEvent.MOVE,SnakeMoveEvent).toCommand(SnakeMoveCommand);
		// The "view" property is a DisplayObjectContainer reference.
		// If this was a Flex application we would need to cast it
		// as an IVisualElementContainer and call addElement().
		//contextView.view.addChild(new LobbyView());
		//contextView.view.addChild(new GameView());
		//contextView.view.addChild(new MainView());
	}
}

}
