import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: ColorName.primary,
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Message'),
                Tab(text: 'Memories'),
              ],
            ),
            centerTitle: true,
            title: const Text(
              'IDUL FITRI 1445 H',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: Card(
                  elevation: 10,
                  surfaceTintColor: ColorName.secondary,
                  shadowColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'EID MUBARAK\nKullu \'aam wa antum bi khair\n\n"Mohon maafkan saya atas segala kesilapan yang disengaja maupun tidak disengaja. Peace... :)"\n- akhher -',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OleoScript'),
                      ),
                      SizedBox(height: 40),
                      Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 50,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: Card(
                  elevation: 10,
                  surfaceTintColor: Colors.white,
                  shadowColor: Colors.blueAccent,
                  child: ListView(
                    children: const [
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/1.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/2.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/3.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/4.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/5.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/6.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/7.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/8.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/9.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/10.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/11.jpg')),
                      Image(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/akhher/assets/main/images/12.jpg')),
                    ],
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: Builder(builder: (context) {
            return Padding(
              padding: EdgeInsets.only(right: 20, bottom: 55),
              child: FloatingActionButton.extended(
                label: const Text(
                  'Share Yuk',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                backgroundColor: ColorName.primary,
                onPressed: () async {
                  await Clipboard.setData(const ClipboardData(
                      text:
                          '''Ucapan Idul Fitri dari *Akhher* untuk kalian semua.. 🤗🌙✨🕌
Link ucapan : https://akhher.github.io/eid_fitri/'''));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Thank you banget guys udah ngebagiin.. 😊'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
