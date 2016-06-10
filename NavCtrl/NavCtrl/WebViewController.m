//
//  ProductWebView.m
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    self.productURLDictionary = [[NSMutableDictionary alloc] init];
    [self loadProductURLDictionary];
    NSString *url = [self.productURLDictionary objectForKey:[defaults objectForKey:@"productSelected"]];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    
    
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds] configuration:configuration];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.view addSubview:webView];
    
    
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.productURLDictionary = [[NSMutableDictionary alloc] init];
    [self loadProductURLDictionary];
    NSString *url = [self.productURLDictionary objectForKey:[defaults objectForKey:@"productSelected"]];
    self.productWebDisplay =[[UIWebView alloc] initWithFrame:self.view.frame];
    self.view = self.productWebDisplay;
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [self.productWebDisplay loadRequest:nsrequest];
     */
    
}

//- (id)initWithFrame:(CGRect)frame
//{
//    self.productWebDisplay = [super initWithFrame:frame];
//    if (self) {
//        self.productWebDisplay=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 1024,768)];
//    }
//    return self;
//}

-(void)loadProductURLDictionary {
    
    [self.productURLDictionary setObject:@"http://www.apple.com/ipad/" forKey:@"iPad"];
    [self.productURLDictionary setObject:@"http://www.apple.com/ipod‎/" forKey:@"iPod Touch"];
    [self.productURLDictionary setObject:@"http://www.apple.com/iphone/" forKey:@"iPhone"];
    [self.productURLDictionary setObject:@"http://www.samsung.com/global/galaxy/galaxy-s7/" forKey:@"Galaxy S7"];
    [self.productURLDictionary setObject:@"http://www.samsung.com/global/galaxy/galaxy-note5/" forKey:@"Galaxy Note"];
    [self.productURLDictionary setObject:@"http://www.samsung.com/TabProS/" forKey:@"Galaxy Tab"];
    [self.productURLDictionary setObject:@"https://store.google.com/product/nexus_5x" forKey:@"Nexus 5X"];
    [self.productURLDictionary setObject:@"https://store.google.com/product/nexus_6p" forKey:@"Nexus 6P"];
    [self.productURLDictionary setObject:@"https://store.google.com/product/pixel_c" forKey:@"Pixel C"];
    [self.productURLDictionary setObject:@"https://www.teslamotors.com/models/" forKey:@"Model S"];
    [self.productURLDictionary setObject:@"https://www.teslamotors.com/modelx/" forKey:@"Model X"];
    [self.productURLDictionary setObject:@"https://www.teslamotors.com/model3/" forKey:@"Model 3"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    // Do whatever you want here
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)dealloc {
    [self.productWebDisplay release];
    [super dealloc];
}
@end
