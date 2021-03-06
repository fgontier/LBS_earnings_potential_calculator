﻿/* Use:
 * 
 * import agi.utils.Format
 * 
 * var _format:Format =  new Format();
 * 
 * trace out:
 * trace(_format.currency(32783.2397,2,$)); //$32,783.24
 * trace(_format.currency(32783.2397,3,$)); //$32,783.240
 * trace(_format.currency(32783.2397,2,"")); //32,783.24
 * 
 */
package agi.utils
{
	public class Format
	{
		//-----------CONSTRUCTOR-----------//
		public function Format() { }
		
		//-----------PRIVATE METHODS-----------//
		public function currency(num:Number,decimalPlace:Number=2,currency:String="$"):String
		{
			//assigns true boolean value to neg in number less than 0
			var neg:Boolean = (num < 0);
			
			//make the number positive for easy conversion
			num = Math.abs(num)

			var roundedAmount:String = String(num.toFixed(decimalPlace));
			
			//split string into array for dollars and cents
			var amountArray:Array = roundedAmount.split(".");
			var dollars:String = amountArray[0]
			var cents:String = amountArray[1]
			
			//create dollar amount
			var dollarFinal:String = ""
			var i:int = 0
			for (i; i < dollars.length; i++)
			{
				if (i > 0 && (i % 3 == 0 ))
				{
					dollarFinal = "," + dollarFinal;
				}
				
				dollarFinal = dollars.substr( -i -1, 1) + dollarFinal;
			}	
			
			//create Cents amount and zeros if necessary
			var centsFinal:String = String(cents);
			
			var missingZeros:int = decimalPlace - centsFinal.length;
		
			if (centsFinal.length < decimalPlace)
			{
				for (var j:int = 0; j < missingZeros; j++) 
				{
					centsFinal += "0";
				}
			}
			
			var finalString:String = ""

			if (neg)
			{
				finalString = "-"+currency + dollarFinal
			} else
			{
				finalString = currency + dollarFinal
			}

			if(decimalPlace > 0)
			{
				finalString += "." + centsFinal;
			} 
			
			return finalString;
		}
	}
}