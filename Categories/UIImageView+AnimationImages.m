#import "UIImageView+AnimationImages.h"

@implementation UIImageView (AnimationImages)

-(void)setAnimationImagesWithUIImageViewSize:(NSArray *)images
{
    CGSize newSize = self.frame.size;
    
    NSMutableArray *newImages = [[NSMutableArray alloc] init];
    
    for (UIImage *img in images)
    {
        UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
        [img drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [newImages addObject:newImg];
    }
    
    self.animationImages = newImages;
    self.contentMode = UIViewContentModeScaleToFill;
}

@end
