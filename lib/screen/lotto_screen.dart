import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/api/api_services.dart';
import 'package:money/appbar/sub_appbar.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/gap.dart';
import 'package:money/constant/size.dart';
import 'package:money/models/lotto_model.dart';
import 'package:money/widget/lotto_number.dart';

class LottoScreen extends StatefulWidget {
  const LottoScreen({super.key});

  @override
  State<LottoScreen> createState() => _LottoScreenState();
}

class _LottoScreenState extends State<LottoScreen> {
  late Future<LottoModel> lottoModel;
  List<int> _lottoNumbers = [];

  @override
  void initState() {
    super.initState();
    lottoModel = ApiServices.fetchLottoNumbers();
  }

  void _generateRandomNumbers() {
    final random = Random();
    _lottoNumbers = [];

    while (_lottoNumbers.length < 6) {
      final number = random.nextInt(45) + 1;
      if (!_lottoNumbers.contains(number)) {
        _lottoNumbers.add(number);
      }
    }
    _lottoNumbers.sort();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SubAppbar(
          title: '모의 로또하기',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "금주의 로또당첨번호",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size24,
                  ),
                ),
              ],
            ),
            Gaps.v10,
            FutureBuilder(
              future: lottoModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final lottoRound = snapshot.data!.drwNo;
                  final drwNoDate = snapshot.data!.drwNoDate;
                  final drwtNo1 = snapshot.data!.drwtNo1;
                  final drwtNo2 = snapshot.data!.drwtNo2;
                  final drwtNo3 = snapshot.data!.drwtNo3;
                  final drwtNo4 = snapshot.data!.drwtNo4;
                  final drwtNo5 = snapshot.data!.drwtNo5;
                  final drwtNo6 = snapshot.data!.drwtNo6;
                  final bnusNo = snapshot.data!.bnusNo;
                  final firstWinamnt = snapshot.data!.firstWinamnt;
                  return Column(
                    children: [
                      Text(
                        "$drwNoDate 추첨",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size20,
                        ),
                      ),
                      Gaps.v5,
                      Text(
                        "$lottoRound 회차",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size20,
                        ),
                      ),
                      Gaps.v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LottoNumberContainer(text: "$drwtNo1"),
                          Gaps.h10,
                          LottoNumberContainer(text: "$drwtNo2"),
                          Gaps.h10,
                          LottoNumberContainer(text: "$drwtNo3"),
                          Gaps.h10,
                          LottoNumberContainer(text: "$drwtNo4"),
                          Gaps.h10,
                          LottoNumberContainer(text: "$drwtNo5"),
                          Gaps.h10,
                          LottoNumberContainer(text: "$drwtNo6"),
                          Gaps.h10,
                          const FaIcon(
                            FontAwesomeIcons.plus,
                            size: Sizes.size28,
                          ),
                          Gaps.h10,
                          LottoNumberContainer(text: "$bnusNo"),
                        ],
                      ),
                      Gaps.v20,
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '1등 당첨금 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size20,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' $firstWinamnt',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: Sizes.size32,
                                color: Colors.red,
                              ),
                            ),
                            const TextSpan(
                              text: ' 원',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            Gaps.v80,
            const Text(
              "모의 로또하기",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size24,
              ),
            ),
            Gaps.v24,
            CupertinoButton(
              onPressed: _generateRandomNumbers,
              color: ColorTheme.mainColor,
              child: const Text("로또 뽑기!"),
            ),
            Gaps.v24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int number in _lottoNumbers)
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.orange,
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        number.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
