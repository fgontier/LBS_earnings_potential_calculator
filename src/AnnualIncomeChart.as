package
{
	import flash.display.Sprite;
	import json.JParser; 
	
	public class AnnualIncomeChart extends Sprite
	{
		private var _salaryArray:Array;
		private var _Ymax:int;	
		private var _age:Number = 18;
		private var jsonStr:String;
		
		public function AnnualIncomeChart(Ymax:int,salaryArray:Array, age:Number)
		{
			_salaryArray = salaryArray;
			_age = age;
			_Ymax = Ymax;						

			if (_age < 18) {_age = 18}		// start the X scale at 18
		}	
		
		public function createJson():String
		{
			var jsonObj:Object = new Object();
			
			// title
			var titleObj:Object = new Object();		 
			titleObj.text = "Your Annual Income";
			titleObj.style = "{font-size: 16px; font-weight: bold; color: #2C5291; text-align: center;}"
			jsonObj.title = titleObj;		
			
			/////// elements
			jsonObj.elements = new Array();
			
			var elementsObj:Object = new Object();
			elementsObj.type = "bar";
			elementsObj.alpha = 0.8;
			elementsObj.colour = "#2C5291";
			elementsObj.values = _salaryArray;
			//elementsObj.tip = #val#
			(jsonObj.elements as Array).push(elementsObj)		
			
			
			/////// y_axis
			var y_axisObj:Object = new Object();
			y_axisObj.min = 0;																		
			y_axisObj.max = nearestTo( _Ymax);										
			y_axisObj.steps = 1
			y_axisObj.stroke = 3
			y_axisObj.tick_length = 15
			y_axisObj.offset = 0
			y_axisObj.colour = "#2C5291"
			y_axisObj.style = "{grid-colour:0xF5E1AA}"
			y_axisObj.labels = {"colour": "#2C5291" , "text": "$#val#"}
			jsonObj.y_axis = y_axisObj;
			
			/////// x_axis 
			var x_axisObj:Object = new Object();
			x_axisObj.min = _age
			x_axisObj.max = 65
			x_axisObj.steps = 2
			x_axisObj.stroke = 3		
			x_axisObj.colour = "0x2C5291"
			x_axisObj.style = "{grid-colour:#F5E1AA}";
			x_axisObj.labels = {"colour": "#2C5291"}
	
			//x_axisObj.rotate = "diagonal"
			//x_axisObj.labels = ["test", "lala"]
			jsonObj.x_axis = x_axisObj;	
			
			/////// tooltip
			var tooltipObj:Object = new Object();
			tooltipObj.shadow = true
			tooltipObj.stroke = 5
			tooltipObj.colour = "#F2C322"
			tooltipObj.background = "#F2C322"
			tooltipObj.mouse = 2;
			//tooltipObj.title = "{font-size: 12px; color: #2C5291}"
			//tooltipObj.body = "{font-size: 20px; font-weight: bold; color: #9090ff }"
			//tooltipObj.text = "{font-size: 20px; font-weight: bold; color: #9090ff }"
			elementsObj.tip = "Annual Income: $#val#";
			jsonObj.tooltip = tooltipObj;	
			
			
			/////// bg_colour
			// jsonObj.bg_colour = "#002200";  //<< if no bg_colour = transparent	
			

			/////// y_legend
			//var y_legendObj:Object = new Object();
			//y_legendObj.text = "Dollars",
			//y_legendObj.style = "{color: #736AFF; font-size: 12px;}"
			//jsonObj.y_legend = y_legendObj;
			
			/////// x_legend
			//var x_legendObj:Object = new Object();
			//x_legendObj.text = "Age",
			//x_legendObj.style = "{color: #736AFF; font-size: 12px;}"
			//jsonObj.x_legend = x_legendObj;
		
			
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