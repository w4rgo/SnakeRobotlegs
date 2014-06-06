package com.w4rgo.snake.events {
import flash.events.Event;

public class BoundariesInitEvent extends Event {
    public static const BOUNDARIES_INIT_EVENT:String = "boundariesInitEvent";

    public function BoundariesInitEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }


    override public function clone():Event {
        return new BoundariesInitEvent(type, bubbles, cancelable);
    }


}
}
