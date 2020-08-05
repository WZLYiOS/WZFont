<center><font face="黑体" size=5>我主良缘字体组件库</font></center>


## Requirements:
- **iOS** 8.0+
- Xcode 10.0+
- Swift 5.0+


## Installation Cocoapods
<pre><code class="ruby language-ruby">pod 'WZFont', '~> 1.2.1'</code></pre>


## Demo
![demo](http://139.224.164.17:4000/WZKit/WZFont/raw/master/demo.png)

## Usage 
### 1.枚举类型
```Objective-C
/**
 字体类型
 (注解: 一般一个字体绝对是一个文件,比如下面的DIN,DIN包含了粗体，DIN包含了中黑,这样子是分开两个文件,
 然后某中字体的如果是常规的话，名字就是这个字体的名字)
 - WZFontDINBold: DINBold
 - WZFontDINMedium: DINMedium
 - WZFontHelveticaLT: HelveticaLT
 - WZFontMittelschrift: Mittelschrift
 - WZFontSourceHanSerifCN: SourceHanSerifCN
 - WZFontTT0144M: FontTT0144M
 - WZFontwzlyhw: wzlyhw(UI胡伟:自制字体)
 */
typedef NS_ENUM(NSInteger, WZFontType) {
    WZFontDINBold = 0,
    WZFontDINMedium,
    WZFontHelveticaLT,
    WZFontMittelschrift,
    WZFontSourceHanSerifCN,
    WZFontTT0144M,
    WZFontwzlyhw
};
```

### 2. 设置相关字体大小
```Objective-C

/**
 设置DINBold字体大小

 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setDINBoldForSize: (CGFloat)fontSize;

/**
 设置DINMedium字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setDINMediumForSize: (CGFloat)fontSize;


/**
 设置HelveticaLT字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setHelveticaLTForSize: (CGFloat)fontSize;


/**
 设置Mittelschrift字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setMittelschriftForSize: (CGFloat)fontSize;


/**
 设置SourceHanSerifCN字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setSourceHanSerifCNForSize: (CGFloat)fontSize;


/**
 设置Wzlyhw字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setWzlyhwForSize: (CGFloat)fontSize;

/**
 设置字体类型大小

 @param type 类型
 @param fontSize 字体大小
 @return 字体
 */
+(nullable UIFont*)setFontType: (WZFontType)type size:(CGFloat)fontSize;


/**
 自定义字体类型大小

 @param fontName 字体名称
 @param fontSize 字体大小
 @return 字体
 */
+ (nullable UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize;
```

## License
WZFont is released under an MIT license. See [LICENSE](LICENSE) for more information.
