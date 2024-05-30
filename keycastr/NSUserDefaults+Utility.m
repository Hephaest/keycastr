//	Copyright (c) 2009 Stephen Deken
//	Copyright (c) 2024 Andrew Kitchen
//
//	All rights reserved.
// 
//	Redistribution and use in source and binary forms, with or without modification,
//	are permitted provided that the following conditions are met:
//
//	*	Redistributions of source code must retain the above copyright notice, this
//		list of conditions and the following disclaimer.
//	*	Redistributions in binary form must reproduce the above copyright notice,
//		this list of conditions and the following disclaimer in the documentation
//		and/or other materials provided with the distribution.
//	*	Neither the name KeyCastr nor the names of its contributors may be used to
//		endorse or promote products derived from this software without specific
//		prior written permission.
//
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//	IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
//	INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
//	LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
//	OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


#import "NSUserDefaults+Utility.h"

@implementation NSUserDefaults (Utility)

-(void) setColor:(NSColor*)aColor forKey:(NSString*)aKey
{
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:aColor
                                            requiringSecureCoding:NO
                                                            error:NULL];
    [self setObject:theData forKey:aKey];
}

-(NSColor*) colorForKey:(NSString*)aKey
{
    NSColor *theColor=nil;
    NSData *theData=[self dataForKey:aKey];
    if (theData != nil)
        theColor = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSColor class]
                                                     fromData:theData
                                                        error:NULL];
    return theColor;
}

-(void) setImage:(NSImage*)anImage forKey:(NSString*)aKey
{
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:anImage
                                            requiringSecureCoding:NO
                                                            error:NULL];
    [self setObject:theData forKey:aKey];
}

-(NSImage*) imageForKey:(NSString*)aKey
{
    NSImage *theImage=nil;
    NSData *theData=[self dataForKey:aKey];
    if (theData != nil)
        theImage = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSImage class]
                                                     fromData:theData
                                                        error:NULL];
    return theImage;
}

@end
