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

// 这个样式首先用color绘制底色，然后在上面覆盖一层半透明渐变层，用来达到苹果的玻璃按钮效果
// 但这个效果无法调整
@interface TTReflectiveFillStyle : TTStyle {
  UIColor*  _color;
  BOOL      _withBottomHighlight;
}

@property (nonatomic, retain) UIColor* color;
@property (nonatomic, assign) BOOL     withBottomHighlight;

+ (TTReflectiveFillStyle*)styleWithColor:(UIColor*)color next:(TTStyle*)next;
+ (TTReflectiveFillStyle*)styleWithColor:(UIColor*)color
                     withBottomHighlight:(BOOL)withBottomHighlight next:(TTStyle*)next;

@end
