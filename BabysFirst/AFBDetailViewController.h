//
//  AFBDetailViewController.h
//  BabysFirst
//
//  Created by Austen McDonald on 6/4/14.
//  Copyright (c) 2014 Afterburner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFBDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
