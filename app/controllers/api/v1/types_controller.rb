module Api
  module V1
    class TypesController < ApplicationController
      def index
        types = Type.all
        render json:types
      end
    end
  end
end