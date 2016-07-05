//
//  DataAccessObject.m
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/20/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

/*
THE IMPORTANCE OF THE SINGLETON
 
The singleton design pattern allows for the persistence of data across many views while ensuring the data used is consistent. 
 
*/

#import "DataAccessObject.h"

static DataAccessObject *sharedMyManager = nil;

@implementation DataAccessObject

#pragma mark Singleton Methods
+ (id)sharedManager {
    @synchronized(self) {
        if(sharedMyManager == nil)
            sharedMyManager = [[super allocWithZone:NULL] init];
    }
    return sharedMyManager;
}



+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedManager] retain];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)retain {
    return self;
}
- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}
- (oneway void)release {
    // never release
}
- (id)autorelease {
    return self;
}
- (id)init {
    if (self = [super init]) {
        //underscore when init because it hasn't been created

        // Apple //
        
        _apple = [[Company alloc] init];
        
        _apple.name = @"Apple mobile devices";
        _apple.stockSymbol = @"AAPL";
        _apple.imageName = @"img-companyLogo_Apple.png";
        
        Product *iPad = [[Product alloc] init];
        Product *iPodTouch = [[Product alloc] init];
        Product *iPhone = [[Product alloc] init];
        
        iPad.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=ipad+Apple";
        iPad.name = @"iPad";
        iPodTouch.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=ipod+touch+Apple";
        iPodTouch.name = @"iPod Touch";
        iPhone.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=iphone+Apple";
        iPhone.name = @"iPhone";
        
        _apple.products = [[NSMutableArray alloc] init];
        [_apple.products addObject:iPad];
        [_apple.products addObject:iPodTouch];
        [_apple.products addObject:iPhone];
        
        
        // Samsung //
        _samsung = [[Company alloc] init];
        
        _samsung.name = @"Samsung mobile devices";
        _samsung.stockSymbol = @"SSNLF";
        _samsung.imageName = @"img-companyLogo_Samsung.png";
        
        Product *galaxyS7 = [[Product alloc] init];
        Product *galaxyNote = [[Product alloc] init];
        Product *galaxyTab = [[Product alloc] init];
        
        galaxyS7.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=Galaxy+S7+samsung";
        galaxyS7.name = @"Galaxy S7";
        galaxyNote.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=Galaxy+Note+samsung";
        galaxyNote.name = @"Galaxy Note";
        galaxyTab.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=Galaxy+Tab+samsung";
        galaxyTab.name = @"Galaxy Tab";
        
        _samsung.products = [[NSMutableArray alloc] init];
        [_samsung.products addObject:galaxyS7];
        [_samsung.products addObject:galaxyNote];
        [_samsung.products addObject:galaxyTab];
        
        
        // Google //
        _google = [[Company alloc] init];
        
        _google.name = @"Google mobile devices";
        _google.stockSymbol = @"GOOGL";
        _google.imageName = @"img-companyLogo_Google.png";
        
        Product *nexus5X = [[Product alloc] init];
        Product *nexus6P = [[Product alloc] init];
        Product *pixelC = [[Product alloc] init];
        
        nexus5X.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=Nexus+5x";
        nexus5X.name = @"Nexus 5X";
        nexus6P.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=nexus+6p";
        nexus6P.name = @"Nexus 6P";
        pixelC.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=pixel+c";
        pixelC.name = @"Pixel C";
        
        _google.products = [[NSMutableArray alloc] init];
        [_google.products addObject:nexus5X];
        [_google.products addObject:nexus6P];
        [_google.products addObject:pixelC];
        
        _tesla = [[Company alloc] init];
        
        _tesla.name = @"Tesla 'mobile devices'";
        _tesla.stockSymbol = @"TSLA";
        _tesla.imageName = @"img-companyLogo_Tesla.png";
        
        Product *modelS = [[Product alloc] init];
        Product *modelX = [[Product alloc] init];
        Product *model3 = [[Product alloc] init];
        
        modelS.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=Model+S+Tesla";
        modelS.name = @"Model S";
        modelX.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=Model+X+Tesla";
        modelX.name = @"Model X";
        model3.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=Model+3+Tesla";
        model3.name = @"Model 3";
        
        _tesla.products = [[NSMutableArray alloc] init];
        [_tesla.products addObject:modelS];
        [_tesla.products addObject:modelX];
        [_tesla.products addObject:model3];

        
        _test = [[Company alloc] init];
        
        _test.name = @"Test mobile devices";
        _test.stockSymbol = @"INTC";
        _test.imageName = @"img-companyLogo_Trump.png";
        
        Product *test = [[Product alloc] init];

        test.productURL = @"http://www.google.com/search?&sourceid=navclient&btnI=I&q=best+404+pages+of+all+time";
        test.name = @"test";
        
        _test.products = [[NSMutableArray alloc] init];
        [_test.products addObject:test];

        
        _companyList = [[NSMutableArray alloc] init];
        [_companyList addObject:_apple];
        [_companyList addObject:_samsung];
        [_companyList addObject:_google];
        [_companyList addObject:_tesla];
        
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
    [super dealloc];
}

@end