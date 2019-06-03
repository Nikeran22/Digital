################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/main.c \
../Src/stm32f4xx_it.c \
../Src/syscalls.c \
../Src/system_stm32f4xx.c 

OBJS += \
./Src/main.o \
./Src/stm32f4xx_it.o \
./Src/syscalls.o \
./Src/system_stm32f4xx.o 

C_DEPS += \
./Src/main.d \
./Src/stm32f4xx_it.d \
./Src/syscalls.d \
./Src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_FULL_LL_DRIVER '-DHSE_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DEXTERNAL_CLOCK_VALUE=12288000' '-DHSI_VALUE=16000000' '-DLSI_VALUE=32000' '-DVDD_VALUE=3300' '-DPREFETCH_ENABLE=1' '-DINSTRUCTION_CACHE_ENABLE=1' '-DDATA_CACHE_ENABLE=1' '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DSTM32F401xE -I"C:/Users/nikil/Desktop/mydigital/lab9/9.2.3/Inc" -I"C:/Users/nikil/Desktop/mydigital/lab9/9.2.3/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/nikil/Desktop/mydigital/lab9/9.2.3/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Users/nikil/Desktop/mydigital/lab9/9.2.3/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


