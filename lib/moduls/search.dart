import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/moduls/web_page.dart';
import 'package:news/shared/cuibt/cuibt.dart';
import 'package:news/shared/cuibt/states.dart';
import 'package:news/shared/network/commponent.dart';

class search extends StatelessWidget {
  @override
  Widget build(Object context) {
    var cubit = news_cubit.get(context);

    return BlocConsumer<news_cubit, news_state>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: usedTextformfield(
                controller: cubit.searchcontroler,
                kaybordType: TextInputType.text,
                label: 'saerch',
                validate: (String? value) {
                  if (value.toString() == null) {
                    return 'search must be not empty';
                  }
                  return null;
                },
                onchange: (value) {
                  cubit.getsearch(word: value!);
                },
              ),
            ),
            body: Column(
              children: [
                if (state is searchInitialState)
                  LinearProgressIndicator(
                    color: Colors.blue,
                  ),
                if (state is searchscreenSucess)
                  Expanded(
                      child: buildArticles(cubit.search, cubit.search.length)),
                /*    Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => articles(
                        cubit.search, cubit.search.length, index, context),
                    separatorBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    itemCount: cubit.search.length,
                  ),
                ),*/
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}

Widget articles(
  posts,
  int len,
  int index,
  context, {
  bool allowscroll = true,
}) {
  return InkWell(
    onTap: () {
      print('${posts[index]['url']}');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => wep_page(
            url: posts[index]['url'],
          ),
        ),
      );
    },
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Image(
              image: NetworkImage(
                posts[index]['urlToImage'] == null
                    ? "https://www.albertadoctors.org/images/ama-master/feature/Stock%20photos/News.jpg"
                    : "${posts[index]['urlToImage']}",
              ),
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 360.0),
          child: Container(
              height: 400.0.h,
              width: 750.0.h,
              //  color: news_cubit.get(context).isDark? HexColor("333739"): Colors.white,

              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(35.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: news_cubit.get(context).isDark
                          ? HexColor("333730")
                          : Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '${posts[index]['title']}',
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ],
    ),
  );
}
