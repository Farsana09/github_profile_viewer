import 'package:flutter/material.dart';
import 'package:task_project/api_integration/repo/userdata.dart';
import 'package:task_project/model/user_model.dart';

class ApiViewModel extends ChangeNotifier{
  late ApiServices apiServices = ApiServices();

List <UserData> data = [];
fetchUserData() async{
  try{
    final response = await  apiServices.fetchUserData();
    if(response != null){
      data = response;
      notifyListeners();
    }
  } catch (e){
    throw('Exception $e');
  }
}

}