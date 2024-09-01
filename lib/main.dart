import 'package:flutter/material.dart';

void main() {
  runApp(PhotoScoreApp());
}

class PhotoScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoScore',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PhotoScoreHomePage(),
    );
  }
}

class PhotoScoreHomePage extends StatefulWidget {
  @override
  _PhotoScoreHomePageState createState() => _PhotoScoreHomePageState();
}

class _PhotoScoreHomePageState extends State<PhotoScoreHomePage> {
  final List<TextEditingController> _controllers = [TextEditingController()];
  int _total = 0;

  void _showPerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "1-)",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/image.png',
                          width: 200,
                          height: 100,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "NOT 1: Periniz 3 taştan oluşuyor ise 1. resimde belirtildiği gibi ortadaki taş sayısını giriniz.",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: _controllers
                          .asMap()
                          .entries
                          .map(
                            (entry) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: entry.value,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 10.0),
                                        labelText: 'Sayı Girin',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  if (entry.key == _controllers.length - 1)
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          _controllers
                                              .add(TextEditingController());
                                        });
                                      },
                                    ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "2-)",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/image2.png',
                          width: 200,
                          height: 100,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "NOT 2: Eğer periniz 2. resimdeki gibi 4 veya daha fazla taştan oluşuyor ise "
                      "resimdeki gibi içeriden en sağ veya en sol kısımdaki taşı girip diğer 2 taşı "
                      "per ekleme butonuna basarak ekleyiniz.",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  for (var controller in _controllers) {
                    int? value = int.tryParse(controller.text);
                    if (value != null) {
                      _total += value * 3; // Sayıyı 3 ile çarp
                    }
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Tamam', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _showYanSayiDialog() {
    final List<TextEditingController> _yanSayiControllers = [
      TextEditingController()
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "1-)",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/image3.png', // Yan Sayı Ekle ekranındaki resim
                          width: 200,
                          height: 100,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "NOT 1: Eğer 4 veya daha fazla taştan oluşan periniz var ise resimde gösterildiği gibi "
                      "12'yi per alıp 9 ve 10 sayılarını ise yan sayı olarak giriniz.",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: _yanSayiControllers
                          .asMap()
                          .entries
                          .map(
                            (entry) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: entry.value,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 10.0),
                                        labelText: 'Sayı Girin',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  if (entry.key ==
                                      _yanSayiControllers.length - 1)
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          _yanSayiControllers
                                              .add(TextEditingController());
                                        });
                                      },
                                    ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  for (var controller in _yanSayiControllers) {
                    int? value = int.tryParse(controller.text);
                    if (value != null) {
                      _total += value; // Sayıyı direkt ekle
                    }
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Tamam', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _clearTotal() {
    setState(() {
      _total = 0;
      _controllers.clear();
      _controllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhotoScore'),
        backgroundColor: Colors.amber[600],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _showPerDialog,
              child: Text('Per Ekle', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[600],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                fixedSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showYanSayiDialog,
              child:
                  Text('Yan Sayı Ekle', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[600],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                fixedSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearTotal,
              child: Text('Temizle', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[600],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                fixedSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Toplam: $_total',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
