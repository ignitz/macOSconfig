/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of DSDT.aml, Fri Aug 24 20:49:16 2018
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000893E (35134)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xC3
 *     OEM ID           "A0994"
 *     OEM Table ID     "A0994000"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20060113 (537264403)
 */
DefinitionBlock ("", "DSDT", 1, "A0994", "A0994000", 0x00000000)
{
    Scope (_PR)
    {
        Processor (CPU1, 0x01, 0x00000810, 0x06)
        {
            OperationRegion (STBL, SystemMemory, 0xBFF8E0D0, 0x01D2)
            Name (NCPU, 0x04)
            Name (TYPE, 0x80000000)
            Name (HNDL, 0x80000000)
            Name (CFGD, 0x01000007)
            Name (TBLD, 0x80)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, Zero, REVS)
                CreateDWordField (Arg0, 0x04, SIZE)
                Local0 = SizeOf (Arg0)
                Local1 = (Local0 - 0x08)
                CreateField (Arg0, 0x40, (Local1 * 0x08), TEMP)
                Name (STS0, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                         
                })
                Concatenate (STS0, TEMP, Local2)
                _OSC (ToUUID ("4077a616-290c-47be-9ebd-d87058713953"), REVS, SIZE, Local2)
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, STS0)
                CreateDWordField (Arg3, 0x04, CAP0)
                CreateDWordField (Arg0, Zero, IID0)
                CreateDWordField (Arg0, 0x04, IID1)
                CreateDWordField (Arg0, 0x08, IID2)
                CreateDWordField (Arg0, 0x0C, IID3)
                Name (UID0, ToUUID ("4077a616-290c-47be-9ebd-d87058713953"))
                CreateDWordField (UID0, Zero, EID0)
                CreateDWordField (UID0, 0x04, EID1)
                CreateDWordField (UID0, 0x08, EID2)
                CreateDWordField (UID0, 0x0C, EID3)
                If (!(((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == EID2) && (IID3 == EID3))))
                {
                    STS0 = 0x06
                    Return (Arg3)
                }

                If ((Arg1 != One))
                {
                    STS0 = 0x0A
                    Return (Arg3)
                }

                TYPE = ((TYPE & 0x7FFFFFFF) | CAP0)
                If ((CFGD & One))
                {
                    If ((((CFGD & 0x01000000) && ((TYPE & 0x09) == 0x09)) && !(TBLD & One)))
                    {
                        TBLD |= One
                        Load (STBL, HNDL)
                    }
                }

                If ((CFGD & 0xF0))
                {
                    If ((((CFGD & 0x01000000) && (TYPE & 0x18)) && !(TBLD & 0x02)))
                    {
                        TBLD |= 0x02
                    }
                }

                Return (Arg3)
            }
        }
    }

    Scope (_PR)
    {
        Processor (CPU2, 0x02, 0x00000810, 0x06)
        {
            OperationRegion (STBL, SystemMemory, 0xBFF8E2B0, 0x0143)
            Name (NCPU, 0x04)
            Name (TYPE, 0x80000000)
            Name (HNDL, 0x80000000)
            Name (CFGD, 0x01000007)
            Name (TBLD, 0x80)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, Zero, REVS)
                CreateDWordField (Arg0, 0x04, SIZE)
                Local0 = SizeOf (Arg0)
                Local1 = (Local0 - 0x08)
                CreateField (Arg0, 0x40, (Local1 * 0x08), TEMP)
                Name (STS1, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                         
                })
                Concatenate (STS1, TEMP, Local2)
                _OSC (ToUUID ("4077a616-290c-47be-9ebd-d87058713953"), REVS, SIZE, Local2)
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, STS1)
                CreateDWordField (Arg3, 0x04, CAP1)
                CreateDWordField (Arg0, Zero, IID0)
                CreateDWordField (Arg0, 0x04, IID1)
                CreateDWordField (Arg0, 0x08, IID2)
                CreateDWordField (Arg0, 0x0C, IID3)
                Name (UID0, ToUUID ("4077a616-290c-47be-9ebd-d87058713953"))
                CreateDWordField (UID0, Zero, EID0)
                CreateDWordField (UID0, 0x04, EID1)
                CreateDWordField (UID0, 0x08, EID2)
                CreateDWordField (UID0, 0x0C, EID3)
                If (!(((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == EID2) && (IID3 == EID3))))
                {
                    STS1 = 0x06
                    Return (Arg3)
                }

                If ((Arg1 != One))
                {
                    STS1 = 0x0A
                    Return (Arg3)
                }

                TYPE = ((TYPE & 0x7FFFFFFF) | CAP1)
                If ((CFGD & One))
                {
                    If ((((CFGD & 0x01000000) && ((TYPE & 0x09) == 0x09)) && !(TBLD & One)))
                    {
                        TBLD |= One
                        Load (STBL, HNDL)
                    }
                }

                If ((CFGD & 0xF0))
                {
                    If ((((CFGD & 0x01000000) && (TYPE & 0x18)) && !(TBLD & 0x02)))
                    {
                        TBLD |= 0x02
                    }
                }

                Return (Arg3)
            }
        }
    }

    Scope (_PR)
    {
        Processor (CPU3, 0x03, 0x00000810, 0x06)
        {
            OperationRegion (STBL, SystemMemory, 0xBFF8E400, 0x0143)
            Name (NCPU, 0x04)
            Name (TYPE, 0x80000000)
            Name (HNDL, 0x80000000)
            Name (CFGD, 0x01000007)
            Name (TBLD, 0x80)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, Zero, REVS)
                CreateDWordField (Arg0, 0x04, SIZE)
                Local0 = SizeOf (Arg0)
                Local1 = (Local0 - 0x08)
                CreateField (Arg0, 0x40, (Local1 * 0x08), TEMP)
                Name (STS2, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                         
                })
                Concatenate (STS2, TEMP, Local2)
                _OSC (ToUUID ("4077a616-290c-47be-9ebd-d87058713953"), REVS, SIZE, Local2)
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, STS2)
                CreateDWordField (Arg3, 0x04, CAP2)
                CreateDWordField (Arg0, Zero, IID0)
                CreateDWordField (Arg0, 0x04, IID1)
                CreateDWordField (Arg0, 0x08, IID2)
                CreateDWordField (Arg0, 0x0C, IID3)
                Name (UID0, ToUUID ("4077a616-290c-47be-9ebd-d87058713953"))
                CreateDWordField (UID0, Zero, EID0)
                CreateDWordField (UID0, 0x04, EID1)
                CreateDWordField (UID0, 0x08, EID2)
                CreateDWordField (UID0, 0x0C, EID3)
                If (!(((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == EID2) && (IID3 == EID3))))
                {
                    STS2 = 0x06
                    Return (Arg3)
                }

                If ((Arg1 != One))
                {
                    STS2 = 0x0A
                    Return (Arg3)
                }

                TYPE = ((TYPE & 0x7FFFFFFF) | CAP2)
                If ((CFGD & One))
                {
                    If ((((CFGD & 0x01000000) && ((TYPE & 0x09) == 0x09)) && !(TBLD & One)))
                    {
                        TBLD |= One
                        Load (STBL, HNDL)
                    }
                }

                If ((CFGD & 0xF0))
                {
                    If ((((CFGD & 0x01000000) && (TYPE & 0x18)) && !(TBLD & 0x02)))
                    {
                        TBLD |= 0x02
                    }
                }

                Return (Arg3)
            }
        }
    }

    Scope (_PR)
    {
        Processor (CPU4, 0x04, 0x00000810, 0x06)
        {
            OperationRegion (STBL, SystemMemory, 0xBFF8E550, 0x0143)
            Name (NCPU, 0x04)
            Name (TYPE, 0x80000000)
            Name (HNDL, 0x80000000)
            Name (CFGD, 0x01000007)
            Name (TBLD, 0x80)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, Zero, REVS)
                CreateDWordField (Arg0, 0x04, SIZE)
                Local0 = SizeOf (Arg0)
                Local1 = (Local0 - 0x08)
                CreateField (Arg0, 0x40, (Local1 * 0x08), TEMP)
                Name (STS3, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                         
                })
                Concatenate (STS3, TEMP, Local2)
                _OSC (ToUUID ("4077a616-290c-47be-9ebd-d87058713953"), REVS, SIZE, Local2)
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, STS3)
                CreateDWordField (Arg3, 0x04, CAP3)
                CreateDWordField (Arg0, Zero, IID0)
                CreateDWordField (Arg0, 0x04, IID1)
                CreateDWordField (Arg0, 0x08, IID2)
                CreateDWordField (Arg0, 0x0C, IID3)
                Name (UID0, ToUUID ("4077a616-290c-47be-9ebd-d87058713953"))
                CreateDWordField (UID0, Zero, EID0)
                CreateDWordField (UID0, 0x04, EID1)
                CreateDWordField (UID0, 0x08, EID2)
                CreateDWordField (UID0, 0x0C, EID3)
                If (!(((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == EID2) && (IID3 == EID3))))
                {
                    STS3 = 0x06
                    Return (Arg3)
                }

                If ((Arg1 != One))
                {
                    STS3 = 0x0A
                    Return (Arg3)
                }

                TYPE = ((TYPE & 0x7FFFFFFF) | CAP3)
                If ((CFGD & One))
                {
                    If ((((CFGD & 0x01000000) && ((TYPE & 0x09) == 0x09)) && !(TBLD & One)))
                    {
                        TBLD |= One
                        Load (STBL, HNDL)
                    }
                }

                If ((CFGD & 0xF0))
                {
                    If ((((CFGD & 0x01000000) && (TYPE & 0x18)) && !(TBLD & 0x02)))
                    {
                        TBLD |= 0x02
                    }
                }

                Return (Arg3)
            }
        }
    }

    Name (DP80, 0x80)
    Name (DP90, 0x90)
    Name (SPIO, 0x2E)
    Name (IOHW, 0x0290)
    Name (APIC, One)
    Name (SMIP, 0xB2)
    Name (PMBS, 0x0800)
    Name (PMLN, 0x80)
    Name (GPBS, 0x0480)
    Name (GPLN, 0x40)
    Name (SMBL, Zero)
    Name (PM30, 0x0830)
    Name (SUSW, 0xFF)
    Name (EAQF, One)
    Name (CFTE, One)
    Name (PCIB, 0xE0000000)
    Name (PCIL, 0x10000000)
    Name (SMBS, 0x0400)
    Name (CPUC, 0x04)
    OperationRegion (BIOS, SystemMemory, 0xBFF8E064, 0xFF)
    Field (BIOS, ByteAcc, NoLock, Preserve)
    {
        SS1,    1, 
        SS2,    1, 
        SS3,    1, 
        SS4,    1, 
        Offset (0x01), 
        IOST,   16, 
        TOPM,   32, 
        ROMS,   32, 
        MG1B,   32, 
        MG1L,   32, 
        MG2B,   32, 
        MG2L,   32, 
        Offset (0x1C), 
        CPB0,   32, 
        CPB1,   32, 
        CPB2,   32, 
        CPB3,   32, 
        ASSB,   8, 
        AOTB,   8, 
        AAXB,   32, 
        SMIF,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        MPEN,   8, 
        TPMF,   8, 
        MSC1,   32, 
        MSC2,   32, 
        MSC3,   32, 
        MSC4,   32, 
        MSC5,   32, 
        MSC6,   32, 
        MSC7,   32, 
        MSC8,   32, 
        DMAX,   8, 
        HPTA,   32
    }

    Method (RRIO, 4, NotSerialized)
    {
        Debug = "RRIO"
    }

    Method (RDMA, 3, NotSerialized)
    {
        Debug = "rDMA"
    }

    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            DBG8 = 0xAA
        }
        Else
        {
            DBG8 = 0xAC
        }

        PICM = Arg0
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If ((OSVR != Ones))
        {
            Return (OSVR)
        }

        If ((PICM == Zero))
        {
            DBG8 = 0xAC
        }

        OSVR = One
        If (CondRefOf (_OSI, Local1))
        {
            If (_OSI ("Windows 2000"))
            {
                OSVR = 0x04
            }

            If (_OSI ("Windows 2001"))
            {
                OSVR = Zero
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                OSVR = Zero
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                OSVR = Zero
            }

            If (_OSI ("Windows 2001.1"))
            {
                OSVR = Zero
            }

            If (_OSI ("Windows 2001.1 SP1"))
            {
                OSVR = Zero
            }

            If (_OSI ("Windows 2006"))
            {
                OSVR = Zero
            }
        }
        ElseIf (MCTH (_OS, "Microsoft Windows NT"))
        {
            OSVR = 0x04
        }
        Else
        {
            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                OSVR = 0x02
            }

            If (MCTH (_OS, "Linux"))
            {
                OSVR = 0x03
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If ((SizeOf (Arg0) < SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = (SizeOf (Arg0) + One)
        Name (BUF0, Buffer (Local0){})
        Name (BUF1, Buffer (Local0){})
        BUF0 = Arg0
        BUF1 = Arg1
        While (Local0)
        {
            Local0--
            If ((DerefOf (BUF0 [Local0]) != DerefOf (BUF1 [Local0])))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        Local0 = (SS1 << One)
        Local0 |= (SS2 << 0x02)
        Local0 |= (SS3 << 0x03)
        Local0 |= (SS4 << 0x04)
        If (((One << Arg1) & Local0))
        {
            PRWP [One] = Arg1
        }
        Else
        {
            Local0 >>= One
            If (((OSFL () == One) || (OSFL () == 0x02)))
            {
                FindSetLeftBit (Local0, PRWP [One])
            }
            Else
            {
                FindSetRightBit (Local0, PRWP [One])
            }
        }

        Return (PRWP)
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, DP80, 0x02)
    Field (DEB0, WordAcc, NoLock, Preserve)
    {
        DBG8,   16
    }

    OperationRegion (DEB4, SystemIO, 0x84, One)
    Field (DEB4, ByteAcc, NoLock, Preserve)
    {
        DBG4,   8
    }

    OperationRegion (DEB1, SystemIO, DP90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Scope (_SB)
    {
        Name (PR00, Package (0x17)
        {
            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR00, Package (0x17)
        {
            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR01, Package (0x08)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR01, Package (0x08)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                If (((OSFL () == One) || (OSFL () == 0x02)))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Device (MCH)
            {
                Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Memory32Fixed (ReadWrite,
                        0xFED14000,         // Address Base
                        0x00006000,         // Address Length
                        )
                })
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (P0P2)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Device (IELK)
                {
                    Name (_HID, "AWY0001")  // _HID: Hardware ID
                    OperationRegion (RXA0, PCI_Config, 0xA0, 0x20)
                    Field (RXA0, ByteAcc, NoLock, Preserve)
                    {
                            ,   9, 
                        PBLV,   1, 
                        Offset (0x10), 
                            ,   1, 
                        PBMS,   1, 
                            ,   1, 
                        PMCS,   1, 
                        ECNS,   1, 
                        Offset (0x11), 
                        ECT1,   16, 
                        ELEN,   1, 
                        Offset (0x14)
                    }

                    Method (\_GPE._L0A, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        Notify (\_SB.PCI0.SBRG.IELK, 0x81)
                        \_SB.PCI0.SBRG.IELK.PMCS = One
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (ELEN)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (SMOD, 1, NotSerialized)
                    {
                    }

                    Method (GPBS, 0, NotSerialized)
                    {
                        Return ((PBLV ^ One))
                    }
                }

                Method (SPTS, 1, NotSerialized)
                {
                    PS1S = One
                    PS1E = One
                    SLPS = One
                }

                Method (SWAK, 1, NotSerialized)
                {
                    SLPS = Zero
                    PS1E = Zero
                    If (((Arg0 == One) && RTCS)){}
                    ElseIf (((Arg0 == 0x03) && BRTC)){}
                    Else
                    {
                        Notify (PWRB, 0x02)
                    }
                }

                OperationRegion (APMP, SystemIO, SMIP, 0x02)
                Field (APMP, ByteAcc, NoLock, Preserve)
                {
                    APMC,   8, 
                    APMS,   8
                }

                Field (APMP, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x01), 
                        ,   1, 
                    BRTC,   1
                }

                OperationRegion (PMS0, SystemIO, PMBS, 0x04)
                Field (PMS0, ByteAcc, NoLock, Preserve)
                {
                        ,   10, 
                    RTCS,   1, 
                        ,   4, 
                    WAKS,   1, 
                    Offset (0x03), 
                    PWBT,   1, 
                    Offset (0x04)
                }

                OperationRegion (SMIE, SystemIO, PM30, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    PS1E,   1, 
                        ,   31, 
                    PS1S,   1, 
                    Offset (0x08)
                }

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (FDC)
                {
                    Name (_HID, EisaId ("PNP0700"))  // _HID: Hardware ID
                    Method (_FDE, 0, NotSerialized)  // _FDE: Floppy Disk Enumerate
                    {
                        Name (FDEP, Package (0x05)
                        {
                            Zero, 
                            Zero, 
                            0x02, 
                            0x02, 
                            0x02
                        })
                        If (_STA ())
                        {
                            FDEP [Zero] = One
                        }

                        Return (FDEP)
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (DSTA (0x03))
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        DCNT (0x03, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        DCRS (0x03, One)
                        IRQE = IRQM
                        DMAE = DMAM
                        IO21 = IO11
                        IO22 = IO12
                        LEN2 = 0x06
                        IO31 = (IO21 + 0x07)
                        IO32 = IO31
                        LEN3 = One
                        Return (CRS2)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        DSRS (Arg0, 0x03)
                        CreateWordField (Arg0, One, IRQE)
                        CreateByteField (Arg0, 0x04, DMAE)
                        ENFG (CGLD (0x03))
                        If (IRQE)
                        {
                            FindSetRightBit (IRQE, Local0)
                            INTR = (Local0 - One)
                        }
                        Else
                        {
                            INTR = Zero
                        }

                        If (DMAE)
                        {
                            FindSetRightBit (DMAE, Local0)
                            DMCH = (Local0 - One)
                        }
                        Else
                        {
                            DMCH = 0x04
                        }

                        EXFG ()
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0370,             // Range Minimum
                                0x0370,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x0377,             // Range Minimum
                                0x0377,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        EndDependentFn ()
                    })
                }

                Device (SIOR)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Method (_UID, 0, NotSerialized)  // _UID: Unique ID
                    {
                        Return (SPIO)
                    }

                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y00)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x00,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (((SPIO != 0x03F0) && (SPIO > 0xF0)))
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIOR._Y00._MIN, GP10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIOR._Y00._MAX, GP11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIOR._Y00._LEN, GPL1)  // _LEN: Length
                            GP10 = SPIO
                            GP11 = SPIO
                            GPL1 = 0x02
                        }

                        Return (CRS)
                    }
                }

                Name (DCAT, Package (0x15)
                {
                    0x02, 
                    0x03, 
                    One, 
                    Zero, 
                    0xFF, 
                    0x07, 
                    0xFF, 
                    0xFF, 
                    0x07, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0xFF, 
                    0xFF
                })
                Mutex (IOCF, 0x00)
                Method (ENFG, 1, NotSerialized)
                {
                    Acquire (IOCF, 0xFFFF)
                    INDX = 0x87
                    INDX = 0x87
                    LDN = Arg0
                }

                Method (EXFG, 0, NotSerialized)
                {
                    INDX = 0xAA
                    Release (IOCF)
                }

                Method (LPTM, 1, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    Local0 = (OPT0 & 0x02)
                    EXFG ()
                    Return (Local0)
                }

                Method (UHID, 1, NotSerialized)
                {
                    If ((Arg0 == One))
                    {
                        ENFG (CGLD (Arg0))
                        Local0 = (OPT1 & 0x38)
                        EXFG ()
                        If (Local0)
                        {
                            Return (0x1005D041)
                        }
                    }

                    Return (0x0105D041)
                }

                Method (SIOK, 1, NotSerialized)
                {
                    ENFG (0x0A)
                    If ((Arg0 > One))
                    {
                        CRE4 |= 0x10
                    }

                    Local0 = CRE3
                    EXFG ()
                }

                Method (SIOS, 1, NotSerialized)
                {
                    Debug = "SIOS"
                    SIOK (Arg0)
                }

                Method (SIOW, 1, NotSerialized)
                {
                    Debug = "SIOW"
                    SIOK (Zero)
                }

                Method (SIOH, 0, NotSerialized)
                {
                    Debug = "SIOH"
                    ENFG (0x0A)
                    If ((OPT3 & 0x10))
                    {
                        Notify (PS2K, 0x02)
                    }

                    EXFG ()
                    SIOK (Zero)
                }

                OperationRegion (IOID, SystemIO, SPIO, 0x02)
                Field (IOID, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x07), 
                    LDN,    8, 
                    Offset (0x22), 
                    FDCP,   1, 
                        ,   2, 
                    LPTP,   1, 
                    URAP,   1, 
                    URBP,   1, 
                    Offset (0x30), 
                    ACTR,   8, 
                    Offset (0x60), 
                    IOAH,   8, 
                    IOAL,   8, 
                    IOH2,   8, 
                    IOL2,   8, 
                    Offset (0x70), 
                    INTR,   4, 
                    Offset (0x74), 
                    DMCH,   3, 
                    Offset (0xE0), 
                    CRE0,   8, 
                    CRE1,   8, 
                    CRE2,   8, 
                    CRE3,   8, 
                    CRE4,   8, 
                    CRE5,   8, 
                    CRE6,   8, 
                    Offset (0xF0), 
                    OPT0,   8, 
                    OPT1,   8, 
                    OPT2,   8, 
                    OPT3,   8, 
                    Offset (0xF5), 
                    OPT5,   8, 
                    OPT6,   8, 
                    Offset (0xF9), 
                    OPT9,   8
                }

                Method (CGLD, 1, NotSerialized)
                {
                    Return (DerefOf (DCAT [Arg0]))
                }

                Method (DSTA, 1, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    Local0 = ACTR
                    EXFG ()
                    If ((Local0 == 0xFF))
                    {
                        Return (Zero)
                    }

                    If ((Arg0 == 0x05))
                    {
                        Local0 >>= 0x02
                    }

                    If ((Arg0 == 0x08))
                    {
                        Local0 >>= One
                    }

                    Local0 &= One
                    IOST |= (Local0 << Arg0)
                    If (Local0)
                    {
                        Return (0x0F)
                    }
                    ElseIf (((One << Arg0) & IOST))
                    {
                        Return (0x0D)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (DCNT, 2, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    If ((Arg0 == 0x05))
                    {
                        Local1 = (IOH2 << 0x08)
                        Local1 |= IOL2
                    }
                    Else
                    {
                        Local1 = (IOAH << 0x08)
                        Local1 |= IOAL
                    }

                    RRIO (Arg0, Arg1, Local1, 0x08)
                    If (((DMCH < 0x04) && ((Local1 = (DMCH & 0x03)) != Zero)))
                    {
                        RDMA (Arg0, Arg1, Local1++)
                    }

                    Local1 = Arg1
                    Local2 = One
                    If ((Arg0 == 0x05))
                    {
                        Local1 = (Arg1 << 0x02)
                        Local2 <<= 0x02
                    }

                    If ((Arg0 == 0x08))
                    {
                        Local1 = (Arg1 << One)
                        Local2 <<= One
                    }

                    Local0 = ACTR
                    Local3 = ~Local2
                    Local0 &= Local3
                    Local0 |= Local1
                    ACTR = Local0
                    EXFG ()
                }

                Name (CRS1, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {}
                    DMA (Compatibility, NotBusMaster, Transfer8, _Y01)
                        {}
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y02)
                })
                CreateWordField (CRS1, One, IRQM)
                CreateByteField (CRS1, \_SB.PCI0.SBRG._Y01._DMA, DMAM)  // _DMA: Direct Memory Access
                CreateWordField (CRS1, \_SB.PCI0.SBRG._Y02._MIN, IO11)  // _MIN: Minimum Base Address
                CreateWordField (CRS1, \_SB.PCI0.SBRG._Y02._MAX, IO12)  // _MAX: Maximum Base Address
                CreateByteField (CRS1, \_SB.PCI0.SBRG._Y02._LEN, LEN1)  // _LEN: Length
                Name (CRS2, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {6}
                    DMA (Compatibility, NotBusMaster, Transfer8, _Y03)
                        {2}
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y04)
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y05)
                })
                CreateWordField (CRS2, One, IRQE)
                CreateByteField (CRS2, \_SB.PCI0.SBRG._Y03._DMA, DMAE)  // _DMA: Direct Memory Access
                CreateWordField (CRS2, \_SB.PCI0.SBRG._Y04._MIN, IO21)  // _MIN: Minimum Base Address
                CreateWordField (CRS2, \_SB.PCI0.SBRG._Y04._MAX, IO22)  // _MAX: Maximum Base Address
                CreateByteField (CRS2, \_SB.PCI0.SBRG._Y04._LEN, LEN2)  // _LEN: Length
                CreateWordField (CRS2, \_SB.PCI0.SBRG._Y05._MIN, IO31)  // _MIN: Minimum Base Address
                CreateWordField (CRS2, \_SB.PCI0.SBRG._Y05._MAX, IO32)  // _MAX: Maximum Base Address
                CreateByteField (CRS2, \_SB.PCI0.SBRG._Y05._LEN, LEN3)  // _LEN: Length
                Method (DCRS, 2, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    IO11 = (IOAH << 0x08)
                    IO11 |= IOAL
                    IO12 = IO11
                    Local0 = (FindSetRightBit (IO11) - One)
                    LEN1 = (One << Local0)
                    If (INTR)
                    {
                        IRQM = (One << INTR)
                    }
                    Else
                    {
                        IRQM = Zero
                    }

                    If (((DMCH > 0x03) || (Arg1 == Zero)))
                    {
                        DMAM = Zero
                    }
                    Else
                    {
                        Local1 = (DMCH & 0x03)
                        DMAM = (One << Local1)
                    }

                    EXFG ()
                    Return (CRS1)
                }

                Method (DSRS, 2, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQM)
                    CreateByteField (Arg0, 0x04, DMAM)
                    CreateWordField (Arg0, 0x08, IO11)
                    ENFG (CGLD (Arg1))
                    IOAL = (IO11 & 0xFF)
                    IOAH = (IO11 >> 0x08)
                    If (IRQM)
                    {
                        FindSetRightBit (IRQM, Local0)
                        INTR = (Local0 - One)
                    }
                    Else
                    {
                        INTR = Zero
                    }

                    If (DMAM)
                    {
                        FindSetRightBit (DMAM, Local0)
                        DMCH = (Local0 - One)
                    }
                    Else
                    {
                        DMCH = 0x07
                    }

                    EXFG ()
                    DCNT (Arg1, One)
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x0A,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y06)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y07)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y08)
                        Memory32Fixed (ReadWrite,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED20000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED50000,         // Address Base
                            0x00040000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFFA00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFFB00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFFE00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFFF00000,         // Address Base
                            0x000FFFFF,         // Address Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y06._MIN, GP00)  // _MIN: Minimum Base Address
                        CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y06._MAX, GP01)  // _MAX: Maximum Base Address
                        CreateByteField (CRS, \_SB.PCI0.SBRG.RMSC._Y06._LEN, GP0L)  // _LEN: Length
                        GP00 = PMBS
                        GP01 = PMBS
                        GP0L = PMLN
                        If (SMBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y07._MIN, GP10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y07._MAX, GP11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.RMSC._Y07._LEN, GP1L)  // _LEN: Length
                            GP10 = SMBS
                            GP11 = SMBS
                            GP1L = SMBL
                        }

                        If (GPBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y08._MIN, GP20)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y08._MAX, GP21)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.RMSC._Y08._LEN, GP2L)  // _LEN: Length
                            GP20 = GPBS
                            GP21 = GPBS
                            GP2L = GPLN
                        }

                        Return (CRS)
                    }
                }

                Scope (\)
                {
                    OperationRegion (RAMW, SystemMemory, 0xBFFF0000, 0x00010000)
                    Field (RAMW, ByteAcc, NoLock, Preserve)
                    {
                        PAR0,   32, 
                        PAR1,   32, 
                        PAR2,   32
                    }

                    OperationRegion (IOB2, SystemIO, 0xB2, 0x02)
                    Field (IOB2, ByteAcc, NoLock, Preserve)
                    {
                        SMIC,   8, 
                        SMIS,   8
                    }

                    Method (ISMI, 1, Serialized)
                    {
                        SMIC = Arg0
                    }

                    Method (GNVS, 1, Serialized)
                    {
                        PAR0 = Arg0
                        ISMI (0x70)
                        Return (PAR1)
                    }

                    Method (SNVS, 2, Serialized)
                    {
                        PAR0 = Arg0
                        PAR1 = Arg1
                        ISMI (0x71)
                    }

                    Method (GMAX, 1, Serialized)
                    {
                        PAR0 = Arg0
                        ISMI (0x74)
                        Return (PAR1)
                    }

                    Method (GMDX, 1, Serialized)
                    {
                        PAR0 = Arg0
                        ISMI (0x75)
                        Return (PAR1)
                    }

                    Method (GCAX, 1, Serialized)
                    {
                        PAR0 = Arg0
                        ISMI (0x76)
                        Return (PAR1)
                    }

                    Method (GCDX, 1, Serialized)
                    {
                        PAR0 = Arg0
                        ISMI (0x77)
                        Return (PAR1)
                    }
                }

                Scope (\_SB.PCI0.SBRG)
                {
                    Device (ASOC)
                    {
                        Name (_HID, "ATK0110")  // _HID: Hardware ID
                        Name (_UID, 0x01010110)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (_INI, 0, NotSerialized)  // _INI: Initialize
                        {
                            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                            _T_0 = GNVS (0x36E8)
                            If ((_T_0 == Zero))
                            {
                                G3T0 [0x03] = 0x42
                            }
                            ElseIf ((_T_0 == 0x02))
                            {
                                G3T0 [0x03] = Zero
                            }
                            ElseIf ((_T_0 == 0x04))
                            {
                                G3T0 [0x03] = 0x85
                            }
                            ElseIf ((_T_0 == 0x06))
                            {
                                G3T0 [0x03] = 0xC8
                            }

                            If (((Local0 = (GCAX (One) & 0x0FF0)) > 0x06F0))
                            {
                                Local0 = GMAX (0x2C)
                                Local2 = ((Local0 >> 0x08) & 0xFF)
                                Local1 = (Local0 & 0xFF)
                                Local0 = (Local1 - Local2)
                                Local7 = GMDX (0x0198)
                                Local7 = ((Local7 >> 0x08) & 0xFF)
                                If ((Local7 < Local0))
                                {
                                    Local7 = Local1
                                }
                            }
                            Else
                            {
                                Local0 = GMAX (0x17)
                                Local1 = ((Local0 >> 0x08) & 0x1F)
                                Local7 = Local1
                                Local0 = GMAX (0x0198)
                                Local0 = ((Local0 >> 0x18) & 0x1F)
                            }

                            Local2 = (Local0 * 0x0A)
                            G3T2 [0x04] = (Local2 | 0xFF000000)
                            If ((GMAX (0x0198) & 0x80000000))
                            {
                                Local1 = 0x1F
                            }

                            If ((GMAX (0x17) & 0x00800000))
                            {
                                Local2 = (GMAX (0x17) & 0x4000)
                                G3T2 [0x05] = 0x05
                                Local5 = ((GMAX (0x17) & 0x4000) >> 0x0E)
                                Local4 = (Local7 - Local0)
                                Local6 = (Local4 * 0x02)
                                G3T2 [0x03] = (Local6 + Local5)
                                Local3 = ((Local3 = (Local1 - Local0)) * 0x02)
                                Local3 += One
                                If (Local2)
                                {
                                    Local3 += One
                                }

                                G3T2 [0x06] = Local3
                            }
                            Else
                            {
                                G3T2 [0x05] = 0x0A
                                G3T2 [0x03] = (Local7 - Local0)
                                G3T2 [0x06] = ((Local3 = (Local1 - Local0)) + One)
                            }

                            Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                            _T_1 = GNVS (0x151F)
                            If ((_T_1 == Zero))
                            {
                                G321 [0x04] = 0x0708
                            }
                            ElseIf ((_T_1 == One))
                            {
                                G321 [0x04] = 0x05DC
                            }
                        }

                        Name (MBIF, Package (0x08)
                        {
                            0x03, 
                            "P5K-SE", 
                            0x01010101, 
                            0x01000100, 
                            0xE0000000, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (ASBF, Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
                        })
                        CreateDWordField (ASBF, Zero, ASB0)
                        CreateDWordField (ASBF, 0x04, ASB1)
                        Method (GGRP, 1, Serialized)
                        {
                            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                            _T_0 = Arg0
                            If ((_T_0 == Zero))
                            {
                                Return (GRP0)
                            }
                            ElseIf ((_T_0 == 0x03))
                            {
                                Return (GRP3)
                            }
                            ElseIf ((_T_0 == 0x04))
                            {
                                Return (GRP4)
                            }
                            ElseIf ((_T_0 == 0x05))
                            {
                                Return (GRP5)
                            }
                            ElseIf ((_T_0 == 0x06))
                            {
                                Return (GRP6)
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                Return (GRP9)
                            }
                            ElseIf ((_T_0 == 0x0B))
                            {
                                Return (GRPB)
                            }
                            ElseIf ((_T_0 == 0x0D))
                            {
                                Return (GRPD)
                            }
                            ElseIf ((_T_0 == 0x0E))
                            {
                                Return (GRPE)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (GITM, 1, Serialized)
                        {
                            CreateDWordField (Arg0, Zero, PRM0)
                            CreateByteField (Arg0, 0x03, GPID)
                            ASB0 = One
                            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                            _T_0 = GPID
                            If ((_T_0 == Zero))
                            {
                                GIT0 (PRM0)
                            }
                            ElseIf ((_T_0 == 0x03))
                            {
                                GIT3 (PRM0)
                            }
                            ElseIf ((_T_0 == 0x04))
                            {
                                GIT4 (PRM0)
                            }
                            ElseIf ((_T_0 == 0x05))
                            {
                                GIT5 (PRM0)
                            }
                            ElseIf ((_T_0 == 0x06))
                            {
                                GIT6 (PRM0)
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                GIT9 (PRM0)
                            }
                            ElseIf ((_T_0 == 0x0B))
                            {
                                GITB (PRM0)
                            }
                            ElseIf ((_T_0 == 0x0D))
                            {
                                GITD (PRM0)
                            }
                            ElseIf ((_T_0 == 0x0E))
                            {
                                GITE (PRM0)
                            }
                            Else
                            {
                                ASB0 = Zero
                            }

                            Return (ASBF)
                        }

                        Method (SITM, 1, Serialized)
                        {
                            CreateDWordField (Arg0, Zero, PRM0)
                            CreateDWordField (Arg0, 0x04, PRM1)
                            CreateDWordField (Arg0, 0x08, PRM2)
                            CreateByteField (Arg0, 0x03, GPID)
                            ASB0 = One
                            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                            _T_0 = GPID
                            If ((_T_0 == Zero))
                            {
                                SIT0 (PRM0, PRM1, PRM2)
                            }
                            ElseIf ((_T_0 == 0x03))
                            {
                                SIT3 (PRM0, PRM1, PRM2)
                            }
                            ElseIf ((_T_0 == 0x04))
                            {
                                SIT4 (PRM0, PRM1, PRM2)
                            }
                            ElseIf ((_T_0 == 0x05))
                            {
                                SIT5 (PRM0, PRM1, PRM2)
                            }
                            ElseIf ((_T_0 == 0x06))
                            {
                                SIT6 (PRM0, PRM1, PRM2)
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                SIT9 (PRM0, PRM1, PRM2)
                            }
                            ElseIf ((_T_0 == 0x0B))
                            {
                                SITB (PRM0, PRM1, PRM2)
                            }
                            ElseIf ((_T_0 == 0x0D))
                            {
                                SITD (PRM0, PRM1, PRM2)
                            }
                            ElseIf ((_T_0 == 0x0E))
                            {
                                SITE (PRM0, PRM1, PRM2)
                            }
                            Else
                            {
                                ASB0 = Zero
                            }

                            Return (ASBF)
                        }

                        Method (OP2V, 2, NotSerialized)
                        {
                            Local0 = DerefOf (Arg1 [0x04])
                            Local1 = DerefOf (Arg1 [0x05])
                            Local1 *= Arg0
                            Local0 += Local1
                            Return (Local0)
                        }

                        Method (V2OP, 2, NotSerialized)
                        {
                            Local0 = DerefOf (Arg1 [0x04])
                            Local1 = DerefOf (Arg1 [0x05])
                            Local0 = (Arg0 - Local0)
                            Divide (Local0, Local1, Local1, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y09)
                    })
                    OperationRegion (^LPCR, SystemMemory, 0xFED1F404, 0x04)
                    Field (LPCR, AnyAcc, NoLock, Preserve)
                    {
                        HPTS,   2, 
                            ,   5, 
                        HPTE,   1, 
                        Offset (0x04)
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((OSFL () == Zero))
                        {
                            If (HPTE)
                            {
                                Return (0x0F)
                            }
                        }
                        ElseIf (HPTE)
                        {
                            Return (0x0B)
                        }

                        Return (Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.PCI0.SBRG.HPET._Y09._BAS, HPT)  // _BAS: Base Address
                        Local0 = (HPTS * 0x1000)
                        HPT = (Local0 + 0xFED00000)
                        Return (CRS)
                    }
                }

                OperationRegion (RX80, PCI_Config, Zero, 0xFF)
                Field (RX80, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x80), 
                    LPCD,   16, 
                    LPCE,   16
                }

                Name (DBPT, Package (0x04)
                {
                    Package (0x08)
                    {
                        0x03F8, 
                        0x02F8, 
                        0x0220, 
                        0x0228, 
                        0x0238, 
                        0x02E8, 
                        0x0338, 
                        0x03E8
                    }, 

                    Package (0x08)
                    {
                        0x03F8, 
                        0x02F8, 
                        0x0220, 
                        0x0228, 
                        0x0238, 
                        0x02E8, 
                        0x0338, 
                        0x03E8
                    }, 

                    Package (0x03)
                    {
                        0x0378, 
                        0x0278, 
                        0x03BC
                    }, 

                    Package (0x02)
                    {
                        0x03F0, 
                        0x0370
                    }
                })
                Name (DDLT, Package (0x04)
                {
                    Package (0x02)
                    {
                        Zero, 
                        0xFFF8
                    }, 

                    Package (0x02)
                    {
                        0x04, 
                        0xFF8F
                    }, 

                    Package (0x02)
                    {
                        0x08, 
                        0xFCFF
                    }, 

                    Package (0x02)
                    {
                        0x0C, 
                        0xEFFF
                    }
                })
                Method (RRIO, 4, NotSerialized)
                {
                    If (((Arg0 <= 0x03) && (Arg0 >= Zero)))
                    {
                        Local0 = Match (DerefOf (DBPT [Arg0]), MEQ, Arg2, MTR, Zero, Zero)
                        If ((Local0 != Ones))
                        {
                            Local1 = DerefOf (DerefOf (DDLT [Arg0]) [Zero])
                            Local2 = DerefOf (DerefOf (DDLT [Arg0]) [One])
                            Local0 <<= Local1
                            LPCD &= Local2
                            LPCD |= Local0
                            WX82 (Arg0, Arg1)
                        }
                    }

                    If ((Arg0 == 0x08))
                    {
                        If ((Arg2 == 0x0200))
                        {
                            WX82 (0x08, Arg0)
                        }
                        ElseIf ((Arg2 == 0x0208))
                        {
                            WX82 (0x09, Arg0)
                        }
                    }

                    If (((Arg0 <= 0x0D) && (Arg0 >= 0x0A)))
                    {
                        WX82 (Arg0, Arg1)
                    }
                }

                Method (WX82, 2, NotSerialized)
                {
                    Local0 = (One << Arg0)
                    If (Arg1)
                    {
                        LPCE |= Local0
                    }
                    Else
                    {
                        Local0 = ~Local0
                        LPCE &= Local0
                    }
                }

                Method (RDMA, 3, NotSerialized)
                {
                }

                Device (^PCIE)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x11)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            _Y0A)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.PCI0.PCIE._Y0A._BAS, BAS1)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.PCIE._Y0A._LEN, LEN1)  // _LEN: Length
                        BAS1 = PCIB
                        LEN1 = PCIL
                        Return (CRS)
                    }
                }

                Scope (\_GPE)
                {
                    Method (_L1E, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        Notify (\_SB.PCI0.SBRG.ASOC, One)
                        Sleep (0x03E8)
                    }
                }

                Scope (ASOC)
                {
                    Name (VESL, Zero)
                    Method (SPLV, 1, Serialized)
                    {
                        VESL = (Arg0 & 0xFFFF)
                        PAR0 = VESL
                        ISMI (0x88)
                        Local0 = (PAR0 & 0xFFFF)
                        Return (Local0)
                    }

                    Method (GPLV, 0, Serialized)
                    {
                        Return (VESL)
                    }
                }

                Device (UAR1)
                {
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_HID, EisaId ("PNP0501"))  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (DSTA (Zero))
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        DSRS (Arg0, Zero)
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (CMPR)
                    }

                    Name (CMPR, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Method (UAR1._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x08, 0x04))
                }

                Device (OMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0B)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0C)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (APIC)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.OMSC._Y0B._LEN, ML01)  // _LEN: Length
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.OMSC._Y0B._BAS, MB01)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.OMSC._Y0C._LEN, ML02)  // _LEN: Length
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.OMSC._Y0C._BAS, MB02)  // _BAS: Base Address
                            MB01 = 0xFEC00000
                            ML01 = 0x1000
                            MB02 = 0xFEE00000
                            ML02 = 0x1000
                        }

                        Return (CRS)
                    }
                }

                Device (^^RMEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x000A0000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0D)
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            _Y0E)
                        Memory32Fixed (ReadWrite,
                            0x00100000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0F)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y10)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.RMEM._Y0D._BAS, BAS1)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.RMEM._Y0D._LEN, LEN1)  // _LEN: Length
                        CreateDWordField (CRS, \_SB.RMEM._Y0E._BAS, BAS2)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.RMEM._Y0E._LEN, LEN2)  // _LEN: Length
                        CreateDWordField (CRS, \_SB.RMEM._Y0F._LEN, LEN3)  // _LEN: Length
                        CreateDWordField (CRS, \_SB.RMEM._Y10._BAS, BAS4)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.RMEM._Y10._LEN, LEN4)  // _LEN: Length
                        If (OSFL ()){}
                        Else
                        {
                            If (MG1B)
                            {
                                If ((MG1B > 0x000C0000))
                                {
                                    BAS1 = 0x000C0000
                                    LEN1 = (MG1B - BAS1)
                                }
                            }
                            Else
                            {
                                BAS1 = 0x000C0000
                                LEN1 = 0x00020000
                            }

                            If (Local0 = (MG1B + MG1L))
                            {
                                BAS2 = Local0
                                LEN2 = (0x00100000 - BAS2)
                            }
                        }

                        LEN3 = (MG2B - 0x00100000)
                        BAS4 = (MG2B + MG2L)
                        LEN4 = (Zero - BAS4)
                        Return (CRS)
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP030B"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Local0 = (One << 0x0A)
                        If ((IOST & Local0))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Method (PS2K._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1D, 0x04))
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Name (^NATA, Package (0x01)
                {
                    0x001F0002
                })
                Name (\FZTF, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5       
                })
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If ((Arg0 == 0x02))
                    {
                        REGF = Arg1
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14){})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (PSCR << One)
                        Local0 = (PMCR | Local1)
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local1 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local2 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local0 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local1 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local1 |= Local3
                        GMPT = PMRI
                        GMUE = Local0
                        GMUT = PMUT
                        GMCR = PMCR
                        GSPT = PSRI
                        GSUE = Local1
                        GSUT = PSUT
                        GSCR = PSCR
                        STM ()
                        PMRI = GMPT
                        Local0 = GMUE
                        PMUT = GMUT
                        PMCR = GMCR
                        Local1 = GSUE
                        PSUT = GSUT
                        PSCR = GSCR
                        If ((Local0 & One))
                        {
                            PM3E = One
                        }
                        Else
                        {
                            PM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            PM6E = One
                        }
                        Else
                        {
                            PM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            PMAE = One
                        }
                        Else
                        {
                            PMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            PS3E = One
                        }
                        Else
                        {
                            PS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            PS6E = One
                        }
                        Else
                        {
                            PS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            PSAE = One
                        }
                        Else
                        {
                            PSAE = Zero
                        }

                        ATA0 = GTF (Zero, Arg1)
                        ATA1 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (SSCR << One)
                        Local0 = (SMCR | Local1)
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local1 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local2 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local0 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local1 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local1 |= Local3
                        GMPT = SMRI
                        GMUE = Local0
                        GMUT = SMUT
                        GMCR = SMCR
                        GSPT = SSRI
                        GSUE = Local1
                        GSUT = SSUT
                        GSCR = SSCR
                        STM ()
                        SMRI = GMPT
                        Local0 = GMUE
                        SMUT = GMUT
                        SMCR = GMCR
                        Local1 = GSUE
                        SSUT = GSUT
                        SSCR = GSCR
                        If ((Local0 & One))
                        {
                            SM3E = One
                        }
                        Else
                        {
                            SM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            SM6E = One
                        }
                        Else
                        {
                            SM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            SMAE = One
                        }
                        Else
                        {
                            SMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            SS3E = One
                        }
                        Else
                        {
                            SS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            SS6E = One
                        }
                        Else
                        {
                            SS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            SSAE = One
                        }
                        Else
                        {
                            SSAE = Zero
                        }

                        ATA2 = GTF (Zero, Arg1)
                        ATA3 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    PIO0 = Ones
                    PIO1 = Ones
                    DMA0 = Ones
                    DMA1 = Ones
                    CHNF = 0x10
                    If (REGF){}
                    Else
                    {
                        Return (TMD0)
                    }

                    If ((Arg1 & 0x20))
                    {
                        CHNF |= 0x02
                    }

                    Local6 = Match (DerefOf (TIM0 [One]), MEQ, Arg0, MTR, Zero, Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA0 = Local7
                    PIO0 = Local7
                    If ((Arg4 & 0x20))
                    {
                        CHNF |= 0x08
                    }

                    Local6 = Match (DerefOf (TIM0 [0x02]), MEQ, Arg3, MTR, Zero, Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA1 = Local7
                    PIO1 = Local7
                    If ((Arg1 & 0x07))
                    {
                        Local5 = Arg2
                        If ((Arg1 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg1 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA0 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= One
                    }

                    If ((Arg4 & 0x07))
                    {
                        Local5 = Arg5
                        If ((Arg4 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg4 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA1 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= 0x04
                    }

                    Debug = TMD0
                    Return (TMD0)
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        GMUE = Zero
                        GMUT = Zero
                        GSUE = Zero
                        GSUT = Zero
                        If ((CHNF & One))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA0, MTR, Zero, Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GMUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GMUE |= One
                            If ((Local0 > 0x02))
                            {
                                GMUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GMUE &= 0xFD
                                GMUE |= 0x04
                            }
                        }
                        ElseIf (((PIO0 == Ones) | (PIO0 == Zero)))
                        {
                            If (((DMA0 < Ones) & (DMA0 > Zero)))
                            {
                                PIO0 = DMA0
                                GMUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x04))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA1, MTR, Zero, Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GSUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GSUE |= One
                            If ((Local0 > 0x02))
                            {
                                GSUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GSUE &= 0xFD
                                GSUE |= 0x04
                            }
                        }
                        ElseIf (((PIO1 == Ones) | (PIO1 == Zero)))
                        {
                            If (((DMA1 < Ones) & (DMA1 > Zero)))
                            {
                                PIO1 = DMA1
                                GSUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x02))
                        {
                            GMUE |= 0x20
                        }

                        If ((CHNF & 0x08))
                        {
                            GSUE |= 0x20
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO0, MTR, Zero, Zero) & 0x07)
                        Local1 = DerefOf (DerefOf (TIM0 [One]) [Local0])
                        GMPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GMUE |= 0x50
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO1, MTR, Zero, Zero) & 0x07)
                        Local1 = DerefOf (DerefOf (TIM0 [0x02]) [Local0])
                        GSPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GSUE |= 0x50
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF       
                })
                Name (AT02, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90       
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6       
                })
                Name (AT04, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91       
                })
                Name (ATA0, Buffer (0x1D){})
                Name (ATA1, Buffer (0x1D){})
                Name (ATA2, Buffer (0x1D){})
                Name (ATA3, Buffer (0x1D){})
                Name (ATAB, Buffer (0x1D){})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Local0 = (CMDC * 0x38)
                    Local1 = (Local0 + 0x08)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Local0 = (CMDC * 0x07)
                    CreateByteField (ATAB, (Local0 + 0x02), A001)
                    CreateByteField (ATAB, (Local0 + 0x06), A005)
                    CMDX = Arg0
                    A001 = Arg1
                    A005 = Arg2
                    CMDC++
                }

                Method (GTF, 2, Serialized)
                {
                    Debug = Arg1
                    CMDC = Zero
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If ((SizeOf (Arg1) == 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        ID49 = IW49
                        CreateWordField (Arg1, 0x6A, IW53)
                        ID53 = IW53
                        CreateWordField (Arg1, 0x7E, IW63)
                        ID63 = IW63
                        CreateWordField (Arg1, 0x76, IW59)
                        ID59 = IW59
                        CreateWordField (Arg1, 0xB0, IW88)
                        ID88 = IW88
                    }

                    Local7 = 0xA0
                    If (Arg0)
                    {
                        Local7 = 0xB0
                        IRDY = (CHNF & 0x08)
                        If ((CHNF & 0x10))
                        {
                            PIOT = PIO1
                        }
                        Else
                        {
                            PIOT = PIO0
                        }

                        If ((CHNF & 0x04))
                        {
                            If ((CHNF & 0x10))
                            {
                                DMAT = DMA1
                            }
                            Else
                            {
                                DMAT = DMA0
                            }
                        }
                    }
                    Else
                    {
                        IRDY = (CHNF & 0x02)
                        PIOT = PIO0
                        If ((CHNF & One))
                        {
                            DMAT = DMA0
                        }
                    }

                    If ((((ID53 & 0x04) && (ID88 & 0xFF00)) && DMAT))
                    {
                        Local1 = Match (DerefOf (TIM0 [0x03]), MLE, DMAT, MTR, Zero, Zero)
                        If ((Local1 > 0x05))
                        {
                            Local1 = 0x05
                        }

                        GTFB (AT01, (0x40 | Local1), Local7)
                    }
                    ElseIf (((ID63 & 0xFF00) && PIOT))
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, Zero) & 0x03)
                        Local1 = (0x20 | DerefOf (DerefOf (TIM0 [0x07]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }

                    If (IRDY)
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, Zero) & 0x07)
                        Local1 = (0x08 | DerefOf (DerefOf (TIM0 [0x06]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }
                    ElseIf ((ID49 & 0x0400))
                    {
                        GTFB (AT01, One, Local7)
                    }

                    If (((ID59 & 0x0100) && (ID59 & 0xFF)))
                    {
                        GTFB (AT03, (ID59 & 0xFF), Local7)
                    }

                    Debug = ATAB
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Local0 = (CMDN * 0x38)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Debug = RETB
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If ((Arg0 == 0x02))
                    {
                        REGF = Arg1
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14){})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (PSCR << One)
                        Local0 = (PMCR | Local1)
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local1 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local2 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local0 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local1 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local1 |= Local3
                        GMPT = PMRI
                        GMUE = Local0
                        GMUT = PMUT
                        GMCR = PMCR
                        GSPT = PSRI
                        GSUE = Local1
                        GSUT = PSUT
                        GSCR = PSCR
                        STM ()
                        PMRI = GMPT
                        Local0 = GMUE
                        PMUT = GMUT
                        PMCR = GMCR
                        Local1 = GSUE
                        PSUT = GSUT
                        PSCR = GSCR
                        If ((Local0 & One))
                        {
                            PM3E = One
                        }
                        Else
                        {
                            PM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            PM6E = One
                        }
                        Else
                        {
                            PM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            PMAE = One
                        }
                        Else
                        {
                            PMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            PS3E = One
                        }
                        Else
                        {
                            PS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            PS6E = One
                        }
                        Else
                        {
                            PS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            PSAE = One
                        }
                        Else
                        {
                            PSAE = Zero
                        }

                        ATA0 = GTF (Zero, Arg1)
                        ATA1 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (SSCR << One)
                        Local0 = (SMCR | Local1)
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local1 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local2 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local0 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local1 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local1 |= Local3
                        GMPT = SMRI
                        GMUE = Local0
                        GMUT = SMUT
                        GMCR = SMCR
                        GSPT = SSRI
                        GSUE = Local1
                        GSUT = SSUT
                        GSCR = SSCR
                        STM ()
                        SMRI = GMPT
                        Local0 = GMUE
                        SMUT = GMUT
                        SMCR = GMCR
                        Local1 = GSUE
                        SSUT = GSUT
                        SSCR = GSCR
                        If ((Local0 & One))
                        {
                            SM3E = One
                        }
                        Else
                        {
                            SM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            SM6E = One
                        }
                        Else
                        {
                            SM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            SMAE = One
                        }
                        Else
                        {
                            SMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            SS3E = One
                        }
                        Else
                        {
                            SS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            SS6E = One
                        }
                        Else
                        {
                            SS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            SSAE = One
                        }
                        Else
                        {
                            SSAE = Zero
                        }

                        ATA2 = GTF (Zero, Arg1)
                        ATA3 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    PIO0 = Ones
                    PIO1 = Ones
                    DMA0 = Ones
                    DMA1 = Ones
                    CHNF = 0x10
                    If (REGF){}
                    Else
                    {
                        Return (TMD0)
                    }

                    If ((Arg1 & 0x20))
                    {
                        CHNF |= 0x02
                    }

                    Local6 = Match (DerefOf (TIM0 [One]), MEQ, Arg0, MTR, Zero, Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA0 = Local7
                    PIO0 = Local7
                    If ((Arg4 & 0x20))
                    {
                        CHNF |= 0x08
                    }

                    Local6 = Match (DerefOf (TIM0 [0x02]), MEQ, Arg3, MTR, Zero, Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA1 = Local7
                    PIO1 = Local7
                    If ((Arg1 & 0x07))
                    {
                        Local5 = Arg2
                        If ((Arg1 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg1 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA0 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= One
                    }

                    If ((Arg4 & 0x07))
                    {
                        Local5 = Arg5
                        If ((Arg4 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg4 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA1 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= 0x04
                    }

                    Debug = TMD0
                    Return (TMD0)
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        GMUE = Zero
                        GMUT = Zero
                        GSUE = Zero
                        GSUT = Zero
                        If ((CHNF & One))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA0, MTR, Zero, Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GMUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GMUE |= One
                            If ((Local0 > 0x02))
                            {
                                GMUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GMUE &= 0xFD
                                GMUE |= 0x04
                            }
                        }
                        ElseIf (((PIO0 == Ones) | (PIO0 == Zero)))
                        {
                            If (((DMA0 < Ones) & (DMA0 > Zero)))
                            {
                                PIO0 = DMA0
                                GMUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x04))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA1, MTR, Zero, Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GSUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GSUE |= One
                            If ((Local0 > 0x02))
                            {
                                GSUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GSUE &= 0xFD
                                GSUE |= 0x04
                            }
                        }
                        ElseIf (((PIO1 == Ones) | (PIO1 == Zero)))
                        {
                            If (((DMA1 < Ones) & (DMA1 > Zero)))
                            {
                                PIO1 = DMA1
                                GSUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x02))
                        {
                            GMUE |= 0x20
                        }

                        If ((CHNF & 0x08))
                        {
                            GSUE |= 0x20
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO0, MTR, Zero, Zero) & 0x07)
                        Local1 = DerefOf (DerefOf (TIM0 [One]) [Local0])
                        GMPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GMUE |= 0x50
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO1, MTR, Zero, Zero) & 0x07)
                        Local1 = DerefOf (DerefOf (TIM0 [0x02]) [Local0])
                        GSPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GSUE |= 0x50
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF       
                })
                Name (AT02, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90       
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6       
                })
                Name (AT04, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91       
                })
                Name (ATA0, Buffer (0x1D){})
                Name (ATA1, Buffer (0x1D){})
                Name (ATA2, Buffer (0x1D){})
                Name (ATA3, Buffer (0x1D){})
                Name (ATAB, Buffer (0x1D){})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Local0 = (CMDC * 0x38)
                    Local1 = (Local0 + 0x08)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Local0 = (CMDC * 0x07)
                    CreateByteField (ATAB, (Local0 + 0x02), A001)
                    CreateByteField (ATAB, (Local0 + 0x06), A005)
                    CMDX = Arg0
                    A001 = Arg1
                    A005 = Arg2
                    CMDC++
                }

                Method (GTF, 2, Serialized)
                {
                    Debug = Arg1
                    CMDC = Zero
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If ((SizeOf (Arg1) == 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        ID49 = IW49
                        CreateWordField (Arg1, 0x6A, IW53)
                        ID53 = IW53
                        CreateWordField (Arg1, 0x7E, IW63)
                        ID63 = IW63
                        CreateWordField (Arg1, 0x76, IW59)
                        ID59 = IW59
                        CreateWordField (Arg1, 0xB0, IW88)
                        ID88 = IW88
                    }

                    Local7 = 0xA0
                    If (Arg0)
                    {
                        Local7 = 0xB0
                        IRDY = (CHNF & 0x08)
                        If ((CHNF & 0x10))
                        {
                            PIOT = PIO1
                        }
                        Else
                        {
                            PIOT = PIO0
                        }

                        If ((CHNF & 0x04))
                        {
                            If ((CHNF & 0x10))
                            {
                                DMAT = DMA1
                            }
                            Else
                            {
                                DMAT = DMA0
                            }
                        }
                    }
                    Else
                    {
                        IRDY = (CHNF & 0x02)
                        PIOT = PIO0
                        If ((CHNF & One))
                        {
                            DMAT = DMA0
                        }
                    }

                    If ((((ID53 & 0x04) && (ID88 & 0xFF00)) && DMAT))
                    {
                        Local1 = Match (DerefOf (TIM0 [0x03]), MLE, DMAT, MTR, Zero, Zero)
                        If ((Local1 > 0x05))
                        {
                            Local1 = 0x05
                        }

                        GTFB (AT01, (0x40 | Local1), Local7)
                    }
                    ElseIf (((ID63 & 0xFF00) && PIOT))
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, Zero) & 0x03)
                        Local1 = (0x20 | DerefOf (DerefOf (TIM0 [0x07]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }

                    If (IRDY)
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, Zero) & 0x07)
                        Local1 = (0x08 | DerefOf (DerefOf (TIM0 [0x06]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }
                    ElseIf ((ID49 & 0x0400))
                    {
                        GTFB (AT01, One, Local7)
                    }

                    If (((ID59 & 0x0100) && (ID59 & 0xFF)))
                    {
                        GTFB (AT03, (ID59 & 0xFF), Local7)
                    }

                    Debug = ATAB
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Local0 = (CMDN * 0x38)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Debug = RETB
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (EUSB)
            {
                Name (_ADR, 0x001D0007)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (USBE)
            {
                Name (_ADR, 0x001A0007)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (P0P5)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }
            }

            Device (P0P6)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }
            }

            Device (P0P7)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }
            }

            Device (P0P8)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR08)
                    }

                    Return (PR08)
                }
            }

            Device (P0P9)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR09)
                    }

                    Return (PR09)
                }
            }

            Device (GBEC)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If (((OSFL () == One) || (OSFL () == 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        USBW = 0x03
                    }
                    Else
                    {
                        USBW = Zero
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x03, 0x04))
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If (((OSFL () == One) || (OSFL () == 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        USBW = 0x03
                    }
                    Else
                    {
                        USBW = Zero
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x04, 0x04))
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If (((OSFL () == One) || (OSFL () == 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        USBW = 0x03
                    }
                    Else
                    {
                        USBW = Zero
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0C, 0x04))
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0003)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If (((OSFL () == One) || (OSFL () == 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        USBW = 0x03
                    }
                    Else
                    {
                        USBW = Zero
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0E, 0x04))
                }
            }

            Device (USB4)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If (((OSFL () == One) || (OSFL () == 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        USBW = 0x03
                    }
                    Else
                    {
                        USBW = Zero
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0E, 0x04))
                }
            }

            Device (USB5)
            {
                Name (_ADR, 0x001A0001)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If (((OSFL () == One) || (OSFL () == 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        USBW = 0x03
                    }
                    Else
                    {
                        USBW = Zero
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x05, 0x04))
                }
            }

            Device (USB6)
            {
                Name (_ADR, 0x001A0002)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    If (((OSFL () == One) || (OSFL () == 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        USBW = 0x03
                    }
                    Else
                    {
                        USBW = Zero
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x20, 0x04))
                }
            }

            Device (P0P4)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0P2, 0x02)
                Notify (\_SB.PCI0.P0P5, 0x02)
                Notify (\_SB.PCI0.P0P6, 0x02)
                Notify (\_SB.PCI0.P0P7, 0x02)
                Notify (\_SB.PCI0.P0P8, 0x02)
                Notify (\_SB.PCI0.P0P9, 0x02)
                Notify (\_SB.PCI0.P0P4, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0P1, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                \_SB.PCI0.SBRG.SIOH ()
            }

            Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                \_SB.PCI0.SBRG.SIOH ()
            }

            Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.EUSB, 0x02)
                Notify (\_SB.PCI0.USBE, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L03, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB0, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB1, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0C, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB2, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0E, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB3, 0x02)
                Notify (\_SB.PCI0.USB4, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L05, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB5, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L20, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB6, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (G0T0, Package (0x07)
        {
            0x00060000, 
            "AP version", 
            0x40000000, 
            Zero, 
            Zero, 
            One, 
            0x02
        })
        Name (G0T1, Package (0x07)
        {
            0x00060001, 
            "Feature flag", 
            0x40000000, 
            Zero, 
            Zero, 
            One, 
            0x08
        })
        Name (G0T2, Package (0x07)
        {
            0x00070002, 
            "ASAP function", 
            0x40000000, 
            Zero, 
            Zero, 
            Zero, 
            0x02
        })
        Name (G0T3, Package (0x07)
        {
            0x00070003, 
            "AMD Cool&Quiet", 
            0x20000000, 
            Zero, 
            Zero, 
            Zero, 
            0x02
        })
        Name (GRP0, Package (0x04)
        {
            G0T0, 
            G0T1, 
            G0T2, 
            G0T3
        })
        Method (GIT0, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == Zero))
            {
                ASB1 = Zero
            }
            ElseIf ((_T_0 == One))
            {
                ASB1 = One
            }
            ElseIf ((_T_0 == 0x02))
            {
                ASB1 = 0x02
            }
            ElseIf ((_T_0 == 0x03))
            {
                ASB1 = 0x03
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SIT0, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == Zero))
            {
                DBG8 = 0x0300
            }
            ElseIf ((_T_0 == One))
            {
                DBG8 = 0x0301
            }
            ElseIf ((_T_0 == 0x02))
            {
                DBG8 = 0x0302
            }
            ElseIf ((_T_0 == 0x03))
            {
                DBG8 = 0x0303
            }
            Else
            {
                ASB0 = Zero
            }
        }
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (G3T0, Package (0x07)
        {
            0x03010011, 
            "CPU Frequency", 
            Zero, 
            Zero, 
            0x4E20, 
            0x64, 
            0x0259
        })
        Name (G3T2, Package (0x07)
        {
            0x03060013, 
            "CPU Ratio", 
            Zero, 
            Zero, 
            0x06, 
            One, 
            0x19
        })
        Name (G321, Package (0x09)
        {
            0x03820032, 
            "DRAM Voltage", 
            Zero, 
            Zero, 
            0x0708, 
            0x14, 
            0x41, 
            One, 
            "Auto"
        })
        Name (G322, Package (0x0E)
        {
            0x03080031, 
            "DRAM Frequency", 
            Zero, 
            Zero, 
            0x09, 
            "Auto", 
            "667 MHz", 
            "800 MHz", 
            "833 MHz", 
            "886 MHz", 
            "1000 MHz", 
            "1066 MHz", 
            "1111 MHz", 
            "1333 MHz"
        })
        Name (G340, Package (0x09)
        {
            0x03810051, 
            "PCIE Frequency", 
            Zero, 
            Zero, 
            0x2710, 
            0x64, 
            0x33, 
            One, 
            "Auto"
        })
        Name (GRP3, Package (0x05)
        {
            G3T0, 
            G3T2, 
            G321, 
            G322, 
            G340
        })
        Name (IDEX, Zero)
        Method (GIT3, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == 0x11))
            {
                ASB1 = (GNVS (0xA6C8) - 0xC8)
            }
            ElseIf ((_T_0 == 0x13))
            {
                If (((Local0 = (GCAX (One) & 0x0FF0)) > 0x06F0))
                {
                    Local0 = GMAX (0x2C)
                    Local2 = ((Local0 >> 0x08) & 0xFF)
                    Local1 = (Local0 & 0xFF)
                    Local0 = (Local1 - Local2)
                    Local7 = GMDX (0x0198)
                    Local7 = ((Local7 >> 0x08) & 0xFF)
                    If ((Local7 < Local0))
                    {
                        Local7 = Local1
                    }
                }
                Else
                {
                    Local0 = GMDX (0x0198)
                    Local1 = ((Local0 >> 0x08) & 0x1F)
                    Local7 = Local1
                    Local0 = GMAX (0x0198)
                    Local0 = ((Local0 >> 0x18) & 0x1F)
                }

                If ((GNVS (0x1651) == Zero))
                {
                    If ((GMAX (0x17) & 0x00800000))
                    {
                        Local5 = ((GMAX (0x17) & 0x4000) >> 0x0E)
                        Local4 = (Local7 - Local0)
                        Local6 = (Local4 * 0x02)
                        ASB1 = (Local6 + Local5)
                    }
                    Else
                    {
                        ASB1 = (Local7 - Local0)
                    }
                }
                ElseIf ((GMAX (0x17) & 0x00800000))
                {
                    Local5 = ((GNVS (0x8298) & 0x40) >> 0x06)
                    Local4 = ((GNVS (0x8298) & 0x1F) - Local0)
                    Local6 = (Local4 * 0x02)
                    ASB1 = (Local6 + Local5)
                }
                Else
                {
                    ASB1 = ((GNVS (0x8298) & 0x1F) - Local0)
                }

                IDEX = ASB1
            }
            ElseIf ((_T_0 == 0x32))
            {
                ASB1 = GNVS (0x53A0)
            }
            ElseIf ((_T_0 == 0x31))
            {
                ASB1 = GNVS (0x4448)
            }
            ElseIf ((_T_0 == 0x51))
            {
                ASB1 = GNVS (0x6368)
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SIT3, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == 0x11))
            {
                Local2 = (Arg1 + 0xC8)
                If ((GNVS (0xA6C8) != Local2))
                {
                    Local1 = (GNVS (0xA6C8) - 0xC8)
                    Local0 = (Local1 * 0x03)
                    CreateByteField (MNBF, Local0, CB04)
                    CreateWordField (CLKR, 0x0B, CBMN)
                    CLKR = RBLK (0xD2, Zero, 0x13)
                    Local0 = (Arg1 * 0x03)
                    CreateByteField (MNBF, Local0, MN04)
                    CreateWordField (MNBF, Local0++, MNVL)
                    If ((CB04 == MN04))
                    {
                        If ((Arg2 & One))
                        {
                            CBMN = MNVL
                            WBLK (0xD2, Zero, 0x13, CLKR)
                        }
                    }
                    Else
                    {
                        ASB0 |= 0x02
                    }

                    If ((Arg2 & One))
                    {
                        SNVS (0xA6C8, Local2)
                    }
                }
            }
            ElseIf ((_T_0 == 0x13))
            {
                If ((IDEX != Arg1))
                {
                    If ((Arg2 & One))
                    {
                        SNVS (0x3510, 0x04)
                        SNVS (0x1651, One)
                        If (((Local0 = (GCAX (One) & 0x0FF0)) > 0x06F0))
                        {
                            Local0 = GMAX (0x2C)
                            Local2 = ((Local0 >> 0x08) & 0xFF)
                            Local1 = (Local0 & 0xFF)
                            Local3 = (Local1 - Local2)
                        }
                        Else
                        {
                            Local0 = GMDX (0x0198)
                            Local1 = ((Local0 >> 0x08) & 0x1F)
                            Local0 = GMAX (0x0198)
                            Local3 = ((Local0 >> 0x18) & 0x1F)
                        }

                        If ((GMAX (0x17) & 0x00800000))
                        {
                            Local2 = Arg1
                            Local0 = (Local2 & One)
                            Arg1 = (Local2 >> One)
                            Arg1 += Local3
                        }
                        Else
                        {
                            Local0 = Zero
                            Arg1 += Local3
                        }

                        Arg1 |= (Local0 << 0x06)
                        SNVS (0x8298, Arg1)
                    }

                    ASB0 |= 0x02
                }
            }
            ElseIf ((_T_0 == 0x32))
            {
                If ((GNVS (0x53A0) != Arg1))
                {
                    If ((Arg1 == Zero))
                    {
                        ASB0 |= 0x02
                    }
                    ElseIf ((Arg2 & One))
                    {
                        Local1 = (Arg1 - One)
                        WBYT (0x3C, 0x10, Local1)
                        WBYT (0x3C, 0x11, One)
                        WBYT (0x3C, 0x12, One)
                        WBYT (0x3C, 0x40, 0x02)
                        ENFG (0x09)
                        Local1 = (OPT5 & 0x1F)
                        Local3 = 0x10
                        Local2 = ((Local3 - Arg1) << 0x04)
                        Local2 &= 0xE0
                        OPT5 = (Local1 | Local2)
                    }

                    If ((Arg2 & One))
                    {
                        SNVS (0x53A0, Arg1)
                    }
                }
            }
            ElseIf ((_T_0 == 0x31))
            {
                If ((GNVS (0x4448) != Arg1))
                {
                    If ((Arg2 & One))
                    {
                        SNVS (0x4448, Arg1)
                    }

                    ASB0 |= 0x02
                }
            }
            ElseIf ((_T_0 == 0x51))
            {
                If ((GNVS (0x6368) != Arg1))
                {
                    If ((Arg2 & One))
                    {
                        SNVS (0x6368, Arg1)
                    }

                    ASB0 |= 0x02
                }
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Name (CLKR, Buffer (0x18)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        })
        Name (PCEF, Buffer (0x68)
        {
            /* 0000 */  0x9F, 0xD8, 0x9F, 0xD8, 0x9C, 0xC5, 0x62, 0xF2,
            /* 0008 */  0x5B, 0xC2, 0xD2, 0x82, 0x21, 0xF2, 0x9A, 0xC0,
            /* 0010 */  0x13, 0x8E, 0xDD, 0xDA, 0x1F, 0xEC, 0xDA, 0xC7,
            /* 0018 */  0xE1, 0xFF, 0x9F, 0xF2, 0x1C, 0xDD, 0x54, 0x9F,
            /* 0020 */  0x1F, 0xF9, 0xDB, 0xDA, 0xD0, 0x82, 0x5E, 0xF7,
            /* 0028 */  0x1D, 0xF1, 0x15, 0xB0, 0xDA, 0xDB, 0x98, 0xCC,
            /* 0030 */  0x16, 0xBD, 0x9C, 0xF2, 0x59, 0xDA, 0x19, 0xDC,
            /* 0038 */  0xD9, 0xDD, 0x99, 0xDF, 0x5A, 0xEA, 0xD6, 0xC7,
            /* 0040 */  0xD9, 0xE4, 0x58, 0xDD, 0x9A, 0xF1, 0x57, 0xD7,
            /* 0048 */  0x15, 0xC6, 0x1A, 0xF7, 0x96, 0xD2, 0xD4, 0xC0,
            /* 0050 */  0x18, 0xE9, 0x12, 0xB0, 0x52, 0xB1, 0x18, 0xEE,
            /* 0058 */  0xD3, 0xBD, 0x56, 0xDD, 0x18, 0xF3, 0xCE, 0x8E,
            /* 0060 */  0x0F, 0x9A, 0xD7, 0xED, 0xD8, 0xF9, 0x15, 0xDC 
        })
        Name (MNBF, Buffer (0x070B)
        {
            /* 0000 */  0x01, 0x64, 0xFC, 0x01, 0x5F, 0xDA, 0x01, 0xA1,
            /* 0008 */  0xE9, 0x01, 0xE2, 0xF1, 0x01, 0x98, 0xAB, 0x01,
            /* 0010 */  0x5D, 0xD0, 0x01, 0x5D, 0xD1, 0x01, 0x23, 0xFE,
            /* 0018 */  0x01, 0x15, 0x99, 0x01, 0x1C, 0xCD, 0x01, 0x5A,
            /* 0020 */  0xBF, 0x01, 0xA0, 0xEC, 0x01, 0xA2, 0xFC, 0x01,
            /* 0028 */  0xD3, 0x8D, 0x01, 0x22, 0xFF, 0x01, 0xD8, 0xB4,
            /* 0030 */  0x01, 0xD3, 0x8F, 0x01, 0x60, 0xF3, 0x01, 0x21,
            /* 0038 */  0xFC, 0x01, 0xA0, 0xF5, 0x01, 0x57, 0xB1, 0x03,
            /* 0040 */  0xA7, 0x96, 0x03, 0x7F, 0xF4, 0x03, 0xA1, 0x80,
            /* 0048 */  0x03, 0xBE, 0xF2, 0x03, 0xB1, 0xC0, 0x03, 0x73,
            /* 0050 */  0xC9, 0x03, 0xFE, 0xF5, 0x03, 0x35, 0xD3, 0x03,
            /* 0058 */  0x35, 0xD4, 0x03, 0x3E, 0xF9, 0x03, 0xF4, 0xD1,
            /* 0060 */  0x03, 0xB1, 0xC6, 0x03, 0x7E, 0xFC, 0x03, 0xE0,
            /* 0068 */  0x82, 0x03, 0x3A, 0xEE, 0x03, 0x7C, 0xF7, 0x03,
            /* 0070 */  0xAF, 0xC2, 0x03, 0xBD, 0xFD, 0x03, 0x34, 0xD9,
            /* 0078 */  0x03, 0x7B, 0xF7, 0x03, 0xEA, 0xB0, 0x03, 0x69,
            /* 0080 */  0xAD, 0x03, 0xE4, 0x98, 0x03, 0x6F, 0xC8, 0x03,
            /* 0088 */  0x36, 0xE7, 0x03, 0x77, 0xEC, 0x03, 0xB8, 0xF1,
            /* 0090 */  0x03, 0xB8, 0xF2, 0x03, 0x2E, 0xC8, 0x03, 0x34,
            /* 0098 */  0xE3, 0x03, 0x60, 0x8C, 0x03, 0x37, 0xF2, 0x03,
            /* 00A0 */  0x37, 0xF3, 0x03, 0xB6, 0xEF, 0x03, 0xE5, 0xA4,
            /* 00A8 */  0x03, 0xB2, 0xDF, 0x03, 0xA8, 0xB3, 0x03, 0x72,
            /* 00B0 */  0xE1, 0x03, 0x78, 0xFD, 0x03, 0x32, 0xE3, 0x03,
            /* 00B8 */  0xF0, 0xDA, 0x03, 0xF2, 0xE4, 0x03, 0x6E, 0xD3,
            /* 00C0 */  0x03, 0x29, 0xBD, 0x03, 0xB7, 0xFE, 0x03, 0x36,
            /* 00C8 */  0xFC, 0x03, 0xEC, 0xCD, 0x03, 0x9F, 0xF1, 0x03,
            /* 00D0 */  0xE0, 0x96, 0x03, 0xA3, 0xA5, 0x03, 0xB5, 0xFB,
            /* 00D8 */  0x03, 0x65, 0xB0, 0x03, 0x71, 0xEA, 0x03, 0xDF,
            /* 00E0 */  0x94, 0x03, 0x26, 0xB7, 0x03, 0xB3, 0xF6, 0x03,
            /* 00E8 */  0x74, 0xFC, 0x03, 0x64, 0xAF, 0x03, 0xB0, 0xEA,
            /* 00F0 */  0x03, 0x71, 0xF0, 0x03, 0xB0, 0xEB, 0x03, 0xAE,
            /* 00F8 */  0xE2, 0x03, 0x6F, 0xE8, 0x03, 0x31, 0xF3, 0x03,
            /* 0100 */  0x2A, 0xD1, 0x03, 0xE8, 0xC7, 0x03, 0xAC, 0xDC,
            /* 0108 */  0x03, 0x23, 0xB0, 0x03, 0xE6, 0xBF, 0x03, 0x2F,
            /* 0110 */  0xEE, 0x03, 0x25, 0xBC, 0x03, 0x61, 0xA8, 0x03,
            /* 0118 */  0x5C, 0x8F, 0x02, 0x2D, 0xE7, 0x02, 0x70, 0xF7,
            /* 0120 */  0x02, 0x71, 0xFD, 0x02, 0x67, 0xCA, 0x02, 0xA0,
            /* 0128 */  0xA6, 0x02, 0xA2, 0xB1, 0x02, 0x2A, 0xDC, 0x02,
            /* 0130 */  0x6C, 0xE7, 0x02, 0xEB, 0xE2, 0x02, 0xE5, 0xC3,
            /* 0138 */  0x02, 0x6B, 0xE4, 0x02, 0x2B, 0xE5, 0x02, 0x23,
            /* 0140 */  0xBB, 0x02, 0x62, 0xB6, 0x02, 0x2D, 0xF2, 0x02,
            /* 0148 */  0x2B, 0xE8, 0x02, 0xEB, 0xE8, 0x02, 0xAB, 0xE9,
            /* 0150 */  0x02, 0x6B, 0xEA, 0x02, 0x2B, 0xEB, 0x02, 0xEB,
            /* 0158 */  0xEB, 0x02, 0x2C, 0xF2, 0x02, 0x6B, 0xED, 0x02,
            /* 0160 */  0x2B, 0xEE, 0x02, 0xEB, 0xEE, 0x02, 0xAB, 0xEF,
            /* 0168 */  0x02, 0x6B, 0xF0, 0x02, 0xDF, 0xAD, 0x02, 0x2D,
            /* 0170 */  0xFD, 0x02, 0xE2, 0xBF, 0x02, 0x23, 0xC6, 0x02,
            /* 0178 */  0x2B, 0xF4, 0x02, 0xEB, 0xF4, 0x02, 0x65, 0xD3,
            /* 0180 */  0x02, 0x6B, 0xF6, 0x02, 0xEC, 0xFC, 0x02, 0x2A,
            /* 0188 */  0xF2, 0x02, 0xA2, 0xC4, 0x02, 0xA0, 0xB9, 0x02,
            /* 0190 */  0x62, 0xC6, 0x02, 0xDC, 0xA3, 0x02, 0xA9, 0xF0,
            /* 0198 */  0x02, 0x9E, 0xB0, 0x02, 0xEB, 0xFD, 0x02, 0xAB,
            /* 01A0 */  0xFE, 0x02, 0x1F, 0xB8, 0x02, 0xA0, 0xBE, 0x02,
            /* 01A8 */  0x22, 0xCB, 0x02, 0xA9, 0xF5, 0x02, 0x6A, 0xFC,
            /* 01B0 */  0x02, 0xE1, 0xC6, 0x02, 0x5F, 0xBB, 0x02, 0x67,
            /* 01B8 */  0xEC, 0x02, 0x28, 0xF3, 0x02, 0x9B, 0xA4, 0x02,
            /* 01C0 */  0xD9, 0x98, 0x02, 0x69, 0xFB, 0x02, 0xE5, 0xE2,
            /* 01C8 */  0x02, 0x64, 0xDD, 0x02, 0x5A, 0xA0, 0x02, 0x5D,
            /* 01D0 */  0xB3, 0x02, 0xDD, 0xB3, 0x02, 0xD6, 0x88, 0x02,
            /* 01D8 */  0x1E, 0xBB, 0x02, 0x28, 0xFA, 0x02, 0x9C, 0xAF,
            /* 01E0 */  0x02, 0x1C, 0xB0, 0x02, 0x21, 0xD0, 0x02, 0xA7,
            /* 01E8 */  0xF6, 0x02, 0xA5, 0xEA, 0x02, 0xA6, 0xF1, 0x02,
            /* 01F0 */  0xA7, 0xF8, 0x02, 0xD9, 0x9F, 0x02, 0xA6, 0xF3,
            /* 01F8 */  0x02, 0xDE, 0xC0, 0x02, 0xA3, 0xE1, 0x02, 0x99,
            /* 0200 */  0xA1, 0x02, 0x96, 0x8E, 0x02, 0x67, 0xFD, 0x02,
            /* 0208 */  0x54, 0x82, 0x02, 0x59, 0xA3, 0x02, 0x65, 0xF2,
            /* 0210 */  0x02, 0x5B, 0xB1, 0x02, 0x24, 0xED, 0x02, 0x19,
            /* 0218 */  0xA5, 0x02, 0xE0, 0xD3, 0x02, 0x9A, 0xAC, 0x02,
            /* 0220 */  0x17, 0x99, 0x02, 0xDC, 0xBA, 0x02, 0x5C, 0xBB,
            /* 0228 */  0x02, 0x96, 0x93, 0x02, 0x24, 0xF2, 0x02, 0xD8,
            /* 0230 */  0xA1, 0x02, 0x64, 0xF3, 0x02, 0x1F, 0xD2, 0x02,
            /* 0238 */  0xA4, 0xF4, 0x02, 0x15, 0x8F, 0x02, 0x9A, 0xB1,
            /* 0240 */  0x02, 0x20, 0xDB, 0x02, 0x1D, 0xC7, 0x02, 0x5F,
            /* 0248 */  0xD5, 0x02, 0x1D, 0xC8, 0x02, 0x60, 0xDD, 0x02,
            /* 0250 */  0xE1, 0xE4, 0x02, 0x62, 0xEC, 0x02, 0x1E, 0xD1,
            /* 0258 */  0x02, 0x9F, 0xD8, 0x02, 0x24, 0xFC, 0x02, 0x9B,
            /* 0260 */  0xBD, 0x02, 0xD5, 0x93, 0x02, 0x9C, 0xC5, 0x02,
            /* 0268 */  0xA3, 0xF7, 0x02, 0x9C, 0xC6, 0x02, 0xE3, 0xF8,
            /* 0270 */  0x02, 0x62, 0xF2, 0x02, 0x5E, 0xD6, 0x02, 0x61,
            /* 0278 */  0xEC, 0x02, 0x22, 0xF4, 0x02, 0x5B, 0xC2, 0x02,
            /* 0280 */  0x9A, 0xBB, 0x02, 0x9B, 0xAD, 0x02, 0xA2, 0xF6,
            /* 0288 */  0x02, 0xD2, 0x82, 0x02, 0x20, 0xE9, 0x02, 0x5F,
            /* 0290 */  0xE2, 0x02, 0xE2, 0xF8, 0x02, 0x21, 0xF2, 0x02,
            /* 0298 */  0x60, 0xEB, 0x02, 0x13, 0x8C, 0x02, 0xE1, 0xF3,
            /* 02A0 */  0x02, 0x9A, 0xC0, 0x02, 0x13, 0x8D, 0x02, 0xA1,
            /* 02A8 */  0xF5, 0x02, 0xA2, 0xFD, 0x02, 0x13, 0x8E, 0x02,
            /* 02B0 */  0xDC, 0xD1, 0x02, 0x5E, 0xE1, 0x02, 0x5D, 0xDA,
            /* 02B8 */  0x02, 0xDD, 0xDA, 0x02, 0xA1, 0xF9, 0x02, 0xA0,
            /* 02C0 */  0xF2, 0x02, 0x95, 0x9F, 0x02, 0x1F, 0xEC, 0x02,
            /* 02C8 */  0x97, 0xAF, 0x02, 0x9B, 0xCE, 0x02, 0x18, 0xB8,
            /* 02D0 */  0x02, 0xDA, 0xC7, 0x02, 0x88, 0x82, 0x02, 0x5F,
            /* 02D8 */  0xEF, 0x02, 0x91, 0x83, 0x02, 0xE1, 0xFF, 0x02,
            /* 02E0 */  0x59, 0xC2, 0x02, 0xD4, 0x9B, 0x02, 0xE0, 0xF9,
            /* 02E8 */  0x02, 0x9F, 0xF2, 0x02, 0x19, 0xC4, 0x02, 0x1C,
            /* 02F0 */  0xDC, 0x02, 0xDA, 0xCC, 0x02, 0x1C, 0xDB, 0x02,
            /* 02F8 */  0xD9, 0xC5, 0x02, 0xDF, 0xF5, 0x02, 0x12, 0x8F,
            /* 0300 */  0x02, 0x54, 0x9F, 0x02, 0x99, 0xC7, 0x02, 0x17,
            /* 0308 */  0xB8, 0x02, 0x51, 0x88, 0x02, 0x1F, 0xF9, 0x02,
            /* 0310 */  0x14, 0xA1, 0x02, 0x1E, 0xF2, 0x02, 0x5B, 0xDA,
            /* 0318 */  0x02, 0xDB, 0xDA, 0x02, 0xD7, 0xBA, 0x02, 0x5F,
            /* 0320 */  0xFC, 0x02, 0x1A, 0xD4, 0x02, 0xD0, 0x82, 0x02,
            /* 0328 */  0x9D, 0xED, 0x02, 0xD7, 0xBC, 0x02, 0x9D, 0xEE,
            /* 0330 */  0x02, 0x5E, 0xF7, 0x02, 0x5C, 0xE7, 0x02, 0x53,
            /* 0338 */  0x9D, 0x02, 0x11, 0x8D, 0x02, 0x1D, 0xF1, 0x02,
            /* 0340 */  0x53, 0x9E, 0x02, 0x1A, 0xD9, 0x02, 0x16, 0xB8,
            /* 0348 */  0x02, 0x15, 0xB0, 0x02, 0xDB, 0xE2, 0x02, 0xD5,
            /* 0350 */  0xB0, 0x02, 0x1E, 0xFD, 0x02, 0xDA, 0xDB, 0x02,
            /* 0358 */  0x58, 0xCB, 0x02, 0xD2, 0x98, 0x02, 0x95, 0xB2,
            /* 0360 */  0x02, 0x98, 0xCC, 0x02, 0x1A, 0xDE, 0x02, 0x1B,
            /* 0368 */  0xE7, 0x02, 0xD8, 0xCD, 0x02, 0x16, 0xBD, 0x02,
            /* 0370 */  0x17, 0xC6, 0x02, 0x9C, 0xF1, 0x02, 0x1C, 0xF2,
            /* 0378 */  0x02, 0x9C, 0xF2, 0x02, 0x1C, 0xF3, 0x02, 0x17,
            /* 0380 */  0xC8, 0x02, 0x5B, 0xEB, 0x02, 0x59, 0xDA, 0x02,
            /* 0388 */  0x18, 0xD2, 0x02, 0x50, 0x8C, 0x02, 0x17, 0xCA,
            /* 0390 */  0x02, 0x19, 0xDC, 0x02, 0x5A, 0xE5, 0x02, 0xDA,
            /* 0398 */  0xE5, 0x02, 0xD6, 0xC2, 0x02, 0xD9, 0xDD, 0x02,
            /* 03A0 */  0xD4, 0xB1, 0x02, 0x15, 0xBB, 0x02, 0xD0, 0x8E,
            /* 03A8 */  0x02, 0x99, 0xDF, 0x02, 0x17, 0xCE, 0x02, 0x94,
            /* 03B0 */  0xB3, 0x02, 0xDC, 0xFB, 0x02, 0x5A, 0xEA, 0x02,
            /* 03B8 */  0xDC, 0xFC, 0x02, 0x5C, 0xFD, 0x02, 0x54, 0xB5,
            /* 03C0 */  0x02, 0xD6, 0xC7, 0x02, 0xD2, 0xA3, 0x02, 0xD8,
            /* 03C8 */  0xDA, 0x02, 0x93, 0xAD, 0x02, 0xD9, 0xE4, 0x02,
            /* 03D0 */  0x9B, 0xF7, 0x02, 0x93, 0xAE, 0x02, 0x5A, 0xEF,
            /* 03D8 */  0x02, 0x58, 0xDD, 0x02, 0x93, 0xAF, 0x02, 0x92,
            /* 03E0 */  0xA6, 0x02, 0x57, 0xD5, 0x02, 0x9A, 0xF1, 0x02,
            /* 03E8 */  0xD6, 0xCC, 0x02, 0xDB, 0xFB, 0x02, 0x96, 0xCD,
            /* 03F0 */  0x02, 0x57, 0xD7, 0x02, 0x56, 0xCE, 0x02, 0x5A,
            /* 03F8 */  0xF4, 0x02, 0xCE, 0x83, 0x02, 0x15, 0xC6, 0x02,
            /* 0400 */  0x57, 0xD9, 0x02, 0x9B, 0xFF, 0x02, 0x9A, 0xF6,
            /* 0408 */  0x02, 0x1A, 0xF7, 0x02, 0x50, 0x98, 0x02, 0x0F,
            /* 0410 */  0x8F, 0x02, 0xD9, 0xEE, 0x02, 0x96, 0xD2, 0x02,
            /* 0418 */  0x5A, 0xF9, 0x02, 0x51, 0xA3, 0x02, 0x99, 0xF0,
            /* 0420 */  0x02, 0xD4, 0xC0, 0x02, 0xD5, 0xCA, 0x02, 0x9A,
            /* 0428 */  0xFB, 0x02, 0x95, 0xCB, 0x02, 0x18, 0xE9, 0x02,
            /* 0430 */  0x94, 0xC2, 0x02, 0x5A, 0xFD, 0x02, 0x58, 0xEA,
            /* 0438 */  0x02, 0x12, 0xB0, 0x02, 0x96, 0xD7, 0x02, 0x98,
            /* 0440 */  0xEB, 0x02, 0xD9, 0xF5, 0x02, 0x52, 0xB1, 0x02,
            /* 0448 */  0xD8, 0xEC, 0x02, 0x11, 0xA8, 0x02, 0x99, 0xF7,
            /* 0450 */  0x02, 0x18, 0xEE, 0x02, 0x97, 0xE4, 0x02, 0x15,
            /* 0458 */  0xD1, 0x02, 0x59, 0xF9, 0x02, 0xD3, 0xBD, 0x02,
            /* 0460 */  0x19, 0xFA, 0x02, 0x97, 0xE6, 0x02, 0xD3, 0xBE,
            /* 0468 */  0x02, 0x56, 0xDD, 0x02, 0x94, 0xC9, 0x02, 0xD3,
            /* 0470 */  0xBF, 0x02, 0xD0, 0xA1, 0x02, 0x18, 0xF3, 0x02,
            /* 0478 */  0xD3, 0xC0, 0x02, 0xD1, 0xAC, 0x02, 0x8E, 0x8E,
            /* 0480 */  0x02, 0xCE, 0x8E, 0x02, 0x95, 0xD6, 0x02, 0x4E,
            /* 0488 */  0x8F, 0x02, 0x55, 0xD7, 0x02, 0x0F, 0x9A, 0x02,
            /* 0490 */  0x56, 0xE2, 0x02, 0x58, 0xF7, 0x02, 0xD2, 0xB9,
            /* 0498 */  0x02, 0xD7, 0xED, 0x02, 0x98, 0xF8, 0x02, 0x97,
            /* 04A0 */  0xEE, 0x02, 0x12, 0xBB, 0x02, 0xD8, 0xF9, 0x02,
            /* 04A8 */  0xD7, 0xEF, 0x02, 0x91, 0xB1, 0x02, 0x18, 0xFB,
            /* 04B0 */  0x02, 0x15, 0xDC, 0x02, 0xD8, 0xFB, 0x02, 0xD7,
            /* 04B8 */  0xF1, 0x02, 0x92, 0xBD, 0x02, 0x16, 0xE8, 0x02,
            /* 04C0 */  0x98, 0xFD, 0x02, 0xD6, 0xE8, 0x02, 0xD7, 0xF3,
            /* 04C8 */  0x02, 0x0D, 0x8A, 0x02, 0x8F, 0x9F, 0x02, 0x14,
            /* 04D0 */  0xD5, 0x02, 0xD6, 0xEA, 0x02, 0xD4, 0xD5, 0x02,
            /* 04D8 */  0x50, 0xAB, 0x02, 0x51, 0xB6, 0x02, 0x56, 0xEC,
            /* 04E0 */  0x02, 0x97, 0xF7, 0x02, 0x55, 0xE2, 0x02, 0x52,
            /* 04E8 */  0xC2, 0x02, 0xD1, 0xB7, 0x02, 0x17, 0xF9, 0x02,
            /* 04F0 */  0x90, 0xAD, 0x02, 0x92, 0xC3, 0x02, 0x57, 0xFA,
            /* 04F8 */  0x02, 0xCC, 0x82, 0x02, 0x17, 0xFB, 0x02, 0xD2,
            /* 0500 */  0xC4, 0x02, 0x13, 0xD0, 0x02, 0x56, 0xF1, 0x02,
            /* 0508 */  0xCF, 0xA4, 0x02, 0x16, 0xF2, 0x02, 0x4E, 0x9A,
            /* 0510 */  0x02, 0xD5, 0xE7, 0x02, 0x13, 0xD2, 0x02, 0x52,
            /* 0518 */  0xC7, 0x02, 0xD4, 0xDD, 0x02, 0x13, 0xD3, 0x02,
            /* 0520 */  0xD6, 0xF4, 0x02, 0x50, 0xB2, 0x02, 0x13, 0xD4,
            /* 0528 */  0x02, 0x94, 0xDF, 0x02, 0x8D, 0x91, 0x02, 0x13,
            /* 0530 */  0xD5, 0x02, 0x16, 0xF7, 0x02, 0x96, 0xF7, 0x02,
            /* 0538 */  0x54, 0xE1, 0x02, 0xD1, 0xBF, 0x02, 0x55, 0xED,
            /* 0540 */  0x02, 0x13, 0xD7, 0x02, 0x15, 0xEE, 0x02, 0x14,
            /* 0548 */  0xE3, 0x02, 0x8F, 0xAA, 0x02, 0x0D, 0x94, 0x02,
            /* 0550 */  0x52, 0xCD, 0x02, 0x56, 0xFB, 0x02, 0xD4, 0xE4,
            /* 0558 */  0x02, 0x16, 0xFC, 0x02, 0x92, 0xCE, 0x02, 0xD6,
            /* 0560 */  0xFC, 0x02, 0x56, 0xFD, 0x02, 0x15, 0xF2, 0x02,
            /* 0568 */  0xD2, 0xCF, 0x02, 0x91, 0xC4, 0x02, 0x8D, 0x96,
            /* 0570 */  0x02, 0x90, 0xB9, 0x02, 0x12, 0xD1, 0x02, 0x55,
            /* 0578 */  0xF4, 0x02, 0xCC, 0x8B, 0x02, 0x54, 0xE9, 0x02,
            /* 0580 */  0x8B, 0x80, 0x02, 0x8F, 0xAF, 0x02, 0xCF, 0xAF,
            /* 0588 */  0x02, 0x0F, 0xB0, 0x02, 0xD5, 0xF6, 0x02, 0x0D,
            /* 0590 */  0x99, 0x02, 0x95, 0xF7, 0x02, 0x4E, 0xA5, 0x02,
            /* 0598 */  0x55, 0xF8, 0x02, 0x51, 0xC9, 0x02, 0x53, 0xE1,
            /* 05A0 */  0x02, 0x4E, 0xA6, 0x02, 0x50, 0xBE, 0x02, 0x53,
            /* 05A8 */  0xE2, 0x02, 0x94, 0xEE, 0x02, 0x4D, 0x9B, 0x02,
            /* 05B0 */  0x53, 0xE3, 0x02, 0xCB, 0x83, 0x02, 0x14, 0xF0,
            /* 05B8 */  0x02, 0x53, 0xE4, 0x02, 0x90, 0xC0, 0x02, 0x15,
            /* 05C0 */  0xFD, 0x02, 0x53, 0xE5, 0x02, 0xD5, 0xFD, 0x02,
            /* 05C8 */  0x14, 0xF2, 0x02, 0x11, 0xCE, 0x02, 0xCD, 0x9D,
            /* 05D0 */  0x02, 0xD2, 0xDA, 0x02, 0x53, 0xE7, 0x02, 0x4C,
            /* 05D8 */  0x92, 0x02, 0x4B, 0x86, 0x02, 0x12, 0xDC, 0x02,
            /* 05E0 */  0xD4, 0xF4, 0x02, 0x54, 0xF5, 0x02, 0x94, 0xF5,
            /* 05E8 */  0x02, 0x52, 0xDD, 0x02, 0x51, 0xD1, 0x02, 0x4D,
            /* 05F0 */  0xA0, 0x02, 0x90, 0xC5, 0x02, 0x54, 0xF7, 0x02,
            /* 05F8 */  0x53, 0xEB, 0x02, 0xD1, 0xD2, 0x02, 0x54, 0xF8,
            /* 0600 */  0x02, 0xCB, 0x88, 0x02, 0x14, 0xF9, 0x02, 0x0F,
            /* 0608 */  0xBB, 0x02, 0xD0, 0xC7, 0x02, 0x14, 0xFA, 0x02,
            /* 0610 */  0xCD, 0xA2, 0x02, 0xD4, 0xFA, 0x02, 0xCE, 0xAF,
            /* 0618 */  0x02, 0x0E, 0xB0, 0x02, 0x4E, 0xB0, 0x02, 0x8E,
            /* 0620 */  0xB0, 0x02, 0x94, 0xFC, 0x02, 0x50, 0xCA, 0x02,
            /* 0628 */  0x4B, 0x8B, 0x02, 0x91, 0xD7, 0x02, 0x92, 0xE4,
            /* 0630 */  0x02, 0x4D, 0xA5, 0x02, 0xCC, 0x98, 0x02, 0x14,
            /* 0638 */  0xFF, 0x02, 0xD2, 0xE5, 0x02, 0x90, 0xCC, 0x02,
            /* 0640 */  0x0F, 0xC0, 0x02, 0x93, 0xF3, 0x02, 0x12, 0xE7,
            /* 0648 */  0x02, 0xCF, 0xC0, 0x02, 0x93, 0xF4, 0x02, 0xCB,
            /* 0650 */  0x8D, 0x02, 0x52, 0xE8, 0x02, 0x93, 0xF5, 0x02,
            /* 0658 */  0x10, 0xCF, 0x02, 0x51, 0xDC, 0x02, 0x93, 0xF6,
            /* 0660 */  0x02, 0xD3, 0xF6, 0x02, 0x53, 0xF7, 0x02, 0x4A,
            /* 0668 */  0x82, 0x02, 0xD2, 0xEA, 0x02, 0x11, 0xDE, 0x02,
            /* 0670 */  0x50, 0xD1, 0x02, 0x4D, 0xAA, 0x02, 0x0A, 0x83,
            /* 0678 */  0x02, 0x93, 0xF9, 0x02, 0x8B, 0x90, 0x02, 0x13,
            /* 0680 */  0xFA, 0x02, 0x4D, 0xAB, 0x02, 0x0F, 0xC6, 0x02,
            /* 0688 */  0x13, 0xFB, 0x02, 0xD0, 0xD3, 0x02, 0xCF, 0xC6,
            /* 0690 */  0x02, 0x13, 0xFC, 0x02, 0xD1, 0xE1, 0x02, 0xD0,
            /* 0698 */  0xD4, 0x02, 0x13, 0xFD, 0x02, 0xCE, 0xBA, 0x02,
            /* 06A0 */  0x0E, 0xBB, 0x02, 0x13, 0xFE, 0x02, 0xCF, 0xC8,
            /* 06A8 */  0x02, 0x8B, 0x93, 0x02, 0x51, 0xE4, 0x02, 0x12,
            /* 06B0 */  0xF2, 0x02, 0x0D, 0xAF, 0x02, 0x92, 0xF2, 0x02,
            /* 06B8 */  0x91, 0xE5, 0x02, 0x52, 0xF3, 0x02, 0x90, 0xD8,
            /* 06C0 */  0x02, 0xD2, 0xF3, 0x02, 0x91, 0xE6, 0x02, 0x92,
            /* 06C8 */  0xF4, 0x02, 0x90, 0xD9, 0x02, 0x12, 0xF5, 0x02,
            /* 06D0 */  0x0B, 0x96, 0x02, 0x8D, 0xB1, 0x02, 0x4B, 0x96,
            /* 06D8 */  0x02, 0x4C, 0xA4, 0x02, 0x11, 0xE9, 0x02, 0x0E,
            /* 06E0 */  0xC0, 0x02, 0x4E, 0xC0, 0x02, 0x4F, 0xCE, 0x02,
            /* 06E8 */  0xCA, 0x89, 0x02, 0x91, 0xEA, 0x02, 0x92, 0xF8,
            /* 06F0 */  0x02, 0x50, 0xDD, 0x02, 0x51, 0xEB, 0x02, 0x8B,
            /* 06F8 */  0x98, 0x02, 0xD2, 0xF9, 0x02, 0xCB, 0x98, 0x02,
            /* 0700 */  0xCF, 0xD0, 0x02, 0x0D, 0xB5, 0x02, 0x4F, 0xD1,
            /* 0708 */  0x02, 0x90, 0xDF                               
        })
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (G4T0, Package (0x04)
        {
            0x04070010, 
            "CPU Q-FAN Control", 
            0x80000000, 
            Zero
        })
        Name (G4T1, Package (0x08)
        {
            0x04080011, 
            "CPU Q-FAN Profile", 
            0x00100001, 
            Zero, 
            0x03, 
            "Optimal", 
            "Silent", 
            "Performance"
        })
        Name (G420, Package (0x04)
        {
            0x04070070, 
            "Chassis Q-FAN Control", 
            0x80000000, 
            Zero
        })
        Name (G421, Package (0x0A)
        {
            0x04080071, 
            "Chassis FAN Ratio", 
            0x00700001, 
            Zero, 
            0x05, 
            "Auto", 
            "90%", 
            "80%", 
            "70%", 
            "60%"
        })
        Name (GRP4, Package (0x04)
        {
            G4T0, 
            G4T1, 
            G420, 
            G421
        })
        Method (GIT4, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == 0x10))
            {
                ASB1 = GNVS (0x1697)
            }
            ElseIf ((_T_0 == 0x11))
            {
                ASB1 = GNVS (0x2568)
            }
            ElseIf ((_T_0 == 0x70))
            {
                ASB1 = GNVS (0x169A)
            }
            ElseIf ((_T_0 == 0x71))
            {
                ASB1 = GNVS (0x3508)
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SIT4, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == 0x10))
            {
                If ((GNVS (0x1697) != Arg1))
                {
                    If ((Arg2 & One))
                    {
                        SNVS (0x1697, Arg1)
                        PAR0 = 0x77
                        ISMI (0x88)
                    }
                }
            }
            ElseIf ((_T_0 == 0x11))
            {
                If ((GNVS (0x2568) != Arg1))
                {
                    If ((Arg2 & One))
                    {
                        SNVS (0x2568, Arg1)
                        PAR0 = 0x77
                        ISMI (0x88)
                    }
                }
            }
            ElseIf ((_T_0 == 0x70))
            {
                If ((GNVS (0x169A) != Arg1))
                {
                    If ((Arg2 & One))
                    {
                        SNVS (0x169A, Arg1)
                        PAR0 = 0x78
                        ISMI (0x88)
                    }
                }
            }
            ElseIf ((_T_0 == 0x71))
            {
                If ((GNVS (0x3508) != Arg1))
                {
                    If ((Arg2 & One))
                    {
                        DBG8 = Arg1
                        SNVS (0x3508, Arg1)
                        PAR0 = 0x78
                        ISMI (0x88)
                    }
                }
            }
            Else
            {
                ASB0 = Zero
            }
        }
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (G5T0, Package (0x07)
        {
            0x05080000, 
            "AI Profile", 
            Zero, 
            Zero, 
            0x02, 
            "Auto", 
            Zero
        })
        Name (GRP5, Package (0x01)
        {
            G5T0
        })
        Method (GIT5, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == Zero))
            {
                ASB1 = One
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SIT5, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == Zero))
            {
                ASB0 = 0x03
            }
            Else
            {
                ASB0 = Zero
            }
        }
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (G6T1, Package (0x07)
        {
            0x06020011, 
            "Vcore Voltage", 
            0x20000000, 
            Zero, 
            0x0352, 
            0x02EE, 
            0x02
        })
        Name (G6T2, Package (0x07)
        {
            0x06030012, 
            "CPU Temperature", 
            0x20000000, 
            Zero, 
            0x0258, 
            0x015E, 
            0x02
        })
        Name (G6T3, Package (0x07)
        {
            0x06040013, 
            "CPU FAN Speed", 
            0x20000000, 
            Zero, 
            0x0258, 
            0x1900, 
            0x02
        })
        Name (G6T4, Package (0x07)
        {
            0x06040073, 
            "Chassis FAN Speed", 
            0x20000000, 
            Zero, 
            0x0258, 
            0x1900, 
            0x02
        })
        Name (G6T5, Package (0x07)
        {
            0x060400C3, 
            "Power FAN Speed", 
            0x20000000, 
            Zero, 
            0x0258, 
            0x1900, 
            0x02
        })
        Name (G6T6, Package (0x07)
        {
            0x06020061, 
            "+12V Voltage", 
            0x20000000, 
            0x2EE0, 
            0x27D8, 
            0x0E10, 
            0x02
        })
        Name (G6T7, Package (0x07)
        {
            0x06020062, 
            "+5V Voltage", 
            0x20000000, 
            0x1388, 
            0x1194, 
            0x03E8, 
            0x02
        })
        Name (G6T8, Package (0x07)
        {
            0x06020063, 
            "+3.3V Voltage", 
            0x20000000, 
            0x0CE4, 
            0x0B9A, 
            0x0294, 
            0x02
        })
        Name (G6T9, Package (0x07)
        {
            0x06030074, 
            "MB Temperature", 
            0x20000000, 
            Zero, 
            0x01C2, 
            0x01F4, 
            0x02
        })
        Name (GRP6, Package (0x09)
        {
            G6T1, 
            G6T2, 
            G6T3, 
            G6T4, 
            G6T5, 
            G6T6, 
            G6T7, 
            G6T8, 
            G6T9
        })
        Method (GIT6, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == 0x11))
            {
                ASB1 = 0x0600
            }
            ElseIf ((_T_0 == 0x12))
            {
                ASB1 = 0x0601
            }
            ElseIf ((_T_0 == 0x13))
            {
                ASB1 = 0x0602
            }
            ElseIf ((_T_0 == 0x73))
            {
                ASB1 = 0x0603
            }
            ElseIf ((_T_0 == 0xC3))
            {
                ASB1 = 0x0604
            }
            ElseIf ((_T_0 == 0x61))
            {
                ASB1 = 0x0605
            }
            ElseIf ((_T_0 == 0x62))
            {
                ASB1 = 0x0606
            }
            ElseIf ((_T_0 == 0x63))
            {
                ASB1 = 0x0607
            }
            ElseIf ((_T_0 == 0x74))
            {
                ASB1 = 0x0608
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SIT6, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == 0x11))
            {
                DBG8 = 0x0600
            }
            ElseIf ((_T_0 == 0x12))
            {
                DBG8 = 0x0601
            }
            ElseIf ((_T_0 == 0x13))
            {
                DBG8 = 0x0602
            }
            ElseIf ((_T_0 == 0x73))
            {
                DBG8 = 0x0603
            }
            ElseIf ((_T_0 == 0xC3))
            {
                DBG8 = 0x0604
            }
            ElseIf ((_T_0 == 0x61))
            {
                DBG8 = 0x0605
            }
            ElseIf ((_T_0 == 0x62))
            {
                DBG8 = 0x0606
            }
            ElseIf ((_T_0 == 0x63))
            {
                DBG8 = 0x0607
            }
            ElseIf ((_T_0 == 0x74))
            {
                DBG8 = 0x0608
            }
            Else
            {
                ASB0 = Zero
            }
        }
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (G9T0, Package (0x0B)
        {
            0x09080000, 
            "AI Overclocking", 
            Zero, 
            One, 
            0x06, 
            "Manual", 
            "Auto", 
            "Standard", 
            Zero, 
            "N.O.S.", 
            Zero
        })
        Name (GRP9, Package (0x01)
        {
            G9T0
        })
        Method (GIT9, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == Zero))
            {
                ASB1 = GNVS (0x34F0)
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SIT9, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == Zero))
            {
                If ((GNVS (0x34F0) != Arg1))
                {
                    If ((Arg2 & One))
                    {
                        SNVS (0x34F0, Arg1)
                    }

                    ASB0 |= 0x02
                }
            }
            Else
            {
                ASB0 = Zero
            }
        }
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (GBT0, Package (0x07)
        {
            0x0B060001, 
            "System Performance", 
            Zero, 
            Zero, 
            0x03, 
            One, 
            0x04
        })
        Name (GBT1, Package (0x07)
        {
            0x0B060002, 
            "System Performance Control", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GBT2, Package (0x07)
        {
            0x0B060003, 
            "System GUI", 
            0x02, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GRPB, Package (0x03)
        {
            GBT0, 
            GBT1, 
            GBT2
        })
        Method (GITB, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == One))
            {
                ASB1 = (DerefOf (GBT0 [0x02]) & 0xFFFF)
            }
            ElseIf ((_T_0 == 0x02))
            {
                ASB1 = DerefOf (GBT1 [0x02])
            }
            ElseIf ((_T_0 == 0x03))
            {
                ASB1 = DerefOf (GBT2 [0x02])
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SITB, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == One))
            {
                Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                _T_1 = (Arg2 & 0xFFFF)
                If ((_T_1 == Zero))
                {
                    Local0 = (DerefOf (GBT0 [0x02]) & 0xFFFF)
                    If ((Local0 == Zero))
                    {
                        PAR0 = Local0
                    }
                }
                ElseIf ((_T_1 == One))
                {
                    Local0 = (Arg1 & 0xFFFF)
                    GBT0 [0x02] = Local0
                    SICL (Local0)
                    PAR0 = Local0
                    ISMI (0x88)
                }
                Else
                {
                    ASB0 = Zero
                }
            }
            ElseIf ((_T_0 == 0x02))
            {
                Local0 = (Arg1 & 0xFF)
                If ((ITCG (Local0) == One))
                {
                    GBT1 [0x02] = Local0
                }
                Else
                {
                    ASB0 = Zero
                }
            }
            Else
            {
                ASB0 = Zero
            }
        }
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (GDT1, Package (0x07)
        {
            0x0D070001, 
            "RTC Alarm", 
            One, 
            Zero, 
            Zero, 
            One, 
            0x02
        })
        Name (GDT2, Package (0x07)
        {
            0x0D060002, 
            "Alarm Date", 
            Zero, 
            Zero, 
            Zero, 
            One, 
            0x20
        })
        Name (GDT3, Package (0x07)
        {
            0x0D060003, 
            "Alarm Hour", 
            Zero, 
            Zero, 
            Zero, 
            One, 
            0x18
        })
        Name (GDT4, Package (0x07)
        {
            0x0D060004, 
            "Alarm Minute", 
            Zero, 
            Zero, 
            Zero, 
            One, 
            0x3C
        })
        Name (GDT5, Package (0x07)
        {
            0x0D060005, 
            "Alarm Second", 
            Zero, 
            Zero, 
            Zero, 
            One, 
            0x3C
        })
        Name (GRPD, Package (0x05)
        {
            GDT1, 
            GDT2, 
            GDT3, 
            GDT4, 
            GDT5
        })
        Method (GITD, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == One))
            {
                ASB1 = GNVS (0x168F)
            }
            ElseIf ((_T_0 == 0x02))
            {
                ASB1 = GNVS (0x5390)
            }
            ElseIf ((_T_0 == 0x03))
            {
                ASB1 = GNVS (0x5398)
            }
            ElseIf ((_T_0 == 0x04))
            {
                ASB1 = GNVS (0x6358)
            }
            ElseIf ((_T_0 == 0x05))
            {
                ASB1 = GNVS (0x6360)
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SITD, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == One))
            {
                SNVS (0x168F, Arg1)
                ASB0 = 0x03
            }
            ElseIf ((_T_0 == 0x02))
            {
                SNVS (0x5390, Arg1)
                ASB0 = 0x03
            }
            ElseIf ((_T_0 == 0x03))
            {
                SNVS (0x5398, Arg1)
                ASB0 = 0x03
            }
            ElseIf ((_T_0 == 0x04))
            {
                SNVS (0x6358, Arg1)
                ASB0 = 0x03
            }
            ElseIf ((_T_0 == 0x05))
            {
                SNVS (0x6360, Arg1)
                ASB0 = 0x03
            }
            Else
            {
                ASB0 = Zero
            }
        }
    }

    Scope (_GPE)
    {
        Method (_L18, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.SBRG.ASOC, 0x05)
            If ((\_SB.PCI0.SBRG.ASOC.AIGC == One))
            {
                \_SB.PCI0.SBRG.ASOC.GITE (0x0E060001)
                \_SB.PCI0.SBRG.ASOC.SICL ((0x8010 | \_SB.PCI0.SBRG.ASOC.ASB1))
            }

            \_SB.PCI0.SBRG.ASOC.RCAS ()
        }
    }

    OperationRegion (GPS0, SystemIO, GPBS, 0x10)
    Field (GPS0, ByteAcc, NoLock, Preserve)
    {
        Offset (0x0C), 
        GPL0,   1
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (GET1, Package (0x07)
        {
            0x0E060001, 
            "OC Status", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET2, Package (0x07)
        {
            0x0E0A0011, 
            "ICPU Value", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET3, Package (0x07)
        {
            0x0E020012, 
            "VCPU Value", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET4, Package (0x07)
        {
            0x0E0B0013, 
            "PCPU Value", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET5, Package (0x07)
        {
            0x0E0A0014, 
            "OC Threshold1", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET6, Package (0x07)
        {
            0x0E0A0015, 
            "OC Threshold2", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET7, Package (0x07)
        {
            0x0E0A0016, 
            "OC Threshold3", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GRPE, Package (0x07)
        {
            GET1, 
            GET2, 
            GET3, 
            GET4, 
            GET5, 
            GET6, 
            GET7
        })
        Name (ADP3, Package (0x0D)
        {
            0x40, 
            0x3B, 
            0x48, 
            0x4A, 
            0x4C, 
            0x69, 
            0x6A, 
            0x6B, 
            0x56, 
            0x5C, 
            0x37, 
            0x38, 
            0x36
        })
        Name (OCST, Buffer (0x04)
        {
             0x00, 0x01, 0x02, 0x03                         
        })
        Method (GITE, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == One))
            {
                ASB1 = DerefOf (OCST [RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [One]))])
            }
            ElseIf ((_T_0 == 0x11))
            {
                Local0 = RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x02]))
                Local1 = RBYT (DerefOf (ADP3 [Zero]), (DerefOf (ADP3 [0x02]) + One))
                ASB1 = ((Local1 << 0x02) | (Local0 & 0x03))
            }
            ElseIf ((_T_0 == 0x12))
            {
                Local0 = RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x03]))
                Local1 = RBYT (DerefOf (ADP3 [Zero]), (DerefOf (ADP3 [0x03]) + One))
                ASB1 = ((Local1 << 0x02) | (Local0 & 0x03))
            }
            ElseIf ((_T_0 == 0x13))
            {
                Local0 = RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x04]))
                Local1 = RBYT (DerefOf (ADP3 [Zero]), (DerefOf (ADP3 [0x04]) + One))
                ASB1 = ((Local1 << 0x08) | Local0)
            }
            ElseIf ((_T_0 == 0x14))
            {
                ASB1 = RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x05]))
            }
            ElseIf ((_T_0 == 0x15))
            {
                ASB1 = RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x06]))
            }
            ElseIf ((_T_0 == 0x16))
            {
                ASB1 = RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x07]))
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Method (SITE, 3, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = (Arg0 & 0xFFFF)
            If ((_T_0 == 0x14))
            {
                WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x05]), Arg1)
            }
            ElseIf ((_T_0 == 0x15))
            {
                WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x06]), Arg1)
            }
            ElseIf ((_T_0 == 0x16))
            {
                WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x07]), Arg1)
            }
            Else
            {
                ASB0 = Zero
            }
        }

        Name (FSBL, Package (0x04)
        {
            Package (0x07)
            {
                0xDE, 
                0xDC, 
                0xD1, 
                0xD1, 
                0xD1, 
                0x64, 
                0xFC
            }, 

            Package (0x07)
            {
                0x6E, 
                0xE1, 
                0xD6, 
                0xD6, 
                0xD6, 
                0x36, 
                0xFC
            }, 

            Package (0x07)
            {
                0x22, 
                0xD0, 
                0xC6, 
                0xC6, 
                0xC6, 
                0x62, 
                0xC6
            }, 

            Package (0x07)
            {
                0xDE, 
                0xDC, 
                0xD1, 
                0xD1, 
                0xD1, 
                0xDE, 
                0xD1
            }
        })
        Name (CLKB, Buffer (0x1B)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0018 */  0x00, 0x00, 0x00                               
        })
        Method (ITCG, 1, NotSerialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            _T_0 = GNVS (0x354C)
            If ((_T_0 == Zero))
            {
                Local0 = One
            }
            ElseIf ((_T_0 == 0x04))
            {
                Local0 = 0x02
            }
            ElseIf ((_T_0 == 0x06))
            {
                Local0 = 0x03
            }
            Else
            {
                Local0 = Zero
            }

            CreateByteField (CLKB, Zero, CB00)
            CreateByteField (CLKB, 0x0B, CB11)
            CreateByteField (CLKB, 0x0C, CB12)
            CreateByteField (CLKB, 0x14, CB20)
            CreateByteField (CLKB, 0x16, CB22)
            CreateByteField (CLKB, 0x17, CB23)
            CreateByteField (CLKB, 0x18, CB24)
            CreateByteField (CLKB, 0x19, CB25)
            CLKB = RBLK (0xD2, Zero, 0x1A)
            Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
            _T_1 = (Arg0 & 0xFF)
            If ((_T_1 == Zero))
            {
                CB00 = (CB00 | 0x20)
                CB20 = (CB20 & 0xFB)
                CB22 = (CB22 & 0xF7)
                CB11 = DerefOf (DerefOf (FSBL [Local0]) [0x05])
                CB12 = DerefOf (DerefOf (FSBL [Local0]) [0x06])
            }
            ElseIf ((_T_1 == One))
            {
                CB00 = (CB00 & 0xDF)
                CB20 = (CB20 | 0x04)
                CB22 = (CB22 | 0x08)
                CB11 = DerefOf (DerefOf (FSBL [Local0]) [Zero])
                CB12 = DerefOf (DerefOf (FSBL [Local0]) [One])
                CB23 = DerefOf (DerefOf (FSBL [Local0]) [0x03])
                CB24 = DerefOf (DerefOf (FSBL [Local0]) [0x02])
                CB25 = DerefOf (DerefOf (FSBL [Local0]) [0x04])
            }
            Else
            {
                Return (Zero)
            }

            WBLK (0xD2, Zero, 0x1A, CLKB)
            Return (One)
        }

        Name (AIGC, Zero)
        Method (SICL, 1, NotSerialized)
        {
            If ((Arg0 & 0x8000))
            {
                AIGC = One
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                _T_0 = (Arg0 & 0xFF)
                If ((_T_0 == 0x10))
                {
                    SPIC (Zero)
                    PICL = Zero
                }
                ElseIf ((_T_0 == 0x11))
                {
                    SPIC (One)
                    PICL = One
                }
                ElseIf ((_T_0 == 0x12))
                {
                    SPIC (0x02)
                    PICL = 0x02
                }
                ElseIf ((_T_0 == 0x13))
                {
                    SPIC (0x03)
                    PICL = 0x03
                }
                Else
                {
                }
            }
            Else
            {
                AIGC = Zero
                If ((Arg0 & 0x4000))
                {
                    SPIC (Zero)
                    PICL = Zero
                }
                Else
                {
                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                    _T_1 = (Arg0 & 0xFF)
                    If ((_T_1 == Zero))
                    {
                        SPIC (One)
                        PICL = One
                    }
                    ElseIf ((_T_1 == One))
                    {
                        SPIC (0x02)
                        PICL = 0x02
                    }
                    ElseIf ((_T_1 == 0x02))
                    {
                        SPIC (0x03)
                        PICL = 0x03
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Return (One)
        }

        Name (PICL, One)
        Name (PSLV, Package (0x04)
        {
            Package (0x05)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x05)
            {
                Zero, 
                Zero, 
                0xFF, 
                Zero, 
                0x10
            }, 

            Package (0x05)
            {
                Zero, 
                0xFF, 
                0xFF, 
                0x30, 
                Zero
            }, 

            Package (0x05)
            {
                0xFF, 
                0xFF, 
                0xFF, 
                0x2C, 
                Zero
            }
        })
        Method (SPIC, 1, NotSerialized)
        {
            If ((Arg0 <= PICL))
            {
                GPL0 = One
                WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x08]), DerefOf (DerefOf (PSLV [Arg0]) [0x03]))
                WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x09]), DerefOf (DerefOf (PSLV [Arg0]) [0x04]))
                If ((AIGC == Zero))
                {
                    WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x05]), DerefOf (DerefOf (PSLV [Arg0]) [Zero]))
                    Sleep (0x03E8)
                    WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x06]), DerefOf (DerefOf (PSLV [Arg0]) [One]))
                    Sleep (0x03E8)
                    WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x07]), DerefOf (DerefOf (PSLV [Arg0]) [0x02]))
                    Sleep (0x03E8)
                }
            }
            Else
            {
                If ((AIGC == Zero))
                {
                    WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x07]), DerefOf (DerefOf (PSLV [Arg0]) [0x02]))
                    Sleep (0x03E8)
                    WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x06]), DerefOf (DerefOf (PSLV [Arg0]) [One]))
                    Sleep (0x03E8)
                    WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x05]), DerefOf (DerefOf (PSLV [Arg0]) [Zero]))
                    Sleep (0x03E8)
                }

                WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x09]), DerefOf (DerefOf (PSLV [Arg0]) [0x04]))
                WBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x08]), DerefOf (DerefOf (PSLV [Arg0]) [0x03]))
                If ((Arg0 == 0x03))
                {
                    GPL0 = Zero
                }
            }

            RCAS ()
        }

        Method (RCAS, 0, NotSerialized)
        {
            RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x0A]))
            RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x0B]))
            RBYT (DerefOf (ADP3 [Zero]), DerefOf (ADP3 [0x0C]))
        }
    }

    OperationRegion (_SB.PCI0.SBRG.PIX0, PCI_Config, 0x60, 0x0C)
    Field (\_SB.PCI0.SBRG.PIX0, ByteAcc, NoLock, Preserve)
    {
        PIRA,   8, 
        PIRB,   8, 
        PIRC,   8, 
        PIRD,   8, 
        Offset (0x08), 
        PIRE,   8, 
        PIRF,   8, 
        PIRG,   8, 
        PIRH,   8
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, IRA0)
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRA & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSA)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRA |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRA & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRA = Local0
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRB & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSB)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRB |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRB & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRB = Local0
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRC & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSC)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRC |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRC & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRC = Local0
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRD & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSD)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRD |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRD & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRD = Local0
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRE & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSE)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRE |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRE & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRF & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSF)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRF |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRF & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRG & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSG)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRG |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRG & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRH & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSH)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRH |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRH & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }
    }

    Scope (_SB)
    {
        Name (XCPD, Zero)
        Name (XNPT, One)
        Name (XCAP, 0x02)
        Name (XDCP, 0x04)
        Name (XDCT, 0x08)
        Name (XDST, 0x0A)
        Name (XLCP, 0x0C)
        Name (XLCT, 0x10)
        Name (XLST, 0x12)
        Name (XSCP, 0x14)
        Name (XSCT, 0x18)
        Name (XSST, 0x1A)
        Name (XRCT, 0x1C)
        Mutex (MUTE, 0x00)
        Method (RBPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            Local0 = (Arg0 + PCIB)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (RWPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            Arg0 &= 0xFFFFFFFE
            Local0 = (Arg0 + PCIB)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (RDPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            Arg0 &= 0xFFFFFFFC
            Local0 = (Arg0 + PCIB)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (WBPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0x0FFF)
            Local0 = (Arg0 + PCIB)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            XCFG = Arg1
            Release (MUTE)
        }

        Method (WWPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            Arg0 &= 0xFFFFFFFE
            Local0 = (Arg0 + PCIB)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            XCFG = Arg1
            Release (MUTE)
        }

        Method (WDPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            Arg0 &= 0xFFFFFFFC
            Local0 = (Arg0 + PCIB)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            XCFG = Arg1
            Release (MUTE)
        }

        Method (RWDP, 3, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            Arg0 &= 0xFFFFFFFC
            Local0 = (Arg0 + PCIB)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Local1 = (XCFG & Arg2)
            XCFG = (Local1 | Arg1)
            Release (MUTE)
        }

        Method (RPME, 1, NotSerialized)
        {
            Local0 = (Arg0 + 0x84)
            Local1 = RDPE (Local0)
            If ((Local1 == Ones))
            {
                Return (Zero)
            }
            Else
            {
                If ((Local1 && 0x00010000))
                {
                    WDPE (Local0, (Local1 & 0x00010000))
                    Return (One)
                }

                Return (Zero)
            }
        }
    }

    OperationRegion (SMRG, SystemIO, 0x0400, 0x10)
    Field (SMRG, ByteAcc, NoLock, Preserve)
    {
        HSTS,   8, 
        SSTS,   8, 
        HSTC,   8, 
        HCMD,   8, 
        HADR,   8, 
        HDT0,   8, 
        HDT1,   8, 
        BLKD,   8
    }

    Field (SMRG, ByteAcc, NoLock, Preserve)
    {
        Offset (0x05), 
        HDTW,   16
    }

    Method (SCMD, 4, Serialized)
    {
        Local0 = 0x05
        While (Local0--)
        {
            Local1 = 0xFFFF
            While ((HSTS && Local1--))
            {
                HSTS = 0xFE
                Stall (0x0A)
            }

            Local2 = HSTC
            HADR = Arg0
            HCMD = Arg1
            HDTW = Arg2
            HSTC = Arg3
            Local1 = 0xFFFF
            While (Local1--)
            {
                If ((HSTS & 0x0C))
                {
                    Local1 = One
                }

                If (((HSTS & 0x03) == 0x02))
                {
                    Return (HDTW)
                }

                Stall (0x0A)
            }

            HSTC = 0x42
            Local1 = 0xFFFF
            While (Local1--)
            {
                If ((HSTS & 0x10))
                {
                    Local1 = One
                }

                Stall (0x0A)
            }

            HSTC = Zero
        }

        Return (Ones)
    }

    Method (SBYT, 2, NotSerialized)
    {
        SCMD (Arg0, Arg1, Zero, 0x44)
    }

    Method (WBYT, 3, NotSerialized)
    {
        SCMD (Arg0, Arg1, Arg2, 0x48)
    }

    Method (WWRD, 3, NotSerialized)
    {
        SCMD (Arg0, Arg1, Arg2, 0x4C)
    }

    Method (RSBT, 2, NotSerialized)
    {
        Arg0 |= One
        Return ((SCMD (Arg0, Arg1, Zero, 0x44) & 0xFF))
    }

    Method (RBYT, 2, NotSerialized)
    {
        Arg0 |= One
        Return ((SCMD (Arg0, Arg1, Zero, 0x48) & 0xFF))
    }

    Method (RWRD, 2, NotSerialized)
    {
        Arg0 |= One
        Return (SCMD (Arg0, Arg1, Zero, 0x4C))
    }

    Method (RBLK, 3, NotSerialized)
    {
        Local0 = (Arg0 | One)
        SCMD (Local0, Arg1, Arg2, 0x54)
        Local0 = HSTC
        Local0 = HDT0
        Local7 = (Local0 + One)
        Name (RBUF, Buffer (Local7){})
        Local1 = Zero
        While (Local0)
        {
            RBUF [Local1] = BLKD
            Local0--
            Local1++
        }

        Return (RBUF)
    }

    Method (WBLK, 4, NotSerialized)
    {
        Local0 = HSTC
        Local0 = Zero
        While ((Local0 <= Arg2))
        {
            BLKD = DerefOf (Arg3 [Local0])
            Local0++
        }

        Local0 = (Arg0 & 0xFE)
        SCMD (Local0, Arg1, Arg2, 0x54)
    }

    Scope (_SB.PCI0.SBRG.SIOR)
    {
        Method (HWV0, 0, NotSerialized)
        {
            Return ((VCOR * 0x08))
        }

        Method (HWV1, 0, NotSerialized)
        {
            Return ((V12V * 0x08))
        }

        Method (HWV3, 0, NotSerialized)
        {
            Return ((V33V * 0x08))
        }

        Method (HWV5, 0, NotSerialized)
        {
            Return ((V50V * 0x08))
        }

        Method (HWT0, 0, NotSerialized)
        {
            Local1 = MBTE
            Local1 *= 0x0A
            Return (Local1)
        }

        Method (HWT1, 0, NotSerialized)
        {
            BSEL = One
            Local1 = TSR1
            Local1 *= 0x0A
            Local2 = TSR2
            Local2 *= 0x05
            Local1 += Local2
            Return (Local1)
        }

        Method (HWT2, 0, NotSerialized)
        {
            BSEL = 0x02
            Local1 = TSR1
            Local1 *= 0x0A
            Local2 = TSR2
            Local2 *= 0x05
            Local1 += Local2
            Return (Local1)
        }

        OperationRegion (DBGE, SystemIO, 0x80, 0x04)
        Field (DBGE, WordAcc, NoLock, Preserve)
        {
            DBGG,   22
        }

        Method (HWF0, 0, NotSerialized)
        {
            Local0 = FAN1
            BSEL = Zero
            Local1 = (FD21 & 0x20)
            Local1 >>= 0x05
            Local1 *= 0x04
            Local2 = (FDR1 & 0x30)
            Local2 >>= 0x04
            Local1 += Local2
            If (((Local1 > 0x05) || (Local1 < 0x02)))
            {
                If ((Local0 > 0xF0))
                {
                    Local1 = 0x02
                }
                ElseIf ((Local0 < 0x1E))
                {
                    Local1 = 0x05
                }
                Else
                {
                    Local1 = 0x03
                }

                Divide (Local1, 0x04, Local2, Local3)
                Local3 <<= 0x05
                Local4 = FD21
                Local4 &= 0xDF
                FD21 = (Local3 | Local4)
                Local4 = FDR1
                Local4 &= 0xCF
                Local2 <<= 0x04
                Local4 |= One
                FDR1 = (Local4 | Local2)
            }

            While ((((Local0 > 0xF0) && (Local1 < 0x05)) || ((Local0 < 0x1E) && (Local1 > 0x02))))
            {
                If (((Local0 > 0xF0) && (Local1 < 0x05)))
                {
                    Local1 += One
                    Divide (Local1, 0x04, Local2, Local3)
                    BSEL = Zero
                    Local3 <<= 0x05
                    Local4 = FD21
                    Local4 &= 0xDF
                    FD21 = (Local3 | Local4)
                    Local4 = FDR1
                    Local4 &= 0xCF
                    Local2 <<= 0x04
                    Local4 |= One
                    FDR1 = (Local4 | Local2)
                    Sleep (0x32)
                    Local0 = FAN1
                    Sleep (0x32)
                    Local0 = FAN1
                    Sleep (0x32)
                    Local0 = FAN1
                }
                Else
                {
                    Local1 -= One
                    Divide (Local1, 0x04, Local2, Local3)
                    BSEL = Zero
                    Local3 <<= 0x05
                    Local4 = FD21
                    Local4 &= 0xDF
                    FD21 = (Local3 | Local4)
                    Local4 = FDR1
                    Local4 &= 0xCF
                    Local2 <<= 0x04
                    Local4 |= One
                    FDR1 = (Local4 | Local2)
                    Sleep (0x32)
                    Local0 = FAN1
                    Sleep (0x32)
                    Local0 = FAN1
                    Sleep (0x32)
                    Local0 = FAN1
                }
            }

            If (((Local0 == 0xFF) && (Local1 == 0x05)))
            {
                Return (Zero)
            }

            If (((Local0 == Zero) && (Local1 == 0x02)))
            {
                Return (0xFFFF)
            }

            Local2 = One
            While (Local1)
            {
                Local2 *= 0x02
                Local1--
            }

            Local0 *= Local2
            Divide (0x00149970, Local0, Local1, Local0)
            Return (Local0)
        }

        Method (HWF1, 0, NotSerialized)
        {
            BSEL = Zero
            Local0 = FAN2
            Local1 = (FD21 & 0x40)
            Local1 >>= 0x06
            Local1 *= 0x04
            Local2 = (FDR1 & 0xC0)
            Local2 >>= 0x06
            Local1 += Local2
            If (((Local1 > 0x05) || (Local1 < 0x02)))
            {
                If ((Local0 > 0xF0))
                {
                    Local1 = 0x02
                }
                ElseIf ((Local0 < 0x1E))
                {
                    Local1 = 0x05
                }
                Else
                {
                    Local1 = 0x03
                }

                Divide (Local1, 0x04, Local2, Local3)
                Local3 <<= 0x06
                Local4 = FD21
                Local4 &= 0xBF
                FD21 = (Local3 | Local4)
                Local4 = FDR1
                Local4 &= 0x3F
                Local2 <<= 0x06
                Local4 |= One
                FDR1 = (Local4 | Local2)
            }

            While ((((Local0 > 0xF0) && (Local1 < 0x05)) || ((Local0 < 0x1E) && (Local1 > 0x02))))
            {
                If (((Local0 < 0x1E) && (Local1 > 0x02)))
                {
                    Local1 -= One
                    Divide (Local1, 0x04, Local2, Local3)
                    BSEL = Zero
                    Local3 <<= 0x06
                    Local4 = FD21
                    Local4 &= 0xBF
                    FD21 = (Local3 | Local4)
                    Local4 = FDR1
                    Local4 &= 0x3F
                    Local2 <<= 0x06
                    Local4 |= One
                    FDR1 = (Local4 | Local2)
                    Sleep (0x32)
                    BSEL = Zero
                    Local0 = FAN2
                    Sleep (0x32)
                    Local0 = FAN2
                    Sleep (0x32)
                    Local0 = FAN2
                }
                Else
                {
                    Local1 += One
                    Divide (Local1, 0x04, Local2, Local3)
                    BSEL = Zero
                    Local3 <<= 0x06
                    Local4 = FD21
                    Local4 &= 0xBF
                    FD21 = (Local3 | Local4)
                    Local4 = FDR1
                    Local4 &= 0x3F
                    Local2 <<= 0x06
                    Local4 |= One
                    FDR1 = (Local4 | Local2)
                    Sleep (0x32)
                    BSEL = Zero
                    Local0 = FAN2
                    Sleep (0x32)
                    Local0 = FAN2
                    Sleep (0x32)
                    Local0 = FAN2
                }
            }

            If (((Local0 == 0xFF) && (Local1 == 0x05)))
            {
                Return (Zero)
            }

            If (((Local0 == Zero) && (Local1 == 0x02)))
            {
                Return (0xFFFF)
            }

            Local2 = One
            While (Local1)
            {
                Local2 *= 0x02
                Local1--
            }

            Local0 *= Local2
            Divide (0x00149970, Local0, Local1, Local0)
            Return (Local0)
        }

        Method (HWF2, 0, NotSerialized)
        {
            Local0 = FAN3
            BSEL = Zero
            Local1 = (FD21 & 0x80)
            Local1 >>= 0x07
            Local1 *= 0x04
            Divide (FD13, 0x40, Local2, Local3)
            Local1 += Local3
            If (((Local1 > 0x05) || (Local1 < 0x02)))
            {
                If ((Local0 > 0xF0))
                {
                    Local1 = 0x02
                }
                ElseIf ((Local0 < 0x1E))
                {
                    Local1 = 0x05
                }
                Else
                {
                    Local1 = 0x03
                }

                Divide (Local1, 0x04, Local2, Local3)
                Local3 <<= 0x07
                Local4 = FD21
                Local4 &= 0x7F
                FD21 = (Local3 | Local4)
                Local3 = FD13
                Local3 &= 0x3F
                Local2 *= 0x40
                Local2 += Local3
                FD13 = Local2
            }

            While ((((Local0 > 0xF0) && (Local1 < 0x05)) || ((Local0 < 0x1E) && (Local1 > 0x02))))
            {
                If (((Local0 > 0xF0) && (Local1 < 0x05)))
                {
                    If ((Local0 == 0xFF))
                    {
                        Local1 = 0x05
                    }
                    Else
                    {
                        Local1 += One
                    }

                    Divide (Local1, 0x04, Local2, Local3)
                    BSEL = Zero
                    Local3 <<= 0x07
                    Local4 = FD21
                    Local4 &= 0x7F
                    FD21 = (Local3 | Local4)
                    Local3 = FD13
                    Local3 &= 0x3F
                    Local2 *= 0x40
                    Local2 += Local3
                    FD13 = Local2
                    If ((Local0 != 0xFF))
                    {
                        Sleep (0x32)
                    }

                    Local0 = FAN3
                    Sleep (0x32)
                    Local0 = FAN3
                    Sleep (0x32)
                    Local0 = FAN3
                }
                Else
                {
                    Local1 -= One
                    Divide (Local1, 0x04, Local2, Local3)
                    BSEL = Zero
                    Local3 <<= 0x07
                    Local4 = FD21
                    Local4 &= 0x7F
                    FD21 = (Local3 | Local4)
                    Local3 = FD13
                    Local3 &= 0x3F
                    Local2 *= 0x40
                    Local2 += Local3
                    FD13 = Local2
                    Sleep (0x32)
                    Local0 = FAN3
                    Sleep (0x32)
                    Local0 = FAN3
                    Sleep (0x32)
                    Local0 = FAN3
                }
            }

            If (((Local0 == 0xFF) && (Local1 == 0x05)))
            {
                Return (Zero)
            }

            If (((Local0 == Zero) && (Local1 == 0x02)))
            {
                Return (0xFFFF)
            }

            Local2 = One
            While (Local1)
            {
                Local2 *= 0x02
                Local1--
            }

            Local0 *= Local2
            Divide (0x00149970, Local0, Local1, Local0)
            Return (Local0)
        }

        Method (HWF4, 0, NotSerialized)
        {
            BSEL = 0x05
            Local0 = FAN4
            BSEL = Zero
            Local1 = (FND4 & 0x80)
            Local1 >>= 0x08
            Local1 *= 0x04
            Local2 = (FND4 & 0x0C)
            Local2 >>= 0x02
            Local1 += Local2
            If (((Local1 > 0x05) || (Local1 < 0x02)))
            {
                If ((Local0 > 0xF0))
                {
                    Local1 = 0x02
                }
                ElseIf ((Local0 < 0x1E))
                {
                    Local1 = 0x05
                }
                Else
                {
                    Local1 = 0x03
                }

                Divide (Local1, 0x04, Local2, Local3)
                Local3 <<= 0x08
                Local2 <<= 0x02
                Local4 = FND4
                Local4 &= 0x73
                Local3 |= Local2
                FND4 = (Local3 | Local4)
            }

            While ((((Local0 > 0xF0) && (Local1 < 0x05)) || ((Local0 < 0x1E) && (Local1 > 0x02))))
            {
                If (((Local0 > 0xF0) && (Local1 < 0x05)))
                {
                    Local1 += One
                    Divide (Local1, 0x04, Local2, Local3)
                    BSEL = Zero
                    Local3 <<= 0x08
                    Local2 <<= 0x02
                    Local4 = FND4
                    Local4 &= 0x73
                    Local3 |= Local2
                    FND4 = (Local3 | Local4)
                    If ((Local0 != 0xFF))
                    {
                        Sleep (0x32)
                    }

                    BSEL = 0x05
                    Local0 = FAN4
                    Sleep (0x32)
                    Local0 = FAN4
                    Sleep (0x32)
                    Local0 = FAN4
                    BSEL = Zero
                }
                Else
                {
                    Local1 -= One
                    Divide (Local1, 0x04, Local2, Local3)
                    BSEL = Zero
                    Local3 <<= 0x08
                    Local2 <<= 0x02
                    Local4 = FND4
                    Local4 &= 0x73
                    Local3 |= Local2
                    FND4 = (Local3 | Local4)
                    Sleep (0x32)
                    BSEL = 0x05
                    Local0 = FAN4
                    Sleep (0x32)
                    Local0 = FAN4
                    Sleep (0x32)
                    Local0 = FAN4
                    BSEL = Zero
                }
            }

            If (((Local0 == 0xFF) && (Local1 == 0x05)))
            {
                Return (Zero)
            }

            If (((Local0 == Zero) && (Local1 == 0x02)))
            {
                Return (0xFFFF)
            }

            Local2 = One
            While (Local1)
            {
                Local2 *= 0x02
                Local1--
            }

            Local0 *= Local2
            Divide (0x00149970, Local0, Local1, Local0)
            Return (Local0)
        }

        Name (FNDT, Package (0x08)
        {
            One, 
            0x02, 
            0x04, 
            0x08, 
            0x10, 
            0x20, 
            0x40, 
            0x80
        })
        Method (HWF3, 0, NotSerialized)
        {
            BSEL = Zero
            Local0 = CFN3
            Local1 = (FD15 & 0x80)
            Local1 >>= 0x05
            Local2 = (FND4 & 0x03)
            Local1 |= Local2
            If (((Local1 > 0x05) || (Local1 < 0x02)))
            {
                If ((Local0 > 0xF0))
                {
                    Local1 = 0x02
                }
                ElseIf ((Local0 < 0x1E))
                {
                    Local1 = 0x05
                }
                Else
                {
                    Local1 = 0x03
                }

                Local2 = (Local1 << 0x05)
                Local2 &= 0x80
                Local3 = (FD15 & 0x7F)
                Local3 |= Local2
                FD15 = Local3
                Local2 = (Local1 & 0x03)
                Local3 = (FND4 & 0xFC)
                Local3 |= Local2
                FND4 = Local3
            }

            While ((((Local0 > 0xF0) && (Local1 < 0x05)) || ((Local0 < 0x1E) && (Local1 > 0x02))))
            {
                If (((Local0 > 0xF0) && (Local1 < 0x05)))
                {
                    Local1++
                }
                Else
                {
                    Local1--
                }

                Local2 = (Local1 << 0x05)
                Local2 &= 0x80
                Local3 = (FD15 & 0x7F)
                Local3 |= Local2
                FD15 = Local3
                Local2 = (Local1 & 0x03)
                Local3 = (FND4 & 0xFC)
                Local3 |= Local2
                FND4 = Local3
                Sleep (0x32)
                Local0 = CFN3
                Sleep (0x32)
                Local0 = CFN3
                Sleep (0x32)
                Local0 = CFN3
            }

            If (((Local0 == 0xFF) && (Local1 == 0x05)))
            {
                Return (Zero)
            }

            If (((Local0 == Zero) && (Local1 == 0x02)))
            {
                Return (0xFFFF)
            }

            Local2 = DerefOf (FNDT [Local1])
            Local0 *= Local2
            Divide (0x00149970, Local0, Local1, Local0)
            Return (Local0)
        }

        OperationRegion (HWRE, SystemIO, IOHW, 0x0A)
        Field (HWRE, ByteAcc, NoLock, Preserve)
        {
            Offset (0x05), 
            HIDX,   8, 
            HDAT,   8
        }

        IndexField (HIDX, HDAT, ByteAcc, NoLock, Preserve)
        {
            Offset (0x04), 
            CHNM,   1, 
            CFNM,   1, 
            CHNS,   2, 
            CFNS,   2, 
            Offset (0x05), 
            SYST,   8, 
            TRGT,   8, 
            Offset (0x08), 
            SSDN,   8, 
            CSDN,   8, 
            SSUP,   8, 
            CSUP,   8, 
            Offset (0x20), 
            VCOR,   8, 
            V12V,   8, 
            Offset (0x23), 
            V33V,   8, 
            Offset (0x25), 
            V50V,   8, 
            Offset (0x27), 
            MBTE,   8, 
            FAN1,   8, 
            FAN2,   8, 
            FAN3,   8, 
            Offset (0x3F), 
            CFN3,   8, 
            Offset (0x47), 
            FDR1,   8, 
            Offset (0x4B), 
            FD13,   8, 
            FD15,   8, 
            Offset (0x4E), 
            BSEL,   3, 
            Offset (0x4F), 
            Offset (0x50), 
            TSR1,   8, 
                ,   7, 
            TSR2,   1, 
            Offset (0x53), 
            FAN4,   8, 
            Offset (0x59), 
            FND4,   8, 
            Offset (0x5D), 
            FD21,   8
        }
    }

    Scope (_SB.PCI0.SBRG.ASOC)
    {
        Name (CORV, Package (0x05)
        {
            0x06020000, 
            "Vcore Voltage", 
            0x0352, 
            0x0640, 
            One
        })
        Name (V3VV, Package (0x05)
        {
            0x06020001, 
            " +3.3 Voltage", 
            0x0B9A, 
            0x0E2E, 
            One
        })
        Name (V5VV, Package (0x05)
        {
            0x06020002, 
            " +5 Voltage", 
            0x1194, 
            0x157C, 
            One
        })
        Name (VV12, Package (0x05)
        {
            0x06020003, 
            " +12 Voltage", 
            0x27D8, 
            0x35E8, 
            One
        })
        Name (VPAR, Package (0x04)
        {
            Package (0x03)
            {
                Zero, 
                One, 
                Zero
            }, 

            Package (0x03)
            {
                0x22, 
                0x22, 
                Zero
            }, 

            Package (0x03)
            {
                0x14, 
                0x0A, 
                Zero
            }, 

            Package (0x03)
            {
                0x3C, 
                0x0A, 
                Zero
            }
        })
        Name (VBUF, Package (0x05)
        {
            0x04, 
            CORV, 
            V3VV, 
            V5VV, 
            VV12
        })
        Method (VGET, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (^^SIOR.HWV0 ())
            }

            If ((Arg0 == One))
            {
                Return (^^SIOR.HWV3 ())
            }

            If ((Arg0 == 0x02))
            {
                Return (^^SIOR.HWV5 ())
            }

            If ((Arg0 == 0x03))
            {
                Return (^^SIOR.HWV1 ())
            }
        }

        Name (CPUT, Package (0x05)
        {
            0x06030000, 
            "CPU Temperature", 
            0x0258, 
            0x03B6, 
            0x00010001
        })
        Name (MBTP, Package (0x05)
        {
            0x06030001, 
            "MB Temperature", 
            0x01C2, 
            0x03B6, 
            0x00010001
        })
        Name (TBUF, Package (0x03)
        {
            0x02, 
            CPUT, 
            MBTP
        })
        Method (TGET, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (^^SIOR.HWT1 ())
            }

            If ((Arg0 == One))
            {
                Return (^^SIOR.HWT0 ())
            }
        }

        Name (CPUF, Package (0x05)
        {
            0x06040000, 
            "CPU FAN Speed", 
            0x0258, 
            0x1C20, 
            0x00010001
        })
        Name (CHAF, Package (0x05)
        {
            0x06040001, 
            "CHASSIS FAN Speed", 
            0x0258, 
            0x1C20, 
            0x00010001
        })
        Name (PWRF, Package (0x05)
        {
            0x06040002, 
            "POWER FAN Speed", 
            0x0258, 
            0x1C20, 
            0x00010001
        })
        Name (FBUF, Package (0x04)
        {
            0x03, 
            CPUF, 
            CHAF, 
            PWRF
        })
        Method (FGET, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (^^SIOR.HWF1 ())
            }

            If ((Arg0 == One))
            {
                Return (^^SIOR.HWF2 ())
            }

            If ((Arg0 == 0x02))
            {
                Return (^^SIOR.HWF0 ())
            }
        }

        Method (VSIF, 0, NotSerialized)
        {
            Return (VBUF)
        }

        Method (RVLT, 1, NotSerialized)
        {
            Local0 = (Arg0 & 0xFFFF)
            Local1 = VGET (Local0)
            Local2 = DerefOf (DerefOf (VPAR [Local0]) [Zero])
            Local3 = DerefOf (DerefOf (VPAR [Local0]) [One])
            Local4 = DerefOf (DerefOf (VPAR [Local0]) [0x02])
            Local5 = (Local1 * (Local2 + Local3))
            Local5 /= Local3
            Local5 += Local4
            Return (Local5)
        }

        Method (SVLT, 1, NotSerialized)
        {
            Local0 = (DerefOf (Arg0 [Zero]) & 0xFFFF)
            Local1 = DerefOf (VBUF [Zero])
            If ((Local0 >= Local1))
            {
                Return (Zero)
            }

            Local0++
            DerefOf (VBUF [Local0]) [One] = DerefOf (Arg0 [One])
            DerefOf (VBUF [Local0]) [0x02] = DerefOf (Arg0 [0x02])
            DerefOf (VBUF [Local0]) [0x03] = DerefOf (Arg0 [0x03])
            DerefOf (VBUF [Local0]) [0x04] = DerefOf (Arg0 [0x04])
            Return (One)
        }

        Method (TSIF, 0, NotSerialized)
        {
            Return (TBUF)
        }

        Method (RTMP, 1, NotSerialized)
        {
            Local0 = (Arg0 & 0xFFFF)
            Local1 = TGET (Local0)
            Return (Local1)
        }

        Method (STMP, 1, NotSerialized)
        {
            Local0 = (DerefOf (Arg0 [Zero]) & 0xFFFF)
            Local1 = DerefOf (TBUF [Zero])
            If ((Local0 >= Local1))
            {
                Return (Zero)
            }

            Local0++
            DerefOf (TBUF [Local0]) [One] = DerefOf (Arg0 [One])
            DerefOf (TBUF [Local0]) [0x02] = DerefOf (Arg0 [0x02])
            DerefOf (TBUF [Local0]) [0x03] = DerefOf (Arg0 [0x03])
            DerefOf (TBUF [Local0]) [0x04] = DerefOf (Arg0 [0x04])
            Return (One)
        }

        Method (FSIF, 0, NotSerialized)
        {
            Return (FBUF)
        }

        Method (RFAN, 1, NotSerialized)
        {
            Local0 = (Arg0 & 0xFFFF)
            Local1 = FGET (Local0)
            Return (Local1)
        }

        Method (SFAN, 1, NotSerialized)
        {
            Local0 = (DerefOf (Arg0 [Zero]) & 0xFFFF)
            Local1 = DerefOf (FBUF [Zero])
            If ((Local0 >= Local1))
            {
                Return (Zero)
            }

            Local0++
            DerefOf (FBUF [Local0]) [One] = DerefOf (Arg0 [One])
            DerefOf (FBUF [Local0]) [0x02] = DerefOf (Arg0 [0x02])
            DerefOf (FBUF [Local0]) [0x03] = DerefOf (Arg0 [0x03])
            DerefOf (FBUF [Local0]) [0x04] = DerefOf (Arg0 [0x04])
            DerefOf (FBUF [Local0]) [0x05] = DerefOf (Arg0 [0x05])
            Return (One)
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Name (CRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, _Y11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y12, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (CRS, \_SB.PCI0._Y11._MIN, MIN5)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y11._MAX, MAX5)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y11._LEN, LEN5)  // _LEN: Length
            CreateDWordField (CRS, \_SB.PCI0._Y12._MIN, MIN6)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y12._MAX, MAX6)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y12._LEN, LEN6)  // _LEN: Length
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = MG1L
                If (Local0)
                {
                    MIN5 = MG1B
                    LEN5 = MG1L
                    MAX5 = (MIN5 + Local0--)
                }

                MIN6 = MG2B
                LEN6 = MG2L
                Local0 = MG2L
                MAX6 = (MIN6 + Local0--)
                Return (CRS)
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        DBG8 = Arg0
        PTS (Arg0)
        WAKP [Zero] = Zero
        WAKP [One] = Zero
        If (((Arg0 == 0x04) && (OSFL () == 0x02)))
        {
            Sleep (0x0BB8)
        }

        WSSB = ASSB
        WOTB = AOTB
        WAXB = AAXB
        ASSB = Arg0
        AOTB = OSFL ()
        AAXB = Zero
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        DBG8 = (Arg0 << 0x04)
        WAK (Arg0)
        If (IOWK){}
        Else
        {
            Notify (\_SB.PWRB, 0x02)
        }

        If (ASSB)
        {
            ASSB = WSSB
            AOTB = WOTB
            AAXB = WAXB
        }

        If (DerefOf (WAKP [Zero]))
        {
            WAKP [One] = Zero
        }
        Else
        {
            WAKP [One] = Arg0
        }

        Return (WAKP)
    }

    OperationRegion (IORK, SystemIO, 0xB3, One)
    Field (IORK, ByteAcc, NoLock, Preserve)
    {
        IOWK,   8
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)  // _S1_: S1 System State
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.SBRG.SIOS (Arg0)
            \_SB.PCI0.SBRG.SPTS (Arg0)
            \_SB.PCI0.NPTS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.SBRG.SIOW (Arg0)
        \_SB.PCI0.SBRG.SWAK (Arg0)
        \_SB.PCI0.NWAK (Arg0)
    }
}

