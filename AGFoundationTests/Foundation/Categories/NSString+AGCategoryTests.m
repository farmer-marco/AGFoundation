//
//  NSString+AGCategoryTests.m
//  AGFoundation
//
//  Created by Andrew Garn on 23/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSString+AGCategoryTests.h"
#import "NSString+AGCategory.h"

@interface NSString_AGCategoryTests ()
@property (nonatomic, strong) NSString *testString;
@end

@implementation NSString_AGCategoryTests

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.testString = @"The quick brown fox jumps over the lazy dog";
}

#pragma mark - Teardown

- (void)tearDown
{
    // Tear-down code here.
    self.testString = nil;
    
    [super tearDown];
}

#pragma mark - Tests

- (void)testContainsString
{
    STAssertTrue([self.testString containsString_AG:@"quick brown fox"], @"Contains string test failed");
    STAssertFalse([self.testString containsString_AG:@"slow brown fox"], @"Contains string test failed");
}

- (void)testStringBetweenStringAndString
{
    NSString *substring = [self.testString stringBetweenString_AG:@"quick brown fox" andString:@"the lazy dog"];
    STAssertTrue([substring isEqualToString:@" jumps over "], @"String between string and string test failed");
    
    substring = [self.testString stringBetweenString_AG:@"brown fox " andString:@"jumps over"];
    STAssertTrue([substring isEqualToString:@""], @"String between string and string test failed");
    
    substring = [self.testString stringBetweenString_AG:@"lorem ipsum" andString:@"dolor sit amet"];
    STAssertTrue(substring == nil, @"String between string and string test failed");
}

- (void)testReversedString
{
    NSString *reversedString = [self.testString reversedString_AG];
    STAssertTrue([reversedString isEqualToString:@"god yzal eht revo spmuj xof nworb kciuq ehT"], @"Reversed string test failed");
}

- (void)testIsValidEmailAddress
{
    STAssertTrue([@"username@example.com" isValidEmailAddress_AG], @"Email validation test failed");
    STAssertTrue([@"username+test@example.com" isValidEmailAddress_AG], @"Email validation test failed");
    STAssertTrue([@"user.name+test@example.com" isValidEmailAddress_AG], @"Email validation test failed");
    STAssertTrue([@"user_name+test@example.com" isValidEmailAddress_AG], @"Email validation test failed");
    STAssertTrue([@"a@bc.uk" isValidEmailAddress_AG], @"Email validation test failed");
    
    STAssertFalse([@"username@example" isValidEmailAddress_AG], @"Email validation test failed");
    STAssertFalse([@"username@example." isValidEmailAddress_AG], @"Email validation test failed");
    STAssertFalse([@"username@" isValidEmailAddress_AG], @"Email validation test failed");
    STAssertFalse([@"username" isValidEmailAddress_AG], @"Email validation test failed");
    STAssertFalse([@"@example.com" isValidEmailAddress_AG], @"Email validation test failed");
    STAssertFalse([@"example.com" isValidEmailAddress_AG], @"Email validation test failed");
}

- (void)testMD5Hash
{
    NSString *MD5Hash = [self.testString MD5Hash_AG];
    STAssertTrue([MD5Hash isEqualToString:@"9e107d9d372bb6826bd81d3542a419d6"], @"MD5Hash test failed");
}

- (void)testSHA1Hash
{
    NSString *SHA1Hash = [self.testString SHA1Hash_AG];
    STAssertTrue([SHA1Hash isEqualToString:@"2fd4e1c67a2d28fced849ee1bb76e7391b93eb12"], @"SHA1Hash test failed");
}

- (void)testSHA256Hash
{
    NSString *SHA256Hash = [self.testString SHA256Hash_AG];
    STAssertTrue([SHA256Hash isEqualToString:@"d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592"], @"SHA256Hash test failed");
}

- (void)testSHA512Hash
{
    NSString *SHA512Hash = [self.testString SHA512Hash_AG];
    STAssertTrue([SHA512Hash isEqualToString:@"07e547d9586f6a73f73fbac0435ed76951218fb7d0c8d788a309d785436bbb642e93a252a954f23912547d1e8a3b5ed6e1bfd7097821233fa0538f3db854fee6"], @"SHA512Hash test failed");
}

@end