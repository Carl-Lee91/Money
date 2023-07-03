import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/api/api_services.dart';
import 'package:money/appbar/sub_appbar.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/gap.dart';
import 'package:money/constant/size.dart';
import 'package:money/models/lotto_model.dart';

class LottoScreen extends StatefulWidget {
  final int? drawNo;

  const LottoScreen({super.key, this.drawNo});

  @override
  State<LottoScreen> createState() => _LottoScreenState();
}

class _LottoScreenState extends State<LottoScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  late Future<LottoModel> lottoModel;

  void _updateDrawNo() {
    final int drawNo = int.parse(_textEditingController.text);
    setState(() {
      lottoModel = ApiServices.fetchLottoNumbers(drawNo);
    });
  }

  void _fetchLottoNumbers() {
    setState(() {
      lottoModel = ApiServices.fetchLottoNumbers(widget.drawNo!);
    });
  }

  @override
  void initState() {
    super.initState();
    lottoModel = ApiServices.fetchLottoNumbers(0);
    if (widget.drawNo != null) {
      lottoModel = ApiServices.fetchLottoNumbers(widget.drawNo!);
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SubAppbar(
          title: '모의 로또하기',
        ),
        body: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Sizes.size60,
                  child: CupertinoTextField(
                    controller: _textEditingController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _updateDrawNo,
                  ),
                ),
                Gaps.h5,
                const Text(
                  "회",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16,
                  ),
                ),
                CupertinoButton(
                  onPressed: _fetchLottoNumbers,
                  child: Text(
                    "검색",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size14,
                      color: ColorTheme.mainColor,
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: lottoModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const Row();
                }
                return const Text("data");
              },
            ),
          ],
        ),
      ),
    );
  }
}
