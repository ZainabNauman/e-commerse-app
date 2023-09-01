import 'package:flutter/material.dart';

class ProfileModel {
  final String title;
  final String value;
  final Icon icon;
  
  ProfileModel( {
    required this.title,
    required this.value,
    required this.icon,
  });
}

 List<ProfileModel> profileData = [
    ProfileModel(title: "Name",value: "Zainab Nauman", icon: const Icon(Icons.person)),
    ProfileModel(title: "Email",value: "zainabnauman1992@gmail.com", icon: const Icon(Icons.email)),
    ProfileModel(title: "Phone no.",value: "03428573798", icon: const Icon(Icons.phone_android)),
    ProfileModel(title: "Address",value: "Changa Road Daska, Sialkot", icon: const Icon(Icons.place)),
    ProfileModel(title: "Birthday",value: "13-09-2000", icon: const Icon(Icons.cake))
    ];