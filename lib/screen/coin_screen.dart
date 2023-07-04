import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/api/api_services.dart';
import 'package:money/appbar/sub_appbar.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/gap.dart';
import 'package:money/constant/size.dart';
import 'package:money/models/coin_model.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  late Future<CoinModel> btcModel;
  late Future<CoinModel> ethModel;
  late Future<CoinModel> etcModel;

  @override
  void initState() {
    super.initState();
    btcModel = ApiServices.fetchCoinPrice("BTC");
    ethModel = ApiServices.fetchCoinPrice("ETH");
    etcModel = ApiServices.fetchCoinPrice("ETC");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SubAppbar(
          title: '코인 시세확인',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/bitcoin.png",
              width: 250,
              height: 250,
            ),
            FutureBuilder(
              future: Future.wait([btcModel, ethModel, etcModel]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final coinModels = snapshot.data as List<CoinModel>;
                  final btcModel = coinModels[0];
                  final ethModel = coinModels[1];
                  final etcModel = coinModels[2];
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "코인 3대장 시세확인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size32,
                            color: ColorTheme.mainColor,
                          ),
                        ),
                        Gaps.v32,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('코인 이름')),
                              DataColumn(label: Text('저점')),
                              DataColumn(label: Text('고점')),
                              DataColumn(label: Text('24시간 거래량')),
                              DataColumn(label: Text('24시간 시세변화')),
                              DataColumn(label: Text('24시간 시세변화율')),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  const DataCell(Text('BTC')),
                                  DataCell(Text(
                                      '${double.parse(btcModel.minPrice).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(btcModel.maxPrice).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(btcModel.tradeAmount24).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(btcModel.fluctate24).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(btcModel.fluctateRate24).toStringAsFixed(2)}%')),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('ETH')),
                                  DataCell(Text(
                                      '${double.parse(ethModel.minPrice).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(ethModel.maxPrice).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(ethModel.tradeAmount24).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(ethModel.fluctate24).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(ethModel.fluctateRate24).toStringAsFixed(2)}%')),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(Text('ETC')),
                                  DataCell(Text(
                                      '${double.parse(etcModel.minPrice).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(etcModel.maxPrice).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(etcModel.tradeAmount24).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(etcModel.fluctate24).toStringAsFixed(2)}원')),
                                  DataCell(Text(
                                      '${double.parse(etcModel.fluctateRate24).toStringAsFixed(2)}%')),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size10,
                vertical: Sizes.size40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoButton(
                    color: ColorTheme.mainColor,
                    onPressed: () {},
                    child: const Text(
                      "Site 1",
                    ),
                  ),
                  CupertinoButton(
                    color: ColorTheme.mainColor,
                    onPressed: () {},
                    child: const Text(
                      "Site 2",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
