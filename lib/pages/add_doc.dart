import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class AddDoc extends StatefulWidget {
  const AddDoc({Key? key}) : super(key: key);

  @override
  State<AddDoc> createState() => _AddDocState();
}

class _AddDocState extends State<AddDoc> {
  final _formkey = GlobalKey<FormState>();
  final date = TextEditingController();
  final type = TextEditingController();
  final dName = TextEditingController();
  final discribe = TextEditingController();

  bool isChecked = false;
  File? file;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);
    });
  }

  Future uploadFile() async {
    final filePath = file!.path;
    final finalFile = File(filePath);

    final metadata = SettableMetadata(contentType: "image/jpeg");

    final storageRef = FirebaseStorage.instance.ref();

    final uploadTask = await storageRef
        .child("images/${basename(file!.path)}")
        .putFile(finalFile, metadata);

    var dowurl = await uploadTask.ref.getDownloadURL();

    final user = FirebaseAuth.instance.currentUser!;
    final user1 = FirebaseFirestore.instance
        .collection('user/${user.uid}/documents')
        .doc();

    final data = {
      'date': date.text,
      'type': type.text,
      'dName': dName.text,
      'discription': discribe.text,
      'visiblity': isChecked,
      'link': dowurl
    };
    await user1.set(data, SetOptions(merge: true));
  }

  Future addDetails() async {
    final user = FirebaseAuth.instance.currentUser!;
    final user1 = FirebaseFirestore.instance
        .collection('user/${user.uid}/documents')
        .doc();

    final data = {
      'date': date.text,
      'type': type.text,
      'doctor_clinic': dName.text,
      'discription': discribe.text,
      'visiblity': isChecked,
      'link': "link"
    };
    await user1.set(data, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : "No file Selected";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'assets/icons/icon.png',
                    height: 45,
                    width: 45,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Add Doc",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 47, 46, 65),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/docPic.png',
                // fit: BoxFit.cover,
                height: 260,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: date,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: type,
                          decoration: const InputDecoration(
                            labelText: 'Type',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: selectFile,
                            icon: const FaIcon(FontAwesomeIcons.file),
                            label: const Text('Open File'),
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 47, 46, 65),
                                fixedSize: const Size(double.infinity, 46)),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(fileName),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: dName,
                          decoration: const InputDecoration(
                            labelText: 'Doctor Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: discribe,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            labelText: 'Discription',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Visiblity',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // addDetails();
                              uploadFile();
                            },
                            icon: const FaIcon(FontAwesomeIcons.bagShopping),
                            label: const Text('Save'),
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 47, 46, 65),
                                fixedSize: const Size(double.infinity, 46)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
