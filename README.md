# Three20Style
一个基于Quartz 2D绘图API的类框架，是Facebook Three20项目的一部分。
### 介绍
Three20是Facebook的一个开源框架，由于过于庞大和复杂已不再维护。但其中某些部分相对独立并且侵入性也比较小，适合做成库。Three20Style就是其中一部分。

### 设计目标
Quartz 2D提供的API基本上都是纯C形式的，没有面向对象的封装，使用起来比较繁琐。如果想使用UI类来绘制路径，貌似只有UIBezierPath可用。但想实现更复杂一些的功能，例如渐变、阴影等，仍然需要C方式的API。Three20Style在一定程度上解决了这个问题，它用面向对象的形式封装了各种常用的形状（路径）、渐变和阴影，并通过一种很便捷的方式将他们组合起来，从而简化了2D绘图操作。

### 设计思想
1 将各种Quartz 2D效果（路径、渐变、阴影等）抽象为TTStyle类的子类，这些子类大致分为几种：

	TTShapeStyle  
任何绘图效果都是以Shape为基础的，这里的Shape对应Quartz 2D中的Path。在Three20Style中，形状单独有一组类来描述，基类是TTShape，而TTShapeStyle则可以用一个TTShape对象初始化。在绘制任何效果之前，一般都需要用TTShapeStyle确定一个形状，在这个形状上绘制效果。  

	TTBevelBorderStyle  
	TTBlendStyle  
	TTFourBorderStyle  
	TTHighlightBorderStyle  
	TTInnerShadowStyle  
	TTLinearGradientBorderStyle  
	TTLinearGradientFillStyle  
	TTMaskStyle  
	TTShadowStyle  
	TTSolidBorderStyle  
	TTSolidFillStyle  
	TTReflectiveFillStyle  
这些style实现各种效果，例如阴影、颜色混合、渐变填充等。具体作用可以参考头文件中的注释。

	TTBoxStyle  
	TTContentStyle  
	TTInsetStyle  
这些style不绘制具体的效果，但会影响后续style绘制的区域。

	TTPartStyle  
这个style比较特殊，可以在当前style链绘制完毕后再叠加另外一套style，详细介绍见头文件。

	TTTextStyle  
这个style可以绘制一些文字。


2 因为一个复杂效果经常是由一组简单效果叠加而成的，所以TTStyle类被实现为一个链表，这样就可以构造一个style链，。这有些类似于Photoshop的图层概念，一个复杂的图片是由很多图层叠加而成。绘制的时候，Three20Style根据链表顺序，逐层绘制style。


```objective-c
@class TTStyleContext;

@interface TTStyle : NSObject {
  TTStyle* _next;
}

@property (nonatomic, retain) TTStyle* next;

- (id)initWithNext:(TTStyle*)next;

- (TTStyle*)next:(TTStyle*)next;

- (void)draw:(TTStyleContext*)context;

- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size;
- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context;

- (void)addStyle:(TTStyle*)style;

- (id)firstStyleOfClass:(Class)cls;
- (id)styleForPart:(NSString*)name;

- (void)logContextFrame:(NSString *)className rect:(CGRect)rect;
@end
```

例如下面的代码生成一个有两个圆角的矩形style：

```objective-c
// Partially rounded rectangle
[TTShapeStyle styleWithShape:  // 构造第一个shape style：一个圆角矩形，其中两个角的半径为0（直角）
 [TTRoundedRectangleShape shapeWithTopLeft:0 topRight:0 bottomRight:10 bottomLeft:10] next:
  [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:  // 构造第二个style：用白色填充这个圆角矩形
   [TTSolidBorderStyle styleWithColor:black width:1 next:nil]]],  // 构造第三个style：围绕这个圆角矩形画一个像素宽的边
```
  效果：![](https://github.com/ordie/Three20Style/blob/master/Resources/partially_rounded_rectangle.png)

3 TTView类使用了TTStyle进行绘制，这是Three20Style框架唯一有侵入性的地方，即要想使用各种style效果，你的view必须继承自TTView：

```objective-c
@interface TTView : UIView <TTStyleDelegate> {
  TTStyle*  _style;
  TTLayout* _layout;
}
```
  当然，不用TTView也是可以的，后面会介绍一种方法，但稍微麻烦，不如直接用TTView方便。

### 使用
使用起来非常简单，首先需要创建一个TTView，然后给它的style属性赋值即可：

```objective-c
// 下面代码创建一个白色背景，黑色边框（边框宽度为1单位宽度）
CGRect frame = CGRectMake(50, 50, 150, 50);
TTView* view = [[TTView alloc] initWithFrame:frame];
view.style = [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:
              [TTSolidBorderStyle styleWithColor:[UIColor blackColor] width:1 next:nil]];
```



