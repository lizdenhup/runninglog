require 'spec_helper'

describe UsersController do 

  describe 'signup page' do 
    it 'loads the signup page' do 
      get '/signup'
      expect(last_response.status).to eq(200)
    end 

    it 'signup directs user to workouts index' do 
      params = {
        :username => "cyclist1"
        :password => "ilovebiking"
        :email => "alwaysbiking@email.com"
      }
      post '/signup', params
      expect(last_response.location).to include('/workouts')
    end 

    context 'without a username' do 
      let!(:params) { {
        :username => ""
        :email => "alwaysbiking@email.com"
        :password => "ilovebiking"
        } }

        it 'does not let a user sign up' do 
          post '/signup', params
          expect(last_response.location).to include('/signup')
        end 
    end 
end 