//
//  ProductWebView.h
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductWebView : UIViewController <UIWebViewDelegate>
@property (retain, nonatomic) IBOutlet UIWebView *productWebDisplay;

@end
