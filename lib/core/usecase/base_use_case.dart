import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../networking/failure.dart';

abstract class BaseUseCase<T, P> {
  Future<Either<Failure, T>> call(P p);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
