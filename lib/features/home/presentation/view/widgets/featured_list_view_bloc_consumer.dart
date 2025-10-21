import 'package:bookly_app/core/functions/custom_error_snack_bar';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/featured_list_view.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/featured_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewBlocConsumer extends StatefulWidget {
  const FeaturedListViewBlocConsumer({super.key});

  @override
  State<FeaturedListViewBlocConsumer> createState() =>
      _FeaturedListViewBlocConsumerState();
}

class _FeaturedListViewBlocConsumerState
    extends State<FeaturedListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          showErrorSnackbar(context, state.errMessage);
          ;
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedListView(bookEntity: books);
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return FeaturedListViewLoadingIndicator();
        }
      },
    );
  }
}
