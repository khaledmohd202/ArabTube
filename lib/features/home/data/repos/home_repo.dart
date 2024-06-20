import 'package:arabtube/features/home/data/models/video.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';


abstract class HomeRepo{
  Future<Either<Failure,List<VideoModel>>> getAllVideos();
}