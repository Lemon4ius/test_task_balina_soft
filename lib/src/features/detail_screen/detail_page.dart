import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_task_balina_soft/src/features/gallery_screen/models/photo_info_model.dart';

class DetailPage extends StatelessWidget {
  final PhotoInfoModel image;

  const DetailPage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.file(
                    File(image.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: Text(
                    image.date.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
