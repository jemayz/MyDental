import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymedic/screens/appointment_screen.dart';
import 'package:mymedic/screens/details_screen.dart';
import 'package:mymedic/screens/nearby_dentist_screen.dart';

class HomeScreen extends StatelessWidget {
  List symptoms = [
    "Caries",
    "Gingivitis",
    "White Spot Lesion",
    "Tooth Discoloration",
    "Periodontal Pockets",
  ];

  List desc = [
    "Caries are like tiny holes or dark spots on your teeth. They happen when bacteria in your mouth feed on sugar and produce acids that slowly eat away at the tooth’s surface. If not treated, they can get bigger and cause pain or sensitivity.",
    "Gingivitis is when your gums become red, puffy, or bleed easily, especially when you brush or floss. It’s usually a sign that your gums are irritated due to plaque buildup. The good news is, if caught early, it can be reversed with proper cleaning and care.",
    "White spot lesions are white, chalky patches that show up on your teeth. They’re a sign that the outer layer (enamel) is starting to weaken. This often happens when teeth aren’t cleaned properly, or after eating too many sugary or acidic foods.",
    "Tooth discoloration means your teeth might look yellowish, brownish, or even have dark stains. This can be caused by things like drinking coffee or tea, smoking, or not brushing well enough. Sometimes it’s also a sign of early decay or enamel damage.",
    "Periodontal pockets are spaces that form between your teeth and gums when the gums start to pull away. This is often due to gum disease. These pockets can trap food and bacteria, making the problem worse if not treated early",
  ];

  List imgSymp = [
    "assets/symp/symp1.jpg",
    "assets/symp/symp2.jpg",
    "assets/symp/symp3.jpg",
    "assets/symp/symp4.jpg",
    "assets/symp/symp5.jpg",
  ];

  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  List names = [
    "Dr. Syamil Afifi",
    "Dr. Ain Afrina",
    "Dr. Khairis Irfan",
    "Dr. Syarah Irdina",
  ];

  List specialist = [
    "Oral & Maxillofacial Surgeon",
    "Dentist",
    "Orthodontist",
    "Oral Radiologist",
  ];

  List ratings = [
    "4.9",
    "4.5",
    "4.8",
    "4.3",
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi Jemay !",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage("assets/profile/izzmir kerek.jpg"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyDentistScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Color(0xFF266975),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFF68B2A8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Color(0xFF266975),
                            size: 25,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Dentist Visit",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Visit nearby Dentists !",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Color(0xFFCDE0C9),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFF68B2A8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.home_filled,
                            color: Color(0xFF266975),
                            size: 25,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Home Visit",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Call the doctor home",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Identify Your Oral Health Issue",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: symptoms.length,
                itemBuilder: (context, index) {
                  // Properly use itemBuilder
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              category: symptoms[index],
                              description: desc[index],
                              imagePath: imgSymp[index],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        backgroundColor: Color(0xFFCDE0C9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color(0xFF266975),
                            width: 1,
                          ),
                        ),
                        elevation: 3,
                        shadowColor: Color(0xFF266975),
                      ),
                      child: Text(
                        symptoms[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Popular Doctors",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentScreen(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF266975),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("assets/doctor/${imgs[index]}"),
                        ),
                        Text(
                          names[index],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          specialist[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Text(
                              ratings[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
