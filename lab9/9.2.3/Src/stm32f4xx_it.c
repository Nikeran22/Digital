/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file    stm32f4xx_it.c
 * @brief   Interrupt Service Routines.
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f4xx_it.h"
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN TD */

/* USER CODE END TD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN PV */
int OCmax1 =419;
int OCmax2=839;
int OCmax3=1679;
int OCmin1=41;
int OCmin2=83;
int OCmin3=167;
int ADCmax=255;
int OCtime2=1999;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/* External variables --------------------------------------------------------*/

/* USER CODE BEGIN EV */

/* USER CODE END EV */

/******************************************************************************/
/*           Cortex-M4 Processor Interruption and Exception Handlers          */
/******************************************************************************/
/**
 * @brief This function handles Non maskable interrupt.
 */
void NMI_Handler(void) {
	/* USER CODE BEGIN NonMaskableInt_IRQn 0 */

	/* USER CODE END NonMaskableInt_IRQn 0 */
	/* USER CODE BEGIN NonMaskableInt_IRQn 1 */

	/* USER CODE END NonMaskableInt_IRQn 1 */
}

/**
 * @brief This function handles Hard fault interrupt.
 */
void HardFault_Handler(void) {
	/* USER CODE BEGIN HardFault_IRQn 0 */

	/* USER CODE END HardFault_IRQn 0 */
	while (1) {
		/* USER CODE BEGIN W1_HardFault_IRQn 0 */
		/* USER CODE END W1_HardFault_IRQn 0 */
	}
}

/**
 * @brief This function handles Memory management fault.
 */
void MemManage_Handler(void) {
	/* USER CODE BEGIN MemoryManagement_IRQn 0 */

	/* USER CODE END MemoryManagement_IRQn 0 */
	while (1) {
		/* USER CODE BEGIN W1_MemoryManagement_IRQn 0 */
		/* USER CODE END W1_MemoryManagement_IRQn 0 */
	}
}

/**
 * @brief This function handles Pre-fetch fault, memory access fault.
 */
void BusFault_Handler(void) {
	/* USER CODE BEGIN BusFault_IRQn 0 */

	/* USER CODE END BusFault_IRQn 0 */
	while (1) {
		/* USER CODE BEGIN W1_BusFault_IRQn 0 */
		/* USER CODE END W1_BusFault_IRQn 0 */
	}
}

/**
 * @brief This function handles Undefined instruction or illegal state.
 */
void UsageFault_Handler(void) {
	/* USER CODE BEGIN UsageFault_IRQn 0 */

	/* USER CODE END UsageFault_IRQn 0 */
	while (1) {
		/* USER CODE BEGIN W1_UsageFault_IRQn 0 */
		/* USER CODE END W1_UsageFault_IRQn 0 */
	}
}

/**
 * @brief This function handles System service call via SWI instruction.
 */
void SVC_Handler(void) {
	/* USER CODE BEGIN SVCall_IRQn 0 */

	/* USER CODE END SVCall_IRQn 0 */
	/* USER CODE BEGIN SVCall_IRQn 1 */

	/* USER CODE END SVCall_IRQn 1 */
}

/**
 * @brief This function handles Debug monitor.
 */
void DebugMon_Handler(void) {
	/* USER CODE BEGIN DebugMonitor_IRQn 0 */

	/* USER CODE END DebugMonitor_IRQn 0 */
	/* USER CODE BEGIN DebugMonitor_IRQn 1 */

	/* USER CODE END DebugMonitor_IRQn 1 */
}

/**
 * @brief This function handles Pendable request for system service.
 */
void PendSV_Handler(void) {
	/* USER CODE BEGIN PendSV_IRQn 0 */

	/* USER CODE END PendSV_IRQn 0 */
	/* USER CODE BEGIN PendSV_IRQn 1 */

	/* USER CODE END PendSV_IRQn 1 */
}

/**
 * @brief This function handles System tick timer.
 */
void SysTick_Handler(void) {
	/* USER CODE BEGIN SysTick_IRQn 0 */

	/* USER CODE END SysTick_IRQn 0 */

	/* USER CODE BEGIN SysTick_IRQn 1 */

	/* USER CODE END SysTick_IRQn 1 */
}

/******************************************************************************/
/* STM32F4xx Peripheral Interrupt Handlers                                    */
/* Add here the Interrupt Handlers for the used peripherals.                  */
/* For the available peripheral interrupt handler names,                      */
/* please refer to the startup file (startup_stm32f4xx.s).                    */
/******************************************************************************/

/**
 * @brief This function handles ADC1 global interrupt.
 */
void ADC_IRQHandler(void) {
	/* USER CODE BEGIN ADC_IRQn 0 */
	if (LL_ADC_IsActiveFlag_EOCS(ADC1) != RESET) {
		LL_ADC_ClearFlag_EOCS(ADC1);

		/* USER CODE END ADC_IRQn 0 */

		/* USER CODE BEGIN ADC_IRQn 1 */

		/* USER CODE END ADC_IRQn 1 */
	}
}

	/**
	 * @brief This function handles TIM2 global interrupt.
	 */
	void TIM2_IRQHandler(void) {
		/* USER CODE BEGIN TIM2_IRQn 0 */
		if (LL_TIM_IsActiveFlag_CC2(TIM2) != RESET) {
			LL_TIM_ClearFlag_CC2(TIM2);
			LL_TIM_WriteReg(TIM2, CCR2, LL_TIM_ReadReg(TIM2,CCR2)+OCtime2);
			LL_ADC_WriteReg(ADC1, CR2, LL_ADC_ReadReg(ADC1,CR2) | 0x40000000); //start conversion
		}

		/* USER CODE END TIM2_IRQn 0 */
		/* USER CODE BEGIN TIM2_IRQn 1 */

		/* USER CODE END TIM2_IRQn 1 */
	}

	/**
	 * @brief This function handles TIM3 global interrupt.
	 */
	void TIM3_IRQHandler(void) {
		int lettura = LL_ADC_ReadReg(ADC1, DR);
		int delta1 = (OCmax1 - OCmin1) * lettura/ADCmax + OCmin1;
		int delta2 = (OCmax2 - OCmin2) * lettura/ADCmax + OCmin2;
		int delta3 = (OCmax3 - OCmin3) * lettura/ADCmax + OCmin3;

		/* USER CODE BEGIN TIM3_IRQn 0 */
		//channel3
		if (LL_TIM_IsActiveFlag_CC3(TIM3) != RESET) {
			LL_TIM_ClearFlag_CC3(TIM3);
			LL_TIM_WriteReg(TIM3, CCR3, LL_TIM_ReadReg(TIM3,CCR3)+delta3);
		}
		//channel2
		else if (LL_TIM_IsActiveFlag_CC2(TIM3) != RESET) {
			LL_TIM_ClearFlag_CC2(TIM3);
			LL_TIM_WriteReg(TIM3, CCR2, LL_TIM_ReadReg(TIM3,CCR2)+delta2);
		}
		//channel1
		else if (LL_TIM_IsActiveFlag_CC1(TIM3) != RESET) {
			LL_TIM_ClearFlag_CC1(TIM3);
			LL_TIM_WriteReg(TIM3, CCR1, LL_TIM_ReadReg(TIM3,CCR1)+delta1); //update OC
		}
	}

	/**
	 * @brief This function handles EXTI line[15:10] interrupts.
	 */
	void EXTI15_10_IRQHandler(void) {
		/* USER CODE BEGIN EXTI15_10_IRQn 0 */

		/* USER CODE END EXTI15_10_IRQn 0 */
		if (LL_EXTI_IsActiveFlag_0_31(LL_EXTI_LINE_13) != RESET) {
			LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_13);
			/* USER CODE BEGIN LL_EXTI_LINE_13 */
			LL_GPIO_WriteReg(GPIOA, ODR, LL_GPIO_ReadReg(GPIOA, ODR) ^ 0x20);
			/* USER CODE END LL_EXTI_LINE_13 */
		}
		/* USER CODE BEGIN EXTI15_10_IRQn 1 */
	}

		/* USER CODE END EXTI15_10_IRQn 1 */


	/* USER CODE BEGIN 1 */

	/* USER CODE END 1 */
	/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
