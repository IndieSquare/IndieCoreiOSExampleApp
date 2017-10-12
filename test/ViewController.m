//
//  ViewController.m
//  test
//
//  Created by Chris on 25/10/2016.
//  Copyright © 2016 IndieSquare. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.iCore = [[IndieCore alloc] initWithViewController:self andAPIKey:@"fd244d6b1660b353fb58c8c31ec91a3d"];
    self.iCore.delegate = self;
    
}
typedef void (^completionBlock)(BOOL success, NSDictionary *response);
//IndieCore delegate methods

-(void)didInitiateCore:(NSString *)message{
    NSLog(@"loaded %@",message);
    
}

-(void)didSignTransaction:(NSString*)signedTx{
    
    
    NSLog(@"signed hex:%@",signedTx);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"signed tx"
                                                    message:signedTx
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

-(void)signTransactionError:(NSString*)errorMessage{
    
    
    NSLog(@"error:%@",errorMessage);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error"
                                                    message:errorMessage
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}


-(void)didCreateWallet:(NSString *)passphrase{
    NSLog(@"passphrase:%@",passphrase);
    
 
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wallet passphrase"
                                                    message:passphrase
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)createWalletError:(NSString *)errorMessage{
    NSLog(@"create wallet error:%@",errorMessage);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error"
                                                    message:errorMessage
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

-(void)didGenerateAddress:(NSString *)address{
    NSLog(@"address:%@",address);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Address"
                                                    message:address
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)generateAddressError:(NSString *)errorMessage{
     NSLog(@"address error:%@",errorMessage);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error"
                                                    message:errorMessage
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}
//



-(IBAction)testSign:(id)sender{
    
    //this will throw and error as the unsigedTx and passphrase are not correct, please add your own
    
     NSString * unsignedTx = @"01000000011d6548285f81215f7e69693ff544cbf16328ecb8fcc6a3f59d30f63541133722020000001976a914edee861dff4de166683e4c54ae3869cd05c7ae0f88acffffffff0336150000000000001976a9140780c76487c8d257aaf0a047382670ba140c2f1788ac00000000000000001e6a1cfb54f2b393304e9a2bc7e63f17bcc210ba96f1e570357d32a994ccc72f2e0800000000001976a914edee861dff4de166683e4c54ae3869cd05c7ae0f88ac00000000";
    
     NSString * passphrase = @"sea blink down rainbow hide aim never wrong shame ice planet page";
    
     NSString * destinationAddress = @"1BPaaPCbLDbG4tsFWRthmTnRQrqqRyiSsB"; //this is used as a security measure to verify the transaction we are sending does send funds to the correct address
    
    [self.iCore signTransacation:unsignedTx andPassphrase:passphrase andIndex:0 andDestination:destinationAddress];
    
}

-(IBAction)testCreateNewWallet:(id)sender{
    
    
    
    [self issueToken:@"1Nh4tPtQjHZSoYdToTF7T3xbaKrTNKM3wP" andTokenName:@"CHRISMOSSONE" andQuantity:10000 andDivisible:true andCompletion:^(BOOL success, NSDictionary*response) {
        
        NSLog(@"issue token %@",response);
        
        
    }];
    
    
    [self issueToken:@"1Nh4tPtQjHZSoYdToTF7T3xbaKrTNKM3wP" andTokenName:@"CHRISMOSSONE" andQuantity:10000 andDivisible:true andDescription:@"desc" andWebsiteURL:@"http:Sdsd232.com" andImageURL:@"htt:fdf.jpg" andFee:10000 andCompletion:^(BOOL success, NSDictionary*response) {
        
        NSLog(@"issue token2 %@",response);
        
        
    }];
    
    
    [self issueToken:@"146NUmhgH2uiXKDaAW2m8PycBFpV9BXdsA" andTokenName:@"CHRISMOSSONE" andQuantity:10000 andDivisible:true andCompletion:^(BOOL success, NSDictionary*response) {
        
        NSLog(@"issue token3 %@",response);
        
        
    }];
    
    
    /*
    NSLog(@"reseq0 %@", [self broadcastTransaction:@"0100000001bf1f87c5041063d8353f3d8e109fb11405456d7972c5f401308ced36eb9e8fea010000001976a914e1869fa1cec7741a502e7a5bd938ed8f5e354b5488acffffffff0200000000000000002e6a2c0b0b8cb664864cdf2ff70668595e63567b9d8ece36b2383513b6eeab7f1c15e70466593f13bb49618b8afe7079e93a00000000001976a914e1869fa1cec7741a502e7a5bd938ed8f5e354b5488ac00000000"]);
    
    
   NSLog(@"reseq1 %@",[self issueToken:@"1Nh4tPtQjHZSoYdToTF7T3xbaKrTNKM3wP" andTokenName:@"CHRISMOSSONE" andQuantity:10000 andDivisible:true andDescription:@"desc" andWebsiteURL:@"http:Sdsd232.com" andImageURL:@"htt:fdf.jpg"]);
    
     NSLog(@"reseq2 %@",[self issueToken:@"1Nh4tPtQjHZSoYdToTF7T3xbaKrTNKM3wP" andTokenName:@"CHRISMOSSONEdSAFASFSADFASFASFsa" andQuantity:10000 andDivisible:true andDescription:@"desc" andWebsiteURL:@"http:Sdsd232.com" andImageURL:@"htt:fdf.jpg"]);
    
    
    NSLog(@"reseq3 %@",[self issueToken:@"1Nh4tPtQjHZSoYdToTF7T3xbaKrTNKM3wP" andTokenName:@"CHRISMOSSONE" andQuantity:10000 andDivisible:true]);
    
    NSLog(@"reseq4 %@",[self issueToken:@"1Nh4tPtQjHZSoYdTossfTF7T3xbaKrTNKereM3wP" andTokenName:@"CHRISMOSSONE" andQuantity:10000 andDivisible:true andDescription:@"desc" andWebsiteURL:@"http:Sdsd232.com" andImageURL:@"htt:fdf.jpg" andFee:10000 andFeePerKB:10000]);
    
    
     NSLog(@"reseq5 %@",[self issueToken:@"146NUmhgH2uiXKDaAW2m8PycBFpV9BXdsA" andTokenName:@"CHRISMOSSONE" andQuantity:10000 andDivisible:true andDescription:@"desc" andWebsiteURL:@"http:Sdsd232.com" andImageURL:@"htt:fdf.jpg" andFee:10000]);
    
    */
    
    
    
    
    
  //  [self.iCore createNewWallet];
    
}

-(IBAction)testGetAddress:(id)sender{
    
    NSString * passphrase = @"sea blink down rainbow hide aim never wrong shame ice planet page";
    
    [self.iCore generateAddressForPassphrase:passphrase andIndex:0];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)dictionaryToJSON:(NSDictionary *)dic{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}
-(NSDictionary*)JSONToDictionary:(NSString*)json{
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    
    //    Note that JSONObjectWithData will return either an NSDictionary or an NSArray, depending whether your JSON string represents an a dictionary or an array.
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    if (error) {
        NSLog(@"Error parsing JSON: %@", error);
    }
    else
    {
       
          
        NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
        return jsonDictionary;
    
    }
    
    return NULL;
}

-(NSDictionary*)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible {
  
   return [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:NULL andWebsiteURL:NULL andImageURL:NULL andFee:-1 andFeePerKB:-1];
        
    
    
}





-(NSDictionary*)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description {
    
    return [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:NULL andImageURL:NULL andFee:-1 andFeePerKB:-1];
    
}

-(NSDictionary*)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL{
    
    return [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:websiteURL andImageURL:NULL andFee:-1 andFeePerKB:-1];
    
}

-(NSDictionary*)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andImageURL:(NSString*)imageURL{
    
     return [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:websiteURL andImageURL:imageURL andFee:-1 andFeePerKB:-1];
    
}


-(NSDictionary*)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andImageURL:(NSString*)imageURL andFee:(int)fee{
    
    return [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:websiteURL andImageURL:imageURL andFee:fee andFeePerKB:-1];
    
}


-(NSDictionary*)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andImageURL:(NSString*)imageURL andFee:(int)fee andFeePerKB:(int)feePerKB{
    
    return [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:websiteURL andImageURL:imageURL andFee:fee andFeePerKB:feePerKB];
    
}

-(void)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andCompletion:(completionBlock)completionBlock{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSDictionary* response = [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:NULL andWebsiteURL:NULL andImageURL:NULL andFee:-1 andFeePerKB:-1];
        
        NSString * status = [response objectForKey:@"status"];
        if([status isEqualToString:@"error"]){
            completionBlock(YES, response);
        }else{
            completionBlock(NO, response);
        }
        
        
    });
    
}
-(void)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andCompletion:(completionBlock)completionBlock{
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSDictionary* response = [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:NULL andImageURL:NULL andFee:-1 andFeePerKB:-1];
        
        NSString * status = [response objectForKey:@"status"];
        if([status isEqualToString:@"error"]){
            completionBlock(YES, response);
        }else{
            completionBlock(NO, response);
        }
        
        
    });
    
}
-(void)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andCompletion:(completionBlock)completionBlock{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSDictionary* response = [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:websiteURL andImageURL:NULL andFee:-1 andFeePerKB:-1];
        NSString * status = [response objectForKey:@"status"];
        if([status isEqualToString:@"error"]){
            completionBlock(YES, response);
        }else{
            completionBlock(NO, response);
        }
        
        
    });
}

-(void)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andImageURL:(NSString*)imageURL andCompletion:(completionBlock)completionBlock{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSDictionary* response =  [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:websiteURL andImageURL:imageURL andFee:-1 andFeePerKB:-1];
        
        NSString * status = [response objectForKey:@"status"];
        if([status isEqualToString:@"error"]){
            completionBlock(YES, response);
        }else{
            completionBlock(NO, response);
        }
        
    });
    
}
-(void)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andImageURL:(NSString*)imageURL andFee:(int)fee andCompletion:(completionBlock)completionBlock{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSDictionary* response = [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:websiteURL andImageURL:imageURL andFee:fee andFeePerKB:-1];
        
        NSString * status = [response objectForKey:@"status"];
        if([status isEqualToString:@"error"]){
            completionBlock(YES, response);
        }else{
            completionBlock(NO, response);
        }
        
        
    });
    
}


    
-(void)issueToken:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andImageURL:(NSString*)imageURL andFee:(int)fee andFeePerKB:(int)feePerKB andCompletion:(completionBlock)completionBlock{
        
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSDictionary* response =  [self issueTokenMaster:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andWebsiteURL:websiteURL andImageURL:imageURL andFee:fee andFeePerKB:feePerKB];
        
        NSString * status = [response objectForKey:@"status"];
        if([status isEqualToString:@"error"]){
            completionBlock(YES, response);
        }else{
            completionBlock(NO, response);
        }

        
    });
}
    
    

-(BOOL)checkIfTokenExists:(NSString*)token{
    
    
    NSDictionary * response = [self get:[NSString stringWithFormat:@"https://api.indiesquare.me/v2/tokens/%@",token]];
    
    NSString * statusCode = [response objectForKey:@"httpStatus"];
   
    if([statusCode isEqualToString:@"200"]){
        
        return true;
        
    }else{
        return false;
    }

}

-(NSDictionary*)issueTokenMaster:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andImageURL:(NSString*)imageURL andFee:(int)fee andFeePerKB:(int)feePerKB{
    if([self checkIfTokenExists:token]){
        NSLog(@"token already exists");
        return [NSDictionary dictionaryWithObjectsAndKeys:@"error",@"status",@"response","token already exists", nil];
    }
    
    if(description == NULL && websiteURL == NULL && imageURL == NULL){
        
        NSDictionary * response1 = [self createIssuanceTransaction:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:description andFee:fee andFeePerKB:feePerKB];
        
        if(![[response1 objectForKey:@"status"] isEqualToString:@"error"]){
            
            NSString * resString = [response1 objectForKey:@"response"];
            
            NSDictionary * dic = [self JSONToDictionary:resString];
            
            return [NSDictionary dictionaryWithObjectsAndKeys:@"success",@"status",dic,@"response", nil];
            
        }else{
            
            return response1;

        }
        
        
    }else{
        
    
    NSDictionary * response1 = [self createEnhancedAssetInfo:token andDescription:description andWebsiteURL:websiteURL andImageURL:imageURL];
    
    if(![[response1 objectForKey:@"status"] isEqualToString:@"error"]){
        
        NSString * resString = [response1 objectForKey:@"response"];
        
        NSDictionary * dic = [self JSONToDictionary:resString];
        
        NSNumber * issuance = [dic objectForKey:@"issuance"];
       
        NSString * descriptionURL = NULL;
        
        if([issuance boolValue] == true){
            descriptionURL = [dic objectForKey:@"uri"];
        }
        
        NSDictionary * response2 = [self createIssuanceTransaction:source andTokenName:token andQuantity:quantity andDivisible:divisible andDescription:descriptionURL andFee:fee andFeePerKB:feePerKB];
        
       
        
        if(![[response2 objectForKey:@"status"] isEqualToString:@"error"]){
          
            NSString * resString = [response2 objectForKey:@"response"];
            
            NSDictionary * dic = [self JSONToDictionary:resString];
            
            return [NSDictionary dictionaryWithObjectsAndKeys:@"success",@"status",dic,@"response", nil];
            
        }else{
            
             return response2;
        }
        
    }else{
        return response1;
    }
        
    }

    return [NSDictionary dictionaryWithObjectsAndKeys:@"error",@"status","unknown error",@"response", nil];
    
}

-(NSDictionary*)createEnhancedAssetInfo:(NSString*)token andDescription:(NSString*)description andWebsiteURL:(NSString*)websiteURL andImageURL:(NSString*)imageURL{
    
    NSArray *objects = [NSArray arrayWithObjects:description, websiteURL, imageURL, nil];
    
    NSArray *keys = [NSArray arrayWithObjects:@"description", @"website", @"image", nil];
    
    NSDictionary *postDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    NSString *jsonRequest = [self dictionaryToJSON:postDic];
    
    NSDictionary * res = [self post:jsonRequest url:[NSString stringWithFormat:@"https://api.indiesquare.me/v2/files/enhancedtokeninfo/%@",token] andIsJSON:true];
    
    NSString * httpStatus = [res objectForKey:@"httpStatus"];
    
    NSString * resString = [res objectForKey:@"response"];
    
    
    if(![httpStatus isEqualToString:@"200"]){
        
        if(resString != NULL){
            NSDictionary * dic = [self JSONToDictionary:resString];
            if([dic objectForKey:@"message"]){
                NSString * message = [dic objectForKey:@"message"];
                NSDictionary * returnDic = [NSDictionary dictionaryWithObjectsAndKeys:@"error",@"status",message,@"response", nil];
                return returnDic;
            }
        }
        
        NSDictionary * returnDic = [NSDictionary dictionaryWithObjectsAndKeys:@"error",@"status",@"error creating issuance transaction",@"response", nil];
        
        return returnDic;
    }
    
   
    
   
    NSDictionary * returnDic = [NSDictionary dictionaryWithObjectsAndKeys:@"success",@"status",resString,@"response", nil];
    
    return returnDic;

}

-(NSDictionary*)createIssuanceTransaction:(NSString*)source andTokenName:(NSString*)token andQuantity:(double)quantity andDivisible:(BOOL)divisible andDescription:(NSString*)description andFee:(int)fee andFeePerKB:(int)feePerKB{
    
    NSMutableDictionary * tmpDic = [[NSMutableDictionary alloc] init];
    [tmpDic setObject:source forKey:@"source"];
    [tmpDic setObject:[NSNumber numberWithDouble:quantity] forKey:@"quantity"];
    [tmpDic setObject:token forKey:@"token"];
    [tmpDic setObject:[NSNumber numberWithBool:divisible] forKey:@"divisible"];
    if(feePerKB != -1){
        [tmpDic setObject:[NSNumber numberWithInt:feePerKB] forKey:@"fee_per_kb"];
    }
    if(fee != -1){
        [tmpDic setObject:[NSNumber numberWithInt:fee] forKey:@"fee"];
    }
    
    if(description != NULL){
        [tmpDic setObject:description forKey:@"description"];
    }
    
    
    NSDictionary *postDic = [NSDictionary dictionaryWithDictionary:tmpDic];
    
    NSString *jsonRequest = [self dictionaryToJSON:postDic];
    
    NSDictionary * res = [self post:jsonRequest url:@"https://api.indiesquare.me/v2/transactions/issuance" andIsJSON:true];
    
    NSString * httpStatus = [res objectForKey:@"httpStatus"];
    
    NSString * resString = [res objectForKey:@"response"];
    
    if(![httpStatus isEqualToString:@"200"]){
        
        if(resString != NULL){
            NSDictionary * dic = [self JSONToDictionary:resString];
            if([dic objectForKey:@"message"]){
                NSString * message = [dic objectForKey:@"message"];
                NSDictionary * returnDic = [NSDictionary dictionaryWithObjectsAndKeys:@"error",@"status",message,@"response", nil];
                return returnDic;
            }
        }
        NSDictionary * returnDic = [NSDictionary dictionaryWithObjectsAndKeys:@"error",@"status",@"error creating issuance transaction",@"response", nil];
        return returnDic;
    }
    
    
    NSDictionary * returnDic = [NSDictionary dictionaryWithObjectsAndKeys:@"success",@"status",resString,@"response", nil];

    return returnDic;
    
    
}




-(NSDictionary *)post:(NSString *)postString url:(NSString*)urlString andIsJSON:(BOOL)isJSON{
    
    //Response data object
    NSData *returnData = [[NSData alloc]init];
    
    NSHTTPURLResponse* urlResponse = nil;
    
    NSError *error = nil;
    
    //Build the Request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    if(isJSON){
        
        NSData *requestData = [postString dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];

    }
    else{
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postString length]] forHTTPHeaderField:@"Content-length"];
    }
    
    [request setValue:@"9dc6v7b6ba8262e153ca2df730d3c317" forHTTPHeaderField:@"X-Api-Key"];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    //Send the Request
    returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: &urlResponse  error: &error];
    
    //Get the Result of Request
    NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) urlResponse;
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:response,@"response", [NSString stringWithFormat:@"%ld",[httpResponse statusCode]],@"httpStatus", nil];
    
    return dic;
}
-(NSDictionary*)broadcastTransaction:(NSString*)signedTx{
    
    NSArray *objects = [NSArray arrayWithObjects:signedTx, nil];
    
    NSArray *keys = [NSArray arrayWithObjects:@"tx", nil];
    
    NSDictionary *postDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    NSString *jsonRequest = [self dictionaryToJSON:postDic];
    
    NSDictionary * res = [self post:jsonRequest url:@"https://api.indiesquare.me/v2/transactions/broadcast" andIsJSON:true];
    
    return res;
    
}
-(NSDictionary *)get:(NSString*)urlString{
    NSMutableURLRequest *request =
    [NSMutableURLRequest requestWithURL:[NSURL
                                         URLWithString:urlString]
                            cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                        timeoutInterval:20
     ];
    
    [request setHTTPMethod: @"GET"];
    
    NSError *requestError = nil;
    NSURLResponse *urlResponse = nil;
    //[NSURLConnection da
    
    NSData *response =
    [NSURLConnection sendSynchronousRequest:request
                          returningResponse:&urlResponse error:&requestError];
    
    
    
    NSString *res = [[NSString alloc] initWithBytes:[response  bytes] length:[response  length] encoding:NSUTF8StringEncoding];
    
       NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) urlResponse;
    
  
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:res,@"response", [NSString stringWithFormat:@"%ld",[httpResponse statusCode]],@"httpStatus", nil];
    
    return dic;
}






@end
