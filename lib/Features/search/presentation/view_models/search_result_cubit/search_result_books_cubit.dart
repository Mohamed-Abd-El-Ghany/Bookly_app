import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';
part 'search_result_books_state.dart';

class SearchResultCubit extends Cubit<SearchResultBooksState> {
  SearchResultCubit(this.searchRepo) : super(SearchResultBooksInitial());
  final SearchRepo searchRepo;

  Future<void> searchResultBooks({required String category}) async {
    emit(
      SearchResultBooksLoading(),
    );
    var result = await searchRepo.searchResultBooks(category: category);
    result.fold((failure) {
      emit(
        SearchResultBooksFailure(failure.errMessage),
      );
    }, (books) {
      emit(
        SearchResultBooksSuccess(books),
      );
    });
  }
}
