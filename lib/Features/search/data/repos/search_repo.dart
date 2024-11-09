import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failures.dart';
import '../../../home/data/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchResultBooks(
      {required String category});
}