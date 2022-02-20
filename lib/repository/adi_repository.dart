import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/adi_pupils.dart';

class AdiRepository {
  // 1
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('adi_pupils');
  // 2
  Stream<QuerySnapshot> getStream() {
    print('Hello Pupils');
    var pupils = collection.snapshots();        
    return pupils;
  }
}
