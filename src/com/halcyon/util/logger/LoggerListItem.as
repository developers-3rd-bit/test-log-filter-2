package com.halcyon.util.logger
{
   import com.greensock.TweenMax;
   import com.halcyon.layout.common.LayoutEvent;
   
   import fl.controls.CheckBox;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class LoggerListItem extends Sprite
   {
      public static const CHECKBOX_CLICK:String = "checkBoxClick";
      
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      private var _selectCheckBox:CheckBox;
      private var _tween:TweenMax;
      
      public function LoggerListItem(argWidth:Number, argHeight:Number=60)
      {
         argWidth = argWidth - 44;
         graphics.lineStyle(1, 0x000000, 1);
         graphics.beginFill(0xc4c4c4, .2);
         graphics.drawRect(0, 0, argWidth, argHeight);
         
         _selectCheckBox = new CheckBox();
         _selectCheckBox.label = "";
         _selectCheckBox.y = (argHeight - _selectCheckBox.height) / 2;
         _selectCheckBox.x = argWidth - _selectCheckBox.width + 44;
         this.addChild(_selectCheckBox);
         
         _labelField = new TextField();
         _labelField.mouseEnabled = false;
         _labelField.height = 22;
         _textFormat = new TextFormat();
         _textFormat.size = 16;
         _labelField.setTextFormat(_textFormat);
         _labelField.y = (argHeight - _labelField.height) / 2;
         _labelField.x = 10;
         _labelField.width = argWidth - _selectCheckBox.width + 30;
         this.addChild(_labelField);
         
         this.width = argWidth;
         
         this.addEventListener(MouseEvent.ROLL_OVER, onMouseOver, false, 0, true);
         this.addEventListener(MouseEvent.ROLL_OUT, onMouseOut, false, 0, true);
         _selectCheckBox.addEventListener(MouseEvent.CLICK, onSelectCheckBoxClick, false, 0, true);
      }
      
      private function onSelectCheckBoxClick(event:Event):void 
      {
         var layoutEvent:LayoutEvent = new LayoutEvent(CHECKBOX_CLICK);
         layoutEvent.extra = this;
         dispatchEvent(layoutEvent);
      }
      
      private function onMouseOver(event:Event):void
      {
         _tween = TweenMax.to(this, .1, {colorMatrixFilter:{colorize:0x00ddff, amount:.3}});
      }
      
      private function onMouseOut(event:Event):void 
      {
         if(_tween)
            _tween.reverse(false);
      }
      
      public function set selected(value:Boolean):void 
      {
         _selectCheckBox.selected = value;
      }
      
      public function get selected():Boolean 
      {
         return _selectCheckBox.selected;
      }
      
      public function set label(value:String):void
      {
         _labelField.text = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function get label():String 
      {
         return _labelField.text;
      }
   }
}