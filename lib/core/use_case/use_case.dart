import 'package:artical/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<T,Parameter>{
  Future<Either<Failure,T>>execute(Parameter parameter);
}

class NoParameter {
  const NoParameter();
}
