/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembly of FACP.aml, Fri Aug 24 20:49:16 2018
 *
 * ACPI Data Table [FACP]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
[004h 0004   4]                 Table Length : 00000084
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : EE
[00Ah 0010   6]                       Oem ID : "A_M_I_"
[010h 0016   8]                 Oem Table ID : "OEMFACP "
[018h 0024   4]                 Oem Revision : 10000820
[01Ch 0028   4]              Asl Compiler ID : "MSFT"
[020h 0032   4]        Asl Compiler Revision : 00000097

[024h 0036   4]                 FACS Address : BFF8E000
[028h 0040   4]                 DSDT Address : BFF805C0
[02Ch 0044   1]                        Model : 01
[02Dh 0045   1]                   PM Profile : 00 [Unspecified]
[02Eh 0046   2]                SCI Interrupt : 0009
[030h 0048   4]             SMI Command Port : 000000B2
[034h 0052   1]            ACPI Enable Value : E1
[035h 0053   1]           ACPI Disable Value : 1E
[036h 0054   1]               S4BIOS Command : 00
[037h 0055   1]              P-State Control : E2
[038h 0056   4]     PM1A Event Block Address : 00000800
[03Ch 0060   4]     PM1B Event Block Address : 00000000
[040h 0064   4]   PM1A Control Block Address : 00000804
[044h 0068   4]   PM1B Control Block Address : 00000000
[048h 0072   4]    PM2 Control Block Address : 00000000
[04Ch 0076   4]       PM Timer Block Address : 00000808
[050h 0080   4]           GPE0 Block Address : 00000820
[054h 0084   4]           GPE1 Block Address : 00000000
[058h 0088   1]       PM1 Event Block Length : 04
[059h 0089   1]     PM1 Control Block Length : 02
[05Ah 0090   1]     PM2 Control Block Length : 00
[05Bh 0091   1]        PM Timer Block Length : 04
[05Ch 0092   1]            GPE0 Block Length : 10
[05Dh 0093   1]            GPE1 Block Length : 00
[05Eh 0094   1]             GPE1 Base Offset : 00
[05Fh 0095   1]                 _CST Support : E3
[060h 0096   2]                   C2 Latency : 0065
[062h 0098   2]                   C3 Latency : 03E9
[064h 0100   2]               CPU Cache Size : 0400
[066h 0102   2]           Cache Flush Stride : 0010
[068h 0104   1]            Duty Cycle Offset : 01
[069h 0105   1]             Duty Cycle Width : 00
[06Ah 0106   1]          RTC Day Alarm Index : 0D
[06Bh 0107   1]        RTC Month Alarm Index : 00
[06Ch 0108   1]            RTC Century Index : 32
[06Dh 0109   2]   Boot Flags (decoded below) : 0003
               Legacy Devices Supported (V2) : 1
            8042 Present on ports 60/64 (V2) : 1
                        VGA Not Present (V4) : 0
                      MSI Not Supported (V4) : 0
                PCIe ASPM Not Supported (V4) : 0
                   CMOS RTC Not Present (V5) : 0
[06Fh 0111   1]                     Reserved : 00
[070h 0112   4]        Flags (decoded below) : 000000A5
      WBINVD instruction is operational (V1) : 1
              WBINVD flushes all caches (V1) : 0
                    All CPUs support C1 (V1) : 1
                  C2 works on MP system (V1) : 0
            Control Method Power Button (V1) : 0
            Control Method Sleep Button (V1) : 1
        RTC wake not in fixed reg space (V1) : 0
            RTC can wake system from S4 (V1) : 1
                        32-bit PM Timer (V1) : 0
                      Docking Supported (V1) : 0
               Reset Register Supported (V2) : 0
                            Sealed Case (V3) : 0
                    Headless - No Video (V3) : 0
        Use native instr after SLP_TYPx (V3) : 0
              PCIEXP_WAK Bits Supported (V4) : 0
                     Use Platform Timer (V4) : 0
               RTC_STS valid on S4 wake (V4) : 0
                Remote Power-on capable (V4) : 0
                 Use APIC Cluster Model (V4) : 0
     Use APIC Physical Destination Mode (V4) : 0
                       Hardware Reduced (V5) : 0
                      Low Power S0 Idle (V5) : 0

[074h 0116  12]               Reset Register : [Generic Address Structure]
[074h 0116   1]                     Space ID : 01 [SystemIO]
[075h 0117   1]                    Bit Width : 08
[076h 0118   1]                   Bit Offset : 00
[077h 0119   1]         Encoded Access Width : 00 [Undefined/Legacy]
[078h 0120   8]                      Address : 0000000000000CF9

[080h 0128   1]         Value to cause reset : 06
[081h 0129   2]                     Reserved : 0000
[083h 0131   1]                     Reserved : 00

Raw Table Data: Length 132 (0x84)

  0000: 46 41 43 50 84 00 00 00 02 EE 41 5F 4D 5F 49 5F  // FACP......A_M_I_
  0010: 4F 45 4D 46 41 43 50 20 20 08 00 10 4D 53 46 54  // OEMFACP  ...MSFT
  0020: 97 00 00 00 00 E0 F8 BF C0 05 F8 BF 01 00 09 00  // ................
  0030: B2 00 00 00 E1 1E 00 E2 00 08 00 00 00 00 00 00  // ................
  0040: 04 08 00 00 00 00 00 00 00 00 00 00 08 08 00 00  // ................
  0050: 20 08 00 00 00 00 00 00 04 02 00 04 10 00 00 E3  //  ...............
  0060: 65 00 E9 03 00 04 10 00 01 00 0D 00 32 03 00 00  // e...........2...
  0070: A5 00 00 00 01 08 00 00 F9 0C 00 00 00 00 00 00  // ................
  0080: 06 00 00 00                                      // ....
