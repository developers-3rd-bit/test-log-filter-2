package
{
	import com.halcyon.util.logger.LoggerCanvas;
	
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	[SWF(width="700", height="500")]
	public class TestFlashList extends Sprite
	{
		private var _listGroup:LoggerCanvas;
		private var _allLoggers:Array = ["FileSharePanel", "Application", "ScreenShareLauncher", 
			"SilverNavigator", "CubeView", "AppTile", "ContextualHelp", "SoftPhoneManager", 
			"UserCube", "WebcamSessionManager"];
		private var _selectedLoggers:Array = ["FileSharePanel", "Application", "ContextualHelp"];
		
		public function TestFlashList()
		{
			_listGroup = new LoggerCanvas(this, 640, 360);
			_listGroup.x = _listGroup.y = 15;
			_listGroup.addEventListener(LoggerCanvas.CLOSE_BTN_CLICK, onCloseBtnClick, false, 0, true);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			this.addChild(_listGroup);
			/*_listGroup.allLoggers = _allLoggers;
			_listGroup.selectedLoggers = _selectedLoggers;*/
         
         var dummyArray:Array = new Array();
         var strArray:Array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                               "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
                               "y", "z", "za", "zb", "zc", "zd"];
         for(var i:int=0;i<30;i++) 
         {
            for(var j:int=0;j<_allLoggers.length;j++) 
            {
               dummyArray.push(_allLoggers[j] + " " + strArray[i]);
            }
         }
         _listGroup.allLoggers = dummyArray;
         
			stage.color = 0x000000;
         
         this.addEventListener(Event.RENDER, onRender, false, 0, true);
		}
      
      private function onRender(event:Event):void
      {
         this.removeEventListener(Event.RENDER, onRender);
         _listGroup.onFilterTextChange(null);
      }
      
		private function onCloseBtnClick(event:Event):void 
      {
			this.removeChild(_listGroup);
		}
	}
}