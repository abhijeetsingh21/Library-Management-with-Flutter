// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class BbaScreen extends StatefulWidget {
  static const String id = 'BbaScreen';

  @override
  State<BbaScreen> createState() => _BbaScreenState();
}

class _BbaScreenState extends State<BbaScreen> {
  PlatformFile? pickedFile;
  UploadTask? _uploadTask;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    _uploadTask = ref.putFile(file);

    final snapshot = await _uploadTask!.whenComplete(() => {null});
    final urlDownload = await snapshot.ref.getDownloadURL();

    if (urlDownload != null) {
      // await _firestore.collection('downloadUrl').add({'url': urlDownload});
      await _firestore
          .collection('name')
          .add({'name': pickedFile!.name, 'url': urlDownload});
    }
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      pickedFile = result?.files.first;
    });
  }

  Future<void> downloadFile() async {
    final path = 'files/${pickedFile!.name}';
    final _ref = FirebaseStorage.instance.ref().child(path);

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final File tempFile = File(appDocPath + '/' + path);
    try {
      await _ref.writeToFile(tempFile);
      await tempFile.create();
      // await OpenFile?.open(tempFile.path);
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          content: Text(
            e.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            'error',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFCADCED),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            selectFile();
          },
        ),
        appBar: AppBar(
          title: const Text('BBA'),
        ),
        body: Column(
          children: [
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('name').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('downloadLink'),
                                content: Linkify(
                                  onOpen: _onOpen,
                                  // (link) {
                                  // ("Linkify link = ${link.url}");
                                  // },
                                  text: snapshot.data!.docs[index]['url'],
                                  style: TextStyle(color: Colors.blue),
                                  linkStyle: TextStyle(color: Colors.green),
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey),
                                height: MediaQuery.of(context).size.height * .1,
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child:
                                      Text(snapshot.data!.docs[index]['name']),
                                ))),
                          ),
                        );
                      },
                    );
                  }),
            ),
            Align(
              alignment: FractionalOffset.bottomLeft,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: GestureDetector(
                      child: Container(
                        width: 90.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Center(
                            child: Icon(
                          Icons.upload,
                          color: Colors.white,
                        )),
                      ),
                      onTap: () => uploadFile(),
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: GestureDetector(
                      child: Container(
                        width: 90.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: const Center(
                            child: Text(
                          'Chat',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      onTap: () => Navigator.pushNamed(context, 'BbaChatScreen'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
