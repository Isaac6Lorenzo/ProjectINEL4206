################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
%.obj: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP430 Compiler'
	"E:/1HardDisk_Programs/Program Files/CCS/ccs/tools/compiler/ti-cgt-msp430_18.12.4.LTS/bin/cl430" -vmsp --code_model=small --data_model=small -Ooff --use_hw_mpy=F5 --include_path="E:/1HardDisk_Programs/Program Files/CCS/ccs/ccs_base/msp430/include" --include_path="C:/Users/Isaac Lorenzo/Documents/WorkSpace CCS PART 2/Examen02_P1" --include_path="E:/1HardDisk_Programs/Program Files/CCS/ccs/tools/compiler/ti-cgt-msp430_18.12.4.LTS/include" --advice:power=all --advice:hw_config=all --define=__MSP430FR2433__ -g --printf_support=minimal --diag_warning=225 --diag_wrap=off --display_error_number --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU40 --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.obj: ../%.asm $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP430 Compiler'
	"E:/1HardDisk_Programs/Program Files/CCS/ccs/tools/compiler/ti-cgt-msp430_18.12.4.LTS/bin/cl430" -vmsp --code_model=small --data_model=small -Ooff --use_hw_mpy=F5 --include_path="E:/1HardDisk_Programs/Program Files/CCS/ccs/ccs_base/msp430/include" --include_path="C:/Users/Isaac Lorenzo/Documents/WorkSpace CCS PART 2/Examen02_P1" --include_path="E:/1HardDisk_Programs/Program Files/CCS/ccs/tools/compiler/ti-cgt-msp430_18.12.4.LTS/include" --advice:power=all --advice:hw_config=all --define=__MSP430FR2433__ -g --printf_support=minimal --diag_warning=225 --diag_wrap=off --display_error_number --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU40 --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


