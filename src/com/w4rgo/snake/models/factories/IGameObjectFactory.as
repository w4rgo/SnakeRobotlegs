package com.w4rgo.snake.models.factories {
import com.w4rgo.snake.models.IGameObject;

public interface IGameObjectFactory {

    function createGameObject(type:String):IGameObject;

}
}
