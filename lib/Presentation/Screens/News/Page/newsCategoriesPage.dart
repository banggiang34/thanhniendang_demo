import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Elements/Buttons/closeButton.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/Page/categorizedNewsPage.dart';
import 'package:thanh_nien_da_nang/Data/News/fetching/fetchDataNewsCategories.dart';
import 'package:thanh_nien_da_nang/Data/News/dataTypes/newsCategoriesData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/Page/subCategorizedNewsPage.dart';

class NewsCategoriesPage extends StatefulWidget {
  const NewsCategoriesPage({Key? key}) : super(key: key);

  @override
  _NewsCategoriesPageState createState() => _NewsCategoriesPageState();
}

class _NewsCategoriesPageState extends State<NewsCategoriesPage> {
  List<NewsCategoriesData> categoryList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories = await fetchNewsCategories();
      setState(() {
        categoryList = fetchedCategories;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _handleRefresh() async {
    await fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'images/newscategories.png',
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        color: Colors.blue.withOpacity(0.5),
                        colorBlendMode: BlendMode.overlay,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.transparent,
                              const Color(0xff0269E9).withOpacity(0.2),
                              const Color(0xff0269E9).withOpacity(0.5),
                              const Color(0xff0269E9).withOpacity(0.6),
                              const Color(0xff0269E9).withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            'Danh mục tin tức',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 25, top: 50),
                        child: CloseBtn(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : categoryList.isEmpty
                            ? const Text('No categories available.')
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: categoryList.length,
                                itemBuilder: (context, index) {
                                  final category = categoryList[index];
                                  return Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      CategoryItem(category),
                                      const Divider(
                                        color: Color(0xffDDDDDD),
                                        thickness: 1.0,
                                        height: 0.0,
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  );
                                },
                              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final NewsCategoriesData category;

  CategoryItem(this.category);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final value = widget.category.value;

    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategorizedNewsPage(
                          value: value,
                          headerTitle: widget.category.category[0],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    widget.category.category[0],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              if (widget.category.category.length > 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      isExpanded ? Icons.remove : Icons.add,
                      color: const Color(0xff0269E9),
                    ),
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                ),
            ],
          ),
        ),
        if (isExpanded) ...[
          for (int i = 1; i < widget.category.category.length; i++)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategorizedNewsPage(
                              value: value,
                              headerTitle: widget.category.category[0],
                            ),
                          ),
                        );
                      },
                      child: Text(
                        widget.category.category[i],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
        ],
      ],
    );
  }
}
