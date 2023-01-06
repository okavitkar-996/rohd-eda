//import 'package:my_dart/my_dart.dart' as my_dart;
import 'package:xml/xml.dart';
import 'dart:io';
import 'package:my_dart/ref.dart' as referance;
import 'package:my_dart/my_dart.dart' as my;
import 'package:xml2json/xml2json.dart';

class Port {
  final String name;
  final String dir;
  final double price;

  Port(this.name, this.dir, this.price);
}

void main() {
  String ff = './xml/unitA.xml';
  File xml_file = File('./xml/unitA.xml');
  final xmlString1 = xml_file.readAsStringSync();
  final document = XmlDocument.parse(xmlString1);
  final ports = document.findAllElements('ipxact:port');
  final files = document.findAllElements('ipxact:fileSet');

  referance.ref(ff);
  print(my.calculate());
}
