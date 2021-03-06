module CapsuleCRM
  class Milestone
    include ActiveModel::Validations
    include Virtus.model

    include CapsuleCRM::Querying::Configuration
    include CapsuleCRM::Querying::FindAll
    include CapsuleCRM::Serializable

    queryable_config do |config|
      config.plural = 'opportunity/milestones'
    end

    attribute :id, Integer
    attribute :name, String
    attribute :description, String
    attribute :probability, Float
    attribute :complete, Boolean

    validates :id, numericality: { allow_blank: true }

    def self.find(id)
      all.select { |item| item.id == id }.first
    end

    def self.find_by_name(name)
      all.select { |item| item.name == name }.first
    end
  end
end
