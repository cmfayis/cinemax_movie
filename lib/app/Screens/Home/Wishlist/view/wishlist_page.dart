import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp/app/Services/api/api_key.dart';
import '../../../../utils/colors.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      appBar: AppBar(
        backgroundColor: AppColors.KBackground,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Wishlist",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: AppColors.kWhite,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('wishlist').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];
                return WishListCard(
                  title: data['movie'],
                  subtitle: data['description'],
                  imageUrl: data['image'],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

class WishListCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imageUrl;
  final VoidCallback? onRemove;

  const WishListCard({
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
      color: AppColors.kWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              "${ApiKey.imagePath}${imageUrl}",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              subtitle!,maxLines: 2,
              style: const TextStyle(
                
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: onRemove,
              icon: const Icon(
                CupertinoIcons.delete,
                color: AppColors.kPrimary,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
