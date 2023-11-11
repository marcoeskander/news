import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cuibt/cuibt.dart';
import 'package:news/shared/cuibt/states.dart';
import 'package:news/shared/network/commponent.dart';

class technology extends StatelessWidget {
  @override
  Widget build(Object context) {
    news_cubit.get(context).getTechnologys();
    var list = news_cubit.get(context).technologys;
    return Scaffold(
      body: BlocConsumer<news_cubit, news_state>(
          builder: (context, state) {
            return buildArticles(list, list.length);
          },
          listener: (context, state) {}),
    );
  }
}
