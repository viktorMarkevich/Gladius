module ActiveAdmin::ArticlesHelper
#   def get_polymorphic_associations(model_object, name)
#     association = model_object.reflect_on_all_associations(:belongs_to).select{|obj| obj.name == name}.first
#     associations = ActiveRecord::Base.subclasses.select do |model|
#       model.reflect_on_all_associations(:has_many).any? do |has_many_association|
#         has_many_association.options[:as] == association.name
#       end
#     end
#   end
end
