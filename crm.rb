class CRM
  def initialize(name)
    @name = name
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
  end


  def main_menu
    print_main_menu
    user_selection = gets.chomp.to_i
    call_option (user_selection)
  end
end

class Contact
  def initialize(first_name,last_name,email,note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end
end


#just main_menu would not work as we have to substantiate when we make a class so we use .new method below

a_crm_app = CRM.new("ezzz")
a_crm_app.main_menu


# def add