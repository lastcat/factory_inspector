require "factory_inspector/version"
#require "factory_girl"
module FactoryInspector
  #直moduleでいい気がする
  def self.factory_inspect(factory)
    result = {}
    #build_class => db_table
    result[:model_class] = factory.build_class
    #definition
    ##name
    result[:name] = factory.name.to_s
    ##attributes
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
      end
      hash[:name] = attr.name.to_s
      hash[:factory_name] = attr.try(:factory).to_s
      result[:attributes].push(hash)
    end

    result[:defined_traits] = []
    factory.definition.defined_traits.each do |trait|
      result[:defined_traits].push(trait.name.to_s)
    end
    result
  end

  #This is simply convert string to symbol array
  def self.trait_inspect(traits)
    traits_content = traits.delete("[").delete("]")
    [] if traits_content == ""
    traits_content.split(",").map{|str| str.strip.delete(":").to_sym}
  end

end
