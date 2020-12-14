// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License. 

import ballerina/http;

public type AzureCosmosConfiguration record {|
    string baseUrl;
    string keyOrResourceToken;
    string host;
    string tokenType;
    string tokenVersion;
    http:ClientSecureSocket? secureSocketConfig;
|};

public type ResourceProperties record {|
    string databaseId = "";
    string containerId = "";
|};

public type Common record {|
    string resourceId?;
    string selfReference?;
    string timeStamp?;
    string eTag?;
|};

public type RequestHeaderOptions record {|
    boolean? isUpsertRequest = ();
    string? indexingDirective = ();
    string? consistancyLevel = ();
    string? sessionToken = ();
    string? changeFeedOption = ();
    string? ifNoneMatch = ();
    string? partitionKeyRangeId = ();
    boolean? enableCrossPartition = ();
    string? ifMatch = ();
|};

public type Headers record {|
    string? continuationHeader = ();
    string? sessionTokenHeader = ();
    string? requestChargeHeader = ();
    string? resourceUsageHeader = ();
    string? itemCountHeader = ();
    string? etagHeader = ();
    string? dateHeader = ();
|};

public type Database record {|
    string id = "";
    *Common;
    string collections?;
    string users?;
    Headers?...;
|};

public type Container record {|
    string id = "";
    *Common;
    string collections?;
    string storedProcedures?;
    string triggers?;
    string userDefinedFunctions?;
    string conflicts?;
    boolean allowMaterializedViews?;
    IndexingPolicy indexingPolicy?;
    PartitionKey partitionKey?;
    Headers?...;
|};

public type Document record {|
    string id = "";
    *Common;
    json? documentBody = {};
    any[]? partitionKey = ();
    string attachments?;
    Headers?...;
|};

public type IndexingPolicy record {|
    string indexingMode = "";
    boolean automatic = true;
    IncludedPath[] includedPaths?;
    IncludedPath[] excludedPaths?;
|};

public type IncludedPath record {|
    string path = "";
    Index[] indexes?;
|};

public type ExcludedPath record {|
    string path?;
|};

public type Index record {|
    string kind = "";
    string dataType = "";
    int precision?;
|};

public type PartitionKey record {|
    string[] paths = [];
    string kind = "";
    int? keyVersion?;
|};

public type PartitionKeyList record {|
    string resourceId = "";
    PartitionKeyRange[] PartitionKeyRanges = [];
    Headers reponseHeaders?;
    int count = 0;
|};

public type PartitionKeyRange record {|
    string id = "";
    string minInclusive = "";
    string maxExclusive = "";
    int ridPrefix?;
    int throughputFraction?;
    string status = "";
    Headers reponseHeaders?;
|};

public type StoredProcedure record {|
    string id = "";
    *Common;
    string body = "";
    Headers?...;
|};

public type UserDefinedFunction record {|
    *StoredProcedure;
    Headers?...;
|};

public type Trigger record {|
    *StoredProcedure;
    string triggerOperation = "";
    string triggerType = "";
    Headers?...;
|};

public type User record {|
    string id = "";
    *Common;
    string permissions?;
    Headers?...;
|};

public type Permission record {|
    string id = "";
    *Common;
    string permissionMode = "";
    string resourcePath = "";
    int validityPeriod?;
    string token?;
    Headers?...;
|};

public type Offer record {|
    string id = "";
    *Common;
    string offerVersion = "";
    string? offerType?; 
    json content = {};
    string offerResourceId = "";
    string resourceSelfLink = "";
    Headers?...;
|};

public type ThroughputProperties record {
    int? throughput = ();
    json? maxThroughput = ();
};

public type HeaderParameters record {|
    string verb = "";
    string apiVersion = API_VERSION;
    string resourceType = "";
    string resourceId = "";
|};

public type AzureError distinct error;

type JsonMap map<json>;

public type Query record {|
    string query = "";
    QueryParameter[]? parameters = [];
|};

public type QueryParameter record {|
    string name = "";
    string value = "";
|};
