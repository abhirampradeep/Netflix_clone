//all kinds of api call that come in the download page,for that this is used.
import 'package:dartz/dartz.dart';
import 'package:net/domain/core/failures/mainfailure.dart';
import 'package:net/domain/downloads/models/downloads.dart';

abstract class IDownloadRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
