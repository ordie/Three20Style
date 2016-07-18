//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "TTDefaultStyleSheet.h"

// Style
#import "TTGlobalStyle.h"
#import "TTStyle.h"
#import "UIColorAdditions.h"
#import "TTDefaultStyleSheet+DragRefreshHeader.h"

// - Styles
#import "TTInsetStyle.h"
#import "TTShapeStyle.h"
#import "TTSolidFillStyle.h"
#import "TTTextStyle.h"
#import "TTSolidBorderStyle.h"
#import "TTShadowStyle.h"
#import "TTInnerShadowStyle.h"
#import "TTBevelBorderStyle.h"
#import "TTLinearGradientFillStyle.h"
#import "TTFourBorderStyle.h"
#import "TTLinearGradientBorderStyle.h"
#import "TTReflectiveFillStyle.h"
#import "TTBoxStyle.h"
#import "TTPartStyle.h"
#import "TTContentStyle.h"
#import "TTBlendStyle.h"

// - Shapes
#import "TTRectangleShape.h"
#import "TTRoundedRectangleShape.h"
#import "TTRoundedLeftArrowShape.h"
#import "TTRoundedRightArrowShape.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTDefaultStyleSheet


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)linkText:(UIControlState)state {
  if (state == UIControlStateHighlighted) {
    return
      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-3, -4, -3, -4) next:
      [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:4.5] next:
      [TTSolidFillStyle styleWithColor:[UIColor colorWithWhite:0.75 alpha:1] next:
      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(3, 4, 3, 4) next:
      [TTTextStyle styleWithColor:self.linkTextColor next:nil]]]]];

  } else {
    return
      [TTTextStyle styleWithColor:self.linkTextColor next:nil];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)linkHighlighted {
  return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:4.5] next:
    [TTSolidFillStyle styleWithColor:[UIColor colorWithWhite:0 alpha:0.25] next:nil]];
}



///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)searchTextField {
  return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:TT_ROUNDED] next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(1, 0, 1, 0) next:
    [TTShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.4) blur:0 offset:CGSizeMake(0, 1) next:
    [TTSolidFillStyle styleWithColor:TTSTYLEVAR(backgroundColor) next:
    [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.4) blur:3 offset:CGSizeMake(0, 2) next:
    [TTBevelBorderStyle styleWithHighlight:RGBACOLOR(0,0,0,0.25) shadow:RGBACOLOR(0,0,0,0.4)
                        width:1 lightSource:270 next:nil]]]]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)searchBar {
  UIColor* color = TTSTYLEVAR(searchBarTintColor);
  UIColor* highlight = [color multiplyHue:0 saturation:0 value:1.2];
  UIColor* shadowColor = [color multiplyHue:0 saturation:0 value:0.82];
  return
    [TTLinearGradientFillStyle styleWithColor1:highlight color2:color next:
    [TTFourBorderStyle styleWithTop:nil right:nil bottom:shadowColor left:nil width:1 next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)searchBarBottom {
  UIColor* color = TTSTYLEVAR(searchBarTintColor);
  UIColor* highlight = [color multiplyHue:0 saturation:0 value:1.2];
  UIColor* shadowColor = [color multiplyHue:0 saturation:0 value:0.82];
  return
    [TTLinearGradientFillStyle styleWithColor1:highlight color2:color next:
    [TTFourBorderStyle styleWithTop:shadowColor right:nil bottom:nil left:nil width:1 next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)blackSearchBar {
  UIColor* highlight = [UIColor colorWithWhite:1 alpha:0.05];
  UIColor* mid = [UIColor colorWithWhite:0.4 alpha:0.6];
  UIColor* shadowColor = [UIColor colorWithWhite:0 alpha:0.8];
  return
    [TTLinearGradientFillStyle styleWithColor1:mid color2:shadowColor next:
    [TTFourBorderStyle styleWithTop:nil right:nil bottom:shadowColor left:nil width:1 next:
    [TTFourBorderStyle styleWithTop:nil right:nil bottom:highlight left:nil width:1 next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)tableHeader {
  UIColor* color = TTSTYLEVAR(tableHeaderTintColor);
  UIColor* highlight = [color multiplyHue:0 saturation:0 value:1.1];
  return
    [TTLinearGradientFillStyle styleWithColor1:highlight color2:color next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-1, 0, 0, 0) next:
    [TTFourBorderStyle styleWithTop:nil right:nil bottom:RGBACOLOR(0,0,0,0.15)
                       left:nil width:1 next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)pickerCell:(UIControlState)state {
  if (state & UIControlStateSelected) {
    return
      [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:TT_ROUNDED] next:
      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 1, 1) next:
      [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(79, 144, 255)
                                 color2:RGBCOLOR(49, 90, 255) next:
      [TTFourBorderStyle styleWithTop:RGBCOLOR(53, 94, 255)
                         right:RGBCOLOR(53, 94, 255) bottom:RGBCOLOR(53, 94, 255)
                         left:RGBCOLOR(53, 94, 255) width:1 next:nil]]]];

   } else {
    return
     [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:TT_ROUNDED] next:
     [TTInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 1, 1) next:
     [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(221, 231, 248)
                                color2:RGBACOLOR(188, 206, 241, 1) next:
     [TTLinearGradientBorderStyle styleWithColor1:RGBCOLOR(161, 187, 283)
                        color2:RGBCOLOR(118, 130, 214) width:1 next:nil]]]];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)searchTableShadow {
  return
    [TTLinearGradientFillStyle styleWithColor1:RGBACOLOR(0, 0, 0, 0.18)
                               color2:[UIColor clearColor] next:
    [TTFourBorderStyle styleWithTop:RGBCOLOR(130, 130, 130) right:nil bottom:nil left:nil
                       width: 1 next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)blackBezel {
  return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:10] next:
    [TTSolidFillStyle styleWithColor:RGBACOLOR(0, 0, 0, 0.7) next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)whiteBezel {
  return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:10] next:
    [TTSolidFillStyle styleWithColor:RGBCOLOR(255, 255, 255) next:
    [TTSolidBorderStyle styleWithColor:RGBCOLOR(178, 178, 178) width:1 next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)blackBanner {
  return
    [TTSolidFillStyle styleWithColor:RGBACOLOR(0, 0, 0, 0.5) next:
    [TTFourBorderStyle styleWithTop:RGBCOLOR(0, 0, 0) right:nil bottom:nil left: nil width:1 next:
    [TTFourBorderStyle styleWithTop:[UIColor colorWithWhite:1 alpha:0.2] right:nil bottom:nil
                       left: nil width:1 next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)badgeWithFontSize:(CGFloat)fontSize {
  return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:TT_ROUNDED] next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 1, 1) next:
    [TTShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.8) blur:3 offset:CGSizeMake(0, 4) next:
    [TTReflectiveFillStyle styleWithColor:RGBCOLOR(221, 17, 27) next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -1, -1) next:
    [TTSolidBorderStyle styleWithColor:[UIColor whiteColor] width:2 next:
    [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(1, 7, 2, 7) next:
    [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:fontSize]
                 color:[UIColor whiteColor] next:nil]]]]]]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)miniBadge {
  return [self badgeWithFontSize:12];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)badge {
  return [self badgeWithFontSize:15];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)largeBadge {
  return [self badgeWithFontSize:17];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)tabBar {
  UIColor* border = [TTSTYLEVAR(tabBarTintColor) multiplyHue:0 saturation:0 value:0.7];
  return
    [TTSolidFillStyle styleWithColor:TTSTYLEVAR(tabBarTintColor) next:
    [TTFourBorderStyle styleWithTop:nil right:nil bottom:border left:nil width:1 next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)tabStrip {
  UIColor* border = [TTSTYLEVAR(tabTintColor) multiplyHue:0 saturation:0 value:0.4];
  return
    [TTReflectiveFillStyle styleWithColor:TTSTYLEVAR(tabTintColor) next:
    [TTFourBorderStyle styleWithTop:nil right:nil bottom:border left:nil width:1 next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (TTStyle*)tabGrid {
//  UIColor* color = TTSTYLEVAR(tabTintColor);
//  UIColor* lighter = [color multiplyHue:1 saturation:0.9 value:1.1];
//
//  UIColor* highlight = RGBACOLOR(255, 255, 255, 0.7);
//  UIColor* shadowColor = [color multiplyHue:1 saturation:1.1 value:0.86];
//  return
//    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:8] next:
//    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(0,-1,-1,-2) next:
//    [TTShadowStyle styleWithColor:highlight blur:1 offset:CGSizeMake(0, 1) next:
//    [TTLinearGradientFillStyle styleWithColor1:lighter color2:color next:
//    [TTSolidBorderStyle styleWithColor:shadowColor width:1 next:nil]]]]];
//}
- (TTStyle*)tabGrid {
    UIColor* color = TTSTYLEVAR(tabTintColor);
    UIColor* lighter = [color multiplyHue:1 saturation:0.9 value:1.1];
    
    UIColor* highlight = RGBACOLOR(255, 255, 255, 0.7);
    UIColor* shadowColor = [color multiplyHue:1 saturation:1.1 value:0.86];
    return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:8] next:
     [TTInsetStyle styleWithInset:UIEdgeInsetsMake(0,-1,-1,-2) next:
      [TTShadowStyle styleWithColor:highlight blur:1 offset:CGSizeMake(0, 1) next:
       [TTLinearGradientFillStyle styleWithColor1:lighter color2:color next:
        [TTSolidBorderStyle styleWithColor:shadowColor width:1 next:nil]]]]];
}



///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)tab:(UIControlState)state {
  if (state == UIControlStateSelected) {
    UIColor* border = [TTSTYLEVAR(tabBarTintColor) multiplyHue:0 saturation:0 value:0.7];

    return
      [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithTopLeft:4.5 topRight:4.5
                                                            bottomRight:0 bottomLeft:0] next:
      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(5, 1, 0, 1) next:
      [TTReflectiveFillStyle styleWithColor:TTSTYLEVAR(tabTintColor) next:
      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, 0, -1) next:
      [TTFourBorderStyle styleWithTop:border right:border bottom:nil left:border width:1 next:
      [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(6, 12, 2, 12) next:
      [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:14]  color:TTSTYLEVAR(textColor)
                   minimumFontSize:8 shadowColor:[UIColor colorWithWhite:1 alpha:0.8]
                   shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]];

  } else {
    return
      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(5, 1, 1, 1) next:
      [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(6, 12, 2, 12) next:
      [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:14]  color:[UIColor whiteColor]
                   minimumFontSize:8 shadowColor:[UIColor colorWithWhite:0 alpha:0.6]
                   shadowOffset:CGSizeMake(0, -1) next:nil]]];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)tabRound:(UIControlState)state {
  if (state == UIControlStateSelected) {
    return
//      [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:TT_ROUNDED] next:
//      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(9, 1, 8, 1) next:
//      [TTShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.8) blur:0 offset:CGSizeMake(0, 1) next:
//      [TTReflectiveFillStyle styleWithColor:TTSTYLEVAR(tabBarTintColor) next:
//      [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.3) blur:1 offset:CGSizeMake(1, 1) next:
//      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -1, -1) next:
//      [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(0, 10, 0, 10) next:
//      [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:13]  color:[UIColor whiteColor]
//                   minimumFontSize:8 shadowColor:[UIColor colorWithWhite:0 alpha:0.5]
//                   shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]]];

      [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:TT_ROUNDED] next:
      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(9, 1, 8, 1) next:
      [TTShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.8) blur:0 offset:CGSizeMake(0, 1) next:
      [TTReflectiveFillStyle styleWithColor:TTSTYLEVAR(tabBarTintColor) next:
      [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.3) blur:1 offset:CGSizeMake(1, 1) next:
      [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -1, -1) next:
      [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(0, 10, 0, 10) next:
      [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:13]  color:[UIColor whiteColor]
                   minimumFontSize:8 shadowColor:[UIColor colorWithWhite:0 alpha:0.5]
                   shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]]];
  } else {
    return
      [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(0, 10, 0, 10) next:
      [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:13]  color:self.linkTextColor
                   minimumFontSize:8 shadowColor:[UIColor colorWithWhite:1 alpha:0.9]
                   shadowOffset:CGSizeMake(0, -1) next:nil]];
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)rounded {
  return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:8] next:
    [TTContentStyle styleWithNext:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)postTextEditor {
  return
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(6, 5, 6, 5) next:
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:15] next:
    [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)photoCaption {
  return
    [TTSolidFillStyle styleWithColor:[UIColor colorWithWhite:0 alpha:0.5] next:
    [TTFourBorderStyle styleWithTop:RGBACOLOR(0, 0, 0, 0.5) width:1 next:
    [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(8, 8, 8, 8) next:
    [TTTextStyle styleWithFont: TTSTYLEVAR(photoCaptionFont)
                         color: TTSTYLEVAR(photoCaptionTextColor)
               minimumFontSize: 0
                   shadowColor: TTSTYLEVAR(photoCaptionTextShadowColor)
                  shadowOffset: TTSTYLEVAR(photoCaptionTextShadowOffset)
                 textAlignment: NSTextAlignmentCenter
             verticalAlignment: UIControlContentVerticalAlignmentCenter
                 lineBreakMode: NSLineBreakByTruncatingMiddle
                 numberOfLines: 6
                          next: nil]]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)photoStatusLabel {
  return
    [TTSolidFillStyle styleWithColor:[UIColor colorWithWhite:0 alpha:0.5] next:
    [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(20, 8, 20, 8) next:
    [TTTextStyle styleWithFont:TTSTYLEVAR(tableFont) color:RGBCOLOR(200, 200, 200)
                 minimumFontSize:0 shadowColor:[UIColor colorWithWhite:0 alpha:0.9]
                 shadowOffset:CGSizeMake(0, -1) next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)pageDot:(UIControlState)state {
  if (state == UIControlStateSelected) {
    return [self pageDotWithColor:[UIColor whiteColor]];

  } else {
    return [self pageDotWithColor:RGBCOLOR(77, 77, 77)];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)launcherButton:(UIControlState)state {
  return
    [TTPartStyle styleWithName:@"image" style:TTSTYLESTATE(launcherButtonImage:, state) next:
    [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:11] color:RGBCOLOR(180, 180, 180)
                 minimumFontSize:11 shadowColor:nil
                 shadowOffset:CGSizeZero next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)launcherCloseButton:(UIControlState)state {
  return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:TT_ROUNDED] next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 1, 1) next:
    [TTShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.5) blur:2 offset:CGSizeMake(0, 3) next:
    [TTSolidFillStyle styleWithColor:[UIColor blackColor] next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -1, -1) next:
    [TTSolidBorderStyle styleWithColor:[UIColor whiteColor] width:2 next:
    [TTPartStyle styleWithName:@"image" style:TTSTYLE(launcherCloseButtonImage:) next:
    nil]]]]]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)launcherPageDot:(UIControlState)state {
  return [self pageDot:state];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)textBar {
  return
    [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(237, 239, 241)
                               color2:RGBCOLOR(206, 208, 212) next:
    [TTFourBorderStyle styleWithTop:RGBCOLOR(187, 189, 190)
                              right:nil bottom:nil left:nil width:1 next:
    [TTFourBorderStyle styleWithTop:RGBCOLOR(255, 255, 255)
                              right:nil bottom:nil left:nil width:1
                       next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)textBarFooter {
  return
    [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(206, 208, 212)
                               color2:RGBCOLOR(184, 186, 190) next:
    [TTFourBorderStyle styleWithTop:RGBCOLOR(161, 161, 161)
                              right:nil bottom:nil left:nil width:1 next:
    [TTFourBorderStyle styleWithTop:RGBCOLOR(230, 232, 235)
                              right:nil bottom:nil left:nil width:1
                       next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)textBarTextField {
  return
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(6, 0, 3, 6) next:
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:12.5] next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(1, 0, 1, 0) next:
    [TTShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.4) blur:0 offset:CGSizeMake(0, 1) next:
    [TTSolidFillStyle styleWithColor:TTSTYLEVAR(backgroundColor) next:
    [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.4) blur:3 offset:CGSizeMake(0, 2) next:
    [TTBevelBorderStyle styleWithHighlight:RGBACOLOR(0,0,0,0.25) shadow:RGBACOLOR(0,0,0,0.4)
                        width:1 lightSource:270 next:nil]]]]]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)textBarPostButton:(UIControlState)state {
  UIColor* fillColor = state == UIControlStateHighlighted
                       ? RGBCOLOR(19, 61, 126)
                       : RGBCOLOR(31, 100, 206);
  UIColor* textColor = state == UIControlStateDisabled
                       ? RGBACOLOR(255, 255, 255, 0.5)
                       : RGBCOLOR(255, 255, 255);
  return
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:13] next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(2, 0, 1, 0) next:
    [TTShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.5) blur:0 offset:CGSizeMake(0, 1) next:
    [TTReflectiveFillStyle styleWithColor:fillColor next:
    [TTLinearGradientBorderStyle styleWithColor1:fillColor
                                 color2:RGBCOLOR(14, 83, 187) width:1 next:
    [TTInsetStyle styleWithInset:UIEdgeInsetsMake(0, -1, 0, -1) next:
    [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(8, 9, 8, 9) next:
    [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:15]
                 color:textColor shadowColor:[UIColor colorWithWhite:0 alpha:0.3]
                 shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public colors


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Common styles


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)textColor {
  return [UIColor blackColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)highlightedTextColor {
  return [UIColor whiteColor];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)backgroundTextColor {
	return [UIColor whiteColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)font {
  return [UIFont systemFontOfSize:14];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)backgroundColor {
  return [UIColor whiteColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)navigationBarTintColor {
  return RGBCOLOR(119, 140, 168);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)toolbarTintColor {
  return RGBCOLOR(109, 132, 162);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchBarTintColor {
  return RGBCOLOR(200, 200, 200);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Tables


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tablePlainBackgroundColor {
  return nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tablePlainCellSeparatorColor {
	return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCellSeparatorStyle)tablePlainCellSeparatorStyle {
	return UITableViewCellSeparatorStyleSingleLine;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableGroupedBackgroundColor {
  return [UIColor groupTableViewBackgroundColor];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableGroupedCellSeparatorColor {
	return nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCellSeparatorStyle)tableGroupedCellSeparatorStyle {
	return [self tablePlainCellSeparatorStyle];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchTableBackgroundColor {
  return RGBCOLOR(235, 235, 235);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchTableSeparatorColor {
  return [UIColor colorWithWhite:0.85 alpha:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Table Items


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)linkTextColor {
  return RGBCOLOR(87, 107, 149);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)timestampTextColor {
  return RGBCOLOR(36, 112, 216);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)moreLinkTextColor {
  return RGBCOLOR(36, 112, 216);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Table Headers


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderTextColor {
  return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderShadowColor {
  return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)tableHeaderShadowOffset {
  return CGSizeMake(0, 1);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderTintColor {
  return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Photo Captions


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)photoCaptionTextColor {
  return [UIColor whiteColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)photoCaptionTextShadowColor {
  return [UIColor colorWithWhite:0 alpha:0.9];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)photoCaptionTextShadowOffset {
  return CGSizeMake(0, 1);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Unsorted


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)screenBackgroundColor {
  return [UIColor colorWithWhite:0 alpha:0.8];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableActivityTextColor {
  return RGBCOLOR(99, 109, 125);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableErrorTextColor {
  return RGBCOLOR(96, 103, 111);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableSubTextColor {
  return RGBCOLOR(79, 89, 105);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableTitleTextColor {
  return RGBCOLOR(99, 109, 125);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tabBarTintColor {
  return RGBCOLOR(119, 140, 168);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tabTintColor {
  return RGBCOLOR(228, 230, 235);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)messageFieldTextColor {
  return [UIColor colorWithWhite:0.5 alpha:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)messageFieldSeparatorColor {
  return [UIColor colorWithWhite:0.7 alpha:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)thumbnailBackgroundColor {
  return [UIColor colorWithWhite:0.95 alpha:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)postButtonColor {
  return RGBCOLOR(117, 144, 181);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public fonts


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)buttonFont {
  return [UIFont boldSystemFontOfSize:12];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableFont {
  return [UIFont boldSystemFontOfSize:17];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableSmallFont {
  return [UIFont boldSystemFontOfSize:15];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableTitleFont {
  return [UIFont boldSystemFontOfSize:13];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableTimestampFont {
  return [UIFont systemFontOfSize:13];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableButtonFont {
  return [UIFont boldSystemFontOfSize:13];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableSummaryFont {
  return [UIFont systemFontOfSize:17];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableHeaderPlainFont {
  return [UIFont boldSystemFontOfSize:16];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableHeaderGroupedFont {
  return [UIFont boldSystemFontOfSize:18];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat) tableBannerViewHeight {
  return 22;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)photoCaptionFont {
  return [UIFont boldSystemFontOfSize:12];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)messageFont {
  return [UIFont systemFontOfSize:15];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)errorTitleFont {
  return [UIFont boldSystemFontOfSize:18];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)errorSubtitleFont {
  return [UIFont boldSystemFontOfSize:12];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)activityLabelFont {
  return [UIFont systemFontOfSize:17];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)activityBannerFont {
  return [UIFont boldSystemFontOfSize:11];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCellSelectionStyle)tableSelectionStyle {
  return UITableViewCellSelectionStyleBlue;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// private


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)toolbarButtonColorWithTintColor:(UIColor*)color forState:(UIControlState)state {
  if (state & UIControlStateHighlighted || state & UIControlStateSelected) {
    if (color.value < 0.2) {
      return [color addHue:0 saturation:0 value:0.2];

    } else if (color.saturation > 0.3) {
      return [color multiplyHue:1 saturation:1 value:0.4];

    } else {
      return [color multiplyHue:1 saturation:2.3 value:0.64];
    }

  } else {
    if (color.saturation < 0.5) {
      return [color multiplyHue:1 saturation:1.6 value:0.97];

    } else {
      return [color multiplyHue:1 saturation:1.25 value:0.75];
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)toolbarButtonTextColorForState:(UIControlState)state {
  if (state & UIControlStateDisabled) {
    return [UIColor colorWithWhite:1 alpha:0.4];

  } else {
    return [UIColor whiteColor];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)selectionFillStyle:(TTStyle*)next {
  return [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(5,140,245)
                                    color2:RGBCOLOR(1,93,230) next:next];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)pageDotWithColor:(UIColor*)color {
  return
    [TTBoxStyle styleWithMargin:UIEdgeInsetsMake(0,0,0,10) padding:UIEdgeInsetsMake(6,6,0,0) next:
    [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:2.5] next:
    [TTSolidFillStyle styleWithColor:color next:nil]]];
}


@end

