//
//  UIViewController+Utils.h
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

- (CGRect) maximumUsableFrame;
- (CGRect) maximumUsableFrameWithInterfaceOrientation:(UIInterfaceOrientation)orientation;
-(void)presentViewControllerWithNavigationController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion;

@end
