import 'package:flutter_generic_app/domain/entities/user/user.dart';

abstract class IAuthRepository {
  Stream<User>? get user => null;

  Future<void> signUp({required String email, required String password});
  Future<void> logInWithGoogle();
  Future<void> logInWithEmailAndPassword({required String email, required String password});
  Future<void> logOut();
}
