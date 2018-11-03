//
//  XomXomResponse.h
//  iOSXomXom
//
//  Created by brlaruda on 12/17/14.
//  Copyright (c) 2014 Jamdeo. All rights reserved.
//

#import "JSONModel.h"

@interface XomXomResponse : JSONModel

@property (assign, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *updated;
@property (strong, nonatomic) NSString *capabilityUuid;
@property (strong, nonatomic) NSString *about;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *cardName;
@property (strong, nonatomic) NSString *uuid;
@property (strong, nonatomic) NSString *mimeType;
@property (strong, nonatomic) NSString *kind;
@property (strong, nonatomic) NSString *etag;


@end


// "number": "7752973833262183227",
// "description": "Description 7752973833262183227",
// "updated": "16 Dec 2014 19:00:34 GMT",
// "capabilityUuid": "9c7d6725-ee1a-4528-bf8a-6598afa84101",
// "about": "About card 7752973833262183227",
// "image": "x",
// "cardName": "Card name 7752973833262183227",
// "uuid": "5b498c53-6b4f-4c52-9cfc-3e4a5cceb54f",
// "mimeType": "image/png",
// "kind": "xomXomApi2#promotioncardItem",
// "etag": "\"SEsvK0mv_DqehfAtLJUiwOH9yj0/H-G5HwtwfVOorsjWPFQGALyAisw\""
