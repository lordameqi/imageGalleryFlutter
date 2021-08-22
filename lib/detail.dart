import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  String nama, gambar, keterangan;
  Detail({this.nama, this.gambar, this.keterangan});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nama}'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: widget.nama,
              child: Material(
                child: InkWell(
                  child: Image.asset(
                    'assets/images/${widget.gambar}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          BagianNama(
            nama: widget.nama,
          ),
          BagianKeterangan(
            keterangan: widget.keterangan,
          )
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama,
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 40.0,
                color: Colors.deepOrange,
              ),
              Text("14", style: TextStyle(fontSize: 18.0)),
            ],
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  String keterangan;
  BagianKeterangan({this.keterangan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            '$keterangan',
            style: TextStyle(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
