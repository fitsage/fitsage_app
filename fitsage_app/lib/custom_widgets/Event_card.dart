import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EventCard extends StatefulWidget {
  final bool isPast;
  final String child1;
  final String child2;

  EventCard({
    Key? key,
    required this.isPast,
    required this.child1,
    required this.child2,
  }) : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  File? _image;
  final picker = ImagePicker();

  _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: 318,
      height: 84,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.child1,
                style: const TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                widget.child2,
                style: const TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              _showImageSourceDialog(context);
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F3F2),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: _image == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Camera.png',
                          width: (20 / 393) * screenWidth,
                          height: (17.6 / 852) * screenHeight,
                        ),
                      ],
                    )
                  : Image.file(_image!, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  Future<void> _showImageSourceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _getImageFromGallery();
                Navigator.pop(context);
              },
              child: Text("Gallery"),
            ),
            TextButton(
              onPressed: () {
                _getImageFromCamera();
                Navigator.pop(context);
              },
              child: Text("Camera"),
            ),
          ],
        );
      },
    );
  }
}
