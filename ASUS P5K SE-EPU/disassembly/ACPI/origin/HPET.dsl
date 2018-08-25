/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembly of HPET.aml, Fri Aug 24 20:49:16 2018
 *
 * ACPI Data Table [HPET]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
[004h 0004   4]                 Table Length : 00000038
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : C2
[00Ah 0010   6]                       Oem ID : "A_M_I_"
[010h 0016   8]                 Oem Table ID : "OEMHPET "
[018h 0024   4]                 Oem Revision : 10000820
[01Ch 0028   4]              Asl Compiler ID : "MSFT"
[020h 0032   4]        Asl Compiler Revision : 00000097

[024h 0036   4]            Hardware Block ID : 8086A301

[028h 0040  12]         Timer Block Register : [Generic Address Structure]
[028h 0040   1]                     Space ID : 00 [SystemMemory]
[029h 0041   1]                    Bit Width : 08
[02Ah 0042   1]                   Bit Offset : 00
[02Bh 0043   1]         Encoded Access Width : 00 [Undefined/Legacy]
[02Ch 0044   8]                      Address : 00000000FED00000

[034h 0052   1]              Sequence Number : 00
[035h 0053   2]          Minimum Clock Ticks : 37EE
[037h 0055   1]        Flags (decoded below) : 00
                             4K Page Protect : 0
                            64K Page Protect : 0

Raw Table Data: Length 56 (0x38)

  0000: 48 50 45 54 38 00 00 00 01 C2 41 5F 4D 5F 49 5F  // HPET8.....A_M_I_
  0010: 4F 45 4D 48 50 45 54 20 20 08 00 10 4D 53 46 54  // OEMHPET  ...MSFT
  0020: 97 00 00 00 01 A3 86 80 00 08 00 00 00 00 D0 FE  // ................
  0030: 00 00 00 00 00 EE 37 00                          // ......7.
