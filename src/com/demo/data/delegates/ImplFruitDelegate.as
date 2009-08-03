package com.demo.data.delegates {
	import com.demo.view.components.fruit.data.descriptors.FruitDescriptor;
	import com.demo.view.components.fruit.data.interfaces.IFruit;
	import com.demo.view.components.fruit.data.interfaces.IFruitDelegate;
	import com.hydraframework.plugins.masterDetail.data.delegates.MockMasterDelegate;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;

	public class ImplFruitDelegate extends MockMasterDelegate implements IFruitDelegate {
		// Static var that simulates the list of objects in a database
		private static var mock_list:ArrayCollection;

		// Static var that simulates an incrementing key field in a database
		private static var next_fruit_id:int = 0;

		// Static var that contains some sample names for the initial mock recordset
		private static var next_fruit_name:Array = ["This", "Is", "Another", "List", "of", "Fruit"];

		public function ImplFruitDelegate() {
			super();
		}

		override public function get keyField():String {
			return "id";
		}

		/*
		   Abstracts the creation of an empty object
		 */
		override public function get recordFactory():Function {
			return newFruit;
		}

		/*
		   Public methods used for mock data
		 */

		/**
		 * Returns a mock recordset
		 */
		override public function get collection():ArrayCollection {
			if (!mock_list) {
				mock_list = new ArrayCollection();
				for (var i:int = 0; i < 6; i++) {
					mock_list.addItem(mockRecordFactory());
				}
			}
			return mock_list;
		}


		override public function get mockRecordFactory():Function {
			return newMockFruit;
		}

		override public function get mockIDFactory():Function {
			return newMockID;
		}


		/*
		   Public service API

		   Override the following methods to actually access server data
		   and your application will work exactly as it did with mock data:

		   function retrieveList():void;
		   function createObject(object:Object):void;
		   function retrieveObject(key:Object):void;
		   function updateObject(object:Object):void;
		   function deleteObject(object:Object):void;

		 */

		override public function retrieveList():void {
			super.retrieveList();
		}

		/*
		   Private Methods
		 */

		private function newFruit():IFruit {
			var fruit:IFruit = new FruitDescriptor();
			return fruit;
		}

		private function newMockFruit():IFruit {
			var fruit:IFruit = new FruitDescriptor();
			fruit.id = newMockID();
			fruit.name = next_fruit_name[fruit.id];
			return fruit;
		}

		private function newMockID():String {
			return String(next_fruit_id++);
		}
	}
}