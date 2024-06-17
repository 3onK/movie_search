// 검색 이미지 리스트 위젯

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieSearch/controller/mainViewController.dart';
import 'package:movieSearch/data/provider/api.dart';
import 'package:movieSearch/data/repository/repository.dart';
import 'package:movieSearch/style/color.dart';
import 'package:movieSearch/view/movieDetailView.dart';
import 'package:movieSearch/widget/customText.dart';

class SearchItem extends StatefulWidget {
  int index;
  SearchItem(this.index, {super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final mainViewController =
      Get.put(MainViewController(repository: Repository(api: Api())));

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => MovieDetailView(
                mainViewController.imageList[widget.index].imdbId.toString()),
            transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding:
                  const EdgeInsets.only(bottom: 5.0, left: 13.0, right: 13.0),
              child: CustomText(
                text:
                    '${mainViewController.imageList[widget.index].title}, ${mainViewController.imageList[widget.index].year.toString().split('T')[0]}',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: mainViewController.imageList[widget.index].poster
                      .toString(),
                  imageBuilder: (context, ImageProvider) {
                    return Container(
                      height: 300.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return Container(
                      height: 300.0,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: primaryNavyBlue,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      height: 300.0,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Icon(Icons.error),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
