import 'package:dartz/dartz.dart';

abstract class IFutureUseCase<Params, Type> {
  Future<Either<Exception, Type>> call(Params params);
}
