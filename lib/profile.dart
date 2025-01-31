import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
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
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Returning the layout based on orientation
          return SingleChildScrollView( 
            child: Column(
              children: [
                ProfileSection(),
                SizedBox(height: orientation == Orientation.portrait ? 20 : 10),
                CustomButton(text: 'Post Ad'),
                CustomButton(text: 'View Properties'),
                CustomButton(text: 'My Details'),
                CustomButton(text: 'Inquiries'),
                SizedBox(height: orientation == Orientation.portrait ? 20 : 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 215, 11, 11)),
                  onPressed: () {},
                  child: Text('Sign Out', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: orientation == Orientation.portrait ? 20 : 10),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Profile section top 
class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 20), 
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 61, 77, 39), // Background color
      ),
      child: Column(
        children: [
          Container(
            width: 100, 
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/profilepic.jpg', 
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Welcome Anuda Kithmin",
            style: TextStyle(
              color: Colors.white, 
              fontSize: 20, 
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  CustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 40),
          side: BorderSide(color: const Color.fromARGB(255, 82, 129, 37), width: 2), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, 
          ),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
