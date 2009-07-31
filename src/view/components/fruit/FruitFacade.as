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
			/*
			   Proxies
			*/
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