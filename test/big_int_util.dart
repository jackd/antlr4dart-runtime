#!/usr/bin/dart
import 'package:test/test.dart';
import 'package:antlr4dart/big_int_util.dart';


void main() {
  var ints = Iterable.generate(31, (i) => BigInt.from(i)).toList();
  group('big_int_util', () {

    test('testBit', () {
      expect(testBit(ints[0], 0), isFalse);
      expect(testBit(ints[0], 1), isFalse);
      expect(testBit(ints[1], 0), isTrue);
      expect(testBit(ints[2], 0), isFalse);
      expect(testBit(ints[2], 1), isTrue);
      expect(testBit(ints[2], 2), isFalse);
      expect(testBit(ints[15], 0), isTrue);
      expect(testBit(ints[15], 1), isTrue);
      expect(testBit(ints[15], 2), isTrue);
      expect(testBit(ints[15], 3), isTrue);
      expect(testBit(ints[15], 4), isFalse);
      expect(testBit(ints[14], 0), isFalse);
      expect(testBit(ints[14], 1), isTrue);
      expect(testBit(ints[14], 2), isTrue);
      expect(testBit(ints[14], 3), isTrue);
      expect(testBit(ints[14], 4), isFalse);
    });

    test('setBit', () {
      expect(setBit(ints[15], 1), equals(ints[15]));
      expect(setBit(ints[13], 1), equals(ints[15]));
      expect(setBit(ints[13], 2), equals(ints[13]));
      expect(setBit(ints[13], 4), equals(ints[29]));
    });

    test('clearBit', () {
      expect(clearBit(ints[15], 1), equals(ints[13]));
      expect(clearBit(ints[13], 1), equals(ints[13]));
      expect(clearBit(ints[13], 0), equals(ints[12]));
      expect(clearBit(ints[13], 2), equals(ints[9]));
      expect(clearBit(ints[13], 4), equals(ints[13]));
      expect(clearBit(ints[13], 3), equals(ints[5]));
    });
  });
}
