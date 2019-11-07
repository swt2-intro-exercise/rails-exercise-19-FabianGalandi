class Author < ApplicationRecord
    # ensure that all parameters are not null
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :homepage, presence: true
  
    # a method for returning the fullname of an author
    def name
      [first_name, last_name].join(' ')
    end
end
