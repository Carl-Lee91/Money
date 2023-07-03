import 'package:flutter/material.dart';
import 'package:money/appbar/sub_appbar.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: SubAppbar(
          title: '코인 시세확인',
        ),
      ),
    );
  }
}
