package view.components.fruit.data.delegates {
	import view.components.fruit.data.descriptors.FruitDescriptor;
	import view.components.fruit.data.interfaces.IFruit;
	import view.components.fruit.data.interfaces.IFruitDelegate;
	import com.hydraframework.plugins.masterDetail.data.delegates.MockMasterDelegate;
	
	import mx.collections.ArrayCollection;

	public class FruitDelegate extends MockMasterDelegate implements IFruitDelegate {

		private static var mock_list:ArrayCollection;
		private static var next_fruit_id:int = 0;
		private static var next_fruit_name:Array = ["Banana", "Apple", "Kumquat", "Orange", "Avocado", "Tomato", "Plum"];
		
		public function FruitDelegate() {
			super();
		}

		override public function get keyField():String {
			return "id";
		}

		override public function get recordFactory():Function {
			return newFruit;
		}

		override public function get mockRecordFactory():Function {
			return newMockFruit;
		}
		
		override public function get mockIDFactory():Function {
			return newMockID;
		}
		
		override public function get collection():ArrayCollection {
			if (!mock_list) {
				mock_list = new ArrayCollection();
				mock_list.addItem(mockRecordFactory());
				mock_list.addItem(mockRecordFactory());
				mock_list.addItem(mockRecordFactory());
				mock_list.addItem(mockRecordFactory());
				mock_list.addItem(mockRecordFactory());
			}
			return mock_list;
		}
		
		override public function createObject(object:Object):void {
			super.createObject(object);
		}
		
		override public function deleteObject(object:Object):void {
			super.deleteObject(object);
		}
		
		override public function retrieveList():void {
			super.retrieveList();
		}
		
		override public function retrieveObject(key:Object):void {
			super.retrieveObject(key);
		}
		
		override public function updateObject(object:Object):void {
			super.updateObject(object);
		}
		
		private function newFruit():IFruit {
			var fruit:IFruit = new FruitDescriptor();
			return fruit;
		}
		
		private function newMockFruit():IFruit {
			var fruit:IFruit = new FruitDescriptor();
			fruit.id = String(next_fruit_id++);
			fruit.name = next_fruit_name[fruit.id];
			return fruit;
		}
		
		private function newMockID():String {
			return String(next_fruit_id++);
		}
	}
}