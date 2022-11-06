import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('coffee');

class Database {
  // create user
  static Future<Response> addOrder({
    // required String uid,
    required String name,
    required String spice,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      // "uid": uid,
      "name": name,
      "spice": spice,
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Placed the Order";
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

  // update order
  static Future<Response> updateOrder({
    required String name,
    required String spice,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{"name": name, "spice": spice};

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Order";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  // delete user
  static Future<Response> deleteOrder({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Canceled Order";
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

//   Future<void> updateUserData(String sugars, String name, String strength) async {
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
