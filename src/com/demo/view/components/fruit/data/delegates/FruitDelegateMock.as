/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
package com.demo.view.components.fruit.data.delegates {
	import com.demo.view.components.fruit.data.descriptors.FruitDescriptor;
	import com.demo.view.components.fruit.data.interfaces.IFruit;
	import com.demo.view.components.fruit.data.interfaces.IFruitDelegate;
	import com.hydraframework.plugins.masterDetail.data.delegates.MasterDelegateMock;
	
	import mx.collections.ArrayCollection;

	public class FruitDelegateMock extends MasterDelegateMock implements IFruitDelegate {

		private static var mock_list:ArrayCollection;
		private static var next_fruit_id:int = 0;
		private static var next_fruit_name:Array = ["Banana", "Apple", "Kumquat", "Orange", "Avocado", "Tomato", "Plum"];
		
		public function FruitDelegateMock() {
			super();
		}

		/*
		   -----------------------------------------------------------------------
		   Overriding testing methods from MasterDelegateMock
		   -----------------------------------------------------------------------
		 */

		override public function get mockRecordFactory():Function {
			return newMockFruit;
		}
		
		override public function get mockIDFactory():Function {
			return newMockID;
		}
		
		override public function get mockCollection():ArrayCollection {
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

		/*
		   -----------------------------------------------------------------------
		   Public IMasterDelegate API
		   -----------------------------------------------------------------------
		 */
		 
		override public function get keyField():String {
			return "id";
		}
		
		override public function get recordFactory():Function {
			return newFruit;
		}

		override public function retrieveList():void {
			super.retrieveList();
		}
				
		override public function createObject(object:Object):void {
			super.createObject(object);
		}
		
		override public function deleteObject(object:Object):void {
			super.deleteObject(object);
		}
		
		override public function retrieveObject(key:Object):void {
			super.retrieveObject(key);
		}
		
		override public function updateObject(object:Object):void {
			super.updateObject(object);
		}
		
		
		/*
		   -----------------------------------------------------------------------
		   Private Methods
		   -----------------------------------------------------------------------
		 */
		 
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