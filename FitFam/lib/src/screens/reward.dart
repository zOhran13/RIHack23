import 'package:flutter/material.dart';

import '../common_widgets/custom_app_bar.dart';

class PhotoItem {
  final String imageUrl;
  final String name;
  final String description;

  PhotoItem(
      {required this.imageUrl, required this.name, required this.description});
}

class RewardScreen extends StatelessWidget {
  final List<PhotoItem> photos;

  const RewardScreen({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70.0), child: CustomAppBar()),
        body: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the details screen when an item is tapped.
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PhotoDetailsScreen(
                    photo: photo,
                  ),
                ));
              },
              child: ListTile(
                leading: Image.network(photo.imageUrl),
                title: Text(photo.name),
                subtitle: Text(photo.description),
              ),
            );
          },
        ));
  }
}

class PhotoDetailsScreen extends StatelessWidget {
  final PhotoItem photo;

  const PhotoDetailsScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0), child: CustomAppBar()),
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
