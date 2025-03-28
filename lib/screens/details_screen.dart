import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String category;
  final String description;
  final String imagePath;

  const DetailsPage({
    Key? key,
    required this.category,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8ECDE),
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Color(0xFF266975),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 22,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(imagePath),
            ),
            SizedBox(height: 20), // Add spacing between the image and the text
            Text(
              'Symptom: $category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 30),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF266975),
              ),
              child: Text(
                'Go Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
