package com.w4rgo.snake.configuration {
public class Configuration {

    public static const SQUARE_SIZE : int = 6;
    public static const OFFSET_X:int = 0;
    public static const OFFSET_Y:int = SQUARE_SIZE * 10;
    public static const BOARD_SIZE_X:int = 40 * SQUARE_SIZE;
    public static const BOARD_SIZE_Y:int = 40 * SQUARE_SIZE;
    public static const START_X:int = BOARD_SIZE_X / 2 + OFFSET_X;
    public static const START_Y:int = BOARD_SIZE_Y / 2 + OFFSET_Y;
	public static const START_SPEED:int = 100;
	public static const SPEED_DECREMENT : int = 5;
}
}
