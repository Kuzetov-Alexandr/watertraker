import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watertraker/features/account/presentation/pages/account_page.dart';
import 'package:watertraker/utils/style.dart';

class EditingAccountPage extends StatelessWidget {
  const EditingAccountPage({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountPage(onPressed: () {}),
                ),
              );
            },
            customBorder: const CircleBorder(),
            child: SvgPicture.asset(
              'assets/images/back.svg',
              width: 16,
              height: 25,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Редактирование', style: MyStyle.styleTextW7),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff33E34F)),
                    fixedSize: MaterialStatePropertyAll(
                      Size(
                        MediaQuery.of(context).size.width,
                        70,
                      ),
                    ),
                    maximumSize: MaterialStatePropertyAll(
                      Size(
                        MediaQuery.of(context).size.width,
                        70,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: Text(
                    'Сменить аккаунт',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
