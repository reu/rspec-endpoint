require "rspec/endpoint/version"
require "rspec/core"

module RSpec
  module Endpoint
    def endpoint(description, metadata = {}, &block)
      method, path = description.split(" ")
      method = method.downcase

      methods = %w(get post put delete patch head options)
      fail "Invalid method #{method}. Valid options: #{methods}" unless methods.include? method.downcase

      segments = path.split("/")

      path_params = segments.select { |segment| segment.start_with?(":") }.map { |segment| segment[1..-1] }

      describe(description, metadata) do
        let(:path) { segments.map { |seg| seg.start_with?(":") ? send(seg[1..-1]) : seg }.join("/") }
        let(:params) { path_params.reduce({}) { |params, param| params.merge(param.to_sym => send(param)) } }

        path_params.each { |param| let(param.to_sym) { send(param.to_sym) } }

        subject { send(method.to_sym, send(:path), params) }

        class_eval(&block)
      end
    end
  end
end

RSpec.configure do |rspec|
  rspec.extend RSpec::Endpoint
  rspec.backtrace_exclusion_patterns << %r(/lib/rspec/endpoint)
end

RSpec::SharedContext.send(:include, RSpec::Endpoint)
