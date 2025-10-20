import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<type, Param, Param2> {
  Future<Either<Failure, type>> call([Param param, Param2 param2]);
}

class NoParam {}