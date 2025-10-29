import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_sun_online/models/category_model.dart';
import 'package:evently_sun_online/models/event_model.dart';
import 'package:evently_sun_online/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {
  static Future<UserCredential> register(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> login(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  // static Future<void>addUserToFireStore(UserModel user){
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //  CollectionReference<Map<String, dynamic>> usersCollection =  db.collection("Users");
  //  DocumentReference<Map<String, dynamic>> userDocument = usersCollection.doc(user.id);
  // return userDocument.set(user.toJson());
  //
  // }
  // static Future<UserModel> getUserFromFireStore(String uid) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
  //     "Users",
  //   );
  //   DocumentReference<Map<String, dynamic>> userDocument = usersCollection.doc(
  //     uid,
  //   );
  //   DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await userDocument
  //       .get();
  //   var json = documentSnapshot.data();
  //   return UserModel.fromJson(json!);
  // }
  static CollectionReference<UserModel> _getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);
    return userDocument.set(user);
  }

  static Future<UserModel> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();
    return documentSnapshot.data()!;
  }

  static CollectionReference<EventModel> _getEventsCollection(
    BuildContext context,
  ) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("Events")
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromJson(snapshot.data()!, context),
          toFirestore: (event, _) => event.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(
    EventModel event,
    BuildContext context,
  ) {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection(
      context,
    );

    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    return eventDocument.set(event);
  }

  static Future<List<EventModel>> getEventsFromFireStore(
    BuildContext context,
   [ CategoryModel? category]
  ) async {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection(
      context,
    );
    QuerySnapshot<EventModel> querySnapshot = await eventsCollection
        .where("categoryId", isEqualTo: category?.id == "0" ? null : category?.id)
        .orderBy("dateTime")
        .get();
    List<EventModel> events = querySnapshot.docs
        .map((documentSnapshot) => documentSnapshot.data())
        .toList();

    return events;
  }

  static Stream<List<EventModel>> getEventsFromFireStoreRealTimeUpdate(
    BuildContext context,
    CategoryModel category,
  ) async* {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection(
      context,
    );
    Stream<QuerySnapshot<EventModel>> snapshots = eventsCollection
        .where("categoryId", isEqualTo: category.id == "0" ? null : category.id)
        .orderBy("dateTime")
        .snapshots();

    /// [snapshot, snapshot, snapshot]
    Stream<List<EventModel>> eventsStream = snapshots.map(
      (snapshot) =>
          snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(),
    );
    yield* eventsStream;
  }



  static Future <void>addEventToFavourite(EventModel event){
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favouriteEventsIds.add(event.id);
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel>  userDocument = usersCollection.doc(currentUser.id);
    return userDocument.set(currentUser);
  }

  static Future<void> removeEventFromFavourite(EventModel event){
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favouriteEventsIds.remove(event.id);
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(currentUser.id);
    return userDocument.set(currentUser);
  }
  static Future<List<EventModel>> getFavouriteEvents(BuildContext context)async{
    List<EventModel> events = await getEventsFromFireStore(context, );
  return   events.where((event)=>UserModel.currentUser!.favouriteEventsIds.contains(event.id)).toList();
  }

}
