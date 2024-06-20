import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failure.dart';
import '../model/channel_model.dart';

abstract class ChannelRepo{
  Future<Either<Failure,List<ChannelModel>>> getChannels();

}