import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/models/articleModel.dart';
import 'package:news/moduls/web_page.dart';
import 'package:news/shared/cuibt/cuibt.dart';

import 'package:webview_flutter/webview_flutter.dart';

Widget buildArticles(
  posts,
  int len, {
  bool allowscroll = true,
}) {
  return Swiper(
    scrollDirection: Axis.vertical,
    allowImplicitScrolling: allowscroll,
    scale: 1.0,
    viewportFraction: 0.7,
    itemCount: len,
    itemBuilder: (BuildContext context, int index) {
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
    },
  );
}

Widget usedTextformfield({
  required TextEditingController controller,
  required TextInputType kaybordType,
  required String? Function(String?)? validate,
  required String label,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onchange,
  String? Function(String?)? onTap,
  bool securty = false,
  Icon? prefex,
  Icon? sufex,
  void Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: kaybordType,
      onChanged: onchange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      autofocus: true,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: sufex != null
            ? IconButton(
                icon: sufex,
                onPressed: suffixPressed,
              )
            : null,
        border: OutlineInputBorder(),
        prefix: prefex,
      ),
    );
