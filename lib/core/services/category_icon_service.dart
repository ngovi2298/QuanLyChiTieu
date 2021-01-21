import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Expenses_Tracker_App/core/models/category.dart';

class CategoryIconService {
  //* Danh sách các mục tiền ra
  final expenseList = {
    Category(0, "Ăn Uống", FontAwesomeIcons.pizzaSlice, Colors.green),
    Category(1, "Hoá Đơn", FontAwesomeIcons.moneyBill, Colors.blue),
    Category(2, "Đi Lại", FontAwesomeIcons.bus, Colors.blueAccent),
    Category(3, "Nhà Cữa", FontAwesomeIcons.home, Colors.brown),
    Category(4, "Giải Trí", FontAwesomeIcons.gamepad, Colors.cyanAccent),
    Category(5, "Mua Sắm", FontAwesomeIcons.shoppingBag, Colors.deepOrange),
    Category(6, "Quần Áo", FontAwesomeIcons.tshirt, Colors.deepOrangeAccent),
    Category(7, "Bảo Hiểm", FontAwesomeIcons.hammer, Colors.indigo),
    Category(8, "Điện Thoại", FontAwesomeIcons.phone, Colors.indigoAccent),
    Category(9, "Sức Khoẻ", FontAwesomeIcons.briefcaseMedical, Colors.lime),
    Category(10, "Thể Thao", FontAwesomeIcons.footballBall, Colors.limeAccent),
    Category(11, "Làm Đẹp", FontAwesomeIcons.marker, Colors.pink),
    Category(12, "Giáo Dục", FontAwesomeIcons.book, Colors.teal),
    Category(13, "Tặng Quà", FontAwesomeIcons.gift, Colors.redAccent),
    Category(14, "Thú Nuôi", FontAwesomeIcons.dog, Colors.deepPurpleAccent),
  };
  //* mục trong tiền vào
  final incomeList = {
    Category(0, "Tiền Lương", FontAwesomeIcons.wallet, Colors.lightGreen[900]),
    Category(1, "Tiền Thưởng", FontAwesomeIcons.moneyCheck, Colors.amber),
    Category(2, "Trợ Cấp", FontAwesomeIcons.gifts, Colors.lightGreen),
    Category(3, "Vay Mượn", FontAwesomeIcons.houseUser, Colors.yellow),
    Category(4, "Lợi Nhuận", FontAwesomeIcons.piggyBank, Colors.cyanAccent),
    Category(5, "Xổ số", FontAwesomeIcons.dice, Colors.deepOrange),
  };
}
