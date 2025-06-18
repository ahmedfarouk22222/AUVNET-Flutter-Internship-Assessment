class BannerEntity {
  final String imageUrl;
  final String? redirectUrl; // optional, in case clicking the banner redirects somewhere

  const BannerEntity({
    required this.imageUrl,
    this.redirectUrl,
  });
}
