import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onToggleTheme});
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final fyiItems = [
      {
        "image": "assets/images/suga.jpg",
        "desc": "Suga BTS Rilis Album Baru",
        "date": "01-04-2025"
      },
      {
        "image": "assets/images/roin.jpg",
        "desc": "roin Hadir di Variety Show running man",
        "date": "28-03-2025"
      },
      {
        "image": "assets/images/jake.jpg",
        "desc": "Jake Enhypen Tampil di Acara Musik",
        "date": "25-03-2025"
      },
    ];

    final galleryItems = [
      'assets/images/psj.jpg',
      'assets/images/jake.jpg',
      'assets/images/roin.jpg',
      'assets/images/suga.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Park Seo Jun"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/images/psj.jpg', height: 200),
              ),
            ),
            const SizedBox(height: 16),
            const Text("FYI", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fyiItems.length,
                itemBuilder: (context, index) {
                  final item = fyiItems[index];
                  return Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 12),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                item['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(item['desc']!, style: const TextStyle(fontSize: 12)),
                            Text(item['date']!, style: const TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text("Galeri", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: galleryItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(imagePath: galleryItems[index]),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(galleryItems[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Text("Disc", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            albumItem("assets/images/loveyourself.jpg", "Love Yourself", "Album oleh BTS"),
            albumItem("assets/images/darkblood.jpg", "Dark Blood", "Album oleh Enhypen"),
            albumItem("assets/images/bernadya.jpg", "Bernadya", "Album indie favorit"),
            const SizedBox(height: 16),
            const Text("Bio", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/erika.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Erika Zahrania", style: TextStyle(fontSize: 16)),
                    Text("let it flow", style: TextStyle(fontSize: 12)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget albumItem(String image, String title, String subtitle) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(image, height: 50, width: 50, fit: BoxFit.cover),
    ),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(subtitle),
  );
}
