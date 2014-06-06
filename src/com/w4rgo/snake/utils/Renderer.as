package com.w4rgo.snake.utils {
import com.w4rgo.snake.models.IDrawableGameObject;

import flash.display.Graphics;

import org.as3commons.collections.LinkedList;
import org.as3commons.collections.framework.IIterator;


public class Renderer {

    private var _graphics:Graphics;


    public function Renderer(graphics:Graphics) {
        this._graphics = graphics;
    }


    public function get graphics():Graphics {
        return _graphics;
    }

    public function set graphics(value:Graphics):void {
        _graphics = value;
    }

    public function paint(array:Vector.<IDrawableGameObject>):void {

        for each (var object:IDrawableGameObject in array) {
            paintObject(object);
        }
    }

    private function paintObject(object:IDrawableGameObject):void {
        this._graphics.lineStyle(1, 0x000000);
        this._graphics.beginFill(object.color);
        this._graphics.drawRect(object.x, object.y, object.size, object.size);
        this._graphics.endFill();
    }

    public function paintLinkedList(array:LinkedList):void {

        var iterator:IIterator = array.iterator();
        while (iterator.hasNext()) {
            var object:IDrawableGameObject = iterator.next();
            paintObject(object);
        }
    }

    public function clear():void {
        _graphics.clear();
    }
}
}
