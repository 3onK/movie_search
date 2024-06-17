import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movieSearch/data/model/movie_detail/movieDetail.dart';
import 'package:movieSearch/data/repository/repository.dart';
import 'package:movieSearch/style/color.dart';

class MovieDetailController extends GetxController {
  final Repository repository;
  final String imdbID;
  MovieDetailController({required this.repository, required this.imdbID});

  var movieData = <MovieDetail>[];
  var isLoading = true;

  @override
  onInit() {
    super.onInit();
    getMovieDetail();
  }

  getMovieDetail() async {
    await repository.getByID(imdbID).then((MovieDetail data) {
      if (data.response == 'False') {
        Get.back();
        Fluttertoast.showToast(
            msg: '정보를 불러오는데 실패하였습니다.', textColor: primaryWhite);
        return;
      }
      movieData.add(data);
      isLoading = false;
      update();
    });
  }
}
