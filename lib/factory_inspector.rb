require "factory_inspector/version"
#require "factory_girl"
module FactoryInspector
  def self.factory_inspect(factory)
    result = {}
    #model_class: model definition
    result[:model_class] = factory.build_class
    #definition:
    ##name:factory's name
    result[:name] = factory.name.to_s
    ##attributes: attributes's name, type(static, dynamic, or association), each factory_name.
    result[:attributes] = []

    factory.definition.attributes.each do |attr|
      hash = {}
      case attr
      when FactoryGirl::Attribute::Static
        hash[:type] = "static"
      when FactoryGirl::Attribute::Dynamic
        hash[:type] = "dynamic"
      when FactoryGirl::Attribute::Association
        hash[:type] = "association"
        name_and_traits = attr.factory
        if name_and_traits.array?
          hash[:factory_name] = name_and_traits.shift.to_s
          hash[:traits] = name_and_traits.map{ |tr| tr.to_s }
        else
          hash[:factory_name] = name_and_traits.to_s
          hash[:traits] = []
        end
      end
      hash[:name] = attr.name.to_s
      result[:attributes].push(hash)
    end

    ##assoations generated in factory
    result[:assos] = result[:attributes].select{ |attr| attr[:type] == "association"}
    ##defined_traits: Traits which this factory (contain not used this instance).
    result[:defined_traits] = []
    factory.definition.defined_traits.each do |trait|
      result[:defined_traits].push(trait.name.to_s)
    end
    result
  end

end
