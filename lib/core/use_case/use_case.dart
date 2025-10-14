import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<type, Param> {
  Future<Either<Failure, type>> call([Param param]);
}

class NoParam {}