import 'package:flutter_test/flutter_test.dart';

main() {
  test("test arrays", () {
    dynamic tstArray = createArray([3, 3, 3]);
    print(tstArray);
    var coors = [1, 1, 1];
    addToArray(tstArray, coors, 999);
    print(tstArray);
  });
}

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

dynamic addToArray(dynamic array, List<int> coors, int value) {
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
