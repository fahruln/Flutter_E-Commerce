import 'package:dicoding/bag_screen.dart';
import 'package:dicoding/detail_screen.dart';
import 'package:dicoding/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:dicoding/model.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200,
                          ),
                          child: const TextField(
                              textAlignVertical: TextAlignVertical.center,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              )),
                        ),
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WishlistScreen()));
                          },
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BagScreen()));
                        },
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              if (constraints.maxWidth < 600) {
                return const CollectionGrid(count: 2);
              } else if (constraints.maxWidth < 800) {
                return const CollectionGrid(count: 3);
              } else if (constraints.maxWidth < 1000) {
                return const CollectionGrid(count: 4);
              } else if (constraints.maxWidth < 1200) {
                return const CollectionGrid(count: 5);
              } else {
                return const CollectionGrid(count: 6);
              }
            },
          ),
        ),
      ),
    );
  }
}

class CollectionGrid extends StatelessWidget {
  final int count;
  const CollectionGrid({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.count(
          shrinkWrap: true,
          childAspectRatio: 0.7,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: count,
          children: collectionList.map((collection) {
            return InkWell(
              hoverColor: Colors.grey,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return DetailScreen(product: collection);
                }));
              },
              child: Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            collection.image[0],
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            collection.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'IDR ${NumberFormat.decimalPattern().format(collection.price)}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
