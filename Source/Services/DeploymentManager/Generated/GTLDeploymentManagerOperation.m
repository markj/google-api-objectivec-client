/* Copyright (c) 2016 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
//  GTLDeploymentManagerOperation.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   Google Cloud Deployment Manager API (deploymentmanager/v2)
// Description:
//   The Deployment Manager API allows users to declaratively configure, deploy
//   and run complex solutions on the Google Cloud Platform.
// Documentation:
//   https://cloud.google.com/deployment-manager/
// Classes:
//   GTLDeploymentManagerOperation (0 custom class methods, 23 custom properties)
//   GTLDeploymentManagerOperationError (0 custom class methods, 1 custom properties)
//   GTLDeploymentManagerOperationWarningsItem (0 custom class methods, 3 custom properties)
//   GTLDeploymentManagerOperationErrorErrorsItem (0 custom class methods, 3 custom properties)
//   GTLDeploymentManagerOperationWarningsItemDataItem (0 custom class methods, 2 custom properties)

#import "GTLDeploymentManagerOperation.h"

// ----------------------------------------------------------------------------
//
//   GTLDeploymentManagerOperation
//

@implementation GTLDeploymentManagerOperation
@dynamic clientOperationId, creationTimestamp, descriptionProperty, endTime,
         error, httpErrorMessage, httpErrorStatusCode, identifier, insertTime,
         kind, name, operationType, progress, region, selfLink, startTime,
         status, statusMessage, targetId, targetLink, user, warnings,
         zoneProperty;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map = @{
    @"descriptionProperty" : @"description",
    @"identifier" : @"id",
    @"zoneProperty" : @"zone"
  };
  return map;
}

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map = @{
    @"warnings" : [GTLDeploymentManagerOperationWarningsItem class]
  };
  return map;
}

+ (void)load {
  [self registerObjectClassForKind:@"deploymentmanager#operation"];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLDeploymentManagerOperationError
//

@implementation GTLDeploymentManagerOperationError
@dynamic errors;

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map = @{
    @"errors" : [GTLDeploymentManagerOperationErrorErrorsItem class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLDeploymentManagerOperationWarningsItem
//

@implementation GTLDeploymentManagerOperationWarningsItem
@dynamic code, data, message;

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map = @{
    @"data" : [GTLDeploymentManagerOperationWarningsItemDataItem class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLDeploymentManagerOperationErrorErrorsItem
//

@implementation GTLDeploymentManagerOperationErrorErrorsItem
@dynamic code, location, message;
@end


// ----------------------------------------------------------------------------
//
//   GTLDeploymentManagerOperationWarningsItemDataItem
//

@implementation GTLDeploymentManagerOperationWarningsItemDataItem
@dynamic key, value;
@end
