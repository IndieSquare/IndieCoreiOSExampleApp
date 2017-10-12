//
//  IndieCore.h
//  IndieCore
//
//  Created by Chris on 25/10/2016.
//  Copyright © 2016 IndieSquare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class IndieCore;
@protocol IndieCoreDelegate <NSObject>
@optional
- (void)didSignTransaction:(NSString*)signedTx;
- (void)signTransactionError:(NSString*)errorMessage;
- (void)didGenerateAddress:(NSString*)address;
- (void)generateAddressError:(NSString*)errorMessage;
- (void)didCreateWallet:(NSString*)passphrase;
- (void)createWalletError:(NSString*)errorMessage;
- (void)didInitiateCore:(NSString*)message;
// ... other methods here
@end


@interface IndieCore : NSObject<UIWebViewDelegate>
-(id)initWithViewController:(UIViewController*)parentController andAPIKey:(NSString*)apiKey;
-(void)signTransacation:(NSString*)tx andPassphrase:(NSString*)passphrase andIndex:(int)index andDestination:(NSString*)destination;
-(void)createNewWallet;
-(void)generateAddressForPassphrase:(NSString*)passphrase andIndex:(int)index;

@property(nonatomic,strong)UIWebView * webView;
@property(nonatomic,strong)NSString*apiKey;
@property BOOL webViewLoaded;
@property (nonatomic, weak) id <IndieCoreDelegate> delegate;
@end

