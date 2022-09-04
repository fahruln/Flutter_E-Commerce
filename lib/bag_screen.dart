import 'package:dicoding/detail_screen.dart';
import 'package:dicoding/main.dart';
import 'package:dicoding/model.dart';
import 'package:dicoding/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  totalPrice() {
    num total = 0;
    for (var element in bagList) {
      total += element.price * element.amount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor:
              (bagList.isEmpty) ? Colors.grey.shade200 : Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(right: 20, left: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          )),
                      IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const WishlistScreen();
                            }));
                          },
                          icon: const Icon(
                            Icons.favorite_outline,
                            size: 30,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: bagList.isEmpty
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Wow, your shopping bag is empty',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'let\'s fill it with the collection of your dreams',
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()));
                          },
                          child: const Text(
                            'Start Shopping',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    )
                  ],
                ))
              : SingleChildScrollView(
                  child: Column(
                      children: bagList
                          .map((item) => InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return DetailScreen(
                                      product: item,
                                    );
                                  })));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  height: 200,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Image.network(
                                              item.image[0],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.name,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'IDR ${NumberFormat.decimalPattern().format(item.price)}',
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          (wishList.contains(item)
                                              ? const Text(
                                                  'It\'s already on the wishlist',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              : TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      wishList.add(item);
                                                      bagList.remove(item);
                                                    });
                                                  },
                                                  child: const Text(
                                                    'Move to Wishlist',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ))),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      bagList.remove(item);
                                                      if (bagList.isEmpty) {
                                                        const BagScreen();
                                                      }
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete_outline,
                                                    size: 30,
                                                    color: Colors.grey,
                                                  )),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 20),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.grey)),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onPressed: () {
                                                          setState(() {
                                                            if (item.amount >
                                                                1) {
                                                              item.amount -= 1;
                                                            }
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons.remove,
                                                          color:
                                                              (item.amount > 1)
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                        )),
                                                    Text(
                                                      item.amount.toString(),
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    IconButton(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onPressed: () {
                                                          setState(() {
                                                            item.amount += 1;
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.add,
                                                        ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList()),
                ),
          bottomNavigationBar: bagList.isNotEmpty
              ? BottomAppBar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Total Price',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'IDR ${NumberFormat.decimalPattern().format(totalPrice())}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Buy Now (\$)',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
