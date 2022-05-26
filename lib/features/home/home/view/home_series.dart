import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../viewModel/home_view_model.dart';

import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../series/viewModel/series_view_model.dart';

Column homeSeries(
    {required BuildContext context, required HomeViewModel homeViewModel}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.mediumWidthPadding2),
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
            return homeViewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeViewModel.seriesItems!.isNotEmpty ? 20 : 0,
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
                                  '${homeViewModel.seriesItems![index].thumbnail!.path}.${homeViewModel.seriesItems![index].thumbnail!.extension}',
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
