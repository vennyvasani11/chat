import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int status;

  const Failure(this.message, this.status);

  @override
  List<Object?> get props => [message, status];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message, super.status);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message, super.status);
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure(super.message, super.status);
}

class InternalServerErrorFailure extends Failure {
  const InternalServerErrorFailure(super.message, super.status);
}
class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure(super.message, super.status);
}


class BadGatewayErrorFailure extends Failure {
  const BadGatewayErrorFailure(super.message, super.status);
}
