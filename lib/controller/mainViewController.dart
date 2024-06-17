import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movieSearch/data/model/searchMovie/search.dart';
import 'package:movieSearch/data/model/searchMovie/searchMovie.dart';
import 'package:movieSearch/data/repository/repository.dart';
import 'package:movieSearch/style/color.dart';

class MainViewController extends GetxController {
  final Repository repository;
  MainViewController({required this.repository});

  final List<ScrollController> scrollController = [
    ScrollController(),
  ]; // 스크롤 컨트롤러

  var selectedTab = 0.obs; // 현재 탭 인덱스

  bool isLoading = false;
  var imageList = <Search>[].obs; // 검색 리스트 배열
  var page = 1;
  int? totalPage = 0;

  TextEditingController searchInputController = TextEditingController();
  var searchText = 'star'.obs;

  late FocusNode searchFocusNode; // 검색창 포커스 노드

  // 검색 상태 저장 변수
  var currentKeyword = 'star';
  var currentSort = '';

  // 탭 이동, 현재 탭 클릭시 맨위로 점프
  void selectTab(int num) {
    if (selectedTab.value == num) {
      scrollController[num].jumpTo(0);
    } else {
      selectedTab.value = num;
    }
  }

  @override
  onInit() {
    super.onInit();
    searchInputController.text = 'star';
    scrollEvent();
    searchFocusNode = FocusNode();
    search();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  // 무한스크롤 이벤트
  void scrollEvent() {
    scrollController[0].addListener(() {
      if ((scrollController[0].position.pixels >=
              scrollController[0].position.maxScrollExtent - 300.0) &&
          (page <= totalPage!)) {
        searchNext();
      }
    });
  }

  // 검색
  search() async {
    if (isLoading) return;

    if ((searchText.value.trim().isEmpty)) {
      Fluttertoast.showToast(msg: '검색어를 입력해주세요.', textColor: primaryWhite);
      return;
    }

    isLoading = true;
    currentKeyword = searchText.value;
    page = 1;
    await repository
        .getBySearch(currentKeyword, page.toString())
        .then((SearchMovie data) {
      if (data.response == 'False') {
        return;
      }

      imageList.clear();
      imageList.value = data.search!;

      totalPage = (int.parse(data.totalResults!) ~/ 10 + 1) as int?;

      scrollController[0].jumpTo(0);
    });
    isLoading = false;
  }

  // 다음페이지 검색
  searchNext() async {
    if (isLoading) return;

    isLoading = true;
    page++;
    await repository
        .getBySearch(currentKeyword, page.toString())
        .then((SearchMovie data) {
      if (data.response == 'False') {
        return;
      }

      imageList.value = [...imageList, ...data.search!]; // 기존 데이터에 이어붙이기
    });
    isLoading = false;
  }
}
