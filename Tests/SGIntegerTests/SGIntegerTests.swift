import Testing
@testable import SGInteger

@Test func testBinary() async throws {

  for x : UInt8 in 0 ... 0xff {
    let binary = x.binary()
    let y = UInt8(binary: binary)
    #expect(x == y)
  }

  for x : UInt16 in 0 ... 0xffff {
    let binary = x.binary()
    let y = UInt16(binary: binary!)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = UInt32.random(in: 0 ... 0xffffffff)
    let binary = x.binary()
    let y = UInt32(binary: binary!)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = UInt64.random(in: 0 ... 0xffffffffffffffff)
    let binary = x.binary()
    let y = UInt64(binary: binary!)
    #expect(x == y)
  }

  let _8 : UInt8 = 0xff
  #expect(_8.binary() == "11111111")
  let _16 : UInt16 = 0xffff
  #expect(_16.binary() == "1111111111111111")
  let _32 : UInt32 = 0xffffffff
  #expect(_32.binary() == "11111111111111111111111111111111")
  let _64 : UInt64 = 0xffffffffffffffff
  #expect(_64.binary() == "1111111111111111111111111111111111111111111111111111111111111111")

  #expect(UInt8(binary: "eric") == nil)
  #expect(UInt16(binary: "eric") == nil)
  #expect(UInt32(binary: "eric") == nil)
  #expect(UInt64(binary: "eric") == nil)

  for x : Int8 in Int8.min ... Int8.max {
    let binary = x.binary()
    let y = Int8(binary: binary)
    #expect(x == y)
  }

  for x : Int16 in Int16.min ... Int16.max {
    let binary = x.binary()
    let y = Int16(binary: binary!)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = Int32.random(in: Int32.min ... Int32.max)
    let binary = x.binary()
    let y = Int32(binary: binary!)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = Int64.random(in: Int64.min ... Int64.max)
    let binary = x.binary()
    let y = Int64(binary: binary!)
    #expect(x == y)
  }

  #expect(Int8(binary: "eric") == nil)
  #expect(Int16(binary: "eric") == nil)
  #expect(Int32(binary: "eric") == nil)
  #expect(Int64(binary: "eric") == nil)

}

@Test func testHex() async throws {
  
  for x : UInt8 in 0 ... 0xff {
    let hex = x.hex()
    let y = UInt8(hex: hex)
    #expect(x == y)
  }

  for x : UInt16 in 0 ... 0xffff {
    let hex = x.hex()
    let y = UInt16(hex: hex!)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = UInt32.random(in: 0 ... 0xffffffff)
    let hex = x.hex()
    let y = UInt32(hex: hex!)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = UInt64.random(in: 0 ... 0xffffffffffffffff)
    let hex = x.hex()
    let y = UInt64(hex: hex!)
    #expect(x == y)
  }

  let _64 : UInt64 = 0xffffffffffffffff
  #expect(_64.hex()?.uppercased() == "FFFFFFFFFFFFFFFF")
  let _32 : UInt32 = 0xffffffff
  #expect(_32.hex()?.uppercased() == "FFFFFFFF")
  let _16 : UInt16 = 0xffff
  #expect(_16.hex()?.uppercased() == "FFFF")
  let _8 : UInt8 = 0xff
  #expect(_8.hex().uppercased() == "FF")

  #expect(UInt8(hex: "eric") == nil)
  #expect(UInt16(hex: "eric") == nil)
  #expect(UInt32(hex: "eric") == nil)
  #expect(UInt64(hex: "eric") == nil)

  for x : Int8 in Int8.min ... Int8.max {
    let hex = x.hex()
    let y = Int8(hex: hex)
    #expect(x == y)
  }

  for x : Int16 in Int16.min ... Int16.max {
    let hex = x.hex()
    let y = Int16(hex: hex!)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = Int32.random(in: Int32.min ... Int32.max)
    let hex = x.hex()
    let y = Int32(hex: hex!)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = Int64.random(in: Int64.min ... Int64.max)
    let hex = x.hex()
    let y = Int64(hex: hex!)
    #expect(x == y)
  }

  #expect(Int8(hex: "eric") == nil)
  #expect(Int16(hex: "eric") == nil)
  #expect(Int32(hex: "eric") == nil)
  #expect(Int64(hex: "eric") == nil)

}

@Test func testDotHex() async throws {
  
  var _64 : UInt64 = 0xffffffffffffffff
  
  #expect(_64.dotHex()?.uppercased() == "FF.FF.FF.FF.FF.FF.FF.FF")
  
  #expect(_64.dotHex(numberOfBytes: 6)?.uppercased() == nil)
  
  _64 = 0xffffffffffff
  
  #expect(_64.dotHex(numberOfBytes: 6)?.uppercased() == "FF.FF.FF.FF.FF.FF")

  _64 = 0x00
  
  #expect(_64.dotHex(numberOfBytes: 5)?.uppercased() == "00.00.00.00.00")

  _64 = 0x16
  
  #expect(_64.dotHex(numberOfBytes: 4)?.uppercased() == "00.00.00.16")

}

@Test func testEndian() async throws {
  
  for x : UInt8 in 0 ... 0xff {
    let data = x.bigEndianData
    let y = UInt8(bigEndianData: data)
    #expect(x == y)
  }

  for x : UInt16 in 0 ... 0xffff {
    let data = x.bigEndianData
    let y = UInt16(bigEndianData: data)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = UInt32.random(in: 0 ... 0xffffffff)
    let data = x.bigEndianData
    let y = UInt32(bigEndianData: data)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = UInt64.random(in: 0 ... 0xffffffff)
    let data = x.bigEndianData
    let y = UInt64(bigEndianData: data)
    #expect(x == y)
  }

  for x : UInt8 in 0 ... 0xff {
    let data = x.littleEndianData
    let y = UInt8(littleEndianData: data)
    #expect(x == y)
  }

  for x : UInt16 in 0 ... 0xffff {
    let data = x.littleEndianData
    let y = UInt16(littleEndianData: data)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = UInt32.random(in: 0 ... 0xffffffff)
    let data = x.littleEndianData
    let y = UInt32(littleEndianData: data)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = UInt64.random(in: 0 ... 0xffffffff)
    let data = x.littleEndianData
    let y = UInt64(littleEndianData: data)
    #expect(x == y)
  }

  for x : Int8 in Int8.min ... Int8.max {
    let data = x.bigEndianData
    let y = Int8(bigEndianData: data)
    #expect(x == y)
  }

  for x : Int16 in Int16.min ... Int16.max {
    let data = x.bigEndianData
    let y = Int16(bigEndianData: data)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = Int32.random(in: Int32.min ... Int32.max)
    let data = x.bigEndianData
    let y = Int32(bigEndianData: data)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = Int64.random(in: Int64.min ... Int64.max)
    let data = x.bigEndianData
    let y = Int64(bigEndianData: data)
    #expect(x == y)
  }

  for x : Int8 in Int8.min ... Int8.max {
    let data = x.littleEndianData
    let y = Int8(littleEndianData: data)
    #expect(x == y)
  }

  for x : Int16 in Int16.min ... Int16.max {
    let data = x.littleEndianData
    let y = Int16(littleEndianData: data)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = Int32.random(in: Int32.min ... Int32.max)
    let data = x.littleEndianData
    let y = Int32(littleEndianData: data)
    #expect(x == y)
  }

  for _ in 0 ... 0xffff {
    let x = Int64.random(in: Int64.min ... Int64.max)
    let data = x.littleEndianData
    let y = Int64(littleEndianData: data)
    #expect(x == y)
  }
  
  let _64 : UInt64 = 0xfffefdfcfbfaf9f8
  var data = _64.bigEndianData
  #expect(data == [0xff, 0xfe, 0xfd, 0xfc, 0xfb, 0xfa, 0xf9, 0xf8])
  data = _64.littleEndianData
  #expect(data == [0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff])

  let _32 : UInt32 = 0xfffefdfc
  data = _32.bigEndianData
  #expect(data == [0xff, 0xfe, 0xfd, 0xfc])
  data = _32.littleEndianData
  #expect(data == [0xfc, 0xfd, 0xfe, 0xff])

  let _16 : UInt16 = 0xfffe
  data = _16.bigEndianData
  #expect(data == [0xff, 0xfe])
  data = _16.littleEndianData
  #expect(data == [0xfe, 0xff])

  let _8 : UInt8 = 0xff
  data = _8.bigEndianData
  #expect(data == [0xff])
  data = _8.littleEndianData
  #expect(data == [0xff])

  let _I64 = Int64(bitPattern: 0xfffefdfcfbfaf9f8)
  data = _I64.bigEndianData
  #expect(data == [0xff, 0xfe, 0xfd, 0xfc, 0xfb, 0xfa, 0xf9, 0xf8])
  data = _I64.littleEndianData
  #expect(data == [0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff])

  let _I32 = Int32(bitPattern: 0xfffefdfc)
  data = _I32.bigEndianData
  #expect(data == [0xff, 0xfe, 0xfd, 0xfc])
  data = _I32.littleEndianData
  #expect(data == [0xfc, 0xfd, 0xfe, 0xff])

  let _I16  = Int16(bitPattern: 0xfffe)
  data = _I16.bigEndianData
  #expect(data == [0xff, 0xfe])
  data = _I16.littleEndianData
  #expect(data == [0xfe, 0xff])

  let _I8  = Int8(bitPattern: 0xff)
  data = _I8.bigEndianData
  #expect(data == [0xff])
  data = _I8.littleEndianData
  #expect(data == [0xff])

}

