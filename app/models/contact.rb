class Contact < ApplicationRecord

  validates :name,:contact_no,
            :presence => {:message => 'Please enter'}
  validates :name,
            :format=> { with: /\A[a-zA-Z ]+\z/, 
            :message=> "Only Characters are allowed" }
  validates :contact_no,
            :presence => {:message => 'Enter valid number'},
            :numericality => true,
            :length => { :minimum => 10, :maximum => 10,
            :message=> "Enter valid number" }
end
