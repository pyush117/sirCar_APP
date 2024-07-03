import '../../consts/firebase_consts.dart';

class FireStoreServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getBookings(uid) {
    return firestore
        .collection(bookingCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }
}
