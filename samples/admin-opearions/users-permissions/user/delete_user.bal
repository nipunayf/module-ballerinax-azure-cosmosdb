// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/log;
import ballerina/os;
import ballerinax/azure_cosmosdb as cosmosdb;

cosmosdb:Configuration config = {
    baseUrl: os:getEnv("BASE_URL"),
    primaryKeyOrResourceToken: os:getEnv("MASTER_OR_RESOURCE_TOKEN")
};

cosmosdb:ManagementClient managementClient = new(config);

public function main() { 
    string databaseId = "my_database";
    string userId = "my_new_user";
    
    log:print("Delete user");
    cosmosdb:DeleteResponse|error result = managementClient->deleteUser(databaseId, userId);

    if (result is cosmosdb:DeleteResponse) {
        log:print(result.toString());
        log:print("Success!");
    } else {
        log:printError(result.message());
    }
}
