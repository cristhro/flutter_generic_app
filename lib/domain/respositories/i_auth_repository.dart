import 'package:flutter_generic_app/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class IAuthRepository {
  Stream<User>? get user => null;

  Future<void> signUp({required String email, required String password});
  Future<void> logInWithGoogle();
  Future<void> logInWithEmailAndPassword({required String email, required String password});
  Future<void> logOut();
}
