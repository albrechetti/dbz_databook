import 'package:dartz/dartz.dart';

abstract class IFutureUsecase<Params, Type> {
  Future<Either<Exception, Type>> call(Params params);
}
