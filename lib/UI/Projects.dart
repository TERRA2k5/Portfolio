import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Widget _buildProjectCard({
    required String imagePath,
    required String title,
    required String description,
    required String githubUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: Colors.grey[900],
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(imagePath, height: 100),),
              const SizedBox(height: 12),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(description, style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton.icon(
                  onPressed: () => _launchUrl(githubUrl),
                  icon: SizedBox(width: 20, height: 20, child: Image.asset('images/github.png'),),
                  label: const Text("GitHub", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.teal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 24, left: 16),
            child: Text("My Projects", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
          ),
          _buildProjectCard(
            imagePath: 'images/flutter.png',
            title: 'Atom Mail',
            description: 'AtomMail is a modern email management application with email summerization and categorization features along with auto generated replies.',
            githubUrl: 'https://github.com/agnidhra-coder/atom-mail-hf',
          ),
          _buildProjectCard(
            imagePath: 'images/flutter.png',
            title: 'Raksha',
            description: 'An emergency safety app that alerts nearby users within 5km during distress situations.',
            githubUrl: 'https://github.com/TERRA2k5/Raksha',
          ),
          _buildProjectCard(
            imagePath: 'images/kotlin.png',
            title: 'Recyclomate',
            description: 'A waste sorting assistant app that uses image detection to guide users on proper recycling practices.',
            githubUrl: 'https://github.com/TERRA2k5/Recyclomate',
          ),
          _buildProjectCard(
            imagePath: 'images/kotlin.png',
            title: 'Quizzhub',
            description: 'MCQ Quiz generation and analysis using Gemini and let user save important questions.',
            githubUrl: 'https://github.com/TERRA2k5/Quizzhub',
          ),
          _buildProjectCard(
            imagePath: 'images/kotlin.png',
            title: 'Filmopedia',
            description: 'A movie bucket list app that allows users to create and manage their own movie collections.',
            githubUrl: 'https://github.com/TERRA2k5/Filmopedia',
          ),
        ],
      ),
    );
  }
}
