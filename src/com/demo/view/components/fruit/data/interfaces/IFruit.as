/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the MIT License (http://www.opensource.org/licenses/mit-license.php)
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