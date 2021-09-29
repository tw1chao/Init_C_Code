/**
	******************************************************************************
	* @file           : main.c
	* @brief          : Main program body
	******************************************************************************
	* @attention
	*
	*
	******************************************************************************
	*/

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/**
	* @brief  The application entry point.
	* @retval int
	*/
int main(int argc, char *argv[])
{

	printf("-9.29 = %x    \r\n",float_to_L11(-9.29));
	printf("SOL1 = %.5f A \r\n",L11_to_float(float_to_L11(-9.29)));
	printf("SOL2 = %.5f A \r\n",L11_to_float(0xd5aeU));

	// system("pause");
	return EXIT_SUCCESS;
}


/************************ (C) COPYRIGHT tw1chao *****END OF FILE****/
