import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/product.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  String category = 'General';
  String brand = 'Un brand';
  bool offer = false;

  List<Product> products = [

  ];


  @override
  Future<void> onInit() async{
    productCollection = firestore.collection('products');
    await fetchproducts();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        image: productImgCtrl.text,
        brand: brand,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product added successfully', colorText: Colors.green);
      setValueDefault();
    } catch (e) {
      Get.snackbar('Fail', e.toString(), colorText: Colors.red);
      print(e);
    }

  }
  fetchproducts()async{
   try {
     QuerySnapshot productSnapshot = await productCollection.get();
     final List<Product> retriveProducts = productSnapshot.docs.map((doc) =>
            Product.fromJson(doc.data() as Map <String ,dynamic>),

        ).toList();
     products.clear();
     products.assignAll(retriveProducts);
     Get.snackbar('Success', 'The Product fetch Successfully from database',colorText: Colors.green);

   } catch (e) {
     Get.snackbar('Failed ',e.toString(),colorText: Colors.red);
     print(e);
   }finally{
     update();
   }
  }
  deleteProduct(String id) async{
   try {
     await productCollection.doc(id).delete();
     fetchproducts();
   } catch (e) {
     Get.snackbar('Failed ',e.toString(),colorText: Colors.red);
     print(e);
   }
  }

  setValueDefault(){
    productNameCtrl.clear();
    productPriceCtrl.clear();
    productImgCtrl.clear();
    productDescriptionCtrl.clear();
    category = 'General';
    brand = 'Un brand';
    offer = false;
update();
  }
}
