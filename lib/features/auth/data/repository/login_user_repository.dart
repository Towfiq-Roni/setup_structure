
import 'package:dartz/dartz.dart';
import '../../../../core/domain/failure.dart';
import '../../../../core/domain/service_locator.dart';
import '../../domain/repository/authentication_user_repository.dart';
import '../datasource/login_remote_datasource.dart';
import '../models/user_model.dart';

class LoginUserRepositoryImpl implements LoginUserRepository {
  @override
  Future<Either<Failure, User>> login({required User user}) {
    return serviceLocator<LoginRemoteDataSource>().loginUser(
      user: user,
    );
  }
  //
}
