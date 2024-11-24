import '../models/photo_info_model.dart';

abstract class GalleryRepo{
  Future<dynamic> sendPhotos(PhotoInfoModel photoInfoModel);
}