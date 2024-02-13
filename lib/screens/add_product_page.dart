import 'package:ecommerce/custom_widgets/drop_down_btn.dart';
import 'package:ecommerce/custom_widgets/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: const Text('Add Product'),),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.maxFinite,
              child: Column(
                children: [
                  Text('Add New Product', style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: ctrl.productNameCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text(' Product name'),
                        hintText: 'Enter Product name'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: ctrl.productDescriptionCtrl,
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text(' Product Description'),
                        hintText: 'Enter your Product Description'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: ctrl.productImgCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text(' Product Image url'),
                        hintText: 'Enter Product your Image url'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: ctrl.productPriceCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text(' Product price'),
                        hintText: 'Enter Product price'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(child: DropDownBtn(
                        list: ['item1', 'item2', 'item3'],
                        selectedProductItems: ctrl.category,
                        Onselected: (selectedValue) {
                          ctrl.category = selectedValue ?? 'General';
                          ctrl.update();
                        },)),
                      Flexible(child: DropDownBtn(
                        list: ['brand1', 'brand2', 'brand3'],
                        selectedProductItems: ctrl.brand,
                        Onselected: (selectedValue) {
                          ctrl.brand = selectedValue ?? 'Unbrand';
                          ctrl.update();
                        },))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text('Other Product ? '),
                  const SizedBox(height: 10,),
                  DropDownBtn(list: ['true', 'false'],
                    selectedProductItems: ctrl.offer.toString(),
                    Onselected: (selectedValue) {
                      ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                      ctrl.update();
                    },),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))
                    ),
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Text("Add Product",
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
