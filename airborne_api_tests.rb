
require 'airborne'
require 'rspec'



#Get on contacts
describe 'GET on /contacts' do
  it 'should validate types' do
    get 'http://192.168.56.222:3000/api/v1/contacts' #json api that returns list of contacts
    expect_json('contacts.0', name: 'Jeremy Kemper')
    expect_json('contacts.1', name: 'David Heinemeir Hansson')
     expect_json_types('contacts.*', name: :string, twitter: :string)
    end
end

#Get on contacts by id
describe 'GET on contacts/id' do
  it 'should validate types' do
    get 'http://192.168.56.222:3000/api/v1/contacts/1' #json api that returns list of contacts
    expect_json('contact', name: 'Jeremy Kemper')
     expect_json_types('contact', name: :string)
    end
end

#Get on contacts by relationship#REST Filtering 
describe 'GET on /contacts?relationship=friend' do
  it 'should validate types' do
    get 'http://192.168.56.222:3000/api/v1/contacts?relationship=friend' #json api that returns list of contacts
    expect_json('contacts.0', name: 'Jeremy Kemper')
    expect_json('contacts.1', name: 'Patrik Naik')
     expect_json_types('contacts.*', name: :string)
    end
end

#Post on contacts
describe 'POST on /contacts' do
  it 'should validate types' do
  	 post 'http://192.168.56.222:3000/api/v1/contacts',
  	 contact: {
        :id => 16,
        :name => "barack obama",
        :email => "barackobama@gmail.com",
        :twitter => "@miloops",
        :relationship => "business"
    }
    get 'http://192.168.56.222:3000/api/v1/contacts/16' #json api that returns list of contacts
    expect_json('contact', name: 'barack obama')
    end
end


#Put on  contacts/id
describe 'PUT on /contacts' do
  it 'should validate types' do
  	 put 'http://192.168.56.222:3000/api/v1/contacts/11',
  	 contact: {
        :id => 11,
        :name => "Emilio Tagua",
        :email => "Tagua@gmail.com",
        :twitter => "@miloops",
        :relationship => "business"
    }
    get 'http://192.168.56.222:3000/api/v1/contacts/11' #json api that returns list of contacts
    expect_json('contact', email: 'Tagua@gmail.com')
    end
end


#Delete on contacts/id
describe 'DELETE on /contacts/id' do
  it 'should validate types' do
  	 delete 'http://192.168.56.222:3000/api/v1/contacts/8'
  	 
    
   
    end
end


