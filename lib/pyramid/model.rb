module Pyramid
  module Model
    extend ActiveSupport::Concern

    def save
      if new_record?
        api_repo.create(key, to_hash)
          .map { |h| update_attributes! h }
      else
        api_repo.update key, to_param, to_hash # true of false depending on error
      end
    end

    def destroy
      if persisted?
        api_repo.destroy key, to_param
      end
    end

    def persisted?
      !new_record?
    end

    def new_record?
      !id
    end

    def key
      self.class.key
    end

    def to_param
      id
    end

    def api_repo
      self.class.api_repo
    end

    module ClassMethods
      def api_repo
        ApiRepo
      end

      def key
        "#{self.to_s.underscore}".split('/').last
      end

      def find(id)
        api_repo.find(key, id)
          .map { |h| new(h) }
          .first
      end

      def findAll(opts={})
        api_repo.findAll(key, opts)
          .map { |h| new(h) }
      end
    end
  end
end
