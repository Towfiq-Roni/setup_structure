import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import '../../../../core/domain/failure.dart';
import '../../../../core/domain/request.dart';
import '../../../../core/domain/service_locator.dart';
import '../models/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, User>> loginUser({required User user});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Request request = serviceLocator<Request>();
  @override
  Future<Either<Failure, User>> loginUser({required User user}) async {
    try {
      final response = await request.post(
        '/login',
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return Right(User.fromJson(response.data));
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      debugPrint('LoginRemoteDataSourceImplError $e');
      return const Left(
        Exception('Exception Occured in LoginRemoteDataSourceImpl'),
      );
    }
  }
}
