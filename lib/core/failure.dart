import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure({required this.message});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class LocalFailure extends Failure {
  const LocalFailure({required super.message});
}
