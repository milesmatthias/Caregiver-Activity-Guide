//
//  Benefit.h
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 Miles Matthias. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBenefitNumberKey   @"Benefit"
#define kBenefitTitlekey    @"title"
#define kBenefitDescKey     @"description"

@interface Benefit : NSObject <NSCoding> {
    int         number;
    NSString    *title;
    NSString    *description;
}
@property int number;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;
@end
