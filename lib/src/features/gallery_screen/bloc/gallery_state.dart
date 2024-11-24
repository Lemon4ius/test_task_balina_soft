part of 'gallery_bloc.dart';

@immutable
sealed class GalleryState {}

final class GalleryInitial extends GalleryState {}

final class GalleryPhotoState extends GalleryState {
  final List<PhotoInfoModel> images;

  GalleryPhotoState(this.images);
}

