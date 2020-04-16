# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/bigquery/datatransfer/v1/datatransfer_pb"
require "google/cloud/bigquery/datatransfer/v1/datatransfer_services_pb"
require "google/cloud/bigquery/data_transfer/v1/data_transfer_service"

class Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_get_data_source
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::DataSource.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_data_source_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_data_source, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::GetDataSourceRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_data_source_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_data_source({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_data_source name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_data_source Google::Cloud::Bigquery::DataTransfer::V1::GetDataSourceRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_data_source({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_data_source Google::Cloud::Bigquery::DataTransfer::V1::GetDataSourceRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_data_source_client_stub.call_rpc_count
    end
  end

  def test_list_data_sources
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::ListDataSourcesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_token = "hello world"
    page_size = 42

    list_data_sources_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_data_sources, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::ListDataSourcesRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_data_sources_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_data_sources({ parent: parent, page_token: page_token, page_size: page_size }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_data_sources parent: parent, page_token: page_token, page_size: page_size do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_data_sources Google::Cloud::Bigquery::DataTransfer::V1::ListDataSourcesRequest.new(parent: parent, page_token: page_token, page_size: page_size) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_data_sources({ parent: parent, page_token: page_token, page_size: page_size }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_data_sources Google::Cloud::Bigquery::DataTransfer::V1::ListDataSourcesRequest.new(parent: parent, page_token: page_token, page_size: page_size), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_data_sources_client_stub.call_rpc_count
    end
  end

  def test_create_transfer_config
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::TransferConfig.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    transfer_config = {}
    authorization_code = "hello world"
    version_info = "hello world"
    service_account_name = "hello world"

    create_transfer_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_transfer_config, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::CreateTransferConfigRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Bigquery::DataTransfer::V1::TransferConfig), request.transfer_config
      assert_equal "hello world", request.authorization_code
      assert_equal "hello world", request.version_info
      assert_equal "hello world", request.service_account_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_transfer_config_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_transfer_config({ parent: parent, transfer_config: transfer_config, authorization_code: authorization_code, version_info: version_info, service_account_name: service_account_name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_transfer_config parent: parent, transfer_config: transfer_config, authorization_code: authorization_code, version_info: version_info, service_account_name: service_account_name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_transfer_config Google::Cloud::Bigquery::DataTransfer::V1::CreateTransferConfigRequest.new(parent: parent, transfer_config: transfer_config, authorization_code: authorization_code, version_info: version_info, service_account_name: service_account_name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_transfer_config({ parent: parent, transfer_config: transfer_config, authorization_code: authorization_code, version_info: version_info, service_account_name: service_account_name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_transfer_config Google::Cloud::Bigquery::DataTransfer::V1::CreateTransferConfigRequest.new(parent: parent, transfer_config: transfer_config, authorization_code: authorization_code, version_info: version_info, service_account_name: service_account_name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_transfer_config_client_stub.call_rpc_count
    end
  end

  def test_update_transfer_config
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::TransferConfig.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    transfer_config = {}
    authorization_code = "hello world"
    update_mask = {}
    version_info = "hello world"
    service_account_name = "hello world"

    update_transfer_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_transfer_config, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::UpdateTransferConfigRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Bigquery::DataTransfer::V1::TransferConfig), request.transfer_config
      assert_equal "hello world", request.authorization_code
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      assert_equal "hello world", request.version_info
      assert_equal "hello world", request.service_account_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_transfer_config_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_transfer_config({ transfer_config: transfer_config, authorization_code: authorization_code, update_mask: update_mask, version_info: version_info, service_account_name: service_account_name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_transfer_config transfer_config: transfer_config, authorization_code: authorization_code, update_mask: update_mask, version_info: version_info, service_account_name: service_account_name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_transfer_config Google::Cloud::Bigquery::DataTransfer::V1::UpdateTransferConfigRequest.new(transfer_config: transfer_config, authorization_code: authorization_code, update_mask: update_mask, version_info: version_info, service_account_name: service_account_name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_transfer_config({ transfer_config: transfer_config, authorization_code: authorization_code, update_mask: update_mask, version_info: version_info, service_account_name: service_account_name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_transfer_config Google::Cloud::Bigquery::DataTransfer::V1::UpdateTransferConfigRequest.new(transfer_config: transfer_config, authorization_code: authorization_code, update_mask: update_mask, version_info: version_info, service_account_name: service_account_name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_transfer_config_client_stub.call_rpc_count
    end
  end

  def test_delete_transfer_config
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_transfer_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_transfer_config, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::DeleteTransferConfigRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_transfer_config_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_transfer_config({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_transfer_config name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_transfer_config Google::Cloud::Bigquery::DataTransfer::V1::DeleteTransferConfigRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_transfer_config({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_transfer_config Google::Cloud::Bigquery::DataTransfer::V1::DeleteTransferConfigRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_transfer_config_client_stub.call_rpc_count
    end
  end

  def test_get_transfer_config
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::TransferConfig.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_transfer_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_transfer_config, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::GetTransferConfigRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_transfer_config_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_transfer_config({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_transfer_config name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_transfer_config Google::Cloud::Bigquery::DataTransfer::V1::GetTransferConfigRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_transfer_config({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_transfer_config Google::Cloud::Bigquery::DataTransfer::V1::GetTransferConfigRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_transfer_config_client_stub.call_rpc_count
    end
  end

  def test_list_transfer_configs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::ListTransferConfigsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    data_source_ids = ["hello world"]
    page_token = "hello world"
    page_size = 42

    list_transfer_configs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_transfer_configs, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::ListTransferConfigsRequest, request
      assert_equal "hello world", request.parent
      assert_equal ["hello world"], request.data_source_ids
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_transfer_configs_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_transfer_configs({ parent: parent, data_source_ids: data_source_ids, page_token: page_token, page_size: page_size }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_transfer_configs parent: parent, data_source_ids: data_source_ids, page_token: page_token, page_size: page_size do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_transfer_configs Google::Cloud::Bigquery::DataTransfer::V1::ListTransferConfigsRequest.new(parent: parent, data_source_ids: data_source_ids, page_token: page_token, page_size: page_size) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_transfer_configs({ parent: parent, data_source_ids: data_source_ids, page_token: page_token, page_size: page_size }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_transfer_configs Google::Cloud::Bigquery::DataTransfer::V1::ListTransferConfigsRequest.new(parent: parent, data_source_ids: data_source_ids, page_token: page_token, page_size: page_size), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_transfer_configs_client_stub.call_rpc_count
    end
  end

  def test_schedule_transfer_runs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::ScheduleTransferRunsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    start_time = {}
    end_time = {}

    schedule_transfer_runs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :schedule_transfer_runs, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::ScheduleTransferRunsRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::Timestamp), request.start_time
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::Timestamp), request.end_time
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, schedule_transfer_runs_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.schedule_transfer_runs({ parent: parent, start_time: start_time, end_time: end_time }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.schedule_transfer_runs parent: parent, start_time: start_time, end_time: end_time do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.schedule_transfer_runs Google::Cloud::Bigquery::DataTransfer::V1::ScheduleTransferRunsRequest.new(parent: parent, start_time: start_time, end_time: end_time) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.schedule_transfer_runs({ parent: parent, start_time: start_time, end_time: end_time }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.schedule_transfer_runs Google::Cloud::Bigquery::DataTransfer::V1::ScheduleTransferRunsRequest.new(parent: parent, start_time: start_time, end_time: end_time), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, schedule_transfer_runs_client_stub.call_rpc_count
    end
  end

  def test_start_manual_transfer_runs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::StartManualTransferRunsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"

    start_manual_transfer_runs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :start_manual_transfer_runs, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::StartManualTransferRunsRequest, request
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, start_manual_transfer_runs_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.start_manual_transfer_runs({ parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.start_manual_transfer_runs parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.start_manual_transfer_runs Google::Cloud::Bigquery::DataTransfer::V1::StartManualTransferRunsRequest.new(parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.start_manual_transfer_runs({ parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.start_manual_transfer_runs Google::Cloud::Bigquery::DataTransfer::V1::StartManualTransferRunsRequest.new(parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, start_manual_transfer_runs_client_stub.call_rpc_count
    end
  end

  def test_get_transfer_run
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::TransferRun.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_transfer_run_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_transfer_run, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::GetTransferRunRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_transfer_run_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_transfer_run({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_transfer_run name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_transfer_run Google::Cloud::Bigquery::DataTransfer::V1::GetTransferRunRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_transfer_run({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_transfer_run Google::Cloud::Bigquery::DataTransfer::V1::GetTransferRunRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_transfer_run_client_stub.call_rpc_count
    end
  end

  def test_delete_transfer_run
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_transfer_run_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_transfer_run, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::DeleteTransferRunRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_transfer_run_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_transfer_run({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_transfer_run name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_transfer_run Google::Cloud::Bigquery::DataTransfer::V1::DeleteTransferRunRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_transfer_run({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_transfer_run Google::Cloud::Bigquery::DataTransfer::V1::DeleteTransferRunRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_transfer_run_client_stub.call_rpc_count
    end
  end

  def test_list_transfer_runs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::ListTransferRunsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    states = [:TRANSFER_STATE_UNSPECIFIED]
    page_token = "hello world"
    page_size = 42
    run_attempt = :RUN_ATTEMPT_UNSPECIFIED

    list_transfer_runs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_transfer_runs, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::ListTransferRunsRequest, request
      assert_equal "hello world", request.parent
      assert_equal [:TRANSFER_STATE_UNSPECIFIED], request.states
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      assert_equal :RUN_ATTEMPT_UNSPECIFIED, request.run_attempt
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_transfer_runs_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_transfer_runs({ parent: parent, states: states, page_token: page_token, page_size: page_size, run_attempt: run_attempt }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_transfer_runs parent: parent, states: states, page_token: page_token, page_size: page_size, run_attempt: run_attempt do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_transfer_runs Google::Cloud::Bigquery::DataTransfer::V1::ListTransferRunsRequest.new(parent: parent, states: states, page_token: page_token, page_size: page_size, run_attempt: run_attempt) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_transfer_runs({ parent: parent, states: states, page_token: page_token, page_size: page_size, run_attempt: run_attempt }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_transfer_runs Google::Cloud::Bigquery::DataTransfer::V1::ListTransferRunsRequest.new(parent: parent, states: states, page_token: page_token, page_size: page_size, run_attempt: run_attempt), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_transfer_runs_client_stub.call_rpc_count
    end
  end

  def test_list_transfer_logs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::ListTransferLogsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_token = "hello world"
    page_size = 42
    message_types = [:MESSAGE_SEVERITY_UNSPECIFIED]

    list_transfer_logs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_transfer_logs, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::ListTransferLogsRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      assert_equal [:MESSAGE_SEVERITY_UNSPECIFIED], request.message_types
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_transfer_logs_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_transfer_logs({ parent: parent, page_token: page_token, page_size: page_size, message_types: message_types }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_transfer_logs parent: parent, page_token: page_token, page_size: page_size, message_types: message_types do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_transfer_logs Google::Cloud::Bigquery::DataTransfer::V1::ListTransferLogsRequest.new(parent: parent, page_token: page_token, page_size: page_size, message_types: message_types) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_transfer_logs({ parent: parent, page_token: page_token, page_size: page_size, message_types: message_types }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_transfer_logs Google::Cloud::Bigquery::DataTransfer::V1::ListTransferLogsRequest.new(parent: parent, page_token: page_token, page_size: page_size, message_types: message_types), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_transfer_logs_client_stub.call_rpc_count
    end
  end

  def test_check_valid_creds
    # Create GRPC objects.
    grpc_response = Google::Cloud::Bigquery::DataTransfer::V1::CheckValidCredsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    check_valid_creds_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :check_valid_creds, name
      assert_kind_of Google::Cloud::Bigquery::DataTransfer::V1::CheckValidCredsRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, check_valid_creds_client_stub do
      # Create client
      client = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.check_valid_creds({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.check_valid_creds name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.check_valid_creds Google::Cloud::Bigquery::DataTransfer::V1::CheckValidCredsRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.check_valid_creds({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.check_valid_creds Google::Cloud::Bigquery::DataTransfer::V1::CheckValidCredsRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, check_valid_creds_client_stub.call_rpc_count
    end
  end
end