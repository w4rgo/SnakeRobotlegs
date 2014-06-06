package com.w4rgo.snake.models {

public class Wall extends GameObject{
    public function Wall( ) {
        super(0x000000);


    }


    override public function scoreValue() : int {
        return 0;
    }

}
}
