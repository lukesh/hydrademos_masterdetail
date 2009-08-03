package com.demo {
	import com.demo.data.delegates.ImplFruitDelegate;
	import com.hydraframework.core.mvc.patterns.facade.Facade;
	
	import mx.core.IUIComponent;

	public class ApplicationFacade extends Facade {
		public static const NAME:String = "ApplicationFacade";

		public function ApplicationFacade(component:IUIComponent) {
			super(NAME, component);
		}
		
		override public function initialize():void {
			super.initialize();
			trace("ApplicationFacade Initialized.");
		}
		
		override public function registerCore():void {
			// Override any Fruit delegates in the system with ImplFruitDelegate
			// in the application (global) context.
			this.registerDelegate(ImplFruitDelegate, true); 
		}

	}
}