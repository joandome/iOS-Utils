iOS-Utils
=========


UIImageView+AnimationImages
===========================

UIImageView has a property called "animationImages". This property sets an array of UIImages that will be changing through an animation. This works fine if all UIImages have the same size as the UIImageView. However the animation don't make any rezise, even if you use "resizableImageWithCapInsets" for each UIImage before setting "animationImages". So, I create this category of UIImageView with a procedure, similar to setter "setAnimationImages", but inside it all UIImages are resized by UIImageView frame. Also the "ContentMode" property of UIImageView is set as "UIViewContentModeScaleToFill". 

Finally, it's very important that every UIImage previously sets "resizableImageWithCapInsets" to know how to resize each one.

Example:

 #import "UIImageView+AnimationImages.h"

UIImage *img1 = [[UIImage imageNamed:@"image1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 150, 20, 150)];
UIImage *img2 = [[UIImage imageNamed:@"image2.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 150, 20, 150)];

[self.imgView setAnimationImagesWithUIImageViewSize:[NSArray arrayWithObjects:img1, img2, nil]];

self.imgView.animationDuration = 1;

[self.imgView startAnimating];


