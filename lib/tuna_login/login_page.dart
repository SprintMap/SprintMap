import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sprintmap/home.dart';
import 'package:sprintmap/mainwrapper.dart';
import 'package:sprintmap/tuna_login/auth_service.dart';
import 'package:sprintmap/tuna_utils/customTextButton.dart';
import 'package:sprintmap/tuna_utils/tuna_colors.dart';
import 'package:sprintmap/tuna_utils/tuna_textStyle.dart';
import 'package:sprintmap/views/home_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String topImage = "assets/images/topImage.png";
    return Scaffold(
      backgroundColor: CustomColors.darkColor,
      body: appBody(height, topImage),
    );
  }

  SingleChildScrollView appBody(double height, String topImage) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topImageContainer(height, topImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    customSizedBox(),
                    emailTextField(),
                    customSizedBox(),
                    passwordTextField(),
                    customSizedBox(),
                    forgotPasswordButton(),
                    customSizedBox(),
                    signInButton(),
                    googleSignInButton(),
                    CustomTextButton(
                      onPressed: () async {
                        final result = await authService.signInAnonymous();
                        if (result != null) {
                          Navigator.pushReplacementNamed(context, "/homePage");
                        } else {
                          print("Hata ile karşılaşıldı");
                        }
                      },
                      buttonText: '',
                    ),
                    Center(
                      child: CustomTextButton(
                        onPressed: () => Navigator.pushNamed(context, "/signUp"),
                        buttonText: "Hesap Oluştur",
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

  Text titleText() {
    return Text(
      "Merhaba, \nHoşgeldin!",
      style: CustomTextStyle.titleTextStyle,
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
        return null;
      },
      onSaved: (value) {
        email = value!;
      },
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Email"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
        return null;
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Şifre"),
    );
  }

  Center forgotPasswordButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: customText("Şifremi Unuttum", CustomColors.pinkColor),
      ),
    );
  }

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: signIn,
        child: Container(
          height: 50,
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xff31274F)),
          child: Center(
            child: customText("Giriş Yap", CustomColors.loginButtonTextColor),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final result = await authService.signIn(email, password);
      if (result == "success") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainWrapper()),
                //burada routeni main wrappere yapacaksin
                (route) => false);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Hata"),
                content: Text(result!),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Geri Dön"))
                ],
              );
            });
      }
    }
  }

  // Google Sign-In Button
  Center googleSignInButton() {
    return Center(
      child: TextButton(
        onPressed: () async {
          final userCredential = await authService.signInWithGoogle();
          if (userCredential != null) {
            Navigator.pushReplacementNamed(context, "/homePage");
          } else {
            print("Google ile giriş başarısız.");
          }
        },
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white70,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/google_logo.png', // Google logosu resmi
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                "Google ile Giriş Yap",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container topImageContainer(double height, String topImage) {
    return Container(
      height: height * .25,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(topImage),
        ),
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
    height: 20,
  );

  Widget customText(String text, Color color) => Text(
    text,
    style: TextStyle(color: color),
  );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}