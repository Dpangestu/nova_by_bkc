import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static void showCustomDialog(
      BuildContext context, String title, String message,
      {bool isError = false, String? redirectRoute}) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -40,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isError ? FeatherIcons.xCircle : FeatherIcons.checkCircle,
                      color: isError
                          ? const Color(0xffF5004F)
                          : const Color(0xff06D001),
                      size: 48,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff225CAB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015,
                    horizontal: MediaQuery.of(context).size.width * 0.25,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  if (!isError && redirectRoute != null) {
                    Navigator.of(context).pushReplacementNamed(redirectRoute);
                  }
                },
                child: Text(
                  'Oke',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.white,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showConfirmDialog(BuildContext context, String title,
      String message, VoidCallback onConfirm) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -40,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      FeatherIcons.alertCircle,
                      color: Color(0xffF5004F),
                      size: 48,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF5004F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.015,
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                    },
                    child: Text(
                      'Batal',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.white,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff225CAB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.015,
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                      onConfirm(); // Panggil aksi konfirmasi
                    },
                    child: Text(
                      'Ya',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.white,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
