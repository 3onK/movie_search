// imageUrl을 파라미터로 받아 줌인 가능한 전체화면으로 띄워주는 view

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieSearch/controller/movieDetailController.dart';
import 'package:movieSearch/data/provider/api.dart';
import 'package:movieSearch/data/repository/repository.dart';
import 'package:movieSearch/style/color.dart';
import 'package:movieSearch/view/posterView.dart';
import 'package:movieSearch/widget/customText.dart';

class MovieDetailView extends StatelessWidget {
  String imdbID;
  MovieDetailView(
    this.imdbID, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MovieDetailController>(
          init: MovieDetailController(
              repository: Repository(api: Api()), imdbID: imdbID),
          builder: (movieDetailController) {
            if (movieDetailController.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                                () => PosterView(
                                    movieDetailController.movieData[0].poster!),
                                transition: Transition.fadeIn);
                          },
                          child: Container(
                            height: 300.0,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: secondaryDarkGray,
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  movieDetailController.movieData[0].poster!,
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
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 13.0, right: 13.0, top: 13.0, bottom: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                '${movieDetailController.movieData[0].title!}, ${movieDetailController.movieData[0].year!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              ),
                              CustomText(
                                text: '평점',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: movieDetailController
                                .movieData[0].ratings?.length,
                            itemBuilder: (context, index) {
                              final rating = movieDetailController
                                  .movieData[0].ratings?[index];
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(13.0),
                                margin: const EdgeInsets.only(bottom: 5.0),
                                decoration: BoxDecoration(
                                    color: secondaryLightGray,
                                    borderRadius: BorderRadius.circular(13.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: rating?.source ?? '',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                    CustomText(
                                      text: rating?.value ?? '',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '개봉일: ${movieDetailController.movieData[0].released!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '제작자: ${movieDetailController.movieData[0].director!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '출연진: ${movieDetailController.movieData[0].actors!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '작가: ${movieDetailController.movieData[0].writer!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '장르: ${movieDetailController.movieData[0].genre!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '상영시간: ${movieDetailController.movieData[0].runtime!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '수상: ${movieDetailController.movieData[0].awards!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '언어: ${movieDetailController.movieData[0].language!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '국가: ${movieDetailController.movieData[0].country!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '메타스코어: ${movieDetailController.movieData[0].metascore!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          CustomText(
                            text:
                                '박스오피스: ${movieDetailController.movieData[0].boxOffice!}',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          const CustomText(
                            text: '줄거리',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(13.0),
                            margin: const EdgeInsets.only(bottom: 5.0),
                            decoration: BoxDecoration(
                                color: secondaryLightGray,
                                borderRadius: BorderRadius.circular(13.0)),
                            child: CustomText(
                              text: movieDetailController.movieData[0].plot!,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
