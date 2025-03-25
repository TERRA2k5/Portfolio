import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _launchUrl(String text) async {
    final Uri url = Uri.parse(text);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall() async {
    final Uri callUri = Uri(scheme: 'tel', path: '6200015798');
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      print("Could not launch call");
    }
  }

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'aryananand005@gmail.com',
    );

    await launchUrl(emailUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CustomScrollView(
          slivers: [
            // SliverToBoxAdapter(child: SizedBox(height: 20,),),
            const SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 250,
              collapsedHeight: 80,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(top: 50),
                // collapseMode: CollapseMode.parallax,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                          'images/aryan.jpg'), // Replace with your image
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aryan Anand',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          'App Developer',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          'Student at IIT(ISM) Dhanbad',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    )
                  ],
                ),
                centerTitle: true,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),

            _buildLinks(context), // links

            _buildAbout(context),
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(left: 8, top: 16, bottom: 8),
              child: Text(
                'Skills',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            )),

            _buildSkills(context), // skills

            const SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLinks(BuildContext context) {
    return SliverToBoxAdapter(
        child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 25,
              width: 25,
              child: InkWell(
                onTap: () {
                  _launchUrl('https://github.com/TERRA2k5');
                },
                child: Image.asset('images/github.png'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 25,
              width: 25,
              child: InkWell(
                onTap: () {
                  _launchUrl('https://linkedin.com/in/aryan-anand-8649a227b');
                },
                child: Image.asset('images/linkedin.png'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 25,
              width: 25,
              child: InkWell(
                onTap: () {
                  _launchUrl('https://www.instagram.com/aryan___2k5');
                },
                child: Image.asset('images/instagram.png'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 25,
              width: 25,
              child: InkWell(
                onTap: () {
                  _launchUrl('https://x.com/TERRA2k5');
                },
                child: Image.asset('images/twitter.png'),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildAbout(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: 16),
              child: Text(
                'About Me',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'I am a passionate software developer with expertise in Flutter, Kotlin, and Competitive Programming. I am pursuing Bachelor of Technology at IIT Dhanbad.I am always eager to take on new challenges, collaborate on exciting projects, and create impactful solutions using technology.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, bottom: 16),
            child: GestureDetector(
                onTap: _makePhoneCall,
                child: const Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '  6200015798',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, bottom: 16),
            child: GestureDetector(
                onTap: _sendEmail,
                child: const Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '  aryananand005@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildSkills(BuildContext context) {
    return SliverToBoxAdapter(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/kotlin.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/dart.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/flutter.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/firebase.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/cpp.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/androidstudio.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/postman.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/git.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/flask.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('images/sql.png'),
            ),
          ),
        ],
      ),
    );
  }
}
