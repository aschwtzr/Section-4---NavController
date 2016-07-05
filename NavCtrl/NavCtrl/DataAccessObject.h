//
//  DataAccessObject.h
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/20/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"

@interface DataAccessObject : NSObject

@property (nonatomic, strong) NSMutableArray *companyList; 
@property (nonatomic, strong) Company *apple;
@property (nonatomic, strong) Company *samsung;
@property (nonatomic, strong) Company *tesla;
@property (nonatomic, strong) Company *google;
@property (nonatomic, strong) Company *test;

+ (id)sharedManager;

@end
