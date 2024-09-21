// -----------------------------------------------------------------------------
// SGInt.swift
//
// This Swift source file is a part of the SGInteger package
// by Paul C. L. Willmott.
//
// Copyright © 2024 Paul C. L. Willmott. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy 
// of this software and associated documentation files (the “Software”), to deal 
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
// copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
// SOFTWARE.
// -----------------------------------------------------------------------------
//
// Revision History:
//
//     21/09/2024  Paul Willmott - SGInt.swift created
// -----------------------------------------------------------------------------

import Foundation

// MARK: Int64

extension Int64 {
  
  // MARK: Constructors
  
  init?(hex:String) {
    
    self.init()
    
    if let temp = UInt64(hex, radix: 16) {
      self = Int64(bitPattern: temp)
    }
    else {
      return nil
    }
    
  }

  init?(hex:String.SubSequence) {
    
    self.init()
    
    if let temp = UInt64(hex, radix: 16) {
      self = Int64(bitPattern: temp)
    }
    else {
      return nil
    }

  }
  
  init?(dotHex:String, numberOfBytes:Int = MemoryLayout<UInt64>.size) {
    
    guard (1 ... MemoryLayout<UInt64>.size) ~= numberOfBytes else {
      return nil
    }

    self.init()
    
    let trimmed = dotHex.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if trimmed.isEmpty {
      self = 0
      return
    }
    
    let split = trimmed.split(separator: ".", omittingEmptySubsequences: true)
    
    if split.count != numberOfBytes {
      return nil
    }

    var value : UInt64 = 0
    
    for digits in split {
      if let byte = UInt8(hex:digits) {
        value <<= 8
        value |= UInt64(byte)
      }
      else {
        return nil
      }
    }
    
    self = Int64(bitPattern: value)
    
  }
  
  init?(binary:String) {
    
    self.init()
    
    if let temp = UInt64(binary, radix: 2) {
      self = Int64(bitPattern: temp)
    }
    else {
      return nil
    }
    
  }

  init?(binary:String.SubSequence) {
    
    self.init()
    
    if let temp = UInt64(binary, radix: 2) {
      self = Int64(bitPattern: temp)
    }
    else {
      return nil
    }

  }
  
  init?(bigEndianData: [UInt8]) {
    
    guard (1 ... MemoryLayout<UInt64>.size) ~= bigEndianData.count else {
      return nil
    }

    self.init()
    
    var temp : UInt64 = 0
    
    for byte in bigEndianData {
      temp <<= 8
      temp |= UInt64(byte)
    }
    
    self = Int64(bitPattern: temp)
    
  }
  
  init?(littleEndianData: [UInt8]) {
    
    guard (1 ... MemoryLayout<UInt64>.size) ~= littleEndianData.count else {
      return nil
    }

    self.init()
    
    var temp : UInt64 = 0
    
    for byte in littleEndianData.reversed() {
      temp <<= 8
      temp |= UInt64(byte)
    }
    
    self = Int64(bitPattern: temp)
    
  }

  // MARK: Public Properties
  
  public var littleEndianData : [UInt8] {
  
    var data : [UInt8] = []
    
    var value = UInt64(bitPattern: self)
    
    for _ in 1...MemoryLayout<UInt64>.size {
      data.append(UInt8(value & 0xff))
      value >>= 8
    }

    return data
    
  }
  
  public var bigEndianData : [UInt8] {
    return littleEndianData.reversed()
  }
  
  // MARK: Public Methods
  
  public func hex(numberOfBytes:Int = MemoryLayout<UInt64>.size, numberPrefix:String = "") -> String? {
    
    guard (1 ... MemoryLayout<UInt64>.size) ~= numberOfBytes else {
      return nil
    }
    
    let numberOfDigits = numberOfBytes * 2
    
    let temp = String(UInt64(bitPattern: self), radix: 16)
    
    if temp.count > numberOfDigits {
      return nil
    }
    
    return numberPrefix + String("\(String(repeating: "0", count: numberOfDigits - temp.count))\(temp)".suffix(numberOfDigits))
    
  }
  
  public func dotHex(numberOfBytes:Int = MemoryLayout<UInt64>.size) -> String? {

    guard (1 ... MemoryLayout<UInt64>.size) ~= numberOfBytes, var hex = self.hex(numberOfBytes: numberOfBytes) else {
      return nil
    }
    
    var result = ""
    
    while !hex.isEmpty {
      result += hex.prefix(2)
      hex.removeFirst(2)
      if !hex.isEmpty {
        result += "."
      }
    }
    
    return result
    
  }
  
  public func binary(numberOfBytes:Int = MemoryLayout<UInt64>.size, numberPrefix:String = "") -> String? {
    
    guard (1 ... MemoryLayout<UInt64>.size) ~= numberOfBytes else {
      return nil
    }
    
    let numberOfDigits = numberOfBytes * 8
    
    let temp = String(UInt64(bitPattern: self), radix: 2)
    
    if temp.count > numberOfDigits {
      return nil
    }
    
    return numberPrefix + String("\(String(repeating: "0", count: numberOfDigits - temp.count))\(temp)".suffix(numberOfDigits))
    
  }
  
}

// MARK: Int32

extension Int32 {
  
  // MARK: Constructors
  
  init?(hex:String) {
    
    self.init()
    
    if let temp = UInt32(hex, radix: 16) {
      self = Int32(bitPattern: temp)
    }
    else {
      return nil
    }
    
  }

  init?(hex:String.SubSequence) {
    
    self.init()
    
    if let temp = UInt32(hex, radix: 16) {
      self = Int32(bitPattern: temp)
    }
    else {
      return nil
    }

  }
  
  init?(binary:String) {
    
    self.init()
    
    if let temp = UInt32(binary, radix: 2) {
      self = Int32(bitPattern: temp)
    }
    else {
      return nil
    }
    
  }

  init?(binary:String.SubSequence) {
    
    self.init()
    
    if let temp = UInt32(binary, radix: 2) {
      self = Int32(bitPattern: temp)
    }
    else {
      return nil
    }

  }
  
  init?(bigEndianData: [UInt8]) {
    
    guard (1 ... MemoryLayout<UInt32>.size) ~= bigEndianData.count else {
      return nil
    }

    self.init()
    
    var temp : UInt32 = 0
    
    for byte in bigEndianData {
      temp <<= 8
      temp |= UInt32(byte)
    }
    
    self = Int32(bitPattern: temp)
    
  }
  
  init?(littleEndianData: [UInt8]) {
    
    guard (1 ... MemoryLayout<UInt32>.size) ~= littleEndianData.count else {
      return nil
    }

    self.init()
    
    var temp : UInt32 = 0
    
    for byte in littleEndianData.reversed() {
      temp <<= 8
      temp |= UInt32(byte)
    }
    
    self = Int32(bitPattern: temp)
    
  }

  // MARK: Public Properties
  
  public var littleEndianData : [UInt8] {
  
    var data : [UInt8] = []
    
    var value = UInt32(bitPattern: self)
    
    for _ in 1...MemoryLayout<UInt32>.size {
      data.append(UInt8(value & 0xff))
      value >>= 8
    }

    return data
    
  }
  
  public var bigEndianData : [UInt8] {
    return littleEndianData.reversed()
  }
  
  // MARK: Public Methods
  
  public func hex(numberOfBytes:Int = MemoryLayout<UInt32>.size, numberPrefix:String = "") -> String? {
    
    guard (1 ... MemoryLayout<UInt32>.size) ~= numberOfBytes else {
      return nil
    }
    
    let numberOfDigits = numberOfBytes * 2
    
    let temp = String(UInt32(bitPattern: self), radix: 16)
    
    if temp.count > numberOfDigits {
      return nil
    }
    
    return numberPrefix + String("\(String(repeating: "0", count: numberOfDigits - temp.count))\(temp)".suffix(numberOfDigits))
    
  }
  
  public func binary(numberOfBytes:Int = MemoryLayout<UInt32>.size, numberPrefix:String = "") -> String? {
    
    guard (1 ... MemoryLayout<UInt32>.size) ~= numberOfBytes else {
      return nil
    }
    
    let numberOfDigits = numberOfBytes * 8
    
    let temp = String(UInt32(bitPattern: self), radix: 2)
    
    if temp.count > numberOfDigits {
      return nil
    }
    
    return numberPrefix + String("\(String(repeating: "0", count: numberOfDigits - temp.count))\(temp)".suffix(numberOfDigits))
    
  }
  
}

// MARK: Int16

extension Int16 {
  
  // MARK: Constructors
  
  init?(hex:String) {
    
    self.init()
    
    if let temp = UInt16(hex, radix: 16) {
      self = Int16(bitPattern: temp)
    }
    else {
      return nil
    }
    
  }

  init?(hex:String.SubSequence) {
    
    self.init()
    
    if let temp = UInt16(hex, radix: 16) {
      self = Int16(bitPattern: temp)
    }
    else {
      return nil
    }

  }
  
  init?(binary:String) {
    
    self.init()
    
    if let temp = UInt16(binary, radix: 2) {
      self = Int16(bitPattern: temp)
    }
    else {
      return nil
    }
    
  }

  init?(binary:String.SubSequence) {
    
    self.init()
    
    if let temp = UInt16(binary, radix: 2) {
      self = Int16(bitPattern: temp)
    }
    else {
      return nil
    }

  }
  
  init?(bigEndianData: [UInt8]) {
    
    guard (1 ... MemoryLayout<UInt16>.size) ~= bigEndianData.count else {
      return nil
    }

    self.init()
    
    var temp : UInt16 = 0
    
    for byte in bigEndianData {
      temp <<= 8
      temp |= UInt16(byte)
    }
    
    self = Int16(bitPattern: temp)
    
  }
  
  init?(littleEndianData: [UInt8]) {
    
    guard (1 ... MemoryLayout<UInt16>.size) ~= littleEndianData.count else {
      return nil
    }

    self.init()
    
    var temp : UInt16 = 0
    
    for byte in littleEndianData.reversed() {
      temp <<= 8
      temp |= UInt16(byte)
    }
    
    self = Int16(bitPattern: temp)
    
  }

  // MARK: Public Properties
  
  public var littleEndianData : [UInt8] {
  
    var data : [UInt8] = []
    
    var value = UInt16(bitPattern: self)
    
    for _ in 1...MemoryLayout<UInt16>.size {
      data.append(UInt8(value & 0xff))
      value >>= 8
    }

    return data
    
  }
  
  public var bigEndianData : [UInt8] {
    return littleEndianData.reversed()
  }
  
  // MARK: Public Methods
  
  public func hex(numberOfBytes:Int = MemoryLayout<UInt16>.size, numberPrefix:String = "") -> String? {
    
    guard (1 ... MemoryLayout<UInt16>.size) ~= numberOfBytes else {
      return nil
    }
    
    let numberOfDigits = numberOfBytes * 2
    
    let temp = String(UInt16(bitPattern: self), radix: 16)
    
    if temp.count > numberOfDigits {
      return nil
    }
    
    return numberPrefix + String("\(String(repeating: "0", count: numberOfDigits - temp.count))\(temp)".suffix(numberOfDigits))
    
  }
  
  public func binary(numberOfBytes:Int = MemoryLayout<UInt16>.size, numberPrefix:String = "") -> String? {
    
    guard (1 ... MemoryLayout<UInt16>.size) ~= numberOfBytes else {
      return nil
    }
    
    let numberOfDigits = numberOfBytes * 8
    
    let temp = String(UInt16(bitPattern: self), radix: 2)
    
    if temp.count > numberOfDigits {
      return nil
    }
    
    return numberPrefix + String("\(String(repeating: "0", count: numberOfDigits - temp.count))\(temp)".suffix(numberOfDigits))
    
  }

}

// MARK: Int8

extension Int8 {
  
  // MARK: Constructors
  
  init?(hex:String) {
    
    self.init()
    
    if let temp = UInt8(hex, radix: 16) {
      self = Int8(bitPattern: temp)
    }
    else {
      return nil
    }
    
  }

  init?(hex:String.SubSequence) {
    
    self.init()
    
    if let temp = UInt8(hex, radix: 16) {
      self = Int8(bitPattern: temp)
    }
    else {
      return nil
    }

  }
  
  init?(binary:String) {
    
    self.init()
    
    if let temp = UInt8(binary, radix: 2) {
      self = Int8(bitPattern: temp)
    }
    else {
      return nil
    }
    
  }

  init?(binary:String.SubSequence) {
    
    self.init()
    
    if let temp = UInt8(binary, radix: 2) {
      self = Int8(bitPattern: temp)
    }
    else {
      return nil
    }

  }
  
  init?(bigEndianData: [UInt8]) {
    
    guard (1 ... MemoryLayout<UInt8>.size) ~= bigEndianData.count else {
      return nil
    }

    self.init()
    
    self = Int8(bitPattern: bigEndianData[0])
    
  }
  
  init?(littleEndianData: [UInt8]) {
    
    guard (1 ... MemoryLayout<UInt8>.size) ~= littleEndianData.count else {
      return nil
    }

    self.init()
    
    self = Int8(bitPattern: littleEndianData[0])

  }

  // MARK: Public Properties
  
  public var littleEndianData : [UInt8] {
    return [UInt8(bitPattern: self)]
  }
  
  public var bigEndianData : [UInt8] {
    return [UInt8(bitPattern: self)]
  }
  
  // MARK: Public Methods
  
  public func hex(numberPrefix:String = "") -> String {
    let temp = String(UInt8(bitPattern: self), radix: 16)
    return numberPrefix + String("\(String(repeating: "0", count: 2 - temp.count))\(temp)".suffix(2))
  }
  
  public func binary(numberPrefix:String = "") -> String {
    let temp = String(UInt8(bitPattern: self), radix: 2)
    return numberPrefix + String("\(String(repeating: "0", count: 8 - temp.count))\(temp)".suffix(8))
  }
  
}


