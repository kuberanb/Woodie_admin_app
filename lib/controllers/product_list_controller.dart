import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../core/constants.dart';

class ProductListController extends GetxController {
  Stream<QuerySnapshot> getHomeProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore.collection(productsCollection).snapshots();
  }
}
