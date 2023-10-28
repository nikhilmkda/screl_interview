import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:screl_interview/model/model_class.dart';

class UserDataFetchProvider with ChangeNotifier {
  List<Temperatures> userData = [];
  bool isLoading = false;

  Future<List<Temperatures>> fetchDataFromAPIOnce() async {
    if (userData.isEmpty) {
      await fetchDataFromAPI();
    }
    return userData;
  }

 Future<void> fetchDataFromAPI() async {
  isLoading = true; // Set isLoading to true when fetching data
  try {
    print('fetching data...');
    final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('fetch successful');
      List jsonData = json.decode(response.body);

      // Limit the number of users to 10
      if (jsonData.length > 10) {
        jsonData = jsonData.sublist(0, 10);
      }

      userData = jsonData.map((data) {
        return Temperatures(
          id: data['id'],
          name: data['name'],
          username: data['username'],
          email: data['email'],
          address: Address(
            street: data['address']['street'],
            suite: data['address']['suite'],
            city: data['address']['city'],
            zipcode: data['address']['zipcode'],
            geo: Geo(
              lat: data['address']['geo']['lat'],
              lng: data['address']['geo']['lng'],
            ),
          ),
          phone: data['phone'],
          website: data['website'],
          company: Company(
            name: data['company']['name'],
            catchPhrase: data['company']['catchPhrase'],
            bs: data['company']['bs'],
          ),
        );
      }).toList();
      print(userData);
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      print('Error: ${response.statusCode}');
      print('Response: ${response.body}');
      throw Exception('Failed to load data from the API');
    }
  } catch (error) {
    print('An error occurred: $error');
    isLoading = false;
    // You can handle the error as needed, e.g., show an error message to the user.
  }
}

}
