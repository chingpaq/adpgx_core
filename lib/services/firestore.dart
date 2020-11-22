import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  FirebaseFirestore fireStore;
  CollectionReference users;

  void initFireStore() {
    fireStore = FirebaseFirestore.instance;
    users = FirebaseFirestore.instance.collection('users');
  }

  Future<bool> addUser({String firstName, String lastName, String userName, String uID}) async{
    try {
      await users
          .add({
        'firstName': firstName,
        'lastName': lastName,
        'userName': userName,
        'userID' : uID,
      });
      return true;
    } catch(e){
      return false;
    }
  }


}
