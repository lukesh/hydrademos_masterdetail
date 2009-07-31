package view.components.fruit.data.interfaces {

	public interface IFruit {
		[Bindable(event="idChange")]
		function set id(value:String):void;
		function get id():String;
		[Bindable(event="nameChange")]
		function set name(value:String):void;
		function get name():String;
	}
}