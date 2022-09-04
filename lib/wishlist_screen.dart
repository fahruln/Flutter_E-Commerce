import 'package:dicoding/bag_screen.dart';
import 'package:dicoding/detail_screen.dart';
import 'package:dicoding/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(70),
                    child: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      flexibleSpace: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerLeft,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 30,
                                  )),
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: const TextField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
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
                                                const BagScreen()));
                                  },
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )),
                body: (wishList.isEmpty)
                    ? const Center(
                        child: Text('Empty'),
                      )
                    : LayoutBuilder(builder: (context, constraints) {
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
                      })),
          ),
        ));
  }
}

class CollectionGrid extends StatefulWidget {
  final int count;
  const CollectionGrid({Key? key, required this.count}) : super(key: key);

  @override
  State<CollectionGrid> createState() => _CollectionGridState();
}

class _CollectionGridState extends State<CollectionGrid> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 0.7,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: widget.count,
          children: wishList.map((collection) {
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
                    Stack(children: [
                      Expanded(
                          child: Image.network(
                        collection.image[0],
                        fit: BoxFit.cover,
                      )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    wishList.remove(collection);
                                  });
                                },
                                icon: const Icon(Icons.delete_outline)),
                          ))
                    ]),
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
