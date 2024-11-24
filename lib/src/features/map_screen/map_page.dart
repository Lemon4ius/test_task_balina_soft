import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_task_balina_soft/src/features/gallery_screen/models/photo_info_model.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart';
import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart' as YandexImage;
import 'package:yandex_maps_mapkit_lite/yandex_map.dart';

import '../../core/constans.dart';
import '../../core/data_store.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  MapWindow? _mapWindow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: YandexMap(
          onMapCreated: (mapWindow) {
            final imageProvider = YandexImage.ImageProvider.fromImageProvider(const AssetImage('assets/photo_image.png'));
          _mapWindow = mapWindow;
          final List<Point> points = [];
          getPhotoList().forEach((element) {
            points.add(Point(latitude: element.latitude, longitude: element.longitude));
          },);
          _mapWindow?.map.mapObjects.addPlacemarks(imageProvider, const IconStyle(scale: 0.2), points: points);
          mapkit.onStart();
        },

        )
    );
  }

  List<PhotoInfoModel> getPhotoList() {
    final json = BaseDataStore().getString(ConstantsShared.photosKey);
    if (json.isNotEmpty) {
      Iterable jsonImagePathList = jsonDecode(json);
      final imagePathList = List<PhotoInfoModel>.from(jsonImagePathList.map(
            (e) => PhotoInfoModel.fromJson(e),
      ));
      return imagePathList;
    }
    return [];
  }
}
