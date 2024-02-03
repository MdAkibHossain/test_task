import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonNetworkImageWidget extends StatelessWidget {
  final String imageLink;

  const CommonNetworkImageWidget({
    required this.imageLink,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return builtItemImageContainer(imageLink);
  }

  Widget builtItemImageContainer(String? imageName) {
    String imageUrl = "";
    if (imageName != null && imageName.isNotEmpty) {
      imageUrl = imageName;
    }
    bool validURL = Uri.parse(imageUrl).isAbsolute;

    try {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: (validURL && imageUrl.isNotEmpty)
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        // borderRadius: const BorderRadius.all(
                        //   Radius.circular(5),
                        // ),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.contain),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                        padding: const EdgeInsets.all(0),
                        child:
                            const Center(child: CupertinoActivityIndicator())),
                    errorWidget: (context, url, error) => Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.all(0),
                        child: Icon(Icons.error)),
                  )
                : Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/placeholder_image.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
          ));
    } catch (error) {
      log("error : $error");
      return Container(
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          image: DecorationImage(
              image: AssetImage("assets/images/placeholder_image.png"),
              fit: BoxFit.cover),
        ),
      );
    }
  }
}
