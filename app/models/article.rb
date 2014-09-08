class Article < ActiveRecord::Base

  belongs_to :school
  belongs_to :author, class_name: User
  belongs_to :articlable, polymorphic: true

  validates_presence_of :school_id, :author_id
  validates_presence_of :title
  validates_length_of :title, in: 5..140, message: 'The name must be at least 5 characters and no more than 140 characters!'

  # def get_polymorphic_associations(model_object, name)
  #   association = model_object.reflect_on_all_associations(:belongs_to).select{|obj| obj.name == name}.first
  #   ActiveRecord::Base.subclasses.select do |model|
  #     model.reflect_on_all_associations(:has_many).any? do |has_many_association|
  #       has_many_association.options[:as] == association.name
  #     end
  #   end
  # end
end
