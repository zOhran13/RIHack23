import 'package:flutter/material.dart';

// Define a data class to represent each item in the list.
class PhotoItem {
  final String imageUrl;
  final String name;
  final String description;

  PhotoItem(
      {required this.imageUrl, required this.name, required this.description});
}

class PhotoListWidget extends StatelessWidget {
  final List<PhotoItem> photos;

  const PhotoListWidget({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return GestureDetector(
          onTap: () {
            // Navigate to the details screen when an item is tapped.
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PhotoDetailsScreen(photo: photo),
            ));
          },
          child: ListTile(
            leading: Image.network(photo.imageUrl),
            title: Text(photo.name),
            subtitle: Text(photo.description),
          ),
        );
      },
    );
  }
}

class PhotoDetailsScreen extends StatelessWidget {
  final PhotoItem photo;

  const PhotoDetailsScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(photo.imageUrl),
          const SizedBox(height: 20),
          Text('Name: ${photo.name}'),
          const SizedBox(height: 10),
          Text('Description: ${photo.description}'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Photo List Example'),
      ),
      body: PhotoListWidget(
        photos: [
          PhotoItem(
            imageUrl: 'https://example.com/image1.jpg',
            name: 'Photo 1',
            description: 'Description of Photo 1',
          ),
          PhotoItem(
            imageUrl: 'https://example.com/image2.jpg',
            name: 'Photo 2',
            description: 'Description of Photo 2',
          ),
          // Add more PhotoItem objects as needed.
        ],
      ),
    ),
  ));
}
