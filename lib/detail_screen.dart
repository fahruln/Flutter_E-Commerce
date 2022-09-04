import 'package:dicoding/bag_screen.dart';
import 'package:dicoding/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final Collection product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                              margin: const EdgeInsets.symmetric(horizontal: 5),
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
                ),
              ),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 1100) {
                    return MobileDetailScreen(product: widget.product);
                  } else {
                    return WebDetailScreen(product: widget.product);
                  }
                },
              )),
        ),
      ),
    );
  }
}

class MobileDetailScreen extends StatefulWidget {
  final Collection product;
  const MobileDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<MobileDetailScreen> createState() => _MobileDetailScreenState();
}

class _MobileDetailScreenState extends State<MobileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                child: Image.network(
                  widget.product.image[0],
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      'IDR ${NumberFormat.decimalPattern().format(widget.product.price)}',
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.description,
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    onPressed: () {
                      setState(() {
                        if (wishList.contains(widget.product)) {
                          wishList.remove(widget.product);
                        } else {
                          wishList.add(widget.product);
                        }
                      });
                    },
                    icon: Icon(
                      (wishList.contains(widget.product)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                      size: 30,
                    )),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (bagList.contains(widget.product)) {
                            widget.product.amount += 1;
                          } else {
                            bagList.add(widget.product);
                          }
                        });
                      },
                      child: const Text(
                        'Add to Bag',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WebDetailScreen extends StatefulWidget {
  final Collection product;
  const WebDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<WebDetailScreen> createState() => _WebDetailScreenState();
}

class _WebDetailScreenState extends State<WebDetailScreen> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 40),
                    width: 450,
                    child: Image.network(
                      widget.product.image[0],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.product.name,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'IDR ${NumberFormat.decimalPattern().format(widget.product.price)}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.all(20),
                        width: 450,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5, color: Colors.grey.shade300)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'AMOUNT',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: Colors.grey.shade300)),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          child: IconButton(
                                            color: (amount <= 1)
                                                ? Colors.grey.shade300
                                                : Colors.black,
                                            onPressed: () {
                                              setState(() {
                                                if (amount > 1) {
                                                  amount--;
                                                }
                                              });
                                            },
                                            icon: const Icon(Icons.remove),
                                            iconSize: 16,
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: 40,
                                            child: Text(amount.toString())),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              amount++;
                                            });
                                          },
                                          icon: const Icon(Icons.add),
                                          iconSize: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    color: Colors.grey.shade300,
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          setState(() {
                                            if (wishList
                                                .contains(widget.product)) {
                                              wishList.remove(widget.product);
                                            } else {
                                              wishList.add(widget.product);
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          (wishList.contains(widget.product)
                                              ? Icons.favorite
                                              : Icons.favorite_outline),
                                          size: 20,
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      color: Colors.black,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (bagList
                                                .contains(widget.product)) {
                                              widget.product.amount += 1;
                                            } else {
                                              bagList.add(widget.product);
                                              widget.product.amount +=
                                                  amount - 1;
                                            }
                                          });
                                        },
                                        child: const Text(
                                          'Add to Bag',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: 450,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5, color: Colors.grey.shade300)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'DESCRIPTION',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.product.description),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
