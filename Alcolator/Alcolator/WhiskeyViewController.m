//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Joanna Lingenfelter on 3/28/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController


-(void) updateUserInterface {
    [self.beerPercentTextField resignFirstResponder];
    // first, calculate how much alchol is in all those beers...
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12; // assume they are 12 oz beer bottle
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    // now, calculate the equivalent amount of wine...
    float ouncesInOneShot = 1; // assume 1 oz shot
    float alcholoPercentageOfWhiskey = 0.4; // 40% is average
    float ouncesOfAlcoholPerShot = ouncesInOneShot * alcholoPercentageOfWhiskey;
    float numberOfShotsForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerShot;
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText;
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    if (numberOfShotsForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    
    
    //generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfShotsForEquivalentAlcoholAmount, whiskeyText];
    self.resultLabel.text = resultText;
    self.title = [NSString stringWithFormat:@" Whiskey (%.f shots)", numberOfShotsForEquivalentAlcoholAmount];
    

}

@end
