import 'package:flutter/material.dart';
import 'package:shop_a_z/db/db_helper.dart';

import '../models/brand.dart';

class TelescopeProvider extends ChangeNotifier {
  List<Brand> brandList = [];

  Future<void> addBrand(String name) async {
    Brand brand = Brand(name: name);
    return DbHelper.addBrand(brand);
  }

  getAllBrands() {
    DbHelper.getAllBrands().listen((snapshot) {
      brandList = List.generate(snapshot.docs.length, (index) => Brand.fromJson(snapshot.docs[index].data()));
      notifyListeners();
    });
  }
}