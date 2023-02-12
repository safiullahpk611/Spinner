


import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/proposal-model.dart';

class DatabaseServices{
  final firebaseFireStore = FirebaseFirestore.instance;
  postData( LinkAddress linkAddress) async {
    try {
      var id = DateTime.now().microsecondsSinceEpoch.toString();


      await firebaseFireStore
          .collection('AddressLink')
          .doc('doc')
          .set(linkAddress.toJson());

      return true;
    } catch (e) {
      print("Exception@MakingPostImage=>$e");
    }
  }


  Future<LinkAddress> getUser() async {
    print('GetUser id:');
    try {
      final snapshot = await firebaseFireStore.collection('AddressLink').doc('doc').get();
      print('Current app User Data: ${snapshot.data()}');
      return LinkAddress.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      print('Exception @DatabaseService/getUser $e');
      return LinkAddress();
    }
  }



  Stream<QuerySnapshot>? getLinkAdress(){

    try {
     Stream<QuerySnapshot> snapshot = firebaseFireStore
          .collection('AddressLink')
          .snapshots() as Stream<QuerySnapshot>;
      print("Successfully Fetched");
      return snapshot;
    } catch (e) {
      print('Exception@ GetWeeklyWeight ==> $e');
      return null;
    }

  }
  


}