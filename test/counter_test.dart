import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/src/counter.dart';
import 'package:unit_test/src/counter.dart';

void main() {
  // Counter tests
  group('Counter tests', () {
    // Test 1
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
