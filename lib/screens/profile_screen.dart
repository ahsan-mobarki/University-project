import 'package:flutter/material.dart';
import 'package:image_picker/Image_picker.dart';
import 'memories_screen.dart';
import 'visited_places_screen.dart';
import 'settings_screen.dart';
import 'dart:io';


class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List _accounts = [];
  final String _text = 'Ahsan';
  bool _hidePassword = true;
  bool _isEnabled = false;
  File? _profileImage;

  @override
  void initState(){
    super.initState();

    _controller1.text = _text;
  }

  @override
  void dispose(){
    super.dispose();

    _controller1.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);

    if(image != null){
      setState((){
        _profileImage = File(image.path);
      });
    }
  }

  void imagePickOptions(){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.photo, color: Colors.grey, size: 50),
                      Text(
                        'Gallery',
                        style: TextStyle(
                          fontSize: 20
                        )
                      )
                    ]
                  )
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.camera, color: Colors.grey, size: 50),
                      Text(
                        'Camera',
                        style: TextStyle(
                          fontSize: 20,
                        )
                      )
                    ]
                  )
                )
              )
            ]
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffdfe3ff),
              Color(0xffdfe3ff),
              Color(0xffe3ffff),
            ]
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: _profileImage != null
                          ? (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileImage(
                                  imageFile: _profileImage!,
                                  onEdit: imagePickOptions,
                                )
                              )
                            );
                          }
                          : null,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : const AssetImage('images/person.png')
                        )
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.white30
                            )
                          ),
                          icon: const Icon(Icons.camera_alt),
                          onPressed: imagePickOptions,
                        )
                      )
                    ]
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextField(
                          controller: _controller1,
                          enabled: _isEnabled,
                          readOnly: !_isEnabled,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              fontSize: 35,
                              color: Colors.grey[400]
                            )
                          ),
                          onSubmitted: (value){
                            setState((){
                              _controller1.text = value;
                              _isEnabled = false;
                            });
                          }
                        )
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            _isEnabled
                            ? Icons.check
                            : Icons.edit,
                          ),
                          onPressed: (){
                            setState((){
                              _isEnabled = !_isEnabled;
                            });
                          }
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      leading: const Icon(Icons.supervisor_account),
                      title: const Text(
                        'Accounts',
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_down),
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Current Account',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                              )
                            ]
                          )
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : const AssetImage('images/person.png'),
                          ),
                          title: Text(
                            _controller1.text,
                          ),
                          subtitle: const Text('abc@gmail.com'),
                        ),
                        const Divider(indent: 8, endIndent: 8),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Others',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const SizedBox(
                                  child: Column(
                                    children: [
                                      Icon(Icons.switch_account),
                                      Text('Switch Account'),
                                    ]
                                  )
                                )
                              )
                            ]
                          )
                        ),
                        const Divider(indent: 8, endIndent: 8),
                        Container(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _accounts.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_accounts[index]),
                              );
                            }
                          )
                        ),
                        ListTile(
                          leading: const Icon(Icons.add, size: 25),
                          title: const Text(
                            'Add Another Account',
                            style: TextStyle(
                              fontSize: 16
                            )
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  title: const Text(
                                    'Add Account',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                  content: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Form(
                                        key: _loginFormKey,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            TextFormField(
                                              keyboardType: TextInputType.emailAddress,
                                              controller: _emailController,
                                              decoration: InputDecoration(
                                                fillColor: Colors.transparent,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                prefixIcon: const Icon(Icons.mail_outline),
                                                label: const Text(
                                                  'Email ID',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                hintText: 'example@abc.com',
                                                hintStyle: const TextStyle(color: Colors.grey),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Enter Your Email';
                                                }
                                                bool emailValidation = RegExp(
                                                    r"^[A-Za-z0-9.A-Za-z0-9!#$%&'*+-/=?^_`{|}~]+@[A-Za-z]+.[A-Za-z]+")
                                                    .hasMatch(value);
                                                if (!emailValidation) {
                                                  return 'Invalid Email';
                                                }
                                                return null;
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            TextFormField(
                                              keyboardType: TextInputType.emailAddress,
                                              controller: _passwordController,
                                              obscureText: _hidePassword,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                prefixIcon: const Icon(Icons.lock_outline),
                                                label: const Text(
                                                  'Password',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                hintText: 'Password_1',
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _hidePassword = !_hidePassword;
                                                    });
                                                  },
                                                  child: Icon(
                                                    _hidePassword
                                                        ? Icons.visibility_outlined
                                                        : Icons.visibility_off_outlined,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Enter Password';
                                                } else if (value.length < 6) {
                                                  return 'Password should at least 6 characters';
                                                }
                                                return null;
                                              },
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  child: const Text(
                                                    'Forgot Password!',
                                                    style: TextStyle(
                                                      fontFamily: 'courier',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                    )
                                                  ),
                                                  onPressed: () {},
                                                )
                                              ]
                                            ),
                                          ]
                                        )
                                      )
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_loginFormKey.currentState!.validate()) {
                                          setState(() {
                                            _accounts.add(_emailController.text);
                                          });
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: const Text('Add'),
                                    )
                                  ]
                                );
                              }
                            );
                          }
                        )
                      ]
                    )
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'My Memories',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )
                      ),
                    ]
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: const Icon(Icons.photo_album),
                      title: const Text(
                        'Memories',
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MemoriesScreen()
                          )
                        );
                      }
                    )
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: const Icon(Icons.tour),
                      title: const Text(
                        'Places Visited',
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VisitedPlacesScreen()
                          )
                        );
                      }
                    )
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Others',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )
                      ),
                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen()
                          )
                        );
                      }
                    )
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      trailing: const Icon(Icons.logout),
                      onTap: (){

                      }
                    )
                  ),
                ]
              ),
            )
          )
        ),
      )
    );
  }
}

class ProfileImage extends StatelessWidget{
  final File imageFile;
  final VoidCallback onEdit;

  const ProfileImage({
    required this.imageFile,
    required this.onEdit,
    super.key
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Profile Picture',
          style: TextStyle(
            color: Colors.white,
          )
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: onEdit
          )
        ]
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: FileImage(imageFile)
          )
        )
      )
    );
  }
}