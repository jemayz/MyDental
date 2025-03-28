import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DiagnosisScreen extends StatefulWidget {
  @override
  _DiagnosisScreen createState() => _DiagnosisScreen();
}

class _DiagnosisScreen extends State<DiagnosisScreen> {
  File? _image;
  String diagnosis = '';
  bool isLoading = false;

  // Function to pick image
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _sendToGeminiAPI(_image!);
    }
  }

  // Function to send image to API
  Future<void> _sendToGeminiAPI(File imageFile) async {
    setState(() {
      isLoading = true;
      diagnosis = '';
    });

    final bytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(bytes);

    final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=AIzaSyBK5GfKUeDNNPL_2ZlG1-KvR_OMj4zHr4Y");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                    "You are an AI Dental Doctor. Analyze the dental image and provide diagnosis and suggestions to overcome the issue."
              },
              {
                "inlineData": {"mimeType": "image/jpeg", "data": base64Image}
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        diagnosis = data['candidates'][0]['content']['parts'][0]['text'];
        isLoading = false;
      });
    } else {
      setState(() {
        diagnosis = "Error: ${response.body}";
        isLoading = false;
      });
    }
  }

  // Function to parse bold text
  RichText parseDiagnosisText(String text) {
    final boldRegex = RegExp(r'\*\*(.*?)\*\*');
    final spans = <TextSpan>[];

    int currentIndex = 0;

    for (final match in boldRegex.allMatches(text)) {
      if (match.start > currentIndex) {
        spans.add(TextSpan(
          text: text.substring(currentIndex, match.start),
          style: TextStyle(fontSize: 15, color: Color(0xFF266975)),
        ));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFF266975),
        ),
      ));
      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentIndex),
        style: TextStyle(fontSize: 15, color: Color(0xFF266975)),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDE0C9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'AI-Powered Diagnosis',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF266975),
                ),
              ),
              SizedBox(height: 20),
              _image != null
                  ? Image.file(_image!, height: 200)
                  : Text('No image selected.'),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                icon: Icon(Icons.camera, color: Color(0xFF266975)),
                label: Text('Take Picture',
                    style: TextStyle(color: Color(0xFF266975))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xFF266975)),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.gallery),
                icon: Icon(Icons.image, color: Color(0xFF266975)),
                label: Text('Choose from Gallery',
                    style: TextStyle(color: Color(0xFF266975))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xFF266975)),
                ),
              ),
              SizedBox(height: 16),
              isLoading
                  ? Center(
                      child:
                          CircularProgressIndicator(color: Color(0xFF266975)))
                  : diagnosis.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Color(0xFF266975)),
                            Text(
                              "Diagnosis Result:",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF266975)),
                            ),
                            SizedBox(height: 8),
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Color(0xFF266975))),
                              color: Color.fromARGB(255, 218, 238, 214),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: parseDiagnosisText(diagnosis),
                              ),
                            ),
                          ],
                        )
                      : Container(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
