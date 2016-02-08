﻿package  src{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class arrow extends MovieClip{
		
		public static const ARROW_OUT_OF_BOUNDS:String = "arrow out of bounds";
		public var speed:int = 0;
		
		public function arrow() {
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, loop);
			this.addEventListener(Event.REMOVED_FROM_STAGE, rfs);
		}
		
		public function init(e:Event) {
			var place = Math.round(Math.random());			
			
			if (place == 0){
				this.y = 100;
			}else{
				this.y = 300;
			}
			this.x = 550;
		}
		function rfs(e:Event):void{
			this.removeEventListener(Event.ENTER_FRAME, loop);
		}
		public function loop(e:Event):void{
			this.x += speed;
			
			if (this.x < -100){
				dispatchEvent(new Event(ARROW_OUT_OF_BOUNDS));
				this.removeEventListener(Event.ENTER_FRAME, loop);
			}
		}
	  }
	
}