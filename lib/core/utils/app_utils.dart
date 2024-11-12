  import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';

class AppUtils {
  AppUtils._();

  static const kGap12 = SliverToBoxAdapter(child: kBoxHeight12);
  static const kGap16 = SliverToBoxAdapter(child: kBoxHeight16);
  static const kGap8 = SliverToBoxAdapter(child: kBoxHeight8);
  static const kGap4 = SliverToBoxAdapter(child: kBoxHeight4);
  static const kGap10 = SliverToBoxAdapter(child: kBoxHeight10);
  static const kGap20 = SliverToBoxAdapter(child: kBoxHeight20);
  static const kGap22 = SliverToBoxAdapter(child: kBoxHeight22);
  static const kGap24 = SliverToBoxAdapter(child: kBoxHeight24);
  static const kGap54 = SliverToBoxAdapter(child: kBoxHeight54);
  static const kGapBox = SliverToBoxAdapter(child: SizedBox());
  static const kBoxWith4 = SizedBox(width: 4);
  static const kBoxWith8 = SizedBox(width: 8);
  static const kBoxWith12 = SizedBox(width: 12);

  /// divider
  static const kDivider = Divider(
    height: 1,
    thickness: 1,
    color: LightThemeColors.borderColor,
  );
  static const kDivider8Ver = Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Divider(
      height: 1,
      thickness: 1,
      color: LightThemeColors.borderColor,
    ),
  );
  static const kGap16Divider = SliverToBoxAdapter(child: kPadHor16Divider);
  static const kPadHor16Divider = Divider(
    height: 1,
    thickness: 1,
    indent: 16,
    endIndent: 16,
    color: LightThemeColors.borderColor,
  );
  static const kPadHor12Divider = Divider(
    height: 1,
    thickness: 1,
    indent: 12,
    endIndent: 12,
    color: LightThemeColors.borderColor,
  );
  static const kPad60Divider = Padding(
    padding: EdgeInsets.only(left: 60),
    child: Divider(height: 1, thickness: 1),
  );

  /// spacer
  static const kSpacer = Spacer();

  /// Sizedbox
  static const kBox = SizedBox.shrink();
  static const kBoxHeight2 = SizedBox(height: 2);
  static const kBoxHeight3 = SizedBox(height: 3);
  static const kBoxHeight4 = SizedBox(height: 4);
  static const kBoxHeight6 = SizedBox(height: 6);
  static const kBoxHeight8 = SizedBox(height: 8);
  static const kBoxHeight10 = SizedBox(height: 10);
  static const kBoxHeight12 = SizedBox(height: 12);
  static const kBoxHeight14 = SizedBox(height: 14);
  static const kBoxHeight16 = SizedBox(height: 16);
  static const kBoxHeight18 = SizedBox(height: 18);
  static const kBoxHeight20 = SizedBox(height: 20);
  static const kBoxHeight22 = SizedBox(height: 22);
  static const kBoxHeight24 = SizedBox(height: 24);
  static const kBoxHeight26 = SizedBox(height: 26);
  static const kBoxHeight28 = SizedBox(height: 28);
  static const kBoxHeight40 = SizedBox(height: 40);
  static const kBoxHeight42 = SizedBox(height: 42);
  static const kBoxHeight38 = SizedBox(height: 48);
  static const kBoxHeight45 = SizedBox(height: 45);
  static const kBoxHeight48 = SizedBox(height: 48);
  static const kBoxHeight54 = SizedBox(height: 54);
  static const kBoxHeight58 = SizedBox(height: 58);

  static const kBoxHeight30 = SizedBox(height: 30);
  static const kBoxHeight32 = SizedBox(height: 32);
  static const kBoxHeight34 = SizedBox(height: 34);
  static const kBoxHeight36 = SizedBox(height: 36);
  static const kBoxHeight64 = SizedBox(height: 64);
  static const kBoxHeight80 = SizedBox(height: 80);
  static const kBoxHeight84 = SizedBox(height: 84);
  static const kBoxHeight124 = SizedBox(height: 124);
  static const kBoxHeight204 = SizedBox(height: 204);
  static const kBoxWidth2 = SizedBox(width: 2);
  static const kBoxWidth8 = SizedBox(width: 8);
  static const kBoxWidth6 = SizedBox(width: 6);
  static const kBoxWidth4 = SizedBox(width: 4);
  static const kBoxWidth3 = SizedBox(width: 3);
  static const kBoxWidth10 = SizedBox(width: 10);
  static const kBoxWidth12 = SizedBox(width: 12);
  static const kBoxWidth14 = SizedBox(width: 14);
  static const kBoxWidth20 = SizedBox(width: 20);
  static const kBoxWidth16 = SizedBox(width: 16);
  static const kBoxWidth24 = SizedBox(width: 24);
  static const kBoxWidth27 = SizedBox(width: 27);
  static const kBoxWidth30 = SizedBox(width: 30);
  static const kBoxWidth40 = SizedBox(width: 40);
  static const kBoxWidth56 = SizedBox(width: 56);
  static const kBoxWidth95 = SizedBox(width: 95);

  /// padding
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingAll3 = EdgeInsets.all(3);
  static const kPaddingAll2 = EdgeInsets.all(2);
  static const kPaddingAll1 = EdgeInsets.all(1);
  static const kPaddingHorizontal12Vertical8 =
      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8);
  static const kPaddingHorizontal12Vertical10 =
      EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingAll6 = EdgeInsets.all(6);
  static const kPaddingHorizontal16Vertical8 =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll12 = EdgeInsets.all(12);
  static const kPaddingAll10 = EdgeInsets.all(10);
  static const kPaddingAll14 = EdgeInsets.all(14);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingAll18 = EdgeInsets.all(18);
  static const kPaddingAll20 = EdgeInsets.all(20);
  static const kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const kPaddingAll24 = EdgeInsets.all(24);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHorizontal16T0B8 =
      EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 0);
  static const kPaddingHorizontal16T0B16 =
      EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0);
  static const kPaddingHorizontal16T10B16 =
      EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10);
  static const kPaddingHorizontal16T16B24 =
      EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16);
  static const kPaddingHorizontal16T24B24 =
      EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24);
  static const kPaddingHorizontal24T10B54 =
      EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 10);
  static const kPaddingHorizontal32T32B20 =
      EdgeInsets.only(left: 32, right: 32, bottom: 20, top: 32);
  static const kPaddingHorizontal82T0B82 =
      EdgeInsets.only(left: 82, right: 82, bottom: 0, top: 82);
  static const kPaddingLTRB8 = EdgeInsets.only(
    left: 16,
    right: 16,
    top: 16,
    bottom: 8,
  );
  static const kPaddingLTR = EdgeInsets.only(
    left: 16,
    right: 16,
    top: 16,
  );

  static const kPaddingL37 = EdgeInsets.only(
    left: 37,
  );
  static const kPaddingL10 = EdgeInsets.only(
    left: 10,
  );
  static const kPaddingL16 = EdgeInsets.only(
    left: 16,
  );
  static const kPaddingT4R8B4 = EdgeInsets.only(
    right: 8,
    bottom: 4,
    top: 4,
  );
  static const kPaddingT24 = EdgeInsets.only(
    top: 24,
  );

  static const kPaddingR4 = EdgeInsets.only(right: 4);
  static const kPaddingR10 = EdgeInsets.only(right: 10);
  static const kPaddingR16 = EdgeInsets.only(right: 16);
  static const kPaddingLT8RB = EdgeInsets.only(
    left: 16,
    right: 16,
    top: 8,
    bottom: 16,
  );
  static const kPaddingLT0RB = EdgeInsets.only(
    left: 16,
    right: 16,
    top: 0,
    bottom: 16,
  );
  static const kPadding12LTRB0 = EdgeInsets.only(
    left: 12,
    right: 12,
    top: 12,
    bottom: 0,
  );
  static const kPaddingTop10 = EdgeInsets.only(
    top: 10,
  );
  static const kPaddingTop21 = EdgeInsets.only(
    top: 21,
  );
  static const kPaddingTop24 = EdgeInsets.only(
    top: 24,
  );
  static const kPaddingTop28 = EdgeInsets.only(
    top: 28,
  );
  static const kPaddingTop20 = EdgeInsets.only(
    top: 40,
  );

  static const kPaddingL16R12 = EdgeInsets.only(left: 16, right: 12, bottom: 8);
  static const kPaddingL16R12TB8 =
      EdgeInsets.only(left: 16, right: 12, bottom: 8, top: 8);
  static const kPaddingL0R8TB16 =
      EdgeInsets.only(left: 0, right: 8, bottom: 16, top: 16);
  static const kPaddingL16R16T0B24 =
      EdgeInsets.only(left: 16, right: 16, bottom: 24);
  static const kPaddingL16R16T0B16 =
      EdgeInsets.only(left: 16, right: 16, bottom: 16);
  static const kPaddingL16R16T24B16 =
      EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16);
  static const kPaddingL16R16T24B0 =
      EdgeInsets.only(left: 16, right: 16, top: 24);
  static const kPaddingL12R12T12B24 =
      EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 24);
  static const kPaddingLRB20T12 =
      EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 20);
  static const kPaddingL16R16T16B24 =
      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24);
  static const kPaddingL8T8 = EdgeInsets.only(left: 8, top: 8);
  static const kPaddingL60 = EdgeInsets.only(left: 60);
  static const kPaddingT20B24R16 =
      EdgeInsets.only(top: 20, bottom: 24, right: 16);
  static const kPaddingL16T20B24 =
      EdgeInsets.only(left: 16, top: 20, bottom: 24);
  static const kPaddingR20T16B16 =
      EdgeInsets.only(right: 20, top: 16, bottom: 16);

  static const kPaddingHor32Ver20 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const kPaddingHor16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHor4 = EdgeInsets.symmetric(horizontal: 4);
  static const kPaddingHor6 = EdgeInsets.symmetric(horizontal: 6);
  static const kPaddingHor8 = EdgeInsets.symmetric(horizontal: 8);
  static const kPaddingVer12 = EdgeInsets.symmetric(vertical: 12);
  static const kPaddingVer16 = EdgeInsets.symmetric(vertical: 16);
  static const kPaddingVer24 = EdgeInsets.symmetric(vertical: 24);
  static const kPaddingVer44 = EdgeInsets.symmetric(vertical: 44);
  static const kPaddingHor18 = EdgeInsets.symmetric(horizontal: 18);
  static const kPaddingHor20 = EdgeInsets.symmetric(horizontal: 20);
  static const kPaddingHor24 = EdgeInsets.symmetric(horizontal: 24);
  static const kPaddingHor28 = EdgeInsets.symmetric(horizontal: 28);
  static const kPaddingHor12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHor10 = EdgeInsets.symmetric(horizontal: 10);
  static const kPaddingHor32 = EdgeInsets.symmetric(horizontal: 32);
  static const kPaddingHor34 = EdgeInsets.symmetric(horizontal: 34);
  static const kPaddingHor36 = EdgeInsets.symmetric(horizontal: 36);
  static const kPaddingHor38 = EdgeInsets.symmetric(horizontal: 38);
  static const kPaddingHor44 = EdgeInsets.symmetric(horizontal: 44);
  static const kPaddingHor48 = EdgeInsets.symmetric(horizontal: 48);
  static const kPaddingHor73 = EdgeInsets.symmetric(horizontal: 73);
  static const kPaddingVer8 = EdgeInsets.symmetric(vertical: 8);
  static const kPaddingVer10 = EdgeInsets.symmetric(vertical: 10);
  static const kPaddingHor16Ver12 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const kPaddingHor14Ver10 =
      EdgeInsets.symmetric(horizontal: 14, vertical: 10);
  static const kPaddingHor12Ver16 =
      EdgeInsets.symmetric(horizontal: 12, vertical: 16);
  static const kPaddingHor32Ver16 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 16);
  static const kPaddingHor16Ver8 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const kPaddingHor8Ver4 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const kPaddingHor8Ver5 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 5);
  static const kPaddingHor8Ver6 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 6);
  static const kPaddingHor12Ver8 =
      EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const kPaddingVer10Hor16 =
      EdgeInsets.symmetric(vertical: 10, horizontal: 16);
  static const kPaddingVer8Hor18 =
      EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  static const kPaddingVer10Hor12 =
      EdgeInsets.symmetric(vertical: 10, horizontal: 12);
  static const kPaddingVer2Hor4 =
      EdgeInsets.symmetric(vertical: 2, horizontal: 4);
  static const kPaddingVer2Hor8 =
      EdgeInsets.symmetric(vertical: 2, horizontal: 8);
  static const kPaddingVer3Hor10 =
      EdgeInsets.symmetric(vertical: 3, horizontal: 10);
  static const kPaddingVer2Hor10 =
      EdgeInsets.symmetric(vertical: 2, horizontal: 10);
  static const kPaddingVer2Hor6 =
      EdgeInsets.symmetric(vertical: 2, horizontal: 6);
  static const kPaddingVer5Hor2 =
      EdgeInsets.symmetric(vertical: 5, horizontal: 2);
  static const kPaddingVer18Hor16 =
      EdgeInsets.symmetric(vertical: 18, horizontal: 16);
  static const kPaddingVer24Hor16 =
      EdgeInsets.symmetric(vertical: 24, horizontal: 16);
  static const kPaddingVer24Hor8 =
      EdgeInsets.symmetric(vertical: 24, horizontal: 8);
  static const kPaddingVer14Hor12 =
      EdgeInsets.symmetric(vertical: 14, horizontal: 12);
  static const kPaddingVer14Hor16 =
      EdgeInsets.symmetric(vertical: 14, horizontal: 16);
  static const kPaddingVer16Hor24 =
      EdgeInsets.symmetric(vertical: 16, horizontal: 24);
  static const kPaddingVer4Hor12 =
      EdgeInsets.symmetric(vertical: 4, horizontal: 12);
  static const kPaddingVer4Hor16 =
      EdgeInsets.symmetric(vertical: 4, horizontal: 16);
  static const kPaddingVer6Hor12 =
      EdgeInsets.symmetric(vertical: 6, horizontal: 12);
  static const kPaddingVer12Hor14 =
      EdgeInsets.symmetric(vertical: 12, horizontal: 14);
  static const kPaddingVer16Hor14 =
      EdgeInsets.symmetric(vertical: 16, horizontal: 14);
  static const kPaddingVer20Hor22 =
      EdgeInsets.symmetric(vertical: 20, horizontal: 22);
  static const kPaddingVer22Hor12 =
      EdgeInsets.symmetric(vertical: 22, horizontal: 12);
  static const kPaddingVer28Hor28 =
      EdgeInsets.symmetric(vertical: 28, horizontal: 28);
  static const kPaddingVer15Hor5 =
      EdgeInsets.symmetric(vertical: 15, horizontal: 5);

  /// border radius
  static const kRadius = Radius.zero;
  static const kRadius8 = Radius.circular(8);
  static const kRadius6 = Radius.circular(6);
  static const kRadius10 = Radius.circular(10);
  static const kRadius12 = Radius.circular(12);
  static const kRadius16 = Radius.circular(16);
  static const kBorderRadius = BorderRadius.all(Radius.circular(0));
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const kBorderRadius5 = BorderRadius.all(Radius.circular(5));
  static const kBorderRadius6 = BorderRadius.all(Radius.circular(6));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadiusTop8 = BorderRadius.only(
    topLeft: Radius.circular(8),
    topRight: Radius.circular(8),
  );
  static const kBorderRadiusTop10 = BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );
  static const kBorderRadiusTop12 = BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
  );
  static const kBorderRadiusTop16 = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
  );
  static const kBorderRadiusTop24 = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
  static const kBorderRadiusBottom8 = BorderRadius.only(
    bottomLeft: Radius.circular(8),
    bottomRight: Radius.circular(8),
  );
  static const kBorderRadiusBottom10 = BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  );
  static const kBorderRadiusTopBot12 = BorderRadius.only(
    topRight: AppUtils.kRadius12,
    bottomRight: AppUtils.kRadius12,
  );
  static const kBorderRadiusLeftTopBob12 = BorderRadius.only(
    topLeft: AppUtils.kRadius12,
    bottomLeft: AppUtils.kRadius12,
  );
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kBorderRadius14 = BorderRadius.all(Radius.circular(14));
  static const kBorderRadius24 = BorderRadius.all(Radius.circular(24));
  static const kBorderRadius20 = BorderRadius.all(Radius.circular(20));
  static const kBorderRadius32 = BorderRadius.all(Radius.circular(32));
  static const kBorderRadius48 = BorderRadius.all(Radius.circular(48));
  static const kBorderRadius64 = BorderRadius.all(Radius.circular(64));
  static const kBorderRadius100 = BorderRadius.all(Radius.circular(100));
  static const kBoxDecoration = BoxDecoration(
    borderRadius: AppUtils.kBorderRadius24,
    color: LightThemeColors.whiteBackground,
  );
  static const kBoxDecorationNoRadius = BoxDecoration(
    color: LightThemeColors.whiteBackground,
  );

  static const kBoxDecoration12 = BoxDecoration(
    borderRadius: AppUtils.kBorderRadius12,
    color: LightThemeColors.whiteBackground,
  );
  static const kBoxDecoration12Gray = BoxDecoration(
    borderRadius: AppUtils.kBorderRadius12,
    color: LightThemeColors.scaffoldBackgroundColor,
  );
  static BoxDecoration kBoxDecoration12WhiteBorderRed = BoxDecoration(
    borderRadius: AppUtils.kBorderRadius12,
    color: LightThemeColors.whiteBackground,
    border: Border.all(color: LightThemeColors.red),
  );
  static const kBoxDecorationTop24 = BoxDecoration(
    color: LightThemeColors.white,
    borderRadius: AppUtils.kBorderRadiusTop24,
  );
  static const kBoxDecorationTop = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
    color: LightThemeColors.whiteBackground,
  );
  static const kBoxDecorationBottom = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(24),
      bottomRight: Radius.circular(24),
    ),
    color: LightThemeColors.whiteBackground,
  );
}
