import 'package:dio/dio.dart';
import 'package:test_task_balina_soft/src/core/network.dart';
import 'package:test_task_balina_soft/src/features/gallery_screen/models/photo_info_model.dart';

import '../../../core/error_model/error_response_model.dart';
import '../repo/gallery_repo.dart';

class GalleryRepoImpl implements GalleryRepo {
  final _network = Network.singleton();

  @override
  Future<dynamic> sendPhotos(PhotoInfoModel photoInfoModel)async {
    try{
      final response = await _network.dio.post('/image', data: {
        "base64Image": photoInfoModel.base64Image,
        "date": 232,//TODO не очень понял что бэк планировал принимать
        "lat": photoInfoModel.latitude,
        'lng': photoInfoModel.longitude
      }
      );
    }on DioException catch(e){
      if(e.response !=null) {
        final errorData = ErrorResponseModel.fromJson(e.response?.data);

        return errorData;
      }
    }

  }
}
