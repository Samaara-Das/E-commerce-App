import 'dart:io';

import 'package:flutter/material.dart';

import '../models/brand.dart';
import '../utils/constants.dart';

class AddTelescopePage extends StatefulWidget {
  static const String routeName = 'addtelescope';
  const AddTelescopePage({super.key});

  @override
  State<AddTelescopePage> createState() => _AddTelescopePageState();
}

class _AddTelescopePageState extends State<AddTelescopePage> {
  final _modelController = TextEditingController();
  final _dimensionController = TextEditingController();
  final _weightController = TextEditingController();
  final _lensDiameterController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  Brand? brand;
  String? imageLocalPath;
  DateTime? dateTime;
  String mountDescription = TelescopeUtils.mountList.first;
  String focusType = TelescopeUtils.focusList.first;
  String telescopeType = TelescopeUtils.typeList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Telescope')),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  imageLocalPath == null ? const Icon(Icons.photo, size:100)
                    : Image.file(File(imageLocalPath!), height: 100, width: 100, fit: BoxFit.cover),
                  const Text('Select Telescope Image\nfrom', textAlign: TextAlign.center,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.camera),
                        label: const Text('Camera'),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.browse_gallery),
                        label: const Text('Gallery'),
                      ),
                    ]
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
