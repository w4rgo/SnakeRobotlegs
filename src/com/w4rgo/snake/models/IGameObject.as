package com.w4rgo.snake.models {

public interface IGameObject extends IDrawableGameObject{

   // function buildGraphics(size:int):void;

    function move ( x:int ,y :int):void;

    function collides(part: IGameObject):Boolean;

    function scoreValue():int;

}
}
