import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const ProductDetails());
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  final addProduct = 0;
//String? ProductName,description;
//int? price,number;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  void addOne() {}

  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
              child: Image(
                image: AssetImage('images/Screenshot 2024-11-17 230023.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'ProductName',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'description',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'price',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'store',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'number',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                const Spacer(
                  flex: 3,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan),
                    onPressed: addOne,
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 20),
                      selectionColor: Colors.cyan,
                    )),
                const Spacer(flex: 1),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Padding(
                        padding: EdgeInsets.all(40),
                        child: Icon(
                          FontAwesomeIcons.cartPlus,
                          size: 40,
                        ),
                      )),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan),
                    onPressed: addOne,
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 20),
                      selectionColor: Colors.cyan,
                    )),
                const Spacer(
                  flex: 3,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
