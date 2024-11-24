import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_balina_soft/src/features/detail_screen/detail_page.dart';
import 'package:test_task_balina_soft/src/features/gallery_screen/bloc/gallery_bloc.dart';
import 'package:test_task_balina_soft/src/features/gallery_screen/models/photo_info_model.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late List<PhotoInfoModel> _image = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryBloc()..add(OnInitialLoadPhotoGalleryEvent()),
      child: BlocListener<GalleryBloc, GalleryState>(
        listener: (context, state) {
          if (state is GalleryPhotoState) {
            setState(() {
              setState(() {
                _image= state.images;
              });
            });
          }
        },
        child: SafeArea(
          child: Builder(
            builder: (context) {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.read<GalleryBloc>().add(OnLoadPhotoGalleryEvent());
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisExtent: 160,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(_image[index]),
                                ),
                              );
                            },
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.file(
                                File(_image[index].path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Text(_image[index].name, maxLines: 1, overflow: TextOverflow.ellipsis,)
                        ],
                      );
                    },
                    itemCount: _image.length,
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
