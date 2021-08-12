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

	// printf("%x",float_to_L11(-10.5));
	printf("CH1= %.3f A",L11_to_float(0x873AU));
	printf("\r\n");
	printf("CH2= %.3f A",L11_to_float(0x86EAU));
	printf("\r\n");

	// system("pause");
	return EXIT_SUCCESS;
}


/************************ (C) COPYRIGHT YingChao,Chen *****END OF FILE****/
