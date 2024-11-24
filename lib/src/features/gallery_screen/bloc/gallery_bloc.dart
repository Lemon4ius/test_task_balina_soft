import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:native_exif/native_exif.dart';
import 'package:test_task_balina_soft/src/features/gallery_screen/repo/gallery_repo.dart';
import 'package:test_task_balina_soft/src/features/gallery_screen/repo_impl/gallery_repo_impl.dart';

import '../../../core/constans.dart';
import '../../../core/data_store.dart';
import '../models/photo_info_model.dart';

part 'gallery_event.dart';

part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepo _repo = GalleryRepoImpl();
  List<XFile> _image = [];

  GalleryBloc() : super(GalleryInitial()) {
    on<OnLoadPhotoGalleryEvent>(onLoadPhoto);
    on<OnInitialLoadPhotoGalleryEvent>(onInitialLoadPhoto);
  }

  FutureOr<void> onLoadPhoto(
      OnLoadPhotoGalleryEvent event, Emitter<GalleryState> emit) async {
    final ImagePicker picker = ImagePicker();
    final images = await picker.pickMultiImage(maxWidth: 1000, maxHeight: 1000);
    initialPhotosList();
    for (var element in images) {
      if (!_image
          .map(
            (e) => e.path,
          )
          .contains(element.path)) {
        _image.add(element);
      }
    }
    final exifAddedPhoto = await convertXFileToExif(images);
    final addedPhotoList = await converterToJson(images, exifAddedPhoto);
    for (final photoModel in addedPhotoList) {
      _repo.sendPhotos(photoModel);
    }
    final exifAllPhotos = await convertXFileToExif(_image);
    final allPhotoList = await converterToJson(_image, exifAllPhotos);
    final jsonList = jsonEncode(allPhotoList.map((e) => e.toJson()).toList());
    BaseDataStore().saveString(ConstantsShared.photosKey, jsonList);
    emit(GalleryPhotoState(allPhotoList));
  }

  void initialPhotosList() {
    final json = BaseDataStore().getString(ConstantsShared.photosKey);
    if (json.isNotEmpty) {
      Iterable jsonImagePathList = jsonDecode(json);
      final imagePathList = List<PhotoInfoModel>.from(jsonImagePathList.map(
        (e) => PhotoInfoModel.fromJson(e),
      ));
      _image = List<XFile>.from(imagePathList.map(
        (e) => XFile(e.path),
      ));
    }
  }

  Future<List<PhotoInfoModel>> converterToJson(
      List<XFile> images, List<Exif> exif) async {
    List<PhotoInfoModel> photoInfoModel = [];
    for (var i = 0; i < exif.length; i++) {
      final latLong = await exif[i].getLatLong();
      final dateImg = await exif[i].getOriginalDate();
      final nameImg = images[i].name;
      final pathImg = images[i].path;
      final latitudeImg = latLong?.latitude;
      final longitudeImg = latLong?.longitude;
      final base65Img = base64Encode(await images[i].readAsBytes());
      final model = PhotoInfoModel(
          name: nameImg,
          path: pathImg,
          longitude: longitudeImg ?? 53.902284,
          latitude: latitudeImg ?? 27.561831,
          date: dateImg.toString(),
          base64Image: base65Img);
      photoInfoModel.add(model);
      exif[i].close();
    }
    return photoInfoModel;
  }

  FutureOr<void> onInitialLoadPhoto(
      OnInitialLoadPhotoGalleryEvent event, Emitter<GalleryState> emit)async {
    initialPhotosList();
    final exifAllPhotos = await convertXFileToExif(_image);
    final photoList = await converterToJson(_image, exifAllPhotos);
    emit(GalleryPhotoState(photoList));
  }

  Future<List<Exif>> convertXFileToExif(List<XFile> images) async {
    return List<Exif>.from(await Future.wait(images.map(
      (e) async {
        return await Exif.fromPath(e.path);
      },
    )));
  }
}

sendPhotos(repo, model) {
  Isolate.run(
    () => repo.sendPhotos(model),
  );
}
