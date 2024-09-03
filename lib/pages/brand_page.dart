import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_a_z/providers/telescope_provider.dart';
import 'package:shop_a_z/utils/widget_functions.dart';

class BrandPage extends StatelessWidget {
  static const String routeName = 'brand';
  const BrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Brands'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSingleTextInputDialog(
            context: context,
            title: 'Add Brand',
            onSubmit: (brand) {
              EasyLoading.show(status: 'Please wait...');
              Provider.of<TelescopeProvider>(context, listen: false)
                .addBrand(brand)
                .then((value) {
                  EasyLoading.dismiss();
                  showMsg(context, 'Brand added!');
                });
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<TelescopeProvider>(
        builder: (context, provider, child) => provider.brandList.isEmpty ?
        Center(child: Text('No brands yet')) :
        ListView.builder(
          itemCount: provider.brandList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(provider.brandList[index].name)
            );
          }
        )
      ),
    );
  }
}
