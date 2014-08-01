//
//  AppDelegate.m
//
//  Copyright (c) 2014 StyleShare (https://stylesha.re)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "AppDelegate.h"
#import "SSBorderedButton.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self createNotCustomizedButton];
    [self createCustomizedButton];
    
    return YES;
}

- (void)createNotCustomizedButton
{
    SSBorderedButton *button = [[SSBorderedButton alloc] initWithFrame:CGRectMake(10, 30, 73, 44)];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [self.window addSubview:button];
}

- (void)createCustomizedButton
{
    SSBorderedButton *button = [[SSBorderedButton alloc] initWithFrame:CGRectMake(10, 100, 73, 44)];
    button.borderWidth = 1;
    button.cornerRadius = 10;
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button setBorderColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setBorderColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.window addSubview:button];
}

@end
