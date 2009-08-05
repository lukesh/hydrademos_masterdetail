package com.demo.data.delegates {
	import com.demo.view.components.fruit.data.descriptors.FruitDescriptor;
	import com.demo.view.components.fruit.data.interfaces.IFruit;
	import com.demo.view.components.fruit.data.interfaces.IFruitDelegate;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;

	public class ImplFruitDelegate implements IFruitDelegate {

		public function ImplFruitDelegate() {
			super();
		}

		/*
		   -----------------------------------------------------------------------
		   Public IMasterDelegate API
		   -----------------------------------------------------------------------
		 */
		 
		public function get keyField():String {
			return "ID";
		}
		
		private function _recordFactory():IFruit {
			return new FruitDescriptor();
		}

		public function get recordFactory():Function {
			return _recordFactory;
		}

		public function retrieveList():void {
			/*
			
			// Sample implementation for live data interaction.
			
			var asyncToken:AsyncToken = MyService.retrieveList();

			asyncToken.addResponder(new Responder(function(data:Object):void {
					responder.result(data);
				}, function(info:Object):void {
					responder.fault(info);
				}));
				
			*/
		}

		public function createObject(object:Object):void {
			
		}

		public function retrieveObject(key:Object):void {

		}

		public function updateObject(object:Object):void {

		}

		public function deleteObject(object:Object):void {

		}
	}
}