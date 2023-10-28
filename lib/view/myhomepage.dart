import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:screl_interview/controller/user_data_api_fetch_provider.dart';
import 'package:screl_interview/model/model_class.dart';
import 'package:screl_interview/view/widgets/user_detailed_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataFetchProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List Of Users',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade800, // Change the background color
        elevation: 4, // Add elevation for a shadow effect
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Gap(20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.all(12.0), // Add padding inside the TextField
                filled: true,
                fillColor: Colors.white, // Background color of the TextField
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Add rounded corners
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors
                          .grey), // Border color when the TextField is not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors
                          .blue), // Border color when the TextField is focused
                ),
              ),
              // You can add more configuration options for the TextField
            ),
            const Gap(20),
            FutureBuilder<void>(
              future: userDataProvider.fetchDataFromAPIOnce(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ));
                } else {
                  if (userDataProvider.userData.isEmpty) {
                    return Center(
                        child: Text('No products available.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: userDataProvider.userData.length,
                      itemBuilder: (context, index) {
                        Temperatures userData =
                            userDataProvider.userData[index];
                        return Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UserDetailedScreen(
                                    id: userData.id,
                                    name: userData.name,
                                    username: userData.username,
                                    email: userData.email,
                                    address: userData.address,
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                userData.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1, // Limit text to a single line
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  Text(
                                    'Email: ${userData.email}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                    ),
                                    maxLines: 1, // Limit text to a single line
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Street: ${userData.address.street}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                    ),
                                    maxLines: 1, // Limit text to a single line
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  // Add more details here as needed
                                ],
                              ),
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ]),
        ),
      ),
      //   backgroundColor: Colors.amber,
    );
  }
}
