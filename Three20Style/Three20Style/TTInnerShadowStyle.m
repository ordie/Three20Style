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

#import "TTInnerShadowStyle.h"

// Style
#import "TTStyleContext.h"
#import "TTShape.h"

// Core
#import "NSStringAdditions.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTInnerShadowStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(TTStyleContext*)context {
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGContextSaveGState(ctx);

  [context.shape addToPath:context.frame];
  CGContextClip(ctx);

  [context.shape addInverseToPath:context.frame];
  [[UIColor blueColor] setFill];

  // Due to a bug in OS versions 3.2 and 4.0, the shadow appears upside-down. It pains me to
  // write this, but a lot of research has failed to turn up a way to detect the flipped shadow
  // programmatically
  float shadowYOffset = -_offset.height;
  NSString *osVersion = [UIDevice currentDevice].systemVersion;
  if ([osVersion versionStringCompare:@"3.2"] != NSOrderedAscending) {
    shadowYOffset = _offset.height;
  }

    // 注意阴影和填充的顺序不能颠倒，否则没有阴影效果。从这里可以看出，阴影是一个附加效果，它必须依赖之前的
    // 描边或填充动作
  CGContextSetShadowWithColor(ctx, CGSizeMake(_offset.width, shadowYOffset), _blur,
                              _color.CGColor);
  CGContextEOFillPath(ctx);
  CGContextRestoreGState(ctx);

  return [self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context {
  if (_next) {
    return [self.next addToSize:size context:context];

  } else {
    return size;
  }
}


@end
