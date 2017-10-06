part of antlr4dart;

/// Sometimes we need to map a key to a value but key is two pieces of data.
class DoubleKeyMap<Key1, Key2, Value> {

  LinkedHashMap<Key1, LinkedHashMap<Key2, Value>> _data;

  DoubleKeyMap() {
    _data = new LinkedHashMap<Key1, LinkedHashMap<Key2, Value>>();
  }

  Iterable<Value> get values {
    Set<Value> set = new HashSet<Value>();
    for (Map<Key2, Value> key in _data.values)
      for (Value value in key.values) set.add(value);
    return set;
  }

  Iterable<Key1> get keys => _data.keys;

  Value put(Key1 key1, Key2 key2, Value value) {
    Map<Key2, Value> data = _data[key1];
    Value prev = null;
    if (data == null) {
      data = new LinkedHashMap<Key2, Value>();
      _data[key1] =  data;
    } else {
      prev = data[key2];
    }
    data[key2] = value;
    return prev;
  }

  Value get(Key1 key1, Key2 key2) {
    Map<Key2, Value> data = _data[key1];
    if (data == null) return null;
    return data[key2];
  }

  Map<Key2, Value> operator [](Key1 key) => _data[key];

  /// Get all values associated with primary [key].
  Iterable<Value> valuesForKey(Key1 key) {
    Map<Key2, Value> data = _data[key];
    if (data == null) return null;
    return data.values;
  }

  Iterable<Key2> keySetForKey(Key1 key) {
    LinkedHashMap<Key2, Value> data = _data[key];
    if (data == null) return null;
    return data.keys;
  }
}
