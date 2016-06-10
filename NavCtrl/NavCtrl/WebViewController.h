//
//  WebViewController.h
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIWebView *productWebDisplay;
@property (nonatomic, retain) NSMutableDictionary *productURLDictionary;
-(void)loadProductURLDictionary; 

@end
