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

// CGContextSetShadow和CGContextSetShadowWithColor函数中的blur参数值为模糊度，
// 实际上blur*2（或blur*1.5？看320代码中好像用的是1.5倍，有待研究）是模糊区域的像素宽度。
// 从这个style开始的后续style的所有绘制都会在一个透明层上进行，然后这个透明层上的所有形状
// 会被当做一个整体，最后在这个整体上绘制阴影
@interface TTShadowStyle : TTStyle {
  UIColor*  _color;
  CGFloat   _blur;
  CGSize    _offset;
}

@property (nonatomic, retain) UIColor*  color;
@property (nonatomic)         CGFloat   blur;
@property (nonatomic)         CGSize    offset;

+ (TTShadowStyle*)styleWithColor:(UIColor*)color blur:(CGFloat)blur offset:(CGSize)offset
                            next:(TTStyle*)next;

@end
