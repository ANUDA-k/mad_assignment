import 'package:flutter/material.dart';

class PostAdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 147, 147),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Text(
          "Real Estate",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Yellow Label - Full width
              Container(
                width: double.infinity,  // Full width
                color: const Color.fromARGB(255, 143, 96, 16),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Please fill in all the details carefully before submitting your ad.",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.0),

              // FORM INSIDE A CARD WITH PADDING
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0), 
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Form Title
                        Text("Create a New Ad", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 16.0),

                        // Title Field
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Ad Title",
                            hintText: "Enter the title of your property ad",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.title),
                          ),
                        ),
                        SizedBox(height: 12.0),

                        // Description Field
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: "Description",
                            hintText: "Provide details about your property",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.description),
                          ),
                        ),
                        SizedBox(height: 12.0),

                        // Price Field
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Price (LKR)",
                            hintText: "Enter the price of the property",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.money),
                          ),
                        ),
                        SizedBox(height: 12.0),

                        // Location Field
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Location",
                            hintText: "Enter the property location",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.location_on),
                          ),
                        ),
                        SizedBox(height: 12.0),

                        // Category Dropdown
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Category",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.category),
                          ),
                          items: [
                            DropdownMenuItem(value: "House", child: Text("House")),
                            DropdownMenuItem(value: "Apartment", child: Text("Apartment")),
                            DropdownMenuItem(value: "Villa", child: Text("Villa")),
                            DropdownMenuItem(value: "Land", child: Text("Land")),
                          ],
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 12.0),

                        // Image Upload Placeholder
                        GestureDetector(
                          onTap: () {
                            print("Upload Image");
                          },
                          child: Container(
                            height: screenHeight * 0.3, // Adjusting height based on screen size
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                                  SizedBox(height: 8.0),
                                  Text("Upload Property Images", style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),

                        // Submit Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => NextPage(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    var begin = Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.easeInOut;
                                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                    var offsetAnimation = animation.drive(tween);
                                    return SlideTransition(position: offsetAnimation, child: child);
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Submit Ad", style: TextStyle(fontSize: 18)),
                                SizedBox(width: 10),
                                Icon(Icons.send),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy Next Page
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page"), backgroundColor: Colors.green),
      body: Center(
        child: Text("Ad Submitted Successfully!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
