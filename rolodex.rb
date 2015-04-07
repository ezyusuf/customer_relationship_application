class Rolodex

  def initialize
    @contacts = []
    @id = 1000
  end

  def contacts
    @contacts
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(first_name, last_name, email, note)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  # def update_contact
  # end

end