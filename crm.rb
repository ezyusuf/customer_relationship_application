#This is your "View" or "User Interface" class
# It prints menus, takes input, and calls on Rolodex to do stuff

require_relative 'contact'
require_relative 'rolodex'

class CRM

  def self.run(name)
    crm = CRM.new(name)
    crm.main_menu
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
    display_attribute if user_selection == 5
    delete_contact if user_selection == 6
    exit if user_selection == 7
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
    @rolodex.add_contact(first_name, last_name, email, note)
  end

  # def modify_contact
  #   @rolodex.update_contact
  # end


  def main_menu
    print_main_menu
    user_selection = gets.chomp.to_i
    call_option (user_selection)
  end
end


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

a_crm_app = CRM.new("ezzz")
a_crm_app.main_menu

# CRM.run("my CRM")

# contact.email
# contact.note = "Buy a Present"


# def add