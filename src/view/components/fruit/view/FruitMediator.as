/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package view.components.fruit.view {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.patterns.mediator.Mediator;
	import com.hydraframework.plugins.masterDetail.MasterDetailPlugin;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.core.IUIComponent;
	
	import view.components.fruit.Fruit;
	import view.components.fruit.data.interfaces.IFruit;

	public class FruitMediator extends Mediator {
		public static const NAME:String = "FruitMediator";

		public function get view():Fruit {
			return Fruit(this.component);
		}

		public function FruitMediator(component:IUIComponent = null) {
			super(NAME, component);
		}

		override public function initialize():void {
			super.initialize();
			/*
			   Attach view component event listeners
			 */
			view.addEventListener("selectedItemChange", handleSelectedItemChange);
			view.addEventListener("delete", handleModifierEvent);
			view.addEventListener("create", handleModifierEvent);
			view.addEventListener("save", handleModifierEvent);
		}

		override public function dispose():void {
			super.dispose();
			/*
			   Remove view component event listeners
			 */
			view.removeEventListener("selectedItemChange", handleSelectedItemChange);
			view.removeEventListener("delete", handleModifierEvent);
			view.removeEventListener("create", handleModifierEvent);
			view.removeEventListener("save", handleModifierEvent);
		}

		override public function handleNotification(notification:Notification):void {
			super.handleNotification(notification);

			if (notification.isRequest()) {
				switch (notification.name) {
					case MasterDetailPlugin.RETRIEVE_LIST:
						view.waiting = true;
						break;
						
					default:
				}
			}

			if (notification.isResponse()) {
				view.waiting = false;
				
				switch (notification.name) {
					case MasterDetailPlugin.RETRIEVE_LIST:
						view.collection = ArrayCollection(notification.body);
						break;
						
					case MasterDetailPlugin.SELECT:
						view.selectedItem = IFruit(notification.body);
						break;
					
					case MasterDetailPlugin.DELETE:
						this.sendNotification(new Notification(MasterDetailPlugin.INSTANTIATE));
						break;
						
					case MasterDetailPlugin.CREATE:
						this.sendNotification(new Notification(MasterDetailPlugin.SELECT, IFruit(notification.body)));
						break;
						
					default:
				}
			}
		}

		/*
		   -----------------------------------------------------------------------
		   Event Handlers
		   -----------------------------------------------------------------------
		 */
		private function handleSelectedItemChange(event:Event):void {
			var item:IFruit = view.selectedItem;
			if(item.id != null) {
				this.sendNotification(new Notification(MasterDetailPlugin.SELECT, item));
			}
		}
		
		private function handleModifierEvent(event:Event):void {
			switch(event.type) {
				case "delete":
					this.sendNotification(new Notification(MasterDetailPlugin.DELETE, view.selectedItem));
					break;
				case "create":
					this.sendNotification(new Notification(MasterDetailPlugin.INSTANTIATE));
					break;
				case "save":
					if(view.selectedItem.id != null) {
						this.sendNotification(new Notification(MasterDetailPlugin.UPDATE, view.selectedItem));
					} else {
						this.sendNotification(new Notification(MasterDetailPlugin.CREATE, view.selectedItem));
					}
					break;
			}
		}
	}
}