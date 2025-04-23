import 'package:equatable/equatable.dart';
import 'package:festpay_pocket_app/app/core/utils/errors/messages.dart';

abstract class Failure extends Equatable {
  String get message;

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  @override
  String get message => Messages.serverFailure;

  @override
  List<Object> get props => [message];
}

class NoConnectionFailure extends Failure {
  @override
  String get message => Messages.noConnection;

  @override
  List<Object> get props => [message];
}

class UnknownFailure extends Failure {
  @override
  String get message => Messages.unknownFailure;

  @override
  List<Object> get props => [message];
}
