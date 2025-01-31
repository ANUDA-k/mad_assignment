import 'package:flutter/material.dart';
import 'package:mad_assignment/exprofile.dart';

class ExplorePage extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [
    {
      'title': 'Seaside Road, Burnmouth - Garden',
      'agent': 'By Kate',
      'price': 'LKR425,000,000',
      'bedrooms': 5,
      'bathrooms': 2,
      'image': 'assets/ex1.jpg',
      'description': 'A beautiful property with a garden in Brighton.'
    },
    {
      'title': 'Nuwara Eliya - Cottage by the Hills',
      'agent': 'By Country Homes',
      'price': 'LKR180,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/ex2.jpg',
      'description': 'A charming cottage with breathtaking views of tea plantations.'
    },
    {
      'title': 'Kandy - Lake view Bungalow',
      'agent': 'By Central Property Developers',
      'price': 'LKR 90,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/ex3.jpg',
      'description': 'A peaceful bungalow overlooking the scenic Kandy Lake.'
    },
    {
      'title': 'Negambo - Modern Seaside House',
      'agent': 'By Coastal Realty',
      'price': 'LKR 130,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/ex4.jpg',
      'description': 'A contemorary house just minutes from the beach in Negambo.'
    },
    {
      'title': 'Mirissa - Oceanfront Villa',
      'agent': 'By Seaside Realty',
      'price': 'LKR 200,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/ex5.jpg',
      'description': 'A stunning oceanfront villa with an infinity pool in Mirissa.'
    },
    {
      'title': 'Dambulla - Luxury Estate',
      'agent': 'By Nature Retreats',
      'price': 'LKR 150,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/ex6.jpg',
      'description': 'A sprawling estate near the Sigigrya rock fortress.'
    },

    {
      'title': 'Haputale - Mountain View Home',
      'agent': 'By Highlands Realty',
      'price': 'LKR 88,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/ex7.jpg',
      'description': 'A peaceful home with panoramic mountain view in Haputale.'
    },
    {
      'title': 'Battaramulla - Modern Family House',
      'agent': 'By Urban Homes',
      'price': 'LKR 65,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/ex8.jpg',
      'description': 'A spacious home in a prime residential area of Colombo.'
    },
    {
      'title': 'Trincomalee - Beachfront Paradise',
      'agent': 'By Tropical Realty',
      'price': 'LKR 220,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/ex9.jpg',
      'description': 'A luxurious beachfront villa with direct access to pristine white sand beaches in Trincomalee.'
    },
    {
      'title': 'Anuradhapura - Heritage Bungalow',
      'agent': 'By Ancient Homes',
      'price': 'LKR 110,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/home7.png',
      'description': 'A beautifully restored heritage bungalow surrounded by lush green, near tha ancient ruins of anuradhapura.'
    },
    {
      'title': 'Jaffna - Modern city Residence',
      'agent': 'By Northern Star Properties',
      'price': 'LKR 80,000,000',
      'bedrooms': 2,
      'bathrooms': 1,
      'image': 'assets/home5.png',
      'description': 'A contemporary city house in the heart of Jaffna, perfect for a growing family or an investment opportunity.'
    },
 
  ];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
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
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                HeaderSection(),
                orientation == Orientation.portrait
                    ? _buildListView(context)
                    : _buildGridView(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return GestureDetector(
         onTap: () {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return PropertyProfilePage(property: properties[index]);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from the right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
},
          child: Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Container(
              height: screenWidth < 360 ? 80 : 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: properties[index]['image'] != null
                          ? Image.asset(
                              properties[index]['image'],
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.image_not_supported,
                                    size: 80, color: Colors.grey);
                              },
                            )
                          : Icon(Icons.image_not_supported,
                              size: 80, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            properties[index]['title'],
                            style: TextStyle(
                                fontSize: screenWidth < 360 ? 10 : 12,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(properties[index]['agent'],
                              style: TextStyle(fontSize: 10)),
                          SizedBox(height: 4),
                          Text(properties[index]['price'],
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.king_bed,
                                  size: 12, color: Colors.grey),
                              SizedBox(width: 4),
                              Text('${properties[index]['bedrooms']}',
                                  style: TextStyle(fontSize: 10)),
                              SizedBox(width: 16),
                              Icon(Icons.bathtub,
                                  size: 12, color: Colors.grey),
                              SizedBox(width: 4),
                              Text('${properties[index]['bathrooms']}',
                                  style: TextStyle(fontSize: 10)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridView(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth < 600 ? 1 : 2,
        childAspectRatio: screenWidth < 600 ? 3 / 2 : 4 / 3,
      ),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return PropertyProfilePage(property: properties[index]);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from the right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
},
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: properties[index]['image'] != null
                        ? Image.asset(
                            properties[index]['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                  child: Icon(Icons.image_not_supported,
                                      size: 40, color: Colors.grey));
                            },
                          )
                        : Center(
                            child: Icon(Icons.image_not_supported,
                                size: 40, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        properties[index]['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Text(properties[index]['price'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.green)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final headerHeight = isLandscape
        ? MediaQuery.of(context).size.height * 0.4
        : 300.0;

    return Container(
      height: headerHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            "assets/home2.jpg",
            width: double.infinity,
            height: headerHeight,
            fit: BoxFit.cover,
          ),
          Container(
            height: headerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Find your dream property",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "From 20000+ properties on Sri Lanka's no.1\nproperty portal",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}