package view.components.fruit.data.descriptors {
	import view.components.fruit.data.interfaces.IFruit;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class FruitDescriptor extends EventDispatcher implements IFruit {
		public function FruitDescriptor() {
		}

		private var _id:String;

		[Bindable(event="idChange")]
		public function set id(value:String):void {
			if (value != _id) {
				_id = value;
				dispatchEvent(new Event("idChange"));
			}
		}

		public function get id():String {
			return _id;
		}

		private var _name:String;

		[Bindable(event="nameChange")]
		public function set name(value:String):void {
			if (value != _name) {
				_name = value;
				dispatchEvent(new Event("nameChange"));
			}
		}

		public function get name():String {
			return _name;
		}
	}
}