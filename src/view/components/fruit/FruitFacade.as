/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package view.components.fruit
{
	import com.hydraframework.core.mvc.patterns.facade.Facade;
	import com.hydraframework.plugins.masterDetail.MasterDetailPlugin;
	
	import mx.core.IUIComponent;
	
	import view.components.fruit.controller.StartupCommand;
	import view.components.fruit.data.delegates.FruitDelegate;
	import view.components.fruit.data.interfaces.IFruitDelegate;
	import view.components.fruit.view.FruitMediator;

	public class FruitFacade extends Facade
	{
		public static const NAME:String = "FruitFacade";
		
		public function FruitFacade(component:IUIComponent=null)
		{
			super(NAME, component);
		}
		
		override public function registerCore():void {
			super.registerCore();
			
			trace("FruitFacade registered.");
			
			/*
			   Plugins
			 */
			this.registerPlugin(new MasterDetailPlugin(IFruitDelegate, FruitDelegate));
			
			/*
			   Delegates
			*/
			
			// No additional delegates need to be registered. When you 
			// initialize the MasterDetail plugin, it registers that delegate
			// for you. You can of course override it here or in implementation
			// if you choose. 
			
			/*
			   Proxies
			*/
			
			// No additional proxies are needed. The MasterDetail plugin mixes
			// in a proxy that handles the collection of objects and the
			// selected object, as well as the dispatching of MasterDetail
			// notifications.
			
			/*
			   Mediators
			*/
			this.registerMediator(new FruitMediator(this.component));
			
			/*
			   Commands
			*/
			this.registerCommand(Facade.REGISTER, StartupCommand);
		}
	}
}