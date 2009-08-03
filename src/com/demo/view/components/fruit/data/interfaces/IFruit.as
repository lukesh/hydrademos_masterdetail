/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.demo.view.components.fruit.data.interfaces {

	public interface IFruit {
		[Bindable(event="idChange")]
		function set id(value:String):void;
		function get id():String;
		[Bindable(event="nameChange")]
		function set name(value:String):void;
		function get name():String;
	}
}