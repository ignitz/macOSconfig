/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-0-CB-01.aml, Fri Aug 24 13:57:43 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000006FE (1790)
 *     Revision         0x01
 *     Checksum         0xAF
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    External (DTS1, UnknownObj)    // Warning: Unknown object
    External (DTS2, UnknownObj)    // Warning: Unknown object
    External (DTS3, UnknownObj)    // Warning: Unknown object
    External (DTS4, UnknownObj)    // Warning: Unknown object
    External (PAMT, IntObj)    // Warning: Unknown object
    External (PDTS, UnknownObj)    // Warning: Unknown object

    Scope (\_SB)
    {
        OperationRegion (MAIO, SystemIO, 0xFD61, 0x03)
        Field (MAIO, ByteAcc, NoLock, Preserve)
        {
            MAIN,   16, 
            MADT,   8
        }

        Method (AMBX, 3, Serialized)
        {
            If ((Arg0 == Zero))
            {
                MAIN = Arg1
                Local2 = MADT
                Return (Local2)
            }
            Else
            {
                MAIN = Arg1
                MADT = Arg2
                Local2 = Zero
                Return (Local2)
            }
        }

        Device (PTID)
        {
            Name (_HID, EisaId ("INT340E"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0C02"))  // _CID: Compatible ID
            Name (IVER, 0x00030000)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Name (TSDL, Package (0x0A)
            {
                Zero, 
                "CPU Core 0 DTS", 
                Zero, 
                "CPU Core 1 DTS", 
                Zero, 
                "CPU Core 2 DTS", 
                Zero, 
                "CPU Core 3 DTS", 
                Zero, 
                "CPU Core Package DTS"
            })
            Name (TMPV, Package (0x02)
            {
                Zero, 
                Zero
            })
            Name (PSDL, Package (0x04)
            {
                Zero, 
                "Power 0", 
                Zero, 
                "Power 1"
            })
            Name (PWRV, Package (0x02)
            {
                Zero, 
                Zero
            })
            Name (OSDL, Package (0x06)
            {
                0x04, 
                "Fan RPM", 
                "RPM", 
                0x0C, 
                "Battery Capacity", 
                "mAh"
            })
            Name (OSDV, Package (0x02)
            {
                Zero, 
                Zero
            })
            Method (TSDD, 0, NotSerialized)
            {
                TMPV [Zero] = ((DTS1 * 0x0A) + 0x0AAC)
                TMPV [One] = ((DTS2 * 0x0A) + 0x0AAC)
                TMPV [0x02] = ((DTS3 * 0x0A) + 0x0AAC)
                TMPV [0x03] = ((DTS4 * 0x0A) + 0x0AAC)
                TMPV [0x04] = ((PDTS * 0x0A) + 0x0AAC)
                Return (TMPV)
            }

            Method (PSDD, 0, NotSerialized)
            {
                Return (PWRV)
            }

            Method (OSDD, 0, NotSerialized)
            {
                Return (OSDV)
            }

            Method (SDSP, 0, NotSerialized)
            {
                Return (0x0A)
            }

            Name (PADA, Package (0x0A)
            {
                One, 
                Ones, 
                Ones, 
                0x1A, 
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones
            })
            Name (PADD, Package (0x0A)
            {
                0x02, 
                0x6C, 
                0x68, 
                0x1A, 
                0x62, 
                0x63, 
                0x60, 
                0x61, 
                0x65, 
                0x64
            })
            Method (PADT, 0, NotSerialized)
            {
                If (PAMT)
                {
                    Return (PADA)
                }

                Return (PADD)
            }

            Method (RPMD, 0, NotSerialized)
            {
                Name (MTMP, Buffer (0x1A){})
                Debug = "RPMD"
                Local0 = AMBX (Zero, 0x8AFB, Zero)
                Debug = Local0
                MTMP [0x05] = AMBX (Zero, 0x8BFB, Zero)
                MTMP [0x06] = AMBX (Zero, 0x8CFB, Zero)
                MTMP [0x07] = AMBX (Zero, 0x8DFB, Zero)
                MTMP [0x08] = AMBX (Zero, 0x8EFB, Zero)
                MTMP [0x09] = AMBX (Zero, 0x8FFB, Zero)
                MTMP [0x0A] = AMBX (Zero, 0x90FB, Zero)
                MTMP [0x0B] = AMBX (Zero, 0x91FB, Zero)
                MTMP [0x0C] = AMBX (Zero, 0x92FB, Zero)
                MTMP [0x0D] = AMBX (Zero, 0x93FB, Zero)
                MTMP [0x0E] = AMBX (Zero, 0x94FB, Zero)
                MTMP [0x0F] = AMBX (Zero, 0x95FB, Zero)
                MTMP [0x10] = AMBX (Zero, 0x96FB, Zero)
                MTMP [0x11] = AMBX (Zero, 0x97FB, Zero)
                MTMP [0x12] = AMBX (Zero, 0x98FB, Zero)
                MTMP [0x13] = AMBX (Zero, 0x99FB, Zero)
                MTMP [0x14] = AMBX (Zero, 0x9AFB, Zero)
                MTMP [0x15] = AMBX (Zero, 0x9BFB, Zero)
                MTMP [0x16] = AMBX (Zero, 0x9CFB, Zero)
                MTMP [0x17] = AMBX (Zero, 0x9DFB, Zero)
                MTMP [0x18] = AMBX (Zero, 0x9EFB, Zero)
                MTMP [0x19] = AMBX (Zero, 0x9FFB, Zero)
                MTMP [Zero] = AMBX (Zero, 0x86FB, Zero)
                MTMP [One] = AMBX (Zero, 0x87FB, Zero)
                MTMP [0x02] = AMBX (Zero, 0x88FB, Zero)
                MTMP [0x03] = AMBX (Zero, 0x89FB, Zero)
                Debug = MTMP
                Return (MTMP)
            }

            Method (WPMD, 1, NotSerialized)
            {
                If ((SizeOf (Arg0) != 0x1A))
                {
                    Debug = SizeOf (Arg0)
                    Debug = Arg0
                    Return (Ones)
                }

                Debug = "WPMD"
                Debug = Arg0
                AMBX (One, 0x8AFB, DerefOf (Arg0 [0x04]))
                AMBX (One, 0x8BFB, DerefOf (Arg0 [0x05]))
                AMBX (One, 0x8CFB, DerefOf (Arg0 [0x06]))
                AMBX (One, 0x8DFB, DerefOf (Arg0 [0x07]))
                AMBX (One, 0x8EFB, DerefOf (Arg0 [0x08]))
                AMBX (One, 0x8FFB, DerefOf (Arg0 [0x09]))
                AMBX (One, 0x90FB, DerefOf (Arg0 [0x0A]))
                AMBX (One, 0x91FB, DerefOf (Arg0 [0x0B]))
                AMBX (One, 0x92FB, DerefOf (Arg0 [0x0C]))
                AMBX (One, 0x93FB, DerefOf (Arg0 [0x0D]))
                AMBX (One, 0x94FB, DerefOf (Arg0 [0x0E]))
                AMBX (One, 0x95FB, DerefOf (Arg0 [0x0F]))
                AMBX (One, 0x96FB, DerefOf (Arg0 [0x10]))
                AMBX (One, 0x97FB, DerefOf (Arg0 [0x11]))
                AMBX (One, 0x98FB, DerefOf (Arg0 [0x12]))
                AMBX (One, 0x99FB, DerefOf (Arg0 [0x13]))
                AMBX (One, 0x9AFB, DerefOf (Arg0 [0x14]))
                AMBX (One, 0x9BFB, DerefOf (Arg0 [0x15]))
                AMBX (One, 0x9CFB, DerefOf (Arg0 [0x16]))
                AMBX (One, 0x9DFB, DerefOf (Arg0 [0x17]))
                AMBX (One, 0x9EFB, DerefOf (Arg0 [0x18]))
                AMBX (One, 0x9FFB, DerefOf (Arg0 [0x19]))
                AMBX (One, 0x86FB, DerefOf (Arg0 [Zero]))
                AMBX (One, 0x87FB, DerefOf (Arg0 [One]))
                AMBX (One, 0x88FB, DerefOf (Arg0 [0x02]))
                AMBX (One, 0x89FB, DerefOf (Arg0 [0x03]))
                Return (Zero)
            }

            Method (ISPC, 0, NotSerialized)
            {
                Debug = "ISPC"
                AMBX (One, 0x10FF, 0x60)
                Local0 = AMBX (Zero, 0x10FF, Zero)
                While (Local0)
                {
                    Local0 = AMBX (Zero, 0x10FF, Zero)
                }

                Return (Zero)
            }

            Method (ENPC, 0, NotSerialized)
            {
                AMBX (One, 0x10FF, 0x61)
                Local0 = AMBX (Zero, 0x10FF, Zero)
                While (Local0)
                {
                    Local0 = AMBX (Zero, 0x10FF, Zero)
                }

                Return (Zero)
            }

            Method (RPCS, 0, NotSerialized)
            {
                Debug = "RPCS"
                AMBX (One, 0x10FF, 0x65)
                Local0 = AMBX (Zero, 0x10FF, Zero)
                While (Local0)
                {
                    Local0 = AMBX (Zero, 0x10FF, Zero)
                }

                Local0 = AMBX (Zero, 0x80FB, Zero)
                Debug = Local0
                Return (Local0)
            }

            Method (RPEC, 0, NotSerialized)
            {
                Local0 = Zero
                AMBX (One, 0x10FF, 0x64)
                Local0 = AMBX (Zero, 0x10FF, Zero)
                While (Local0)
                {
                    Local0 = AMBX (Zero, 0x10FF, Zero)
                }

                Local1 = AMBX (Zero, 0x82FB, Zero)
                Local0 |= Local1
                Local1 = AMBX (Zero, 0x83FB, Zero)
                Local0 |= (Local1 << 0x08)
                Local1 = AMBX (Zero, 0x84FB, Zero)
                Local0 |= (Local1 << 0x10)
                Local1 = AMBX (Zero, 0x85FB, Zero)
                Local0 |= (Local1 << 0x18)
                Return (Local0)
            }
        }
    }
}

