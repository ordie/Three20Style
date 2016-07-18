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

// Style
#import "TTStyle.h"

// 实现斜面效果。这个类根据使用者指定的高亮和阴影颜色，以及光源方向，描绘矩形的四个边
@interface TTBevelBorderStyle : TTStyle {
  UIColor*  _highlight;
  UIColor*  _shadow;
  CGFloat   _width;
  NSInteger _lightSource;
}

@property (nonatomic, retain) UIColor*  highlight;
@property (nonatomic, retain) UIColor*  shadow;
@property (nonatomic)         CGFloat   width;
@property (nonatomic)         NSInteger lightSource;

// 如果使用这个初始化函数，320会用默认方式对color进行变换后，设置相应的高亮和阴影颜色
+ (TTBevelBorderStyle*)styleWithColor:(UIColor*)color width:(CGFloat)width next:(TTStyle*)next;

// 如果使用这个初始化函数，则使用用户指定的高亮和阴影效果，以及光源方向设置高亮和阴影颜色
+ (TTBevelBorderStyle*)styleWithHighlight:(UIColor*)highlight
                                   shadow:(UIColor*)shadow
                                    width:(CGFloat)width
                              lightSource:(NSInteger)lightSource
                                     next:(TTStyle*)next;

@end
