module Pyramid
  module Model
    extend ActiveSupport::Concern

    def save
      if new_record?
        api_repo.create(to_hash)
          .map { |h| update_attributes! h }
      else
        api_repo.update to_param, to_hash # true of false depending on error
      end
      self
    end

    def destroy
      if persisted?
        api_repo.destroy to_param
      end
    end

    def persisted?
      !new_record?
    end

    def new_record?
      !id
    end

    # Note that this is not the `params`
    def to_param
      id
    end

    def key
      self.class.key
    end

    def api_repo
      self.class.api_repo
    end

    module ClassMethods
      def api_repo
        @_api_repo ||= ApiRepo.new(key, path_prefix: path_prefix)
      end

      def key
        @_key ||= "#{self.to_s.underscore}".split('/').last
      end

      def path_prefix(value=nil)
        if value
          @_path_prefix = value
        else
          @_path_prefix
        end
      end

      def find(id)
        api_repo.find(id)
          .map { |h| new(h) }
          .first
      end

      def findAll(opts={})
        api_repo.findAll(opts)
          .map { |h| new(h) }
      end
    end
  end
end
