import 'package:flutter/material.dart';
import 'package:gg_mart/Model/list_model.dart';

class ListviewScreen extends StatelessWidget {
  const ListviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView.builder(
      itemCount: modelList.length,
      itemBuilder: (BuildContext context, int index){
      final modelData = modelList[index];
      return ListTile(
        leading: Icon(modelData.iconData),
        title: Text('${modelData.Item}'),
        subtitle: Text('\$ ${modelData.Rating}'),
      );
    },
    ),
    );
  }
}
