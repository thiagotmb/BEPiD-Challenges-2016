//
//  InterfaceController.m
//  Animations2 WatchKit Extension
//
//  Created by Thiago-Bernardes on 2/19/16.
//  Copyright © 2016 TMB. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *iGroup;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *image;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self.image setImageNamed:@"roda-"];
    
    NSRange imageRange = {.location = 0, .length = 4};
    
    [self.image startAnimatingWithImagesInRange:imageRange duration:0 repeatCount:1];
    
    
    [self animateWithDuration:1 animations:^(void){
        
        [self.iGroup setHeight:0];
        [self.image startAnimating];
        
    }];
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW,  (int64_t)(2.5 * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^(void){
        [self bye];
    });
    // Configure interface objects here.
}

-(void)bye{
    [self animateWithDuration:2 animations:^(void){
        
        [self.iGroup setHeight:300];
        [self.image stopAnimating];
        
    }];
    
    
}



@end



