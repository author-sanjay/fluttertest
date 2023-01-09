import 'package:flutter/material.dart';
import 'package:fluttertest/Details.dart';
import 'package:fluttertest/GetProductModel.dart';
import 'package:fluttertest/GetProductModelApi.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  bool loading = true;
  late List<GetProduct> _getdeals;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await GetProductsapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.purple,
        title: Center(
          child: Text("Test App SocialCTR"),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Text(
              "Products",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
            ),
            _isloading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return list(
                        desc: _getdeals[index].desc,
                        name: _getdeals[index].name,
                        photo: _getdeals[index].images,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: _getdeals.length,
                    padding: EdgeInsets.all(0),
                    controller: ScrollController(keepScrollOffset: false),
                  ),
          ],
        )),
      )),
    );
  }
}

class list extends StatelessWidget {
  list(
      {super.key, required this.desc, required this.name, required this.photo});
  String name;
  String photo;
  String desc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(desc: desc, name: name, photo: photo),
          ),
        );
      }),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                    child: Image.network(
                  photo,
                  fit: BoxFit.contain,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                      child: Text(
                    name,
                    style: TextStyle(fontSize: 20),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
