package com.w4rgo.snake.models {

public class Gold extends GameObject{
    public function Gold() {
        super(0xCC9900);

    }


    override public function scoreValue() : int {
        return 10;
    }

}
}
