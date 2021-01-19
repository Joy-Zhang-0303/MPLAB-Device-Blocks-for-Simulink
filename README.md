# MPLAB Device Blocks for Simulink

**Microchip official blockset v3.46.064** supporting up to 350 microcontrollers.

MPLAB Device Blocks for Simulink enables Embedded Coder for automated build and execution of real-time executable for any board equipped with a dsPIC :registered:, PIC32 :registered:, SAMx5 or SAMx7 from a Simulink model.

This support package is functional for R2010a and beyond (tested with R2020b).

## Installation

[![View MPLAB Device Blocks for Simulink :dsPIC, PIC32 and SAM mcu on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://fr.mathworks.com/matlabcentral/fileexchange/71892-mplab-device-blocks-for-simulink-dspic-pic32-and-sam-mcu)

Type picclean at matlab prompt to clean-up matlab path from previous installations if any.

1. [download](https://github.com/LubinKerhuel/MPLAB-Device-Blocks-for-Simulink/archive/master.zip) and unzip the package
2. execute the .p installer script . Within Matlab, right click on file install.p and select run.

The MCHP\_example folder is created in the current folder and examples copied into.

Visit the Microchip [blockset forum](https://www.microchip.com/forums/f192.aspx)

<img src="https://github.com/LubinKerhuel/MPLAB-Device-Blocks-for-Simulink/raw/master/mplab-deviceblocksforsimulink-whitebackground.png" width="300">

## Presentation

Peripheral blocks configure and inserts code in the MathWorks generated code by embedded coder. (non-exhaustive peripheral block list: ADC, QEI, PWM, IC, OC, CN, I2C, SPI, UART, Op-Amp, Comparator, DAC...)

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

- MathWorks (from R2010a to R2020b)   
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

## Release notes
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


### Supported MCU

30F2010
30F2011
30F2012
30F3010
30F3011
30F3012
30F3013
30F3014
30F4011
30F4012
30F4013
30F5011
30F5013
30F5015
30F5016
30F6010
30F6011
30F6012
30F6013
30F6014
30F6015
33CH128MP202
33CH128MP202S1
33CH128MP203
33CH128MP203S1
33CH128MP205
33CH128MP205S1
33CH128MP206
33CH128MP206S1
33CH128MP208
33CH128MP208S1
33CH128MP502
33CH128MP502S1
33CH128MP503
33CH128MP503S1
33CH128MP505
33CH128MP505S1
33CH128MP506
33CH128MP506S1
33CH128MP508
33CH128MP508S1
33CH256MP205
33CH256MP205S1
33CH256MP206
33CH256MP206S1
33CH256MP208
33CH256MP208S1
33CH256MP505
33CH256MP505S1
33CH256MP506
33CH256MP506S1
33CH256MP508
33CH256MP508S1
33CH512MP205
33CH512MP205S1
33CH512MP206
33CH512MP206S1
33CH512MP208
33CH512MP208S1
33CH512MP505
33CH512MP505S1
33CH512MP506
33CH512MP506S1
33CH512MP508
33CH512MP508S1
33CH64MP202
33CH64MP202S1
33CH64MP203
33CH64MP203S1
33CH64MP205
33CH64MP205S1
33CH64MP206
33CH64MP206S1
33CH64MP208
33CH64MP208S1
33CH64MP502
33CH64MP502S1
33CH64MP503
33CH64MP503S1
33CH64MP505
33CH64MP505S1
33CH64MP506
33CH64MP506S1
33CH64MP508
33CH64MP508S1
33CK128MP202
33CK128MP203
33CK128MP205
33CK128MP206
33CK128MP208
33CK128MP502
33CK128MP503
33CK128MP505
33CK128MP506
33CK128MP508
33CK256MP202
33CK256MP203
33CK256MP205
33CK256MP206
33CK256MP208
33CK256MP502
33CK256MP503
33CK256MP505
33CK256MP506
33CK256MP508
33CK32MP102
33CK32MP103
33CK32MP105
33CK32MP202
33CK32MP203
33CK32MP205
33CK32MP206
33CK32MP502
33CK32MP503
33CK32MP505
33CK32MP506
33CK64MP102
33CK64MP103
33CK64MP105
33CK64MP202
33CK64MP203
33CK64MP205
33CK64MP206
33CK64MP208
33CK64MP502
33CK64MP503
33CK64MP505
33CK64MP506
33CK64MP508
33EP128GM304
33EP128GM306
33EP128GM310
33EP128GM604
33EP128GM706
33EP128GM710
33EP128GP502
33EP128GP504
33EP128GP506
33EP128GS702
33EP128GS704
33EP128GS705
33EP128GS706
33EP128GS708
33EP128GS804
33EP128GS805
33EP128GS806
33EP128GS808
33EP128MC202
33EP128MC204
33EP128MC206
33EP128MC502
33EP128MC504
33EP128MC506
33EP16GS202
33EP16GS502
33EP16GS504
33EP16GS505
33EP16GS506
33EP256GM304
33EP256GM306
33EP256GM310
33EP256GM604
33EP256GM706
33EP256GM710
33EP256GP502
33EP256GP504
33EP256GP506
33EP256MC202
33EP256MC204
33EP256MC206
33EP256MC502
33EP256MC504
33EP256MC506
33EP256MU806
33EP256MU810
33EP256MU814
33EP32GP502
33EP32GP503
33EP32GP504
33EP32GS202
33EP32GS502
33EP32GS504
33EP32GS505
33EP32GS506
33EP32MC202
33EP32MC203
33EP32MC204
33EP32MC502
33EP32MC503
33EP32MC504
33EP512GM304
33EP512GM306
33EP512GM310
33EP512GM604
33EP512GM706
33EP512GM710
33EP512GP502
33EP512GP504
33EP512GP506
33EP512GP806
33EP512MC202
33EP512MC204
33EP512MC206
33EP512MC502
33EP512MC504
33EP512MC506
33EP512MC806
33EP512MU810
33EP512MU814
33EP64GP502
33EP64GP503
33EP64GP504
33EP64GP506
33EP64GS502
33EP64GS504
33EP64GS505
33EP64GS506
33EP64GS708
33EP64GS804
33EP64GS805
33EP64GS806
33EP64GS808
33EP64MC202
33EP64MC203
33EP64MC204
33EP64MC206
33EP64MC502
33EP64MC503
33EP64MC504
33EP64MC506
33EV128GM002
33EV128GM003
33EV128GM004
33EV128GM006
33EV128GM102
33EV128GM103
33EV128GM104
33EV128GM106
33EV256GM002
33EV256GM003
33EV256GM004
33EV256GM006
33EV256GM102
33EV256GM103
33EV256GM104
33EV256GM106
33EV32GM002
33EV32GM003
33EV32GM004
33EV32GM006
33EV32GM102
33EV32GM103
33EV32GM104
33EV32GM106
33EV64GM002
33EV64GM003
33EV64GM004
33EV64GM006
33EV64GM102
33EV64GM103
33EV64GM104
33EV64GM106
33FJ128GP202
33FJ128GP204
33FJ128GP206
33FJ128GP206A
33FJ128GP306
33FJ128GP306A
33FJ128GP310
33FJ128GP310A
33FJ128GP706
33FJ128GP706A
33FJ128GP708
33FJ128GP708A
33FJ128GP710
33FJ128GP710A
33FJ128GP802
33FJ128GP804
33FJ128MC202
33FJ128MC204
33FJ128MC506
33FJ128MC506A
33FJ128MC510
33FJ128MC510A
33FJ128MC706
33FJ128MC706A
33FJ128MC708
33FJ128MC708A
33FJ128MC710
33FJ128MC710A
33FJ128MC802
33FJ128MC804
33FJ12GP201
33FJ12GP202
33FJ12MC201
33FJ12MC202
33FJ16GP304
33FJ16MC304
33FJ256GP506
33FJ256GP506A
33FJ256GP510
33FJ256GP510A
33FJ256GP710
33FJ256GP710A
33FJ256MC510
33FJ256MC510A
33FJ256MC710
33FJ256MC710A
33FJ32GP202
33FJ32GP204
33FJ32GP302
33FJ32GP304
33FJ32MC202
33FJ32MC204
33FJ32MC302
33FJ32MC304
33FJ64GP202
33FJ64GP204
33FJ64GP206
33FJ64GP206A
33FJ64GP306
33FJ64GP306A
33FJ64GP310
33FJ64GP310A
33FJ64GP706
33FJ64GP706A
33FJ64GP708
33FJ64GP708A
33FJ64GP710
33FJ64GP710A
33FJ64GP802
33FJ64GP804
33FJ64MC202
33FJ64MC204
33FJ64MC506
33FJ64MC506A
33FJ64MC508
33FJ64MC508A
33FJ64MC510
33FJ64MC510A
33FJ64MC706
33FJ64MC706A
33FJ64MC710
33FJ64MC710A
33FJ64MC802
33FJ64MC804
32MK0256GPG048
32MK0256GPG064
32MK0256MCJ048
32MK0256MCJ064
32MK0512GPG048
32MK0512GPG064
32MK0512GPK064
32MK0512GPK100
32MK0512MCF064
32MK0512MCF100
32MK0512MCJ048
32MK0512MCJ064
32MK0512MCM064
32MK0512MCM100
32MK1024GPK064
32MK1024GPK100
32MK1024MCF064
32MK1024MCF100
32MK1024MCM064
32MK1024MCM100
32MZ1024EFG064
32MZ1024EFG100
32MZ1024EFG124
32MZ1024EFG144
32MZ1024EFH064
32MZ1024EFH100
32MZ1024EFH124
32MZ1024EFH144
32MZ1024EFM064
32MZ1024EFM100
32MZ1024EFM124
32MZ1024EFM144
32MZ2048EFG064
32MZ2048EFG100
32MZ2048EFG124
32MZ2048EFG144
32MZ2048EFH064
32MZ2048EFH100
32MZ2048EFH124
32MZ2048EFH144
32MZ2048EFM064
32MZ2048EFM100
32MZ2048EFM124
32MZ2048EFM144
SAMD51G18A - QFN48
SAMD51G19A - QFN48
SAMD51J18A - QFN64
SAMD51J19A - WLCSP64
SAMD51J19A - QFN64
SAMD51J20A - WLCSP64
SAMD51J20A - QFN64
SAMD51N19A - TQFP100
SAMD51N20A - TQFP100
SAMD51P19A - TFBGA120
SAMD51P19A - TQFP128
SAMD51P20A - TFBGA120
SAMD51P20A - TQFP128
SAMD51J19B - TQFP64
SAMD51J20C - WLCSP64
SAME51G18A - QFN48
SAME51G19A - QFN48
SAME51J18A - QFN64
SAME51J19A - QFN64
SAME51J20A - QFN64
SAME51N19A - TQFP100
SAME51N20A - TQFP100
SAME53J18A - QFN64
SAME53J19A - QFN64
SAME53J20A - QFN64
SAME53N19A - TQFP100
SAME53N20A - TQFP100
SAME54N19A - TQFP100
SAME54N20A - TQFP100
SAME54P19A - TFBGA120
SAME54P19A - TQFP128
SAME54P20A - TFBGA120
SAME54P20A - TQFP128
SAME70J19B - LQFP64
SAME70J20B - LQFP64
SAME70J21B - LQFP64
SAME70N19B - TFBGA100
SAME70N19B - LQFP100
SAME70N20B - TFBGA100
SAME70N20B - LQFP100
SAME70N21B - TFBGA100
SAME70N21B - LQFP100
SAME70Q19B - LFBGA144
SAME70Q19B - UFBGA144
SAME70Q19B - LQFP144
SAME70Q20B - LFBGA144
SAME70Q20B - UFBGA144
SAME70Q20B - LQFP144
SAME70Q21B - LFBGA144
SAME70Q21B - UFBGA144
SAME70Q21B - LQFP144
SAMS70J19B - LQFP64
SAMS70J19B - QFN64
SAMS70J20B - LQFP64
SAMS70J20B - QFN64
SAMS70J21B - LQFP64
SAMS70J21B - QFN64
SAMS70N19B - TFBGA100
SAMS70N19B - VFBGA100
SAMS70N19B - LQFP100
SAMS70N20B - TFBGA100
SAMS70N20B - VFBGA100
SAMS70N20B - LQFP100
SAMS70N21B - TFBGA100
SAMS70N21B - VFBGA100
SAMS70N21B - LQFP100
SAMS70Q19B - LFBGA144
SAMS70Q19B - UFBGA144
SAMS70Q19B - LQFP144
SAMS70Q20B - LFBGA144
SAMS70Q20B - UFBGA144
SAMS70Q20B - LQFP144
SAMS70Q21B - LFBGA144
SAMS70Q21B - UFBGA144
SAMS70Q21B - LQFP144
SAMV70J19B - LQFP64
SAMV70J20B - LQFP64
SAMV70N19B - TFBGA100
SAMV70N19B - LQFP100
SAMV70N20B - TFBGA100
SAMV70N20B - LQFP100
SAMV70Q19B - TFBGA144
SAMV70Q19B - LQFP144
SAMV70Q20B - TFBGA144
SAMV70Q20B - LQFP144
SAMV71J19B - LQFP64
SAMV71J20B - LQFP64
SAMV71J21B - LQFP64
SAMV71N19B - TFBGA100
SAMV71N19B - LQFP100
SAMV71N20B - TFBGA100
SAMV71N20B - LQFP100
SAMV71N21B - TFBGA100
SAMV71N21B - LQFP100
SAMV71Q19B - TFBGA144
SAMV71Q19B - LQFP144
SAMV71Q20B - TFBGA144
SAMV71Q20B - LQFP144
SAMV71Q21B - TFBGA144
SAMV71Q21B - LQFP144