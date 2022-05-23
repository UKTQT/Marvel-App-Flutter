import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/extensions/padding_extension/padding_extension.dart';

class HomeSeries extends StatelessWidget {
  final seriesViewModel;

  const HomeSeries({
    Key? key,
    required this.seriesViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: context.mediumWidthPadding2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Series',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'All Series >>',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              return !seriesViewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          seriesViewModel.seriesItems!.isNotEmpty ? 20 : 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              // borderRadius: BorderRadius.circular(15.0),
                            ),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: CachedNetworkImage(
                                placeholder: (context, index) {
                                  return const CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                },
                                imageUrl:
                                    '${seriesViewModel.seriesItems![index].thumbnail!.path}.${seriesViewModel.seriesItems![index].thumbnail!.extension}',
                                errorWidget: (context, url, error) =>
                                    const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
