// ignore_for_file: prefer_const_constructors
import 'package:flutter_generic_app/domain/entities/index.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('User', () {
    const id = 'mock-id';
    const email = 'mock-email';
    test('throws AssertionError when email is null', () {
      expect(
        // ignore: null_check_always_fails
        () => User( id: id, email: null!,),
        throwsAssertionError,
      );
    });

    test('throws AssertionError when id is null', () {
      expect(
        // ignore: null_check_always_fails
        () => User(email: email, id: null!),
        throwsAssertionError,
      );
    });

    test('uses value equality', () {
      expect(
        User(email: email, id: id),
        User(email: email, id: id),
      );
    });
  });
}
