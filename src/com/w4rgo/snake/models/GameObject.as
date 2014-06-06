package com.w4rgo.snake.models {
import com.w4rgo.snake.configuration.Configuration;

public class GameObject  implements IGameObject{

    private var _color : uint = 0x993399;
    private var _size : int = Configuration.SQUARE_SIZE;
    private var _x: int;
    private var _y: int;

    public function GameObject(color : uint= 0x993399) {
        this._color = color;
    }

   public function move ( x:int ,y :int):void {
        this._x = x;
        this._y = y;
    }

    public function collides(part: IGameObject):Boolean {
        return (x== part.x && y == part.y && part != this);
    }

    public function scoreValue() : int {
        return 1;
    }

    public function get size():int {
        return _size;
    }

    public function get color():uint {
        return _color;
    }

    public function get x():int {
        return _x;
    }

    public function get y():int {
        return _y;
    }
}
}
