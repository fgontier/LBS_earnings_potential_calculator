package com.globalworks.lbs.tools 
{
	import flash.display.Sprite;
	import json.JParser; 
	
	public class AnnualIncomeChart extends Sprite
	{
		private var _valuesArray:Array;
		private var _age:Number = 30;
		private var jsonStr:String;
		
		public function AnnualIncomeChart(valuesArray:Array, age:Number)
		{
			_valuesArray = valuesArray;
			_age = age;
		}	
		
		public function createJson():String
		{
			var jsonObj:Object = new Object();
			
			// title
			var titleObj:Object = new Object();		 
			titleObj.text = "Your Annual Income";
			jsonObj.title = titleObj;		
			
			/////// elements
			jsonObj.elements = new Array();
			
			var elementsObj:Object = new Object();
			elementsObj.type = "bar";
			elementsObj.alpha = 0.8;
			elementsObj.colour = "#222222";
			elementsObj.values = _valuesArray;
			//elementsObj.tip = #val#
			(jsonObj.elements as Array).push(elementsObj)		
/*			
			
			/////// y_axis
			var y_axisObj:Object = new Object();
			y_axisObj.min = 0;								//y_axisObj.min = annualIncome.text;										
			y_axisObj.max = nearestTo(_valuesArray.pop());	//y_axisObj.max = (valuesArray.pop());
			y_axisObj.steps = 1
			y_axisObj.stroke = 2
			y_axisObj.tick_length = 15
			y_axisObj.offset = 0
			y_axisObj.grid_colour = "#ffffff"
			jsonObj.y_axis = y_axisObj;
			
			/////// x_axis 
			var x_axisObj:Object = new Object();
			x_axisObj.min = _age
			x_axisObj.max = "64"
			x_axisObj.steps = 2
			x_axisObj.colour = "#2C5291"
			x_axisObj.grid_colour = "#ffffff"
	
			//x_axisObj.rotate = "diagonal"
			//x_axisObj.labels = ["test", "lala"]
			jsonObj.x_axis = x_axisObj;	
			
			/////// tooltip
			var tooltipObj:Object = new Object();
			tooltipObj.shadow = true
			tooltipObj.stroke = 5
			tooltipObj.colour = "#00d000"
			tooltipObj.background = "#d0d0ff"
			tooltipObj.title = "{font-size: 12px; color: #905050}"
			tooltipObj.body = "{font-size: 10px; font-weight: bold; color: #9090ff }"
			//tooltipObj.text = "font-size: 10px; font-weight: bold; color: #9090ff "
			jsonObj.tooltip = tooltipObj;	
			
			
			/////// bg_colour
			jsonObj.bg_colour = "#fcfcfc";	
			

			/////// y_legend
			var y_legendObj:Object = new Object();
			y_legendObj.text = "Dollars",
			y_legendObj.style = "{color: #736AFF; font-size: 12px;}"
			jsonObj.y_legend = y_legendObj;
			
			/////// x_legend
			var x_legendObj:Object = new Object();
			x_legendObj.text = "Age",
			x_legendObj.style = "{color: #736AFF; font-size: 12px;}"
			jsonObj.x_legend = x_legendObj;
		
			
			/*
				Encoder the object into JSON.
			*/	
			trace("jsonObj non encoded: " + jsonObj);	
			jsonStr = JParser.encode(jsonObj);
			trace("jsonStr " + jsonStr);
			return(jsonStr)
		}
		
		private function nearestTo(myNunber:int):int
		{
			//trace("myNunber " + myNunber);
			//trace("length " + myNunber.toString().length);
			var Ymax:int;
			
			// Round a number to nearest multiple of 1000, 10000 or 100000
				 if (myNunber.toString().length == 4) { Ymax = ( 1 + Number(myNunber.toString().substr(0,2))) * 100 }
			else if (myNunber.toString().length == 5) { Ymax = ( 1 + Number(myNunber.toString().substr(0,2))) * 1000 }
			else if (myNunber.toString().length == 6) { Ymax = ( 1 + Number(myNunber.toString().substr(0,2))) * 10000 }
			else if (myNunber.toString().length == 7) { Ymax = ( 1 + Number(myNunber.toString().substr(0,2))) * 100000 }
			else if (myNunber.toString().length == 8) { Ymax = ( 1 + Number(myNunber.toString().substr(0,2))) * 1000000 }
			else if (myNunber.toString().length == 9) { Ymax = ( 1 + Number(myNunber.toString().substr(0,2))) * 10000000 }
			return(Ymax)	
		}	
		
	}

}