//
//  ViewController.h
//  Alcolator
//
//  Created by Joanna Lingenfelter on 3/27/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (void) buttonPressed: (UIButton *)sender;
- (void) updateTabbedBar;

@end

