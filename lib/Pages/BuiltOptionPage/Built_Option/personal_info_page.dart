import 'package:flutter/material.dart';

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
  String? name;
  String? email;
  String? psw;
  String? adr;
  int? cont;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Personal Info Page'),
        centerTitle: true,
        backgroundColor: Colors.teal.withOpacity(0.7),
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
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        : Text('Details'),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.8),
                      border: _isselectedindex == 0
                          ? Border(
                              bottom: BorderSide(
                                width: 7,
                                color: Colors.teal.withOpacity(0.8),
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
                              fontSize: 18,
                            ),
                          )
                        : Text('Profile Picture'),
                    height: h * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.8),
                      border: _isselectedindex == 1
                          ? Border(
                              bottom: BorderSide(
                                width: 7,
                                color: Colors.teal.withOpacity(0.8),
                              ),
                            )
                          : const Border(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //contact
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
                              onSaved: (val) {},
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
                              onSaved: (val) {},
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
                              onSaved: (val) {},
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _Show,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                label: const Text('Password'),
                                prefixIcon: const Icon(Icons.password_rounded),
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
                              onSaved: (val) {},
                              textInputAction: TextInputAction.newline,
                              decoration: const InputDecoration(
                                hintText: 'Address',
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),
                                label: Text('Address'),
                                hintMaxLines: 3,
                                prefixIcon: Icon(Icons.share_location_rounded),
                              ),
                            ),
                            TextFormField(
                              onSaved: (val) {},
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    formKey.currentState!.save();
                                  },
                                  child: const Text('Save'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    formKey.currentState!.reset();
                                  },
                                  child: const Text(
                                    'Reset',
                                  ),
                                ),
                              ],
                            ),
                            Text('Name: $name'),
                            Text('Name: $email'),
                            Text('Name: $psw'),
                            Text('Name: $adr'),
                            Text('Name: $cont'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    height: h * 0.5,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.08,
                        ),
                        CircleAvatar(
                          radius: h * 0.05,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(
                          height: h * 0.08,
                        ),
                        Text(
                          "Let's Add your Add Your Profile Picture in Your Resume Profile",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20,
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
    );
  }
}
