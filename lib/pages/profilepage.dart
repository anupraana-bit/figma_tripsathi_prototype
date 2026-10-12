import 'package:flutter/material.dart';
import 'package:paclassdemo/constants.dart';
import 'package:paclassdemo/screens//welcomescreen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover photo + avatar
          Stack(
            clipBehavior: Clip.none,
            children: [
              const NetImage(imgHero, height: 200, width: double.infinity),
              const Positioned(
                top: 45,
                right: 16,
                child: Icon(Icons.settings_outlined, color: Colors.white),
              ),
              const Positioned(
                bottom: -45,
                left: 16,
                child: CircleAvatar(
                  radius: 46,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundImage: NetworkImage(imgProfile),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 55),

          // Name & email
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Anup Rana',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text('anuprana12@gmail.com'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Stats
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey.shade200)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatItem('5', 'Trips'),
                StatItem('12', 'Saved'),
                StatItem('3', 'Reviews'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Travel More card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kLightGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFFC5E3D8),
                  child: Icon(Icons.terrain, color: kGreen),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Travel More',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Collect more memories and earn new badges!',
                          style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward, size: 18),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Menu
          const MenuItem(Icons.calendar_month_outlined, 'My Bookings'),
          const MenuItem(Icons.favorite_border, 'Wishlist'),
          const MenuItem(Icons.star_border, 'Reviews'),
          const MenuItem(Icons.settings_outlined, 'Settings'),
          const MenuItem(Icons.help_outline, 'Help & Support'),
          const SizedBox(height: 10),

          // Log out
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: kLightGreen,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                    (route) => false,
              ),
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String number, label;
  const StatItem(this.number, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const MenuItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}