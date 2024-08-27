import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/resume_builder/Component/build_input_field.dart';

import '../../../Components/snackbar.dart';
import '../../../utils/global.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  int _isselectedindex = 0;
  // bool _Show = true;
  // bool? _isCricket = false;
  // bool? _isOther = false;
  // bool? _isTravelling = false;
  // bool? _isReading = false;
  bool _ison = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Personal Info Page',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
          titleSpacing: 1,
        ),
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _isselectedindex = 0;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: h * 0.06,
                      child: _isselectedindex == 0
                          ? Text(
                              'Details',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            )
                          : Text(
                              'Details',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        border: _isselectedindex == 0
                            ? const Border(
                                bottom: BorderSide(
                                  width: 5,
                                  color: Colors.white,
                                ),
                              )
                            : const Border(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _isselectedindex = 1;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: _isselectedindex == 1
                          ? Text(
                              'Profile Picture',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            )
                          : Text(
                              'Profile Picture',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                      height: h * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        border: _isselectedindex == 1
                            ? const Border(
                                bottom: BorderSide(
                                  width: 5,
                                  color: Colors.white,
                                ),
                              )
                            : const Border(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IndexedStack(
                  index: _isselectedindex,
                  children: [
                    Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(0.05)
                        ..rotateY(-0.05),
                      alignment: FractionalOffset.center,
                      child: Container(
                        height: h,
                        width: w,
                        // padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withOpacity(0.2),
                          //     offset: const Offset(3, 3),
                          //     blurRadius: 10,
                          //     spreadRadius: 2,
                          //   ),
                          //   BoxShadow(
                          //     color: Colors.white.withOpacity(0.7),
                          //     offset: const Offset(-3, -3),
                          //     blurRadius: 10,
                          //     spreadRadius: 2,
                          //   ),
                          // ],
                        ),
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.circular(12),
                                  //     boxShadow: [
                                  //       BoxShadow(
                                  //         color: Colors.grey.withOpacity(0.5),
                                  //         spreadRadius: 1,
                                  //         blurRadius: 10,
                                  //         offset:
                                  //             Offset(-3, -3), // changes position of shadow
                                  //       ),
                                  //       BoxShadow(
                                  //         color: Colors.black.withOpacity(0.2),
                                  //         spreadRadius: 1,
                                  //         blurRadius: 10,
                                  //         offset: Offset(3, 3), // changes position of shadow
                                  //       ),
                                  //     ],
                                  //   ),
                                  //   child: TextFormField(
                                  //     decoration: InputDecoration(
                                  //       hintText: 'Enter your text here',
                                  //       border: InputBorder.none,
                                  //       contentPadding: EdgeInsets.symmetric(
                                  //           horizontal: 16, vertical: 12),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Text(
                                  //   textAlign: TextAlign.start,
                                  //   'Name',
                                  // ),
                                  // Image.network(
                                  //   'assets/Input_text.png',
                                  //   width: size.width,
                                  //   // height: 50,
                                  // ),
                                  // Wrap each TextFormField in a Transform and Container for 3D effect
                                  buildInputField(
                                    'Name',
                                    Icons.person_2_rounded,
                                    'Eg., Aayushi',
                                    (val) => Globals.globals.name = val,
                                    (val) => val!.isEmpty
                                        ? 'Must Enter Your Name'
                                        : null,
                                    initialValue: Globals.globals.name,
                                    keyboardType: TextInputType.name,
                                  ),
                                  buildInputField(
                                    'Email',
                                    Icons.email_rounded,
                                    'aayushi@gmail.com',
                                    (val) => Globals.globals.email = val,
                                    (val) => val!.isEmpty
                                        ? 'Must Enter Your Email'
                                        : RegExp(r'''[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?''')
                                                .hasMatch(val)
                                            ? null
                                            : 'Invalid Email',
                                    initialValue: Globals.globals.email,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  buildInputField(
                                    'Address',
                                    Icons.share_location_rounded,
                                    'Address',
                                    (val) => Globals.globals.address = val,
                                    (val) => val!.isEmpty
                                        ? 'Must Enter Your Address'
                                        : null,
                                    initialValue: Globals.globals.address,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                  ),
                                  buildInputField(
                                    'Contact',
                                    Icons.phone_android_rounded,
                                    '65655892245',
                                    (val) => Globals.globals.contact = val,
                                    (val) => val!.isEmpty
                                        ? 'Must Enter Your Contact'
                                        : val.length < 10
                                            ? 'Contact Must be Enter 10 Digits'
                                            : null,
                                    initialValue: Globals.globals.contact,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 10,
                                  ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Gender',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Switch(
                                        value: _ison,
                                        onChanged: (val) => setState(
                                          () => _ison = !_ison,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Visibility(
                                    visible: _ison,
                                    child: Column(
                                      children: [
                                        RadioListTile(
                                          title: const Text('Male'),
                                          value: 'male',
                                          groupValue: Globals.globals.gender,
                                          onChanged: (value) {
                                            Globals.globals.gender = value;
                                            setState(() {});
                                          },
                                        ),
                                        RadioListTile(
                                          title: const Text('Female'),
                                          value: 'female',
                                          groupValue: Globals.globals.gender,
                                          onChanged: (value) {
                                            Globals.globals.gender = value;
                                            setState(() {});
                                          },
                                        ),
                                        RadioListTile(
                                          title: const Text('Other'),
                                          value: 'other',
                                          groupValue: Globals.globals.gender,
                                          onChanged: (value) {
                                            Globals.globals.gender = value;
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          bool validated =
                                              formKey.currentState!.validate();
                                          if (validated) {
                                            formKey.currentState!.save();
                                          }
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            MySnackbar(
                                              content: validated
                                                  ? 'Form Saved!!'
                                                  : 'Failed to Validate Form!!',
                                              color: validated
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          );
                                        },
                                        child: const Text('Save'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          formKey.currentState!.reset();
                                          Globals.globals.reset();
                                          setState(() {});
                                        },
                                        child: const Text(
                                          'Reset',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(-0.05)
                        ..rotateY(0.05),
                      alignment: FractionalOffset.center,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        height: h * 0.35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(-3, -3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.7),
                              offset: const Offset(3, 3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: h * 0.04,
                            ),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: h * 0.05,
                                  backgroundColor: Colors.grey,
                                  foregroundImage: Globals.globals.image != null
                                      ? FileImage(Globals.globals.image!)
                                      : null,
                                ),
                                FloatingActionButton.small(
                                  onPressed: () async {
                                    ImagePicker picker = ImagePicker();

                                    XFile? file = await picker.pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (file != null) {
                                      Globals.globals.image = File(file.path);
                                      setState(() {});
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  hoverColor: Colors.blue,
                                  splashColor: Colors.green,
                                  child: const Icon(Icons.add_a_photo_outlined),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h * 0.05,
                            ),
                            Text(
                              "Let's Add Your Profile Picture in Your Resume Profile",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildInputField(
  //   String label,
  //   IconData icon,
  //   String hint,
  //   Function(String?) onSave,
  //   String? Function(String?) validator, {
  //   TextInputType keyboardType = TextInputType.text,
  //   int maxLength = 0,
  //   String? initialValue,
  //   int maxLines = 1,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 10.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           label,
  //           style: const TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(height: 5),
  //         Transform(
  //           transform: Matrix4.identity()
  //             ..setEntry(3, 2, 0.001)
  //             ..rotateX(0.05)
  //             ..rotateY(0.05),
  //           alignment: FractionalOffset.center,
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10),
  //               gradient: LinearGradient(
  //                 colors: [
  //                   Colors.teal.shade50, // Start color
  //                   Colors.teal.shade100, // End color
  //                 ],
  //                 begin: Alignment.topLeft,
  //                 end: Alignment.bottomRight,
  //               ),
  //               // Optional: You can keep the boxShadow or remove it if it doesn't match well with the gradient.
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black.withOpacity(0.1),
  //                   offset: Offset(3, 3),
  //                   blurRadius: 5,
  //                   spreadRadius: 2,
  //                 ),
  //                 BoxShadow(
  //                   color: Colors.white.withOpacity(0.7),
  //                   offset: Offset(-3, -3),
  //                   blurRadius: 10,
  //                   spreadRadius: 1,
  //                 ),
  //               ],
  //             ),
  //             child: TextFormField(
  //               onSaved: onSave,
  //               validator: validator,
  //               initialValue: initialValue,
  //               keyboardType: keyboardType,
  //               maxLength: maxLength > 0 ? maxLength : null,
  //               maxLines: maxLines,
  //               decoration: InputDecoration(
  //                 hintText: hint,
  //                 hintStyle: const TextStyle(
  //                   fontSize: 12,
  //                 ),
  //                 prefixIcon: Icon(icon, color: Colors.teal),
  //                 border: const OutlineInputBorder(
  //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //                   borderSide: BorderSide.none,
  //                 ),
  //                 filled: true,
  //                 fillColor: Colors
  //                     .transparent, // Set to transparent to show the gradient
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
