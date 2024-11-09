import 'package:flutter/material.dart';
import '../../../../home/data/models/book_model/book_model.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
    required this.bookModel,
  });

  final List<BookModel> bookModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: bookModel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            bookModel: bookModel[index],
          ),
        );
      },
    );
  }
}
