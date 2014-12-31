#!/usr/bin/env ruby

# Copyright 2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'rubygems'
require 'bundler/setup'
require 'aws-sdk'
require 'uuid'

# Instantiate a new client for Amazon Simple Storage Service (S3). With no
# parameters or configuration, the AWS SDK for Ruby will look for access keys
# and region in these environment variables:
#
#    AWS_ACCESS_KEY_ID='...'
#    AWS_SECRET_ACCESS_KEY='...'
#    AWS_REGION='...'
#
# For more information about this interface to Amazon S3, see:
# http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3.html

AWS.config({
  :region => 'us-west-2',
})

sqs = AWS::SQS.new
queue = sqs.queues.create("wl_queue")
queue.poll do |msg|
  puts msg.body
end
