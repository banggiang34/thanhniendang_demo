import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Data/Campaigns/campaignDetailData.dart';
import 'package:thanh_nien_da_nang/Data/Campaigns/fetchDataDetailCampaign.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/categorizedTilesData.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/horizontalTile.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Campaigns/Page/detailCampaignPage.dart';

class GridSectionCampaign extends StatefulWidget {
  final bool loadingBoolean;
  final List<CategorizedTilesData>? dataList;
  final Widget blankPage;

  const GridSectionCampaign({
    super.key,
    required this.loadingBoolean,
    required this.dataList,
    required this.blankPage,
  });

  @override
  State<GridSectionCampaign> createState() => _GridSectionCampaignState();
}

class _GridSectionCampaignState extends State<GridSectionCampaign> {
  Future<CampaignDetailData> fetchCampaignData(int id) async {
    final campaignData = await fetchDataDetailCampaign.fetchDataById(id);
    return campaignData;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
              vertical: 15,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.loadingBoolean
                      ? const CircularProgressIndicator()
                      : (widget.dataList == null || widget.dataList!.isEmpty)
                          ? widget.blankPage
                          : Wrap(
                              spacing: 0,
                              runSpacing: 15,
                              alignment: WrapAlignment.start,
                              children: widget.dataList!.map((campaign) {
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: HorizontalTile(
                                    id: campaign.id,
                                    imagePath: campaign.imagePath,
                                    categoryimagePath:
                                        campaign.categoryimagePath,
                                    category: campaign.category,
                                    title: campaign.title,
                                    date: campaign.date,
                                    todate: campaign.todate,
                                    time: campaign.time,
                                    joined: campaign.joined,
                                    callBack: () {
                                      int id = widget.dataList!.indexWhere(
                                          (element) =>
                                              element.id == campaign.id);
                                      fetchCampaignData(id)
                                          .then((campaignData) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailCampaignPage(
                                              id: id,
                                              campaignData: campaignData,
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
