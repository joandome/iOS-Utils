//
//  CustomView.h
//  EBox
//
//  Created by Joan Domenech on 31/7/15.
//  Copyright (c) 2015 OT. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@end

@implementation CustomView

-(instancetype)init
{
    self = [super init];
    if (self){
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    if ([self.subviews count] == 0) {
        NSArray *elementsInNib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:Nil options:nil];
        CustomView *loadedView = [elementsInNib lastObject];
        
        loadedView.frame = self.frame;
        loadedView.autoresizingMask = self.autoresizingMask;
        loadedView.translatesAutoresizingMaskIntoConstraints =
        self.translatesAutoresizingMaskIntoConstraints;
        
        for (NSLayoutConstraint *constraint in self.constraints)
        {
            id firstItem = constraint.firstItem;
            if (firstItem == self)
            {
                firstItem = loadedView;
            }
            id secondItem = constraint.secondItem;
            if (secondItem == self)
            {
                secondItem = loadedView;
            }
            [loadedView addConstraint:
             [NSLayoutConstraint constraintWithItem:firstItem
                                          attribute:constraint.firstAttribute
                                          relatedBy:constraint.relation
                                             toItem:secondItem
                                          attribute:constraint.secondAttribute
                                         multiplier:constraint.multiplier
                                           constant:constraint.constant]];
        }
        
        return loadedView;
    }
    return self;
}

@end



