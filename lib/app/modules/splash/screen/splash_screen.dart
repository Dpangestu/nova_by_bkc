import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetBuilder<SplashController>(builder: (context) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/screen_splass_2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FutureBuilder<String>(
              future: _getAppVersion(),
              builder: (context, snapshot) {
                String version =
                    snapshot.hasData ? snapshot.data! : 'Loading...';
                return Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Text(
                    'Version $version',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
