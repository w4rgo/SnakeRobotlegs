package com.w4rgo.snake.events {
import com.w4rgo.snake.models.GameObject;

import flash.events.Event;


public class GameEvent extends Event{

    public static const START_GAME : String = "startGame";
    public static const GAME_STARTED: String = "gameStarted"
    public static const END_GAME : String = "endGame";



    public function GameEvent(type:String,bubbles:Boolean=false,cancelable:Boolean=false) {
        super(type, bubbles , cancelable);
        trace("GAME EVENT: " + this.type );
    }


    override public function clone():Event {
        return new GameEvent(type,bubbles,cancelable);
    }
}
}
