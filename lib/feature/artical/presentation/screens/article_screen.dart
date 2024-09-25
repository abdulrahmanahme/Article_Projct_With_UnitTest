import 'package:artical/core/services_locator/services_locator.dart';
import 'package:artical/feature/artical/presentation/manager/bloc/article_bloc.dart';
import 'package:artical/feature/artical/presentation/manager/bloc/article_event.dart';
import 'package:artical/feature/artical/presentation/manager/bloc/article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleBloc(sl())..add(GetArticleEvent()),
      child: Scaffold(
        appBar: AppBar(
          title:const Text("Book Details"),
        ),
        body: Center(
          child: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              if (state is ArticleInitial) {
                return const Text("Press the button to fetch the Article");
              } else if (state is ArticleLoading) {
                return const CircularProgressIndicator();
              } else if (state is ArticleSuccess) {
                return ListView.builder(
                    itemCount: state.articleModel.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.articleModel[index].body),
                      );
                    });
              } else if (state is ArticleError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
