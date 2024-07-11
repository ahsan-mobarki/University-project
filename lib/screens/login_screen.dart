import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose(){
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
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
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account Login!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 40,
                      color: Colors.blue[900],
                    )
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                          ),
                          label: const Text(
                            'Email ID',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          hintText: 'example@abc.com',
                          hintStyle: const TextStyle(
                            color: Colors.grey
                          )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Your Email';
                          }
                          bool emailValidation = RegExp(
                            r"^[A-Za-z0-9.A-Za-z0-9!#$%&'*+-/=?^_`{|}~]+@[A-Za-z]+.[A-Za-z]+"
                          ).hasMatch(value);
                          if(!emailValidation){
                            return 'Invalid Email';
                          }
                          return null;
                        }
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
                            )
                          ),
                          hintText: 'Password_1',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          suffixIcon: InkWell(
                            onTap: (){
                              setState((){
                                _hidePassword = !_hidePassword;
                              });
                            },
                            child: Icon(
                              _hidePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                            )
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Password';
                          }
                          else if(value.length < 6){
                            return 'Password should atleast 6 characters';
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
                                fontSize: 20,
                              )
                            ),
                            onPressed: (){

                            }
                          )
                        ]
                      )
                    ]
                  )
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.indigo[700]),
                        elevation: WidgetStateProperty.all(5),
                        fixedSize: WidgetStateProperty.all(const Size.fromHeight(55.0))
                      ),
                      onPressed: (){
                          if(_loginFormKey.currentState!.validate()){
                            Navigator.pushReplacementNamed(context, '/shuffle');
                        }
                      },
                      child: const Center(
                        child: Text(
                          'login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          )
                        )
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey),
                        elevation: WidgetStateProperty.all(5),
                        fixedSize: WidgetStateProperty.all(const Size.fromHeight(55)),
                      ),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/shuffle');
                      },
                      child: const Center(
                        child: Text(
                          'Continue As Guest',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          )
                        ),
                      )
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 2,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            )
                          )
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          'OR Continue With',
                          style: TextStyle(
                            fontSize: 20,
                          )
                        ),
                        const SizedBox(width: 3),
                        Container(
                          height: 2,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            )
                          )
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                              'images/google.png'
                            ),
                          )
                        ),
                        InkWell(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                              'images/facebook.png'
                            )
                          )
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Text(
                          'Don\'t have an Account? ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          )
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.green[900]
                            ),
                          ),
                        ),
                      ]
                    ),
                  ]
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}