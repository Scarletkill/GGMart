import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController{
  var counter = 0.obs;//observable

  increment(){
    counter++;
    print('The counter Increased is $counter');
  }

  decrement(){
    counter--;
    print('The counter Decreased is $counter');
  }
}


