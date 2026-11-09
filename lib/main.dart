import 'package:flutter/material.dart';

void main() {
  runApp(const LostAndFoundApp());
}

class LostAndFoundApp extends StatelessWidget {
  const LostAndFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Lost & Found',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[3],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  final List<Map<String, String>> lostAndFoundItems = const [
    {
      'id': '1',
      'name': 'Black Leather Wallet',
      'location': 'Central Library - 2nd Floor',
      'status': 'Lost',
      'date': 'Oct 24, 2026',
      'description': 'Black leather wallet containing student ID and canteen card.',
    },
    {
      'id': '2',
      'name': 'Scientific Calculator (Casio fx-991EX)',
      'location': 'Computer Lab 03',
      'status': 'Found',
      'date': 'Oct 25, 2026',
      'description': 'Casio scientific calculator with a sticker on the back cover.',
    },
    {
      'id': '3',
      'name': 'Blue Water Bottle (Hydro Flask)',
      'location': 'Main Campus Cafeteria',
      'status': 'Lost',
      'date': 'Oct 26, 2026',
      'description': 'Blue stainless steel water bottle left near the window table.',
    },
    {
      'id': '4',
      'name': 'AirPods Pro Case',
      'location': 'Auditorium Block A',
      'status': 'Found',
      'date': 'Oct 27, 2026',
      'description': 'White wireless charging case found under seat row 4.',
    },
    {
      'id': '5',
      'name': 'Engineering Mathematics Textbook',
      'location': 'Room 104 - CS Dept',
      'status': 'Lost',
      'date': 'Oct 27, 2026',
      'description': 'Hardcover textbook with handwritten notes on chapter 3.',
    },
    {
      'id': '6',
      'name': 'Set of House & Car Keys',
      'location': 'Sports Complex Bench',
      'status': 'Found',
      'date': 'Oct 28, 2026',
      'description': '3 keys attached to a red leather keychain.',
    },
    {
      'id': '7',
      'name': 'USB Flash Drive (64GB SanDisk)',
      'location': 'Digital Logic Design Lab',
      'status': 'Lost',
      'date': 'Oct 29, 2026',
      'description': 'Black SanDisk USB drive containing project source code files.',
    },
    {
      'id': '8',
      'name': 'Grey Hoodie (Size L)',
      'location': 'Student Lounge',
      'status': 'Found',
      'date': 'Oct 30, 2026',
      'description': 'Grey zipped hoodie left on the chair near the entrance.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Lost & Found'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        itemCount: lostAndFoundItems.length,
        itemBuilder: (context, index) {
          final item = lostAndFoundItems[index];
          final bool isLost = item['status'] == 'Lost';

          return Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),

              leading: CircleAvatar(
                backgroundColor: isLost ? Colors.red[3] : Colors.green[3],
                child: Icon(
                  isLost ? Icons.search_off : Icons.check_circle_outline,
                  color: isLost ? Colors.red : Colors.green,
                ),
              ),

              title: Text(
                item['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),

              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Location: ${item['location']}'),
                    const SizedBox(height: 2.0),
                    Row(
                      children: [
                        const Text('Status: '),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          decoration: BoxDecoration(
                            color: isLost ? Colors.red[4] : Colors.green[4],
                            border: Border.all(
                              color: isLost ? Colors.red : Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            item['status']!,
                            style: TextStyle(
                              color: isLost ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailScreen(item: item),
                    ),
                  );
                },
                child: const Text('Details'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final Map<String, String> item;

  const ItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final bool isLost = item['status'] == 'Lost';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: CircleAvatar(
                    radius: 36.0,
                    backgroundColor: isLost ? Colors.red[3] : Colors.green[3],
                    child: Icon(
                      isLost ? Icons.search : Icons.inventory_2,
                      size: 40.0,
                      color: isLost ? Colors.red : Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Text(
                    item['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(height: 30.0, thickness: 1.2),


                _buildDetailRow(
                  icon: Icons.info_outline,
                  label: 'Status',
                  value: item['status']!,
                  valueColor: isLost ? Colors.red : Colors.green,
                ),
                const SizedBox(height: 14.0),
                _buildDetailRow(
                  icon: Icons.location_on_outlined,
                  label: 'Location',
                  value: item['location']!,
                ),
                const SizedBox(height: 14.0),
                _buildDetailRow(
                  icon: Icons.calendar_today_outlined,
                  label: 'Date Reported',
                  value: item['date']!,
                ),
                const SizedBox(height: 14.0),
                _buildDetailRow(
                  icon: Icons.description_outlined,
                  label: 'Description',
                  value: item['description']!,
                ),
                const SizedBox(height: 24.0),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back to Catalog'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.teal, size: 22.0),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}