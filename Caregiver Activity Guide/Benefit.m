//
//  Benefit.m
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import "Benefit.h"

@implementation Benefit
@synthesize number;
@synthesize title;
@synthesize description;

- (void)dealloc{
    [title release];
    [description release];
    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInt:self.number forKey:kBenefitNumberKey];
    [coder encodeObject:self.title forKey:kBenefitTitlekey];
    [coder encodeObject:self.description forKey:kBenefitDescKey];
}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        number = [coder decodeIntForKey:kBenefitNumberKey];
        title = [[coder decodeObjectForKey:kBenefitTitlekey] retain];
        description = [[coder decodeObjectForKey:kBenefitDescKey] retain];
    }
    return self;
}

@end
