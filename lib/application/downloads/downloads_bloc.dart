import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net/domain/core/failures/mainfailure.dart';
import 'package:net/domain/downloads/i_download_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

// part 'downloads_bloc.freezed.dart';

// class DownloadsBloc extends Bloc<DownloadsEvents, DownloadsState> {
//   final IDownloadRepo downloadRepo;
//   DownloadsBloc(this.downloadRepo) : super(DownloadsState.intial()) {
//     on<_GetDownloadImage>((event, emit) async {
//       // TODO: implement event handler
//       emit(state.copyWith(
//           isLoading: true, downloadsFailureOrSuccessOption: none()));
//       // final Either<MainFailure, List<Downloads>> downloadoptions =
//       //     await downloadRepo.getDownloadsImages();
//       //     emit(downloadoptions.fold((l) => null, (r) => null))
//     });
//   }
// }
