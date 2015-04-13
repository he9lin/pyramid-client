module Pyramid
  module Model
    extend ActiveSupport::Concern

    def save
      if new_record?
        attrs = ApiRepo.create key, to_hash
        update_attributes! attrs.symbolize_keys
      else
        # TODO
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
    end
  end
end
