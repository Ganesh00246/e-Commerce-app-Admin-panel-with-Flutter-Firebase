import 'package:ecommerce/custom_widgets/homecontroller.dart';
import 'package:ecommerce/screens/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(

      builder: (ctrl) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddProductPage());
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Footware'),
            actions: [
              IconButton(onPressed: (){
                ctrl.refresh();
              }, icon: Icon(Icons.refresh))
            ],
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(ctrl.products[index].name ?? ''),
              subtitle: Text((ctrl.products[index].price ?? 0).toString()),
              trailing: IconButton(
                onPressed: () {
                  ctrl.deleteProduct(ctrl.products[index].id ?? '');
                },
                icon: const Icon(Icons.delete)
                ,),
            );
          }, itemCount: ctrl.products.length,
          ),
        );
      },
    );

  }
}
