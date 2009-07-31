package view.components.fruit.controller
{
	import com.hydraframework.plugins.masterDetail.MasterDetailPlugin;
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand
	{
		public function StartupCommand(facade:IFacade)
		{
			super(facade);
		}
		
		override public function execute(notification:Notification):void {
			if(notification.isRequest()) {
				this.facade.sendNotification(new Notification(MasterDetailPlugin.RETRIEVE_LIST));
				this.facade.sendNotification(new Notification(MasterDetailPlugin.INSTANTIATE));	
			}
		}
	}
}