import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Users {
  final String firstName;
  final String lastName;
  final String uID;
  final String email;
  final String userName;
  Users(
      {@required this.firstName,
      @required this.lastName,
      @required this.userName,
      @required this.uID,
      this.email});

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'uID': uID,
    };
  }

  static Users toObject(Map<String, dynamic> map) {
    return Users(
      firstName: map['firstName'],
      lastName: map['lastName'],
      userName: map['userName'],
      email: map['email'],
      uID: map['uID'],
    );
  }
}
