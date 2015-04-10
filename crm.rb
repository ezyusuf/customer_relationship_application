#This is your "View" or "User Interface" class
# It prints menus, takes input, and calls on Rolodex to do stuff
require_relative 'contact'
require_relative 'rolodex'

class CRM
  def self.run
    a_crm_app = new
    a_crm_app.main_menu
  end

  def initialize
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display contact"
    puts "[5] Display attribute"
    puts "[6] Delete contact"
    puts "[7] Exit"
    puts "Please make a selection: "
  end

  def call_option(user_selection)
    add_new_contact if user_selection == 1
    modify_contact if user_selection == 2
    display_all_contact if user_selection == 3
    display_contact if user_selection == 4
    display_by_attribute if user_selection == 5
    delete_contact if user_selection == 6
  end

  def main_menu
    while true
      print_main_menu
      user_selection = gets.chomp.to_i
      puts "\e[H\e[2J"
      return if user_selection == 7
      call_option(user_selection)
    end
  end

  def add_new_contact
    puts "Enter your first name"
    first_name = gets.chomp
    puts "Enter your last name"
    last_name = gets.chomp
    puts "Enter your email address"
    email = gets.chomp
    puts "Enter a note"
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    @rolodex.add_contact(contact)
    # @rolodex.add_contact(first_name, last_name, email, note)
    main_menu
  end

  def modify_contact
   puts "Please put an id for the customer you want to modify"
   modcontact = gets.chomp.to_i
   contact = @rolodex.find(modcontact)
   puts contact
   puts " Please confirm your selection"
   modconfirm = gets.chomp.downcase
     if modconfirm == "yes"
        puts "What would you want to change?"
        puts "[1] First Name"
        puts "[2] last Name"
        puts "[3] Email"
        puts "[4] Notes"
        puts "Enter your selection"
        modconfirm_sel = gets.chomp.to_i

        case modconfirm_sel
          when 1
            puts " Enter new first name"
            contact.first_name = gets.chomp
          when 2
            puts " Enter new last name"
            contact.last_name = gets.chomp
          when 3
            puts " Enter new email"
            contact.email = gets.chomp
          when 4
            puts " Enter new notes"
            contact.notes = gets.chomp
        end


     elsif modconfirm =="no"
      main_menu
    end

  end

  def display_contact
    puts "Put id of user you want to view"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts contact
    main_menu
  end

   def display_all_contact
    allcontact = @rolodex.allfind
    puts allcontact
    main_menu
  end

  def delete_contact
    puts "Select id of user to be deleted"
    id = gets.chomp.to_i
    @rolodex.delete_user(id)
    main_menu
  end


  def display_by_attribute
    puts "What would you like to display by?"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] E-Mail"
    puts "[4] Notes"
    user_choice = gets.chomp.to_i

    @rolodex.contacts.each do |contact|
      case user_choice
      when 1
        puts "First Name: #{contact.first_name}"
      when 2
        puts "Last Name: #{contact.last_name}"
      when 3
        puts "E-Mail: #{contact.email}"
      when 4
        puts "First Name: #{contact.note}"
      end
    end

    main_menu
  end

  def exit
    puts "\e[H\e[2J"
  end


  # def modify_contact
  #   puts "put id of contact you want to modify"
  #   conact_if = gets.chomp.to_i
  #   contact
  # end


end

a_crm_app = CRM.new
a_crm_app.main_menu




  # def modify_contact
  #   @rolodex.update_contact
  # end






# This is your "Data Storage" class.
# It basically just holds values


# class Contact


#   def initialize(first_name,last_name,email,note)
#     @first_name = first_name
#     @last_name = last_name
#     @email = email
#     @note = note
#   end

#   # def email
#   #   @email
#   # end

#   # def note =(note)
#   #   @note = note
#   # end

# end


# This is where your "Application" or "Business Logic" code should go
# This is the thing that should do the modifications/changes to the array of @contacts


# class Rolodex

#   def initialize
#     @contacts = []
#     @id = 1000
#   end

#   def contacts
#     @contacts
#   end

#   def add_contact(first_name, last_name, email, note)
#     contact = Contact.new(first_name, last_name, email, note)
#     contact.id = @id
#     @contacts << contact
#     @id += 1
#   end

#   # def update_contact
#   # end

# end

#just main_menu would not work as we have to substantiate when we make a class so we use .new method below

# a_crm_app = CRM.new
# a_crm_app.main_menu

# CRM.run("my CRM")

# contact.email
# contact.note = "Buy a Present"


# def add