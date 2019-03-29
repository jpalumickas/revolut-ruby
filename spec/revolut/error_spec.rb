# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Revolut::Error do
  describe '.from_response' do
    it 'has bad request error raised when status is 400' do
      response = double(status: 400, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::BadRequest,
        'Your request is invalid.'
      )
    end

    it 'has unauthorized error raised when status is 401' do
      response = double(status: 401, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::Unauthorized,
        'Your API key is wrong.'
      )
    end

    it 'has forbidden error raised when status is 403' do
      response = double(status: 403, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::Forbidden,
        'Access to the requested resource or action is forbidden.'
      )
    end

    it 'has not found error raised when status is 404' do
      response = double(status: 404, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::NotFound,
        'The requested resource could not be found.'
      )
    end

    it 'has method not allowed error raised when status is 405' do
      response = double(status: 405, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::MethodNotAllowed,
        'You tried to access an endpoint with an invalid method.'
      )
    end

    it 'has not acceptable error raised when status is 406' do
      response = double(status: 406, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::NotAcceptable,
        "You requested a format that isn't JSON."
      )
    end

    it 'has too many requests error raised when status is 429' do
      response = double(status: 429, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::TooManyRequests,
        "You're sending too many requests."
      )
    end

    it 'has internal server error raised when status is 500' do
      response = double(status: 500, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::InternalServerError,
        'We had a problem with our server. Try again later.'
      )
    end

    it 'has service unavailable error raised when status is 503' do
      response = double(status: 503, body: [])
      expect { raise Revolut::Error.from_response(response) }.to raise_error(
        Revolut::ServiceUnavailable,
        "We're temporarily offline for maintenance. Please try again later."
      )
    end

    context 'message from response' do
      it 'has correct error message from response' do
        response = double(
          status: 500,
          body: { 'message' => 'TEST' }
        )
        expect { raise Revolut::Error.from_response(response) }
          .to raise_error(
            Revolut::InternalServerError,
            'TEST'
          )
      end

      it 'has correct error message when response error is blank' do
        response = double(
          status: 500,
          body: { 'message' => '' }
        )
        expect { raise Revolut::Error.from_response(response) }
          .to raise_error(
            Revolut::InternalServerError,
            'We had a problem with our server. Try again later.'
          )
      end
    end
  end
end
