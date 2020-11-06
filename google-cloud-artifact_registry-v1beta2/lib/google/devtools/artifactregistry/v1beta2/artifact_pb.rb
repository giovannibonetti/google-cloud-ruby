# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/devtools/artifactregistry/v1beta2/artifact.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/timestamp_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/devtools/artifactregistry/v1beta2/artifact.proto", :syntax => :proto3) do
    add_message "google.devtools.artifactregistry.v1beta2.DockerImage" do
      optional :name, :string, 1
      optional :uri, :string, 2
      repeated :tags, :string, 3
      optional :image_size_bytes, :int64, 4
      optional :upload_time, :message, 5, "google.protobuf.Timestamp"
      optional :media_type, :string, 6
    end
    add_message "google.devtools.artifactregistry.v1beta2.ListDockerImagesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.devtools.artifactregistry.v1beta2.ListDockerImagesResponse" do
      repeated :docker_images, :message, 1, "google.devtools.artifactregistry.v1beta2.DockerImage"
      optional :next_page_token, :string, 2
    end
  end
end

module Google
  module Cloud
    module ArtifactRegistry
      module V1beta2
        DockerImage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.DockerImage").msgclass
        ListDockerImagesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.ListDockerImagesRequest").msgclass
        ListDockerImagesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.ListDockerImagesResponse").msgclass
      end
    end
  end
end
