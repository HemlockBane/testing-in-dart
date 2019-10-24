import 'package:flutter_test/flutter_test.dart';
// TypeMatcher in the matcher package clashes with the
// TypeMatcher in framework.dart. If you want to use TypeMatcher in expect()
// use the TypeMatcher from the matcher package
// Alternatively, you can use 'isA<T>()'

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
import 'package:matcher/matcher.dart' as type_matcher;

import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:unit_test/main.dart';

class MockClient extends Mock implements http.Client {}

final jsonPlaceholderUrl = 'https://jsonplaceholder.typicode.com/posts/1';

main() {
  group('fetchPost', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(200, const type_matcher.TypeMatcher<int>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchPost(client), throwsException);
    });
  });
}

//void main() {
//  group('fetchPost', () {
//    // #1: Test that the get method throws an exception when it completes
//    // with an error
//    test('throws an exception if the http call completes with an error', () {
//      final client = MockClient();
//
//      when(client.get(jsonPlaceholderUrl))
//          .thenAnswer((_) async => http.Response('Not found', 404));
//
//      expect(fetchPost(client), throwsException);
//    });
//    // #2: Test that the get method returns void when it completes
//    // with a value
//    test('returns void when the http call completes with a value', () async {
//      final client = MockClient();
//
//      when(client.get(jsonPlaceholderUrl))
//          .thenAnswer((_) async => http.Response('{"key": "value"}', 200));
//
//      expect(await fetchPost(client), const TypeMatcher<Post>());
//    });
//  });
//}
