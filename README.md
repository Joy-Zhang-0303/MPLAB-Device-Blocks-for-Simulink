# MPLAB Device Blocks for Simulink

MPLAB Device Blocks for Simulink target boards equipped with a dsPIC :registered:, PIC32 :registered:, SAMx2, SAMx5 or SAMx7.

This support package is functional from Matlab R2015a up to current version (R2022a).

## Installation / Update

[![View MPLAB Device Blocks for Simulink :dsPIC, PIC32 and SAM mcu on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://fr.mathworks.com/matlabcentral/fileexchange/71892-mplab-device-blocks-for-simulink-dspic-pic32-and-sam-mcu)

### clean previous installation
You might want to clean previous installation: type picclean at matlab prompt.

### as an add-on 
1. With Matlab add-on feature, search MPLAB Device Block for Simulink. Use "Download Toolbox".
Open the doc at the end of the installation process to check compiler and MPLAB IDE installation (mlx script).

If you used download only, go to the mchp subfolder and run picsetup to set-up matlab path.

### as an independant package

1. Download the zip from mathWorks website, or alternatively from the [github repository](https://github.com/LubinKerhuel/MPLAB-Device-Blocks-for-Simulink/archive/master.zip)
2. unzip and execute the .p installer script. From matlab, right clik on the install.p file and execute.  
The MCHP\_example folder is created in the current folder with a copy of simple examples.

### commands
- picclean: clean-up matlab path from previous installations.
- picsetup: from the mchp sub-folder, re-configure the matlab path if required.

- picInfo('check'): Verify installation of compilers and tool to program chips
- picInfo('examples'): copy example in current working folder
- picInfo('cmd'): list command 

Visit the Microchip [blockset forum](https://www.microchip.com/forums/f192.aspx)

<img src="https://github.com/LubinKerhuel/MPLAB-Device-Blocks-for-Simulink/raw/master/mplab-deviceblocksforsimulink-whitebackground.png" width="150">

## Presentation

Library blocks configure peripherals and inserts code in the MathWorks generated code by embedded coder. (non-exhaustive peripheral block list: ADC, QEI, PWM, IC, OC, CN, I2C, SPI, UART, Op-Amp, Comparator, DAC...)
No embedded programming knowledge is required. The toolbox transforms any board equipped with a supported MCU into a rapid control prototyping tool and enable a model-based design development scheme.

## Features

- Built-in scheduler including single-tasking and multi-tasking option for multi-rate models.
- Advanced configuration of ADC / PWM peripheral enable PMSM motor algorithm where ADC sample time is triggered precisely within a PWM duty-cycle. The time step might also be triggered by end of ADC conversion minimizing delays.
- A custom protocol allows visualizing and recording data through the UART. The custom picgui interface allows plotting using your own matlab script incoming data in real-time. Data log enable further analysis or offline identification and allow to feed a simulation with real data.
- The custom "C function" block allows including your own code if required.

The blockset also support MathWorks features:

- Processor in the loop (PIL)
- External mode.
- Code replacement to benefit from DSP architecture of dsPIC

This version embed a third part tool adding blocks for UAVs projects (GPS, MAVLink, Receiver S.BUS, S.Port and F.Port blocks for dsPIC). Type picInfo to find out how to install the UxV blocks.

## Requirements

- MathWorks (from R2015a to R2020b)   
  - Matlab
  - Simulink
  - Embedded Coder
  - Matlab Coder
  - Simulink Coder  
- Microchip Ide
  - MPLAB X IDE [download](https://www.microchip.com/MPLABX)
- Microchip Compiler: 
  - xc16 compiler for 16 bits devices [download](https://www.microchip.com/xc16) (dsPIC)
  - xc32 compiler for 32 bits devices [download](https://www.microchip.com/xc32) (PIC32, SAMx5, SAMx7)
- Microchip programmer:
  - PicKit4
  - ICD4
  - J-32
  - Snap programmer
  - Real-Ice
  - PicKit3
  - ICD3
  - Microchip kit Embedded programmer (EDBG)
  -  ...

## Forum: https://www.microchip.com/forums/f192.aspx

## Release notes
- v3.50.27
  - added support for dsPIC32MK EFE/EFF/EFK family
  - support SPI on SAMx7 
  - support I2C on SAMx7
  - Fixed I2C for chip with non continuous I2C references (1 2 4 5..)
  - Fixed SPI potential timing issue with fast clock chips (PIC32)
  - added example using custom code to write SAMx FLASH (EEPROM emulator)
  - Add Timers functionality on SAMx chips
  - Improved PIL support with Test Harness
  - Fixed Low priority interrupt with PIC32MZ that might trig an exception
- v3.50.26
  - fixed SPI code not generated with PIC32
- v3.50.25
  - PIL: Added support for PIL Top-Model and PIL Referenced Model approach  
- v3.50.24
  - Added dsPIC CK 128 & 256
  - Fixed code Replacement for dsPIC not compiling in debug mode -O0 option
  - PIC32 ADC High Speed SAR fixed channel of class 3 below 32 were handled as class 2 (break compilation)
- v3.50.23
  - missing file for Code Replacement for the dsPIC atan2 function 
- v3.50.22
  - Improved PIL on Linux
  - Fixed issue on SAMx7 when analog port is used and no othet peripheral used the same port (Letter)
  - Fixed SPI & I2C peripheral block, broken with SAMx2 and SAMX5.
  - Complete support for dsPIC CK MC
  - dsPIC Improved Code Replacement accuracy. Fix one typo preventing compilation in rare cases
  - dsPIC, Code replaced (sin, cos, atan2) works with revolution unit, not limited to radian.
- v3.50.20
  - Updated datasheet block to locate pdf from Microchip website
  - Fixed dsPIC Optimized assembly code issue resulting in wrong output with XC16 v2.00 set with -Ox optimization enabled.
  - Fixed Idle task call to math function not compiling  
  - Fixed SAMx7 analog pin configuration that might have a bias due to internal peripheral connection
  - Improve compatibility with protected IP submodel
  - Improved PIl support
  - Experimental support for dsPIC CK MC
- v5.50.19
  - Programming interface updated. Extend number of kit programmed from matlab (use latest MPLAB X version. current release is 6.0.0)
  - PIL target initialisation code improved. Fixed possible code issue with initialisation function signature mismatch
  - PIL UART interface compatible with USB-COM port available on kits. Enabling host data flow control
- v5.50.18
  - SAMx7: Fixed USART generated code typo with interrupt implementation
  - dsPIC CK: Fixed Change Notification User Interrupt triggered twice
  - Improved UART block User Interface 
  - SAMx7: Add Fuse configuration ensuring Fuse get programmed
  - SAMx7:  Disable ICE functions on PORT B when pin is used for another purpose
  - SAMx: Add compilation of intermediate model (library)
  - Add PIL and External Mode example for Xplained Ultra board
  - Update Installer
- v3.50.17:
  - Fixed programming not working form Linux (issue from 3.50.16)
  - Update installer. Simplify installation as an add-on.
- v3.50.16:  
  - C Function Call: fixed issue breaking simulink datatype class settings
  - Matlab R2021b: code generator report not showing-up. Renamed compilation from .X to _X
  - Improving DFP & CMSIS search script
  - SAMx7 ADC: remove pull-up on analog chanels
  - SAMx5 UART: add distinct priority for Tx & Rx
  - SAMx5 UART: some baudrate setting were not working (no output)
  - SAMx: removed register keyword wich might cause issue at compilation
  - dsPIC PWM FEP: not working wheh channel 1 were not used
  - dsPIC with dual core: always re-compile Main model code required.
  - dsPIC: fixed code generated issue with SPI peripheral
  - dsPIC: remove default fuse set for Brown Out reset
  - dsPIC: fixed short double setting in MPLAB X project
  - Improved MPLAB X project creation
  - External mode: Add XCP protocol option (experimental)  
- v3.50.13:
  - dsPIC CH (dual core): Fixed Main/Secondary Interface. MSI Fuse not configured
- v3.50.12:
  - SAMx: Fixed Link Time Optimizer incorrect syntax 
  - SAMx: Added CAN example for SAMx7
  - SAMx: Optimized DCache update
  - SAMx7: Fixed typo on UART Tx when set with DMA & single buffer   
- v3.50.11:
  - Improved robustness for long or special path with Windows & Linux
  - SAMx7 QDEC peripheral: added Index edge option
- v3.50.10:
  - dsPIC CH update Slave->Secondary call convention for XC16 1.70
- v3.50.09:
  - Fixed Watch dog not Disabled for some (ds)PIC chips reseting after few seconds.
  - Updated PIL & External mode for dsPIC with R2020b + updated example with dsPIC33CK Curiosity board
  - Fixed SAMx7 AFEC (ADC) possible issue with channel inversion (wrong block outputs)
  - SAMx7 improved library inclusion in MPLAB X project 
- v3.50.08:
  - Added SPI & I2C Support for SAMx2 & SAMx5
  - picflash issue when multiple MPLAB X above v5.45 installed
  - SAMx5 Number of UART listed might be incorrect
  - SAMx5 ADC Time Step Trigger Parameters lost when model is saved
  - SAMx Improved performance by removing some instruction barriere (DSP & ISB)
  - dsPIC ADC HS SAR Fractional mode : typo prevent compilation.
- v3.50.07:
	- SAMx5 & SAMx7 Busy flag (for CPU load measurement ) stuck to 1 after short period of time
	- SAMx chip: Add CMSIS DSP librar to MPLAB X project when using CRL (Required Mathworks Support Package for ARM Cortex-M)
	- SAMx7 PWM event set to instant 0 had no effect
	- SAMx7 ADC: Fixes on AFEC 1 behaviour (not working when used without AFEC0, Issue with triggering time step when used with AFEC 0)
- v3.50.06:
	- dsPIC 33FJxxGS had incorrect fuse option name (compilation break)
	- Internal error might cause incorrect peripheral behaviour  with blocks supporting multiple instantiation
	- Fixed issue introduced with 3.50.04 that break compilation of model embedding a model reference block (sub-model)
- v3.50.05:
	- DFP & CMSIS DSP library search path not proposing newly installed package/library
	  Linux: CMSIS DSP lib failed at compilation time
	- MPLAB X project not created (R2020b, SAMx7)
- v3.50.04: 
	- Added SAMx7 PWM Override block
	- SAMx Peripheral Port mapping issue when a peripheral set-up several time the same pin (i.e. ADC multiple conversion of the same input pin on SAMx7)
	- Fixed issue with MW environment block Sim/CodeGen for mixed model (simulation & code generation) (update)
- v3.50.03: 
	- Fixed issue with MW environment block Sim/CodeGen for mixed model (simulation & code generation)
- v3.50.02:
	- Fixed CMSIS DSP Library possibly added with incorrect path for SAMx5 & SAMx2
	- Enabled  CMSIS DSP library link option
	- Fixed SAMx7 PWM1 trigger not set on ADC depending on PWM0 and on blocks PWM0/1 execution order
- v3.50.01:
	- Fixed UART DMA Tx implementation for SAMx7

- v3.50
   - Support SAM C2x / D2x / DA1  
   - SAMx5 ADC: Multiple conversion per ADC, Trig ADC, Synchronize with Time Step, initialize with NVM factory calibration.
   - SAMx5 QDEC: Add further options and simplify GUI.     
   - Linux support (except PIL & External Mode)
   - dsPIC Code Replacement fixed on R2021a 
   - dSPIC CH/CK fixed issue on PWM HS for noncontiguous channel setup. Duty cycle block input swapped (Ch1-Ch3)
   - CHANGE BEHAVIOUR !! SAMx7 PWM: Dead Time initial value were divided by 2. (1us on GUI set 0.5us on board)  
   - Issue if no CMSIS installed
   - Improved Simulink compiler option set in MPLAB project created.
   - Improve doc block ability to locate online chip datasheet
   - picgui update

- v3.49.02
  - PWM HS FEP fixed several issues
  - programming interface update. overall speed improvement
  - Support Seeger programming hardware (J-32 / J flash Seeger driver)
  - ...
- v3.49.01:
  - Fixed PIL issue with dsPIC / R2018b

- v3.49:
  - Updated External-Mode & PIL. Added examples
  - SAMx scheduler robust to overload
  - PICGUI: data visualisation run in background  
  - MPLAB X project creation is more robust
  - dsPIC UART Driver update (typo fixed, robust in idle tasks sending data) 
  - dsPIC EV watch dog setting fixed
  - Task State block fixed pin settinf for SAMx
  - Update makefile with R2020b template
  - dsPIC 30f default fuse value is not 1 by default. Write all fuses
  - dsPIC CK/CH fixed code replacement FastMemCpy implementation
  - dsPIC CCPx timer typo for some blocks that use timer
  - Updated PIC32 IPL switch function
- v3.48: 
  - Added SPI & I2C for SAMx5 family  
  - ADC for SAMx5: fixed AIN0 channel input not working 
  - Added support for 64 bit MPLAB X Ide (v5.45 and above)
  - Fixed I2C & SPI register names for some dsPICs (EV, FJ)  
  - dsPIC Change Notification / Input Capture: Fixed GUI Error when copy-past block to a model with a different chip
  - Relaxed conditions triggering SINCOS Code Replacement.    
- v3.47.00:
  - Added SPI support for dsPIC GS, CH, CK
  - Fixed pin mapping inconsistency on dualcore dsPIC for Secondary Core
  - Fixed generic issue with former Matlab release 
  - Fixed MPLAB X project creation with R2019a
- v3.46.064:
  - Improved SAMx5 support. Added SPI support
  - Fixed issue with dual core dsPIC support. Renamed core appelation with Main and Secondary.
  - Fixed MPLAB X project not created with R2020b
  - Added PIC32 GPK MCG and GPG
- v3.46.063:
  - Support for SAMx5 familly
  - Fixed search issue for recent XC compilers
  - Support external CMSIS and DFP packages
  - Renamed scripts pad and padr to picgui.pad/padr (Conflict with MathWorks scripts on recent versions)  
- v3.46.05:
  - Fixed compiling issue when using a model reference block (compiling submodel as a library)
- v3.46.04:
  - PIC32: Extend limited choice for output pin function (Pin mapping)
- v3.46.03:
  - fixed Java related issue with programmer interface
- v3.46.02:
  - SPI fixed DMA support for PIC32. Added 8 bit mode with DMA enabled for dsPIC
- v3.46.01:
  - Programmer interface (Java might not be found)
  - SAMx7 chip issues with doc block ; MPLAB X project
  - Installer script propose old installation method (might fix add-ons issues related to user permissions in classroom/lab configuration)
- v3.46.00:
  - Added support for dual core dsPIC CH

- v3.45.05:
  - Fixed QEI typo in generated code (PIC32MK)
  - fixed SPI typo affecting slave mode (PIC32)
- v3.45.04:
  - Fixed possible issue with MPLAB X project creation with model targeting PIC32
  - Fixed Typo on Timer code generator for PIC32 (project not compiling when problem occurs)
  - Added an External Mode example for PIC32MZ + minor update on other example and script compiling all models
- v3.45.03:
  - Fixed wrong heap linker flag at command line for PIC32 when using Compiler Option block  
  - Fixed PIL and External Mode GUI not showing the model UART block settings.
- v3.45.02: 
  - Added IPE or MDB choice for programming (previously automatically selected)
  - Added support for comparator for dsPIC33FJxxMC 02/06
  - Added support for SNAP and PICKIT 4 programmer with MDB interface
  - Removed files generated by programmer interface (MDB or IPE) in working folder.
  - Fixed some issue with SAMx70 and SAMx71 family
  - Reduced Wait State for SAMV
  - Updated motor example for SAME70 PIM with MCLV2 board
  - Added missing dsPIC33CK
  - Improved compatibility with Matlab R2010a
  - Extended block GUI text fields which can evaluate workspace variables
  - UxV toolbox: improved compatibility with R2010a


### Supported MCUs (568)
- **dsPIC30F**
  - 30F2010
  - 30F2011
  - 30F2012
  - 30F3010
  - 30F3011
  - 30F3012
  - 30F3013
  - 30F3014
  - 30F4011
  - 30F4012
  - 30F4013
  - 30F5011
  - 30F5013
  - 30F5015
  - 30F5016
  - 30F6010
  - 30F6011
  - 30F6012
  - 30F6013
  - 30F6014
  - 30F6015
- **PIC32MK GPG**
  - 32MK0256GPG048
  - 32MK0256GPG064
  - 32MK0512GPG048
  - 32MK0512GPG064
- **PIC32MK MCJ**
  - 32MK0256MCJ048
  - 32MK0256MCJ064
  - 32MK0512MCJ048
  - 32MK0512MCJ064
- **PIC32MK GPK**
  - 32MK0512GPK064
  - 32MK0512GPK100
  - 32MK1024GPK064
  - 32MK1024GPK100
- **PIC32MK MCF**
  - 32MK0512MCF064
  - 32MK0512MCF100
  - 32MK1024MCF064
  - 32MK1024MCF100
- **PIC32MK MCM**
  - 32MK0512MCM064
  - 32MK0512MCM100
  - 32MK1024MCM064
  - 32MK1024MCM100
- **PIC32MZ EFE**
  - 32MZ0512EFE064
  - 32MZ0512EFE100
  - 32MZ0512EFE124
  - 32MZ0512EFE144
  - 32MZ1024EFE064
  - 32MZ1024EFE100
  - 32MZ1024EFE124
  - 32MZ1024EFE144
- **PIC32MZ EFF**
  - 32MZ0512EFF064
  - 32MZ0512EFF100
  - 32MZ0512EFF124
  - 32MZ0512EFF144
  - 32MZ1024EFF064
  - 32MZ1024EFF100
  - 32MZ1024EFF124
  - 32MZ1024EFF144
- **PIC32MZ EFK**
  - 32MZ0512EFK064
  - 32MZ0512EFK100
  - 32MZ0512EFK124
  - 32MZ0512EFK144
  - 32MZ1024EFK064
  - 32MZ1024EFK100
  - 32MZ1024EFK124
  - 32MZ1024EFK144
- **PIC32MZ EFG**
  - 32MZ1024EFG064
  - 32MZ1024EFG100
  - 32MZ1024EFG124
  - 32MZ1024EFG144
  - 32MZ2048EFG064
  - 32MZ2048EFG100
  - 32MZ2048EFG124
  - 32MZ2048EFG144
- **PIC32MZ EFH**
  - 32MZ1024EFH064
  - 32MZ1024EFH100
  - 32MZ1024EFH124
  - 32MZ1024EFH144
  - 32MZ2048EFH064
  - 32MZ2048EFH100
  - 32MZ2048EFH124
  - 32MZ2048EFH144
- **PIC32MZ EFM**
  - 32MZ1024EFM064
  - 32MZ1024EFM100
  - 32MZ1024EFM124
  - 32MZ1024EFM144
  - 32MZ2048EFM064
  - 32MZ2048EFM100
  - 32MZ2048EFM124
  - 32MZ2048EFM144
- **dsPIC33CH MP**
  - 33CH128MP202
  - 33CH128MP203
  - 33CH128MP205
  - 33CH128MP206
  - 33CH128MP208
  - 33CH128MP502
  - 33CH128MP503
  - 33CH128MP505
  - 33CH128MP506
  - 33CH128MP508
  - 33CH256MP205
  - 33CH256MP206
  - 33CH256MP208
  - 33CH256MP218
  - 33CH256MP505
  - 33CH256MP506
  - 33CH256MP508
  - 33CH512MP205
  - 33CH512MP206
  - 33CH512MP208
  - 33CH512MP505
  - 33CH512MP506
  - 33CH512MP508
  - 33CH64MP202
  - 33CH64MP203
  - 33CH64MP205
  - 33CH64MP206
  - 33CH64MP208
  - 33CH64MP502
  - 33CH64MP503
  - 33CH64MP505
  - 33CH64MP506
  - 33CH64MP508
- **dsPIC33CK MC**
  - 33CK128MC102
  - 33CK128MC103
  - 33CK128MC105
  - 33CK128MC106
  - 33CK128MC502
  - 33CK128MC503
  - 33CK128MC505
  - 33CK128MC506
  - 33CK256MC102
  - 33CK256MC103
  - 33CK256MC105
  - 33CK256MC106
  - 33CK256MC502
  - 33CK256MC503
  - 33CK256MC505
  - 33CK256MC506
  - 33CK32MC102
  - 33CK32MC103
  - 33CK32MC105
  - 33CK64MC102
  - 33CK64MC103
  - 33CK64MC105
- **dsPIC33CK MP**
  - 33CK128MP202
  - 33CK128MP203
  - 33CK128MP205
  - 33CK128MP206
  - 33CK128MP208
  - 33CK128MP502
  - 33CK128MP503
  - 33CK128MP505
  - 33CK128MP506
  - 33CK128MP508
  - 33CK256MP202
  - 33CK256MP203
  - 33CK256MP205
  - 33CK256MP206
  - 33CK256MP208
  - 33CK256MP305
  - 33CK256MP306
  - 33CK256MP308
  - 33CK256MP502
  - 33CK256MP503
  - 33CK256MP505
  - 33CK256MP506
  - 33CK256MP508
  - 33CK256MP605
  - 33CK256MP606
  - 33CK256MP608
  - 33CK32MP102
  - 33CK32MP103
  - 33CK32MP105
  - 33CK32MP202
  - 33CK32MP203
  - 33CK32MP205
  - 33CK32MP206
  - 33CK32MP502
  - 33CK32MP503
  - 33CK32MP505
  - 33CK32MP506
  - 33CK512MP305
  - 33CK512MP306
  - 33CK512MP308
  - 33CK512MP605
  - 33CK512MP606
  - 33CK512MP608
  - 33CK64MP102
  - 33CK64MP103
  - 33CK64MP105
  - 33CK64MP202
  - 33CK64MP203
  - 33CK64MP205
  - 33CK64MP206
  - 33CK64MP208
  - 33CK64MP502
  - 33CK64MP503
  - 33CK64MP505
  - 33CK64MP506
  - 33CK64MP508
- **dsPIC33EP GM**
  - 33EP128GM304
  - 33EP128GM306
  - 33EP128GM310
  - 33EP128GM604
  - 33EP128GM706
  - 33EP128GM710
  - 33EP256GM304
  - 33EP256GM306
  - 33EP256GM310
  - 33EP256GM604
  - 33EP256GM706
  - 33EP256GM710
  - 33EP512GM304
  - 33EP512GM306
  - 33EP512GM310
  - 33EP512GM604
  - 33EP512GM706
  - 33EP512GM710
- **dsPIC33EP GP**
  - 33EP128GP502
  - 33EP128GP504
  - 33EP128GP506
  - 33EP256GP502
  - 33EP256GP504
  - 33EP256GP506
  - 33EP32GP502
  - 33EP32GP503
  - 33EP32GP504
  - 33EP512GP502
  - 33EP512GP504
  - 33EP512GP506
  - 33EP512GP806
  - 33EP64GP502
  - 33EP64GP503
  - 33EP64GP504
  - 33EP64GP506
- **dsPIC33EP GS**
  - 33EP128GS702
  - 33EP128GS704
  - 33EP128GS705
  - 33EP128GS706
  - 33EP128GS708
  - 33EP128GS804
  - 33EP128GS805
  - 33EP128GS806
  - 33EP128GS808
  - 33EP16GS202
  - 33EP16GS502
  - 33EP16GS504
  - 33EP16GS505
  - 33EP16GS506
  - 33EP32GS202
  - 33EP32GS502
  - 33EP32GS504
  - 33EP32GS505
  - 33EP32GS506
  - 33EP64GS502
  - 33EP64GS504
  - 33EP64GS505
  - 33EP64GS506
  - 33EP64GS708
  - 33EP64GS804
  - 33EP64GS805
  - 33EP64GS806
  - 33EP64GS808
- **dsPIC33EP MC**
  - 33EP128MC202
  - 33EP128MC204
  - 33EP128MC206
  - 33EP128MC502
  - 33EP128MC504
  - 33EP128MC506
  - 33EP256MC202
  - 33EP256MC204
  - 33EP256MC206
  - 33EP256MC502
  - 33EP256MC504
  - 33EP256MC506
  - 33EP32MC202
  - 33EP32MC203
  - 33EP32MC204
  - 33EP32MC502
  - 33EP32MC503
  - 33EP32MC504
  - 33EP512MC202
  - 33EP512MC204
  - 33EP512MC206
  - 33EP512MC502
  - 33EP512MC504
  - 33EP512MC506
  - 33EP512MC806
  - 33EP64MC202
  - 33EP64MC203
  - 33EP64MC204
  - 33EP64MC206
  - 33EP64MC502
  - 33EP64MC503
  - 33EP64MC504
  - 33EP64MC506
- **dsPIC33EP MU**
  - 33EP256MU806
  - 33EP256MU810
  - 33EP256MU814
  - 33EP512MU810
  - 33EP512MU814
- **dsPIC33EV GM**
  - 33EV128GM002
  - 33EV128GM003
  - 33EV128GM004
  - 33EV128GM006
  - 33EV128GM102
  - 33EV128GM103
  - 33EV128GM104
  - 33EV128GM106
  - 33EV256GM002
  - 33EV256GM003
  - 33EV256GM004
  - 33EV256GM006
  - 33EV256GM102
  - 33EV256GM103
  - 33EV256GM104
  - 33EV256GM106
  - 33EV32GM002
  - 33EV32GM003
  - 33EV32GM004
  - 33EV32GM006
  - 33EV32GM102
  - 33EV32GM103
  - 33EV32GM104
  - 33EV32GM106
  - 33EV64GM002
  - 33EV64GM003
  - 33EV64GM004
  - 33EV64GM006
  - 33EV64GM102
  - 33EV64GM103
  - 33EV64GM104
  - 33EV64GM106
- **dsPIC33FJ GP**
  - 33FJ128GP202
  - 33FJ128GP204
  - 33FJ128GP206
  - 33FJ128GP206A
  - 33FJ128GP306
  - 33FJ128GP306A
  - 33FJ128GP310
  - 33FJ128GP310A
  - 33FJ128GP706
  - 33FJ128GP706A
  - 33FJ128GP708
  - 33FJ128GP708A
  - 33FJ128GP710
  - 33FJ128GP710A
  - 33FJ128GP802
  - 33FJ128GP804
  - 33FJ12GP201
  - 33FJ12GP202
  - 33FJ16GP304
  - 33FJ256GP506
  - 33FJ256GP506A
  - 33FJ256GP510
  - 33FJ256GP510A
  - 33FJ256GP710
  - 33FJ256GP710A
  - 33FJ32GP202
  - 33FJ32GP204
  - 33FJ32GP302
  - 33FJ32GP304
  - 33FJ64GP202
  - 33FJ64GP204
  - 33FJ64GP206
  - 33FJ64GP206A
  - 33FJ64GP306
  - 33FJ64GP306A
  - 33FJ64GP310
  - 33FJ64GP310A
  - 33FJ64GP706
  - 33FJ64GP706A
  - 33FJ64GP708
  - 33FJ64GP708A
  - 33FJ64GP710
  - 33FJ64GP710A
  - 33FJ64GP802
  - 33FJ64GP804
- **dsPIC33FJ MC**
  - 33FJ128MC202
  - 33FJ128MC204
  - 33FJ128MC506
  - 33FJ128MC506A
  - 33FJ128MC510
  - 33FJ128MC510A
  - 33FJ128MC706
  - 33FJ128MC706A
  - 33FJ128MC708
  - 33FJ128MC708A
  - 33FJ128MC710
  - 33FJ128MC710A
  - 33FJ128MC802
  - 33FJ128MC804
  - 33FJ12MC201
  - 33FJ12MC202
  - 33FJ16MC304
  - 33FJ256MC510
  - 33FJ256MC510A
  - 33FJ256MC710
  - 33FJ256MC710A
  - 33FJ32MC202
  - 33FJ32MC204
  - 33FJ32MC302
  - 33FJ32MC304
  - 33FJ64MC202
  - 33FJ64MC204
  - 33FJ64MC506
  - 33FJ64MC506A
  - 33FJ64MC508
  - 33FJ64MC508A
  - 33FJ64MC510
  - 33FJ64MC510A
  - 33FJ64MC706
  - 33FJ64MC706A
  - 33FJ64MC710
  - 33FJ64MC710A
  - 33FJ64MC802
  - 33FJ64MC804
- **PIC32**
  - PIC32CM1216MC00032
  - PIC32CM1216MC00048
  - PIC32CM6408MC00032
  - PIC32CM6408MC00048
- **SAMC20**
  - SAMC20E15A
  - SAMC20E16A
  - SAMC20E17A
  - SAMC20E18A
  - SAMC20G15A
  - SAMC20G16A
  - SAMC20G17A
  - SAMC20G18A
  - SAMC20J15A
  - SAMC20J16A
  - SAMC20J17A
  - SAMC20J17AU
  - SAMC20J18A
  - SAMC20J18AU
  - SAMC20N17A
  - SAMC20N18A
- **SAMC21**
  - SAMC21E15A
  - SAMC21E16A
  - SAMC21E17A
  - SAMC21E18A
  - SAMC21G15A
  - SAMC21G16A
  - SAMC21G17A
  - SAMC21G18A
  - SAMC21J15A
  - SAMC21J16A
  - SAMC21J17A
  - SAMC21J17AU
  - SAMC21J18A
  - SAMC21J18AU
  - SAMC21N17A
  - SAMC21N18A
- **SAMD20**
  - SAMD20E14
  - SAMD20E14B
  - SAMD20E15
  - SAMD20E15B
  - SAMD20E15BU
  - SAMD20E16
  - SAMD20E16B
  - SAMD20E16BU
  - SAMD20E17
  - SAMD20E18
  - SAMD20E1F
  - SAMD20G14
  - SAMD20G14B
  - SAMD20G15
  - SAMD20G15B
  - SAMD20G16
  - SAMD20G16B
  - SAMD20G17
  - SAMD20G17U
  - SAMD20G18
  - SAMD20G18U
  - SAMD20J14
  - SAMD20J14B
  - SAMD20J15
  - SAMD20J15B
  - SAMD20J16
  - SAMD20J16B
  - SAMD20J17
  - SAMD20J18
- **SAMD21**
  - SAMD21E15A
  - SAMD21E15B
  - SAMD21E15BU
  - SAMD21E15CU
  - SAMD21E15L
  - SAMD21E16A
  - SAMD21E16B
  - SAMD21E16BU
  - SAMD21E16CU
  - SAMD21E16L
  - SAMD21E17A
  - SAMD21E17D
  - SAMD21E17DU
  - SAMD21E17L
  - SAMD21E18A
  - SAMD21F17L
  - SAMD21G15A
  - SAMD21G15B
  - SAMD21G15L
  - SAMD21G16A
  - SAMD21G16B
  - SAMD21G16L
  - SAMD21G17A
  - SAMD21G17AU
  - SAMD21G17D
  - SAMD21G17L
  - SAMD21G18A
  - SAMD21G18AU
  - SAMD21J15A
  - SAMD21J15B
  - SAMD21J16A
  - SAMD21J16B
  - SAMD21J17A
  - SAMD21J17D
  - SAMD21J18A
- **SAME51**
  - SAME51G18A
  - SAME51G19A
  - SAME51J18A
  - SAME51J19A
  - SAME51J20A
  - SAME51N19A
  - SAME51N20A
- **SAME53**
  - SAME53J18A
  - SAME53J19A
  - SAME53J20A
  - SAME53N19A
  - SAME53N20A
- **SAME54**
  - SAME54N19A
  - SAME54N20A
  - SAME54P19A
  - SAME54P20A
- **SAME70**
  - SAME70J19B
  - SAME70J20B
  - SAME70J21B
  - SAME70N19B
  - SAME70N20B
  - SAME70N21B
  - SAME70Q19B
  - SAME70Q20B
  - SAME70Q21B
- **SAMRH71**
  - SAMRH71F20B
  - SAMRH71F20C
- **SAMS70**
  - SAMS70J19B
  - SAMS70J20B
  - SAMS70J21B
  - SAMS70N19B
  - SAMS70N20B
  - SAMS70N21B
  - SAMS70Q19B
  - SAMS70Q20B
  - SAMS70Q21B
- **SAMV70**
  - SAMV70J19B
  - SAMV70J20B
  - SAMV70N19B
  - SAMV70N20B
  - SAMV70Q19B
  - SAMV70Q20B
- **SAMV71**
  - SAMV71J19B
  - SAMV71J20B
  - SAMV71J21B
  - SAMV71N19B
  - SAMV71N20B
  - SAMV71N21B
  - SAMV71Q19B
  - SAMV71Q20B
  - SAMV71Q21B
