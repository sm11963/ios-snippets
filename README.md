ios-snippets
============

Place to put the useful snippets I find or create

# Elliptical Fade View
Class I created to make an elliptical shadow behind white text on possibly light background. Example usage:
```objc
NSArray *colors = @[(id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4].CGColor,(id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor, (id)[UIColor clearColor].CGColor];
BWEllipticalFadeView *view = [[BWEllipticalFadeView alloc] initWithFrame:CGRectMake(0, 0, 150, 40) colors:colors solidEllipseWidth:20];
view.backgroundColor = [UIColor clearColor];
```
