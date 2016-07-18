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
#import "TTShadowStyle.h"

// 绘制内阴影，这个style先构建一个比当前形状稍大的同样形状（类似于当前的形状被一个粗线条描边），
// 然后用带阴影的方式填充这个形状，并用当前形状区域剪切。效果就是基本上只留下了左上角的阴影部分。
@interface TTInnerShadowStyle : TTShadowStyle
@end
