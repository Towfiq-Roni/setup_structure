import 'package:dartz/dartz.dart';

import '../../../../core/domain/failure.dart';
import '../../../../core/domain/request.dart';
import '../../../../core/domain/service_locator.dart';
import '../../../../services/user_cache_service.dart';
import '../../data/models/user_model.dart';
import '../repository/authentication_user_repository.dart';

class LoginUserUsecase {
  Future<Either<Failure, User>> loginUser(User user) async {
    final response =
        await serviceLocator<LoginUserRepository>().login(user: user);
    if (response.isRight()) {
      final remoteUser = response.getOrElse(() => User());
      serviceLocator<Request>().updateAuthorization(
        remoteUser.token,
      );
      await serviceLocator<UserCacheService>().saveUser(remoteUser);
    }
    return response;
  }
}
