# require "pry"

class Rolodex

  def initialize
    @contacts = []
    @id = 1000
  end

  def contacts
    @contacts
  end

  # def add_contact(first_name, last_name, email, note)
  def add_contact(contact)
    # contact = Contact.new(first_name, last_name, email, note)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(contact_id)
    @contacts.find do |contact|
      contact.id == contact_id
    end
  end

  def allfind
    @contacts
  end

  def delete_user(id)
    @contacts.delete_if{|contact| contact.id == id }
  end


  # def update_contact
  # end

end