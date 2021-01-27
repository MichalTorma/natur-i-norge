dynamic createArray(List<int> dims) {
  if (dims.length > 0) {
    var dim = dims.first;
    var newDims = List<int>.from(dims);
    newDims.removeAt(0);
    var array = List.generate(dim, (index) => createArray(newDims));
    return array;
  } else {
    return null;
  }
}

dynamic addToArray(dynamic array, List<int> coors, dynamic value) {
  if (coors.length > 0) {
    var index = coors.first;
    var newArray = array[index];
    coors.removeAt(0);

    array[index] = addToArray(newArray, coors, value);
    return array;
  } else {
    return value;
  }
}

dynamic addArrays(dynamic a, dynamic b) {
  if (a == null || b == null) {
    return null;
  }
  if (!(a is List)) {
    return a + b;
  } else {
    var res = List<dynamic>.empty(growable: true);
    for (var idx in List.generate(a.length, (index) => index)) {
      res.add(addArrays(a[idx], b[idx]));
    }
  }
}

dynamic divideArrayBy(dynamic array, double value) {
  if (!(array is List)) {
    if (array == null) {
      return null;
    } else {
      return array / value;
    }
  } else {
    var res = List<dynamic>.empty(growable: true);
    for (var _array in array) {
      res.add(divideArrayBy(_array, value));
    }
  }
}
