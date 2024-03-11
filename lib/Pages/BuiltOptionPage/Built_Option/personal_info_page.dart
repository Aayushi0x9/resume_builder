import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Components/snackbar.dart';
import '../../../utils/global.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  int _isselectedindex = 0;
  bool _Show = true;
  bool? _isCricket = false;
  bool? _isOther = false;
  bool? _isTravelling = false;
  bool? _isReading = false;

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
        backgroundColor: Colors.grey.shade200,
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
                    Container(
                      height: h * 0.7,
                      width: w * 0.9,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              //name
                              TextFormField(
                                onSaved: (val) {
                                  Globals.globals.name = val;
                                },
                                validator: (val) => val!.isEmpty
                                    ? 'Must Enter Your Name'
                                    : null,
                                initialValue: Globals.globals.name,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: 'Eg., Aayushi',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  label: Text('Name'),
                                  prefixIcon: Icon(Icons.person_2_rounded),
                                ),
                              ),
                              //email
                              TextFormField(
                                onSaved: (val) {
                                  Globals.globals.email = val;
                                },
                                validator: (val) => val!.isEmpty
                                    ? 'Must Enter Your Email'
                                    : RegExp(r'''[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?''')
                                            .hasMatch(val)
                                        ? null
                                        : 'Invalid Email',
                                initialValue: Globals.globals.email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'aayushi@gmail.com',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  label: Text('email'),
                                  prefixIcon: Icon(Icons.email_rounded),
                                ),
                              ),
                              //password
                              TextFormField(
                                onSaved: (val) {
                                  Globals.globals.password = val;
                                },
                                validator: (val) => val!.isEmpty
                                    ? 'Must Enter Your Password'
                                    : null,
                                initialValue: Globals.globals.password,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _Show,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    fontSize: 12,
                                  ),
                                  label: const Text('Password'),
                                  prefixIcon:
                                      const Icon(Icons.password_rounded),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _Show = !_Show;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      _Show
                                          ? Icons.visibility_rounded
                                          : Icons.visibility_off_rounded,
                                    ),
                                  ),
                                ),
                              ),

                              //contact
                              TextFormField(
                                onSaved: (val) {
                                  Globals.globals.address = val;
                                },
                                validator: (val) => val!.isEmpty
                                    ? 'Must Enter Your Address'
                                    : null,
                                initialValue: Globals.globals.address,
                                textInputAction: TextInputAction.newline,
                                decoration: const InputDecoration(
                                  hintText: 'Address',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  label: Text('Address'),
                                  hintMaxLines: 3,
                                  prefixIcon:
                                      Icon(Icons.share_location_rounded),
                                ),
                              ),
                              TextFormField(
                                onSaved: (val) {
                                  Globals.globals.contact = val;
                                },
                                validator: (val) => val!.isEmpty
                                    ? 'Must Enter Your Contact'
                                    : val.length < 10
                                        ? 'Contact Must be Enter 10 Digits'
                                        : null,
                                initialValue: Globals.globals.contact,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  hintText: '65655892245',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  label: Text('Contact'),
                                  prefixIcon: Icon(Icons.phone_android_rounded),
                                ),
                              ),

                              Row(
                                children: [
                                  const Text(
                                    'Hobby : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //Cricket
                                  // Checkbox(
                                  //   value: _isCricket,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       _isCricket = value;
                                  //     });
                                  //   },
                                  // ),
                                  // const Text("Cricket"),
                                  //Reading
                                  Checkbox(
                                    value: _isReading,
                                    onChanged: (value) {
                                      setState(() {
                                        _isReading = value;
                                      });
                                    },
                                  ),
                                  const Text("Reading"),

                                  //Travelling
                                  Checkbox(
                                    value: _isTravelling,
                                    onChanged: (value) {
                                      setState(() {
                                        _isTravelling = value;
                                      });
                                    },
                                  ),
                                  const Text("Travelling"),
                                  Checkbox(
                                    value: _isOther,
                                    onChanged: (value) {
                                      setState(() {
                                        _isOther = value;
                                      });
                                    },
                                  ),
                                  const Text("Other"),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.02,
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
                              Text('${Globals.globals.name}'),
                              Text('${Globals.globals.address}'),
                              Text('${Globals.globals.contact}'),
                              Text('${Globals.globals.password}'),
                              Text('${Globals.globals.contact}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                              offset: Offset(3, 3),
                              blurRadius: 3,
                            )
                          ]),
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
                              ),
                              FloatingActionButton.small(
                                onPressed: () async {
                                  ImagePicker picker = ImagePicker();

                                  XFile? file = await picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  // if (file != null) {
                                  //   Globals.globals.image = File(file.path);
                                  //   setState(() {});
                                  // }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hoverColor: Colors.blue,
                                splashColor: Colors.green,
                                child: Icon(Icons.add_a_photo_outlined),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          Text(
                            "Let's Add your Add Your Profile Picture in Your Resume Profile",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
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
}
