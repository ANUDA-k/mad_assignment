import 'package:flutter/material.dart';

class PropertyProfilePage extends StatelessWidget {
  final Map<String, dynamic> property;

  PropertyProfilePage({required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property['title']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0), 
                child: Image.asset(
                  property['image'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
              SizedBox(height: 16),
              Text(
                property['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(property['agent'], style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text(
                property['price'],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 16),
              Text(
                property['description'],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.king_bed, size: 24, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('${property['bedrooms']} bedrooms'),
                  SizedBox(width: 16),
                  Icon(Icons.bathtub, size: 24, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('${property['bathrooms']} bathrooms'),
                ],
              ), 
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text('Contact Agent'),
              ),
              SizedBox(height: 32), // Spacer to separate from the image
              // Bottom full-width image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0), // Optional rounded corners
                child: Image.asset(
                  'assets/map.jpg', 
                  fit: BoxFit.cover,
                  width: double.infinity, // Full screen width
                  height: 250, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
