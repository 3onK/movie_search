import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieSearch/controller/mainViewController.dart';
import 'package:movieSearch/data/provider/api.dart';
import 'package:movieSearch/data/repository/repository.dart';
import 'package:movieSearch/style/color.dart';
import 'package:movieSearch/style/shadow.dart';
import 'package:movieSearch/widget/searchItem.dart';

class MovieListView extends StatelessWidget {
  final mainViewController =
      Get.put(MainViewController(repository: Repository(api: Api())));

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // 검색창 포커스 해제
        },
        child: Column(
          children: [
            searchWidget(),
            Expanded(
              child: SingleChildScrollView(
                controller: mainViewController.scrollController[0],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return SearchItem(index);
                          },
                          itemCount: mainViewController.imageList.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 검색창 위젯
  Widget searchWidget() {
    return Container(
      height: 65.0,
      decoration: const BoxDecoration(
        color: primaryNavyBlue,
        boxShadow: boxShadow,
      ),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: primaryWhite,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  focusNode: mainViewController.searchFocusNode, // 포커스 노드
                  onSubmitted: (value) {
                    //검색
                    mainViewController.search();
                  },
                  controller: mainViewController.searchInputController,
                  onChanged: (value) {
                    mainViewController.searchText.value = value;
                  },
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: '검색어를 입력해주세요.',
                    hintStyle: const TextStyle(
                        color: secondaryDarkGray, fontWeight: FontWeight.w600),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 13.0),
                    suffixIcon: mainViewController.searchText.value.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              mainViewController.searchInputController.clear();
                              mainViewController.searchText.value = '';
                            },
                            child: const Icon(
                              Icons.cancel_rounded,
                              color: secondaryDarkGray,
                            ),
                          )
                        : null,
                  ),
                  textInputAction:
                      TextInputAction.search, //키보드 완료 버튼 검색 아이콘으로 변경
                ),
              ),
              InkWell(
                onTap: () {
                  //검색
                  mainViewController.search();
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      right: 16.0, top: 8.0, bottom: 8.0, left: 5.0),
                  child: Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
