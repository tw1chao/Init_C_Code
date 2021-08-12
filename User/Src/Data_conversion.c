/**
	******************************************************************************
	* @file           : Data_conversion.c
	* @brief          : PMBus Data Linear 11 exchange float conversion
	******************************************************************************
	*/


#include "main.h"

/**
 * @brief Convert a LinearFloat5_11 formatted word into a floating point value
 * @retval float
 * @note reference: https://www.analog.com/media/en/technical-documentation/application-notes/an135f.pdf
 */
float L11_to_float(uint16_t input_val)
{
	// extract exponent as MS 5 bits
	int8_t exponent = input_val >> 11;
	// extract mantissa as LS 11 bits
	int16_t mantissa = input_val & 0x7ff;
	
	// sign extend exponent from 5 to 8 bits
	if( exponent > 0x0F ) exponent |= 0xE0;
	// sign extend mantissa from 11 to 16 bits
	if( mantissa > 0x03FF ) mantissa |= 0xF800;

	// compute value as mantissa * 2^(exponent)
	return mantissa * pow(2,exponent);
}


/**
 * @brief Convert a floating point value into a  LinearFloat5_11 formatted word
 * @retval unsigned int 16 bit
 * @note reference: https://www.analog.com/media/en/technical-documentation/application-notes/an135f.pdf
 */
uint16_t float_to_L11(float input_val)
{
	// set exponent to -16
	int exponent = -16;
	// extract mantissa from input value
	int mantissa = (int)(input_val / pow(2.0, exponent));
	// Search for an exponent that produces
	// a valid 11-bit mantissa
	do{
		if((mantissa >= -1024) &&(mantissa <= +1023)){
			break; // stop if mantissa valid
		}
		exponent++;
		mantissa = (int)(input_val / pow(2.0, exponent));
	} while (exponent < +15);

	// Format the exponent of the L11
	uint16_t uExponent = exponent << 11;
	// Format the mantissa of the L11 
	uint16_t uMantissa = mantissa & 0x07FF;
	// Compute value as exponent | mantissa
	return (uExponent | uMantissa);
}



/************************ (C) COPYRIGHT YingChao,Chen *****END OF FILE****/

