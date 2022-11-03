import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('coffee');

class Database {
  // create user
  static Future<Response> addCoffee({
    required String name,
    required String sugars,
    required int strength,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "sugars": sugars,
      "strength": strength
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  // display users
  static Stream<QuerySnapshot> readUser() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  // update user
  static Future<Response> updateUser({
    required String name,
    required String sugars,
    required int strength,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "sugars": sugars,
      "strength": strength
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  // delete user
  static Future<Response> deleteCoffee({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}


// class DatabaseService {

//   final String? uid;
//   DatabaseService({ this.uid });

//   // collection reference
//   final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

//   Future<void> updateUserData(String sugars, String name, int strength) async {
//     return await brewCollection.document(uid).setData({
//       'sugars': sugars,
//       'name': name,
//       'strength': strength,
//     });
//   }
// }

// class DatabaseService {
//   FirebaseFirestore db = FirebaseFirestore.instance;

//   Future<void> updateUserData(String age, String name) async {
//     return await db.collection("users").get().then((event) {
//       for (var doc in event.docs) {
//         print("${doc.id} => ${doc.data()}");
//       }
//     });
//   }
// }
