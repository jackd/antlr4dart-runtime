library big_int_util;


bool testBit(BigInt i, int n) => i & (BigInt.one << n) != BigInt.zero;

///Set the given bitIndex in the BigInt to true.
BigInt setBit(BigInt i, int bitIndex) => i | (BigInt.one << (bitIndex));

///Set the given bitIndex in the BigInt to false
BigInt clearBit(BigInt i, int bitIndex) {
  var mod = i % (BigInt.one << (bitIndex));
  var n = bitIndex + 1;
  return i >> n << n | mod;
}



int bitCount(BigInt i) {
  var count = 0;
  var n = i.bitLength;
  for (var _ = 0; _ < n; ++_) {
    if (i.isOdd) {
      count += 1;
    }
    i = i >> 2;
  }
  return count;
}
