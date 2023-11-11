import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cuibt/cuibt.dart';
import 'package:news/shared/cuibt/states.dart';
import 'package:news/shared/network/commponent.dart';

class businesss extends StatelessWidget {
  @override
  Widget build(Object context) {
    news_cubit.get(context).get_bussiness();
    var list = news_cubit.get(context).business;
    return Scaffold(
      body: BlocConsumer<news_cubit, news_state>(
        listener: (context, state) {},
        builder: (context, state) {
          return (list.length > 0)
              ? buildArticles(list, list.length)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
