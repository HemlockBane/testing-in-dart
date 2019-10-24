import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/src/counter.dart';

void main() {
  // Counter tests
  group('Counter tests', () {
    // Test 1

    // When using the 'flutter_test' package, don't directly instantiate a
    // TypeMatcher object.
    // Instead, use 'isA<T>()' when you need a TypeMatcher object. 'isA<T>()'
    // returns an instantiated TypeMatcher.
    // 'widget_tester.dart' (the file in the 'flutter_test' package that houses
    // the particular test functions we need) doesn't export the TypeMatcher class.
    // It however gives us 'isA<T>()' which returns a TypeMatcher object of type T
    // that we can use.
    // Another TypeMatcher is defined in 'framework.dart'. If TypeMatcher were
    // exported from 'widget_tester.dart', there would be a namespace clash
    // between 'framework.dart' and 'widget_tester.dart' should you attempt to
    // instantiate a TypeMatcher
    test('Counter value should start at zero(0)', () {
      expect(Counter().value, 0);
    });
    // Test 2
    test('Counter value should be incremented', () {
      final counter = Counter();
      counter.increment();

      expect(counter.value, 1);
    });
    // Test 3
    test('Counter value should be decremented', () {
      final counter = Counter();
      counter.decrement();

      expect(counter.value, - 1);
    });
  });
}
