class Contact

 attr_accessor :id, :first_name, :last_name, :email, :note

  def initialize(first_name,last_name,email,note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  # def email
  #   @email
  # end

  # def note =(note)
  #   @note = note
  # end

end


# contact.email
# contact.note = "Buy a Present"

