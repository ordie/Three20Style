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

#import "TTShadowStyle.h"

// Style
#import "TTStyleContext.h"
#import "TTShape.h"

// Core
#import "NSStringAdditions.h"
#import "TTCorePreprocessorMacros.h"
#import "TTGlobalCoreRects.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTShadowStyle

@synthesize color   = _color;
@synthesize blur    = _blur;
@synthesize offset  = _offset;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(TTStyle*)next {
	self = [super initWithNext:next];
  if (self) {
    _offset = CGSizeZero;
  }

  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  TT_RELEASE_SAFELY(_color);

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTShadowStyle*)styleWithColor:(UIColor*)color blur:(CGFloat)blur offset:(CGSize)offset
                            next:(TTStyle*)next {
  TTShadowStyle* style = [[[self alloc] initWithNext:next] autorelease];
  style.color = color;
  style.blur = blur;
  style.offset = offset;
  return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(TTStyleContext*)context {
    
  UIEdgeInsets inset = UIEdgeInsetsMake(_blur, _blur, _blur, _blur);
  context.frame = TTRectInset(context.frame, inset);
  context.contentFrame = TTRectInset(context.contentFrame, inset);

  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGContextSaveGState(ctx);

  [context.shape addToPath:context.frame];
  CGContextSetShadowWithColor(ctx, _offset, _blur/2, _color.CGColor);
  CGContextBeginTransparencyLayer(ctx, nil);
    [self logContextFrame:@"TTShadowStyle" rect:context.frame];
  [self.next draw:context];
  CGContextEndTransparencyLayer(ctx);

  CGContextRestoreGState(ctx);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context {
  CGFloat blurSize = round(_blur / 2);
  size.width += _offset.width + (_offset.width ? blurSize : 0) + blurSize*2;
  size.height += _offset.height + (_offset.height ? blurSize : 0) + blurSize*2;

  if (_next) {
    return [self.next addToSize:size context:context];

  } else {
    return size;
  }
}


@end
