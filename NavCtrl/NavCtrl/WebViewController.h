//
//  WebViewController.h
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "DataAccessObject.h"
#import "Company.h"


@interface WebViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIWebView *productWebDisplay;
@property (nonatomic, retain) NSMutableDictionary *productURLDictionary;
@property (nonatomic, strong) NSMutableArray *companyList;
@property (nonatomic, strong) Company *currentCompany;
@property (nonatomic, strong) Product *currentProduct;

-(void)loadProductURLDictionary; 

@end
