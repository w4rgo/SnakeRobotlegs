package com.w4rgo.snake.models.factories {
import com.w4rgo.snake.models.Fruit;
import com.w4rgo.snake.models.Gold;
import com.w4rgo.snake.models.IGameObject;
import com.w4rgo.snake.models.SnakePart;
import com.w4rgo.snake.models.Wall;


public class GameObjectFactory implements IGameObjectFactory {

    public function GameObjectFactory() {
    }


    public function createGameObject(type:String):IGameObject {
        switch (type) {
            case GameObjectType.WALL: return new Wall();
            case GameObjectType.GOLD: return new Gold();
            case GameObjectType.FRUIT: return new Fruit();
            case GameObjectType.SNAKE_PART: return new SnakePart();

        }
        throw(new Error("There isn't an implementation for this type: " + type));
        return null;

    }
}
}
