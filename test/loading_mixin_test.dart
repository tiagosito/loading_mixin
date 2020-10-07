import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () async {
    var result = await requestData();

    expect(result, 1844);
  });
}

//HTTP request Example
Future requestData() async {
  await Future.delayed(Duration(milliseconds: 1500));
  return 1844;
}
