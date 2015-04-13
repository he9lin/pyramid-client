module Pyramid
  module Model
    extend ActiveSupport::Concern

    def save
      if new_record?
        attrs = ApiRepo.create key, to_hash
        update_attributes! attrs.symbolize_keys
      else
        ApiRepo.update key, id, to_hash # true of false depending on error
      end
    end

    def destroy
      if persisted?
        ApiRepo.destroy key, id
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

    module ClassMethods
      def key
        "#{self.to_s.underscore}".split('/').last
      end

      def find(id)
        ApiRepo.find(key, id)
          .symbolize_keys
          .pipe { |hash| new(hash) }
      end
    end
  end
end
