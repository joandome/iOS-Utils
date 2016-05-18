//
//  UIViewController+Utils.m
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)

- (CGRect) maximumUsableFrame
{
    return [self maximumUsableFrameWithInterfaceOrientation:self.interfaceOrientation];
}

- (CGRect) maximumUsableFrameWithInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    static CGFloat const kNavigationBarPortraitHeight = 44;
    static CGFloat const kNavigationBarLandscapeHeight = 34;
    static CGFloat const kToolBarHeight = 49;
    
    // Start with the screen size minus the status bar if present
    CGRect maxFrame = [UIScreen mainScreen].applicationFrame;
    
    // If the orientation is landscape left or landscape right then swap the width and height
    if (UIInterfaceOrientationIsLandscape(orientation) &&
        [[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedDescending) {
        CGFloat temp = maxFrame.size.height;
        maxFrame.size.height = maxFrame.size.width;
        maxFrame.size.width = temp;
    }
    
    // Take into account if there is a navigation bar present and visible (note that if the NavigationBar may
    // not be visible at this stage in the view controller's lifecycle.  If the NavigationBar is shown/hidden
    // in the loadView then this provides an accurate result.  If the NavigationBar is shown/hidden using the
    // navigationController:willShowViewController: delegate method then this will not be accurate until the
    // viewDidAppear method is called.
    if (self.navigationController) {
        if (self.navigationController.navigationBarHidden == NO) {
            
            // Depending upon the orientation reduce the height accordingly
            if (UIInterfaceOrientationIsLandscape(orientation)) {
                maxFrame.size.height -= kNavigationBarLandscapeHeight;
            }
            else {
                maxFrame.size.height -= kNavigationBarPortraitHeight;
            }
        }
    }
    
    // Take into account if there is a toolbar present and visible
    if (self.tabBarController) {
        if (!self.tabBarController.view.hidden) maxFrame.size.height -= kToolBarHeight;
    }
    return maxFrame;
}

-(void)presentViewControllerWithNavigationController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion
{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navController animated:animated completion:^{
        if (completion)
            completion();
    }];
}

@end
