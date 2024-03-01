import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          // SizedBox(
          //     width: 150,
          //     height: 150,
          //     child: Image.asset("assets/icons/ic_launcher.png")),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Muallif:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Soxibova O‘g‘iloy Nuraliyevna\nXudoyberdiyeva Gulasal Shuxratovna",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Oliy ta'lim muassasasi:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Islom Karimov nomida Toshkent davlat texnika universiteti",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "Ilova talqini: 1.0.0",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
