class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @contact = Contact.new(params_contact)
    if @contact.save
      @contacts = Contact.all
      @contact = Contact.new
    end
    respond_to do |format|
      format.js
    end
  end 

  def search
    digit = params[:query]
    letters = letter_combinations(digit)
    @contacts = if letters.present?
              conditions = letters.map { |letter| "LOWER(name) LIKE '#{letter}%'" }.join(' OR ')
              Contact.where("LOWER(name) LIKE '%#{digit.downcase}%' OR #{conditions} OR contact_no LIKE '%#{digit}%'")
            else
              Contact.where("LOWER(name) LIKE '%#{digit.downcase}%' OR contact_no LIKE '%#{digit}%'")
            end


    respond_to do |format| 
      format.js
    end
  end

  def show_contact
    @contact = Contact.find_by_id(params[:id])
    respond_to do |format| 
      format.js
    end
  end

  private

  def params_contact
    params.require(:contact).permit!
  end

  def letter_combinations(digits)
    return [] if digits.empty?

    number_map = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]

    digits.chars.reduce([""]) do |combinations, digit|
      next_combinations = []

      if ('2'..'9').include?(digit)
        letters = number_map[digit.to_i - 2]
        next_combinations += combinations.product(letters.chars).map(&:join)
      end
      next_combinations
    end
  end

end
