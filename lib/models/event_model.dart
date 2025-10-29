import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_sun_online/models/category_model.dart';
import 'package:evently_sun_online/models/user_model.dart';
import 'package:flutter/material.dart';

class EventModel{
String ownerId;
  String id;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;


  EventModel({required this.id,required this.ownerId,required this.category, required this.title, required this.description, required this.dateTime,
    });
  EventModel.fromJson(Map<String, dynamic>json, BuildContext context):this(
      id: json["id"],
      ownerId: json["ownerId"],
      category:CategoryModel.getCategories(context).firstWhere((category)=>category.id == json["categoryId"] ),
      title:json["title"],
      description: json["description"],
      dateTime:( json["dateTime"] as Timestamp).toDate(),
  );

  Map<String, dynamic>toJson()=>{
    "id":id,
    "categoryId":category.id,
    "title": title,
    "description": description,
    "dateTime":dateTime,
    "ownerId":ownerId,
  };



}