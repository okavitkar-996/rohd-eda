import 'dart:convert';
import 'dart:io';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class file_ty {
  String name = "./";
  String fileType = "None";
  String logicalName = "None";
}

class Fileset {
  String name = "./";
  String type = "None";
  String dependancty = "None";
  //String library = "None";
  //String version = "0";

}

class Component {
  String name = "None";
  String vendor = "None";
  String library = "None";
  String version = "0";

  Component(String x, String y, String q, String w) {
    this.name = x;
    this.vendor = y;
    this.library = q;
    this.version = w;
  }
}

void ref(String file) {
  File xml_file = File(file);

  final xmlString = xml_file.readAsStringSync();
  final document = XmlDocument.parse(xmlString);
  //print(document.runtimeType);
  final vendor = document.findAllElements('ipxact:vendor');
  final library = document.findAllElements('ipxact:library');
  final name = document.findAllElements('ipxact:name');
  final version = document.findAllElements('ipxact:version');

  //List<file_ty>;
  Component bb = new Component(name.first.text, vendor.first.text,
      library.first.text, version.first.text);

  final ports = document.findAllElements('ipxact:port');
  //print(ports.first.runtimeType);

  final fileSets = document.findAllElements('ipxact:fileSet');

  var myList = List<Fileset>;
  //print(fileSets.runtimeType);
  for (var fs in fileSets) {
    //print(fs.runtimeType);
    var xml2json = Xml2Json();

    Fileset fst = new Fileset();
    // var fsxml = ET.tostring(fs);
    String fsxml = fs.toXmlString();

    xml2json.parse(fs.outerXml);
    var xmlMap1 = xml2json.toParker();
    print("Parker");
    print(xmlMap1.runtimeType);
    var xmlMap2 = xml2json.toGData();
    print("GData");
    print(xmlMap2);

    var xmlMapO = xml2json.toGData();
    print("BadgerFish");
    print(xmlMapO);

    //Map valueMap<String, dynamic> = json.decode(xmlMap1);
    //print(valueMap.runtimeType);
    //Map<String, dynamic> xmlMap = xml2json.toMap();
    //Map valueMap = json.decode(xmlMap2);
    //print(valueMap);
  }
}
