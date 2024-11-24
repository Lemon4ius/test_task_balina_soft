part of 'gallery_bloc.dart';

@immutable
sealed class GalleryEvent {}

class OnInitialLoadPhotoGalleryEvent extends GalleryEvent{}
class OnLoadPhotoGalleryEvent extends GalleryEvent{}
