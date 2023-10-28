import 'package:flutter/material.dart';
import 'package:screl_interview/model/model_class.dart';
import 'package:screl_interview/view/user_location_map_screen.dart';

class UserDetailedScreen extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;

  UserDetailedScreen({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Detail', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey, // White background color inside the body
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoContainer("Name: $username"),
            _buildInfoContainer("Full Name: $name"),
            _buildInfoContainer("Email: $email"),
            _buildAddressContainer(),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Show the user's location on the map
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserLocationMap(address: address),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Set button background color to green
                  onPrimary: Colors.white, // Set text color to white
                  padding: EdgeInsets.all(16.0), // Add padding to the button
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Adjust the border radius
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on, // Add a location icon
                      color: Colors.white,
                      size: 24.0,
                    ),
                    SizedBox(
                        width: 8.0), // Add spacing between the icon and text
                    Text(
                      "View User Location",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String info) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        info,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _buildAddressContainer() {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "${address.street}, ${address.suite}, ${address.city}, ${address.zipcode}",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
