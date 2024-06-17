// imageUrl을 파라미터로 받아 줌인 가능한 전체화면으로 띄워주는 view

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieSearch/style/color.dart';

class PosterView extends StatelessWidget {
  final String poster;
  const PosterView(
    this.poster, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: secondaryDarkGray,
              ),
              child: InteractiveViewer(
                panEnabled: true,
                scaleEnabled: true,
                maxScale: 4.0,
                minScale: 1.0,
                child: CachedNetworkImage(
                  imageUrl: poster,
                  imageBuilder: (context, ImageProvider) {
                    return Container(
                      height: 300.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ImageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return Container(
                      height: 300.0,
                      width: 42.0,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: primaryNavyBlue,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
            Positioned(
              top: 18.0,
              left: 18.0,
              child: InkWell(
                onTap: () async {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 32.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
