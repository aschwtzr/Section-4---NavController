//
//  ProductWebView.m
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ProductWebView.h"

@interface ProductWebView ()

@end

@implementation ProductWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.productWebDisplay =[[UIWebView alloc] initWithFrame:self.view.frame];
    self.view = self.productWebDisplay;
    NSString *url=@"http://www.google.com";
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [self.productWebDisplay loadRequest:nsrequest];

}

//- (id)initWithFrame:(CGRect)frame
//{
//    self.productWebDisplay = [super initWithFrame:frame];
//    if (self) {
//        self.productWebDisplay=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 1024,768)];
//    }
//    return self;
//}

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
