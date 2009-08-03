/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.demo.view.components.fruit.controller {
	import com.hydraframework.plugins.masterDetail.MasterDetailPlugin;
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand {
		public function StartupCommand(facade:IFacade) {
			super(facade);
		}

		override public function execute(notification:Notification):void {
			if (notification.isRequest()) {

				/*
				   Get a list of all the fruit.
				 */
				this.facade.sendNotification(new Notification(MasterDetailPlugin.RETRIEVE_LIST));

				/*
				   Initialize the detail view with a new IFruit object
				 */
				this.facade.sendNotification(new Notification(MasterDetailPlugin.INSTANTIATE));
			}
		}
	}
}