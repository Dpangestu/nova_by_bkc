import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_by_bkc/app/modules/login/controllers/login_controller.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginScreen extends GetView<LoginController> {
  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background SVG image
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/svg/login.svg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.03),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.12),
                  _buildLogo(screenWidth),
                  SizedBox(height: screenHeight * 0.03),
                  _buildTextLogin(screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      _buildUsername(screenWidth, screenHeight,
                          controller.usernameController, controller),
                      SizedBox(height: screenHeight * 0.02),
                      _buildPassword(screenWidth, screenHeight,
                          controller.passwordController, controller),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                  // SizedBox(height: screenHeight * 0.01),
                  _buildRememberMeCheckbox(controller),
                  SizedBox(height: screenHeight * 0.01),
                  _buildLoginBtn(
                    screenWidth,
                    screenHeight,
                    controller.usernameController,
                    controller.passwordController,
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder<String>(
            future: _getAppVersion(),
            builder: (context, snapshot) {
              String version = snapshot.hasData ? snapshot.data! : 'Loading...';
              return Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Version $version',
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRememberMeCheckbox(LoginController controller) {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            value: controller.rememberMe.value,
            onChanged: (value) {
              controller.rememberMe.value = value!;
            },
          ),
          const Text('Ingatkan Saya'),
        ],
      ),
    );
  }

  Obx _buildLoginBtn(
      double screenWidth,
      double screenHeight,
      TextEditingController usernameController,
      TextEditingController passwordController) {
    return Obx(
      () => controller.isLoading.value
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                controller.login(
                    usernameController.text, passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff225CAB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.37,
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                  fontFamily: 'Futura',
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
    );
  }
}

Widget _buildPassword(double screenWidth, double screenHeight,
    TextEditingController passwordController, LoginController controller) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Username',
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontFamily: 'Futura',
          ),
        ),
      ),
      SizedBox(height: screenHeight * 0.01),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: passwordController,
          autofillHints: const [AutofillHints.password],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(screenWidth * 0.03),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            controller.validateUsername(value);
          },
        ),
      ),
      Obx(() {
        if (controller.passwordError.value.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              controller.passwordError.value,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          );
        }
        return Container();
      }),
    ],
  );
}

Widget _buildUsername(double screenWidth, double screenHeight,
    TextEditingController usernameController, LoginController controller) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Username',
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontFamily: 'Futura',
          ),
        ),
      ),
      SizedBox(height: screenHeight * 0.01),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: usernameController,
          autofillHints: const [AutofillHints.username],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(screenWidth * 0.03),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            controller.validateUsername(value);
          },
        ),
      ),
      Obx(() {
        if (controller.usernameError.value.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              controller.usernameError.value,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          );
        }
        return Container();
      }),
    ],
  );
}

Widget _buildTextLogin(double screenWidth) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Silahkan Login untuk Melanjutkan',
      style: TextStyle(
        fontSize: screenWidth * 0.03,
        fontFamily: 'Futura',
        fontWeight: FontWeight.w200,
      ),
    ),
  );
}

Widget _buildLogo(double screenWidth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset('assets/svg/sayap.svg', width: screenWidth * 0.3),
    ],
  );
}
