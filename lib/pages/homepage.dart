import 'package:flutter/material.dart';
import '/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting + bell
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good Morning,'),
                    Text('Anup 🏔️',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                Badge(smallSize: 9, child: Icon(Icons.notifications_none, size: 30)),
              ],
            ),
            const SizedBox(height: 16),

            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search destinations, treks...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Featured card
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 140,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const NetImage(imgEverest),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('FEATURED',
                                    style: TextStyle(
                                        color: Colors.greenAccent, fontSize: 10)),
                                Text('Everest Base Camp',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text('The journey of a lifetime',
                                    style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.arrow_forward, color: kGreen, size: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Categories
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(Icons.terrain, 'Trekking', Color(0xFFD8EFE5), kGreen),
                CategoryItem(Icons.flight, 'Tours', Color(0xFFDDEEFF), Colors.blue),
                CategoryItem(Icons.bed, 'Hotels', Color(0xFFFFE9D6), Colors.orange),
                CategoryItem(Icons.explore, 'Explore', Color(0xFFEBE3FF), Colors.deepPurple),
              ],
            ),
            const SizedBox(height: 20),

            // Popular destinations
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Destinations',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('See All', style: TextStyle(color: kGreen)),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Expanded(child: DestinationCard(imgAnnapurna, 'Annapurna Circuit', '4.8')),
                SizedBox(width: 12),
                Expanded(child: DestinationCard(imgLangtang, 'Langtang Valley', '4.6')),
              ],
            ),
            const SizedBox(height: 20),

            // Recommended
            const Text('Recommended For You',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const NetImage(imgMardi, width: 75, height: 60),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mardi Himal Trek',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Nepal', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Row(children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          Text(' 4.5', style: TextStyle(fontSize: 12)),
                        ]),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category circle + label
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bg, fg;
  const CategoryItem(this.icon, this.label, this.bg, this.fg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(18)),
          child: Icon(icon, color: fg, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Destination card
class DestinationCard extends StatelessWidget {
  final String image, name, rating;
  const DestinationCard(this.image, this.name, this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: NetImage(image, height: 85, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: kGreen, size: 13),
                    const Text(' Nepal', style: TextStyle(fontSize: 11)),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    Text(' $rating', style: const TextStyle(fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}