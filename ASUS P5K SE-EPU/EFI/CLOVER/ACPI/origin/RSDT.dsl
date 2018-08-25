/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembly of RSDT.aml, Sat Aug 11 13:20:43 2018
 *
 * ACPI Data Table [RSDT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "RSDT"    [Root System Description Table]
[004h 0004   4]                 Table Length : 0000003C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : EA
[00Ah 0010   6]                       Oem ID : "A_M_I_"
[010h 0016   8]                 Oem Table ID : "OEMRSDT "
[018h 0024   4]                 Oem Revision : 10000820
[01Ch 0028   4]              Asl Compiler ID : "MSFT"
[020h 0032   4]        Asl Compiler Revision : 00000097

[024h 0036   4]       ACPI Table Address   0 : BFF80200
[028h 0040   4]       ACPI Table Address   1 : BFF80390
[02Ch 0044   4]       ACPI Table Address   2 : BFF80400
[030h 0048   4]       ACPI Table Address   3 : BFF8E040
[034h 0052   4]       ACPI Table Address   4 : BFF88F00
[038h 0056   4]       ACPI Table Address   5 : BFF88F40

Raw Table Data: Length 60 (0x3C)

  0000: 52 53 44 54 3C 00 00 00 01 EA 41 5F 4D 5F 49 5F  // RSDT<.....A_M_I_
  0010: 4F 45 4D 52 53 44 54 20 20 08 00 10 4D 53 46 54  // OEMRSDT  ...MSFT
  0020: 97 00 00 00 00 02 F8 BF 90 03 F8 BF 00 04 F8 BF  // ................
  0030: 40 E0 F8 BF 00 8F F8 BF 40 8F F8 BF              // @.......@...
