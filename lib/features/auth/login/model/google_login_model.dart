
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GoogleLoginModel extends Equatable {

  const GoogleLoginModel ({
    required this.id,
    this.name,
    this.email,
    this.photoUrl,
  });

  final String id;
  final String? name;
  final String? email;
  final String? photoUrl;

  @override

  List<Object?> get props =>[id,name,email,photoUrl];
  

  factory GoogleLoginModel.fromDocument(DocumentSnapshot doc){

    return GoogleLoginModel (
    
      id: doc.data().toString().contains('id') ? doc.get('id') : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      photoUrl: doc.data().toString().contains('photoUrl') ? doc.get('photoUrl') : '' ,

    
      // id: doc.get('id'),
      // name: doc.get('name'),
      // email: doc.get('email'),
      // photoUrl: doc.get('photoUrl'),


      // id: doc.data()!['id'],
      // name: doc.data()!['name'],
      // email: doc.data()!['email'],
      // photoUrl: doc.data()!['photoUrl'],


      );
  }

}