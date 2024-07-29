import 'package:flutter/material.dart';

class ListModel{
  String? Item; //? means null declare
  double? Rating;
  IconData? iconData;

  ListModel({this.Item, this.Rating, this.iconData});
}
List<ListModel> modelList=[
  ListModel(Item: 'Amul Dark Chocolate', Rating: 4, iconData: Icons.shopping_cart_checkout),
  ListModel(Item: 'Amul Milk Chocolate', Rating: 4.2,iconData: Icons.baby_changing_station),
  ListModel(Item: 'Snicker Chocolate', Rating: 3,iconData: Icons.accessibility_new),
  ListModel(Item: 'White Rabbit', Rating: 4.6,iconData: Icons.sanitizer),
  ListModel(Item: 'Dark Waffler Kitkat', Rating: 3,iconData: Icons.verified_user),
  ListModel(Item: 'Rich GOld Kitkat', Rating: 3.5,iconData: Icons.barcode_reader),

];
