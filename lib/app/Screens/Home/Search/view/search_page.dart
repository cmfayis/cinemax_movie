import 'package:flutter/material.dart';
import 'package:movieapp/app/Model/trending.dart';
import 'package:movieapp/app/Services/api/api_key.dart';
import 'package:movieapp/app/utils/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      appBar: AppBar(
        backgroundColor: AppColors.KBackground,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: AppColors.kWhite,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              onChanged: (value) {
                ApiKey().searchMovie(value);
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.kPrimary,
                  size: 30,
                ),
                hintText: 'Search...',
                hintStyle: const TextStyle(color: AppColors.kWhite),
                fillColor: const Color.fromARGB(255, 143, 134, 134),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: AppColors.kPrimary, width: 2.0),
                ),
              ),
              style: const TextStyle(color: AppColors.kWhite),
            ),
          //  SizedBox(
          //   child: FutureBuilder(future: search, builder: (context, snapshot) {
          //     return ListView.builder(itemBuilder: (context, index) {
          //       return Container();
          //     },);
          //   },),
          //  )
           
          ],
        ),
      ),
    );
  }
}
