import 'dart:async';
import 'package:artical/core/use_case/use_case.dart';
import 'package:artical/feature/artical/presentation/manager/bloc/article_event.dart';
import 'package:artical/feature/artical/presentation/manager/bloc/article_state.dart';
import 'package:bloc/bloc.dart';
import '../../../domain/use_cases/article_use_case.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleUseCase articleUseCase;
  ArticleBloc(this.articleUseCase) : super(ArticleInitial()) {
    on<GetArticleEvent>(getArticleUseCase);
  }

  FutureOr<void> getArticleUseCase(
      ArticleEvent event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    final result = await articleUseCase.execute(const NoParameter());
    result.fold((failure) {
      emit(
        ArticleError(failure.message),
      );
    }, (success) {
      emit(
        ArticleSuccess(success),
      );
    });
  }
}
