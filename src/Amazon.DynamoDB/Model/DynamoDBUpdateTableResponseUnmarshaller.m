/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "DynamoDBUpdateTableResponseUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"
#import "DynamoDBTableDescriptionUnmarshaller.h"


@implementation DynamoDBUpdateTableResponseUnmarshaller


+(DynamoDBUpdateTableResponse *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBUpdateTableResponse *updateTableResult = [[[DynamoDBUpdateTableResponse alloc] init] autorelease];


    if ([jsonObject valueForKey:@"__type"] != nil) {
        [updateTableResult setException:[DynamoDBExceptionUnmarshaller unmarshall:jsonObject]];
    }
    else {
        if ([jsonObject valueForKey:@"TableDescription"] != nil) {
            updateTableResult.tableDescription = [DynamoDBTableDescriptionUnmarshaller unmarshall:[jsonObject valueForKey:@"TableDescription"]];
        }
    }

    return updateTableResult;
}

@end
