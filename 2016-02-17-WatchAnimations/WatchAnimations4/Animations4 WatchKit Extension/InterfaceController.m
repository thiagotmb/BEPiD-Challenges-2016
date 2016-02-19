//
//  InterfaceController.m
//  Animations4 WatchKit Extension
//
//  Created by Thiago-Bernardes on 2/19/16.
//  Copyright © 2016 TMB. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *groupToAnimate;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *crazyAnimatedLabel;
- (IBAction)changeText;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    
    
    [self animateWithDuration:2 animations:^(void){
        [self.crazyAnimatedLabel setAlpha:1];
        [self.crazyAnimatedLabel setText:@"Au revoir"];
        
        [self.groupToAnimate setHeight:0];
        
    }];
    
    
    
    // Configure interface objects here.
}

- (IBAction)changeText {
    
    [self animateWithDuration:2 animations:^(void){
        
        [self.crazyAnimatedLabel setText:@"Sault"];
        [self.groupToAnimate setHeight:200];

    }];

}


@end



