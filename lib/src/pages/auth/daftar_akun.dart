import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:optinotes/src/pages/auth/login.dart';

import '../../../widgets/button.dart';
import '../../../widgets/form.dart';
import '../../../widgets/logos.dart';
import 'auth_controller/hidden_pass.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final obsecureC = Get.put(ObsecureController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF3A8C8A),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              "assets/images/atas.png",
              width: 240,
              height: 212,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight * 0.34,
              child: Center(
                child: Logos(iconWidth: 68, fontSize: 38, spacing: 2, topPadding: 12,), // ← tutup Row
              ),
            ),
          ),

          // Layer 2: Card putih
          Positioned(
            top: screenHeight * 0.27,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              bottom: false,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              "Daftar Akun",
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 24,
                                color: Color(0xffCEDBC0),
                              ),
                            ),Text(
                              "Buat akun untuk mulai menggunakan aplikasi.",
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 12,
                                color: Color(0xffCEDBC0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'email',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_rounded,
                      ),
                      const SizedBox(height: 16), CustomTextField(
                        labelText: 'Nomor Telfon',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        prefixIcon: Icons.add_call,
                      ),
                      const SizedBox(height: 16),
                      Obx(() => CustomTextField(
                        labelText: 'Password',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icons.password_rounded,
                        obscureText: obsecureC.isPasswordHidden.value,
                        suffixIcon: IconButton(
                          onPressed: () => obsecureC.togglePassword(),
                          icon: Icon(
                            obsecureC.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      ),
                      SizedBox(height: 12),
                      Obx(() => CustomTextField(
                        labelText: 'Konfirmasi Password',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icons.password_rounded,
                        obscureText: obsecureC.isConfirmHidden.value,
                        suffixIcon: IconButton(
                          onPressed: () => obsecureC.toggleConfirm(),
                          icon: Icon(
                            obsecureC.isConfirmHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      ),
                      SizedBox(height: 16),
                      ButtonLog(labelName: 'SignUp',),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          Center(child: Text("Atau Lanjutkan Dengan")),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  print("Login with Google");
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/icons/google.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sudah punya akun? "),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>LoginForm());
                                },
                                child: Text(
                                  "Masuk di sini",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}